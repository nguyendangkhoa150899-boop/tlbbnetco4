#!/usr/bin/env python3
"""NetCo4 admin panel: tai khoan, phat qua, GM, trang thai server.

Chi nghe 127.0.0.1:8088 tren VPS. Mo tu may nha qua SSH tunnel (panel/mo-panel.cmd).
Khong can cai them goi (chi dung thu vien chuan Python 3).

Phat qua: ghi hang doi Server/txt/NetCo4Qua/<GUID>.txt; script Lua 950000
(Public/Data/Script/NetCo4/quatang.lua) phat khi nhan vat dang nhap.
"""
import html
import json
import os
import re
import secrets
import subprocess
import time
import unicodedata
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, urlencode, urlparse

import maudoche   # 02/10: mau do che 8x/9x (panel/maudoche.py)

HOST, PORT = "0.0.0.0", 8443         # HTTPS, mo ra internet (ufw allow 8443), bat buoc dang nhap
PUBLIC_IP = "103.216.118.123"
CERT_DIR = "/etc/tlbb-panel"          # chung chi tu ky, KHONG nam trong repo
SESSION_HOURS = 12
MAX_FAIL, LOCK_MIN = 5, 15
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEPLOY = os.path.join(REPO, "deploy")
ROOT = "/opt/tlbb-root"
GAME = ROOT + "/home/tlbb"
QUEUE = GAME + "/Server/txt/NetCo4Qua"
CAPMIN = QUEUE + "/_capmin.txt"            # cap toi thieu toan server (quatang.lua x950000_CapMin)
# 01/10: KHOA CAP - cap toi da cay bang exp, admin chon tren web. Luu NGOAI repo (cap-nhat.sh ap lai sau rsync,
# reset-choi-that.sh khong xoa). ConfigInfo.ini HumanMaxDefaultLevel = cap + 1 vi engine tru 1 luc nap.
CFGDIR = GAME + "/Server/txt/NetCo4Cfg"
CAPMAX = CFGDIR + "/capmax.txt"
CONFIGINFO = GAME + "/Server/Config/ConfigInfo.ini"
# 03/10: EXP TOAN SERVER (ConfigInfo.ini [Exp] ExpParam) admin chon tren web, luu NGOAI repo nhu khoa cap
# (cap-nhat.sh ap lai sau rsync). "Mac dinh" = gia tri trong repo (git) - nut reset xoa expparam.txt va tra ve so do.
EXPPARAM = CFGDIR + "/expparam.txt"
REPO_CONFIGINFO = "/opt/tlbb-repo/server/Server/Config/ConfigInfo.ini"
RE_EXP = re.compile(r"^\d{1,2}(\.\d)?$")
POPUP = GAME + "/Server/txt/NetCo4Popup"   # qua popup (cua so Qua ngay le) do admin chon nguoi
GMLIST = GAME + "/Server/Config/GMList.ini"
MYSQL = "/usr/local/mysql5.0.45/bin/mysql"
LOG = "/opt/tlbb-backup/panel.log"
TOKEN = secrets.token_urlsafe(24)  # doi moi lan khoi dong panel (chong CSRF)


def capmax_get():
    """Cap toi da dang ghi trong ConfigInfo.ini (HumanMaxDefaultLevel - 1). Co hieu luc tu lan restart game sau khi ghi."""
    try:
        m = re.search(rb"(?m)^HumanMaxDefaultLevel=(\d+)", open(CONFIGINFO, "rb").read())
        return int(m.group(1)) - 1 if m else 0
    except OSError:
        return 0


def capmax_set(n):
    """Sua dung so tren dong HumanMaxDefaultLevel (file GBK, giu nguyen moi byte khac) + ghi capmax.txt."""
    raw = open(CONFIGINFO, "rb").read()
    new, k = re.subn(rb"(?m)^(HumanMaxDefaultLevel=)\d+", lambda m: m.group(1) + str(n + 1).encode(), raw, count=1)
    if k != 1:
        raise RuntimeError("khong thay HumanMaxDefaultLevel trong ConfigInfo.ini")
    with open(CONFIGINFO, "wb") as f:
        f.write(new)
    os.makedirs(CFGDIR, exist_ok=True)
    with open(CAPMAX, "w", encoding="ascii", newline="\n") as f:
        f.write("%d\n" % n)


def exp_doc(path):
    try:
        m = re.search(rb"(?m)^ExpParam=([0-9.]+)", open(path, "rb").read())
        return float(m.group(1)) if m else 0.0
    except (OSError, ValueError):
        return 0.0


def exp_get():
    """EXP toan server dang ghi trong ConfigInfo.ini (co hieu luc tu lan restart game sau khi ghi)."""
    return exp_doc(CONFIGINFO)


def exp_macdinh():
    return exp_doc(REPO_CONFIGINFO) or 12.0


def exp_set(x, giu=True):
    """Sua dung so tren dong ExpParam (file GBK, giu moi byte khac). giu=True ghi expparam.txt (cap-nhat.sh ap lai),
    giu=False xoa expparam.txt (ve mac dinh cua repo)."""
    s = ("%.1f" % x).rstrip("0").rstrip(".")
    s = s if "." in s else s + ".0"
    raw = open(CONFIGINFO, "rb").read()
    new, k = re.subn(rb"(?m)^(ExpParam=)[0-9.]+", lambda m: m.group(1) + s.encode(), raw, count=1)
    if k != 1:
        raise RuntimeError("khong thay ExpParam trong ConfigInfo.ini")
    with open(CONFIGINFO, "wb") as f:
        f.write(new)
    os.makedirs(CFGDIR, exist_ok=True)
    if giu:
        with open(EXPPARAM, "w", encoding="ascii", newline="\n") as f:
            f.write(s + "\n")
    elif os.path.exists(EXPPARAM):
        os.remove(EXPPARAM)
    return s


# 03/10: TAM PHAP TOI DA nguoi choi duoc tu hoc len (yuanbaoshop.lua 888902 x888902_TPMax doc file nay moi lan bam hoc,
# hieu luc ngay, khong restart). 0 / khong co file = luat goc: cap nhan vat + 10, tam phap 70-80/88/96 toi 159.
TPMAX = CFGDIR + "/tpmax.txt"


def tpmax_get():
    try:
        n = int(open(TPMAX).read().strip() or "0")
        return n if 10 <= n <= 159 else 0
    except (OSError, ValueError):
        return 0


def tpmax_set(n):
    os.makedirs(CFGDIR, exist_ok=True)
    if n == 0:
        if os.path.exists(TPMAX):
            os.remove(TPMAX)
        return
    with open(TPMAX, "w", encoding="ascii", newline="\n") as f:
        f.write("%d\n" % n)


# 03/10: ROI THEM QUA SCRIPT do admin cau hinh (NetCo4/roimap.lua x950001_RoiCfg doc file nay moi lan quai chet -> hieu luc ngay).
# Moi dong: <khoa> <ti le %> <ID1[,ID2,@nhom...]>  (nhieu ID / nhom = boc 1 mon). Moi thanh vien to doi o gan roll rieng.
ROITHEM = CFGDIR + "/roithem.txt"
ROI_KHOA = {   # khoa -> (ten hien thi, so con moi luot de uoc tinh)
    "kycuoc_co": ("Ky Cuoc (Co 12h) - moi quan co", 200),
    "kycuoc_boss": ("Ky Cuoc (Co 12h) - boss Vien Co Ky Hon", 1),
}
ROI_NHOM = {   # phai khop x950001_g_Nhom trong roimap.lua
    "@ngoc6": "20 loai ngoc cap 6 thuong",
    "@mienbo6": "Mien Bo 6 / Bi Ngan 6",
}
RE_ROI_PCT = re.compile(r"^\d{1,3}(\.\d{1,2})?$")
RE_ROI_TU = re.compile(r"^(@[a-z0-9_]{1,12}|\d{5,9})$")


def roi_doc():
    out = []
    try:
        lines = open(ROITHEM, encoding="ascii", errors="replace").read().splitlines()
    except OSError:
        return out
    for l in lines:
        p = l.split()
        if len(p) == 3 and p[0] in ROI_KHOA:
            out.append({"k": p[0], "pct": p[1], "ids": p[2].split(",")})
    return out


def roi_ghi(rows):
    os.makedirs(CFGDIR, exist_ok=True)
    tmp = ROITHEM + ".moi"
    with open(tmp, "w", encoding="ascii", newline="\n") as f:
        for r in rows:
            f.write("%s %s %s\n" % (r["k"], r["pct"], ",".join(r["ids"])))
    os.replace(tmp, ROITHEM)


def roi_state():
    rows = []
    for i, r in enumerate(roi_doc()):
        rows.append({"stt": i, "k": r["k"], "pct": r["pct"], "ids": r["ids"],
                     "ten": [ROI_NHOM.get(t) or ITEM_NAME.get(t, "?") for t in r["ids"]]})
    return {"rows": rows, "khoa": {k: {"ten": v[0], "soCon": v[1]} for k, v in ROI_KHOA.items()}, "nhom": ROI_NHOM}


def restart_game():
    subprocess.Popen(["systemctl", "restart", "tlbb"], stdin=subprocess.DEVNULL,
                     stdout=open("/tmp/panel-restart.log", "w"), stderr=subprocess.STDOUT)


def load_env(path):
    env = {}
    if os.path.exists(path):
        for line in open(path, encoding="utf-8"):
            m = re.match(r'^([A-Z_]+)="?([^"\n]*)"?', line.strip())
            if m:
                env[m.group(1)] = m.group(2)
    return env


SECRETS = load_env(os.path.join(DEPLOY, "secrets.env"))
PANEL_PASS = SECRETS.get("PANEL_PASS", "")
SESSIONS = {}   # cookie -> het han (epoch)
FAILS = {}      # ip -> [so lan sai, khoa den (epoch)]
REV = {v: k for k, v in json.load(open(os.path.join(REPO, "tools", "viscii-map.json"), encoding="utf-8")).items()}


def viscii(b: bytes) -> str:
    return "".join(REV.get(x, chr(x)) for x in b)


def audit(msg):
    with open(LOG, "a", encoding="utf-8") as f:
        f.write(time.strftime("%Y-%m-%d %H:%M:%S ") + msg + "\n")


def sql(query):
    """Chay SQL bang mysql trong chroot. Moi gia tri dua vao query PHAI da duoc kiem tra bang regex."""
    p = subprocess.run(
        ["chroot", ROOT, MYSQL, "-uroot", "-p" + SECRETS.get("MYSQL_ROOT_PASS", ""), "-N", "-B", "-e", query],
        capture_output=True, timeout=20)
    if p.returncode != 0:
        raise RuntimeError(p.stderr.decode("utf-8", "replace").strip())
    return [row.split(b"\t") for row in p.stdout.split(b"\n") if row]


def running(name):
    return subprocess.run(["pgrep", "-x", name], capture_output=True).returncode == 0


def online_count():
    p = subprocess.run(["ss", "-Htn", "state", "established", "( sport = :3731 )"], capture_output=True, text=True)
    return len([l for l in p.stdout.splitlines() if l.strip()])


# ---------------------------------------------------------------- vat pham
ITEMS = []
for fn, kind in [("vat-pham-thuong.tsv", "Vat pham"), ("ngoc-bao-thach.tsv", "Ngoc"), ("trang-bi.tsv", "Trang bi")]:
    path = os.path.join(REPO, "docs", "vat-pham", fn)
    if os.path.exists(path):
        for line in open(path, encoding="utf-8"):
            if line.startswith("#"):
                continue
            c = line.rstrip("\n").split("\t")
            if len(c) >= 2 and c[0].isdigit():
                ITEMS.append((c[0], c[1], kind))
# Trang bi chi co ten tieng Trung: ghep ten Han-Viet tu ten-viet.tsv (tools/viet-hoa-trang-bi.js)
VN = {}
_p = os.path.join(REPO, "docs", "vat-pham", "ten-viet.tsv")
if os.path.exists(_p):
    for line in open(_p, encoding="utf-8"):
        c = line.rstrip("\r\n").split("\t")
        if len(c) >= 6 and c[0].isdigit():
            VN[c[0]] = "%s [%s, cấp %s, %s] %s" % (c[1], c[2], c[3], c[4], c[5])
ITEMS = [(i, VN.get(i, n), k) for i, n, k in ITEMS]
ITEM_NAME = {i: n for i, n, _ in ITEMS}
# 30/09: ID pet hop le (PetAttrTable.txt, GBK) cho qua loai "pet" - chi admin phat event (docs/pet-huyen-hoa.md)
PET_IDS = set()
PET_TC = {}   # 01/10: tu chat chuan (cot 34-38: Cuong/The/Noi/Than/Tri) cho shop Pet Boss cua bot
_p = os.path.join(ROOT, "home", "tlbb", "Public", "Config", "PetAttrTable.txt")
if os.path.exists(_p):
    for _line in open(_p, "rb"):
        _c = _line.split(b"\t")
        if _c and _c[0].isdigit():
            PET_IDS.add(_c[0].decode())
            if len(_c) > 38:
                PET_TC[_c[0].decode()] = [int(x) if x.strip().isdigit() else 0 for x in _c[34:39]]


# 30/09 toi: pet Huyen Hoa V2 (tu chat goc) - danh sach ten de chon tren panel, doc tu docs/pet-huyen-hoa.md
PET_V2 = []
_p = os.path.join(REPO, "docs", "pet-huyen-hoa.md")
if os.path.exists(_p):
    for _line in open(_p, encoding="utf-8"):
        _m = re.match(r"^\| (3\d{4}) \| ([^|]+) \| ([^|]+) \|", _line)
        if _m and _m.group(1) in PET_IDS:
            PET_V2.append((_m.group(1), "%s (%s)" % (_m.group(2).strip(), _m.group(3).strip())))
# Ban 12000 (ID V2 - 6000; V2 = goc + 6000, phai < 32767) + tat ca pet (docs/pet-danh-sach.tsv: id, ten Han Viet, ..., truong thanh)
PET_12000 = [(str(int(i) - 6000), n) for i, n in PET_V2 if str(int(i) - 6000) in PET_IDS]
PET_ALL = []
_p = os.path.join(REPO, "docs", "pet-danh-sach.tsv")
if os.path.exists(_p):
    for _line in open(_p, encoding="utf-8"):
        _c = _line.rstrip("\r\n").split("\t")
        if len(_c) >= 8 and _c[0].isdigit() and _c[0] in PET_IDS:
            PET_ALL.append((_c[0], "%s [cấp %s, TT %s]" % (_c[1], _c[4], _c[7])))
# 01/10: kieu tan cong pet = MonsterAttrExTable cot 62 (AttackTraits 11 Ngoai cong / 12 Noi cong / 13 Can bang),
# engine doc theo dong quai CUNG ID voi pet. V2 (= goc + 6000) lay kieu cua ban goc. Chi de HIEN THI tren o chon.
PET_KIEU = {}
_p = os.path.join(ROOT, "home", "tlbb", "Public", "Config", "MonsterAttrExTable.txt")
if os.path.exists(_p):
    _ten = {b"11": "Ngoại công", b"12": "Nội công", b"13": "Cân bằng"}
    for _line in open(_p, "rb"):
        _c = _line.split(b"\t")
        if len(_c) > 62 and _c[0].isdigit() and _c[62].strip() in _ten:
            PET_KIEU[_c[0].decode()] = _ten[_c[62].strip()]


def _kieu(i, v2=False):
    k = PET_KIEU.get(str(int(i) - 6000) if v2 else i, "")
    return " · " + k if k else ""


PET_V2 = [(i, n + _kieu(i, True)) for i, n in PET_V2]
PET_12000 = [(i, n.rsplit(" · ", 1)[0] + _kieu(i)) for i, n in PET_12000]
PET_ALL = [(i, n + _kieu(i)) for i, n in PET_ALL]
# 01/10: bo 144 pet skin (12 skin x Ngoai/Noi/Can bang x cap 85/95, ban admin 12000 + ban V2 tu chat goc), ghep pet nen
# vao ID Huyen Hoa co san - docs/pet-skin.tsv (id, skin, cap, kieu, ban, nen, nhan). Co file nay thi thay 2 nhom Huyen Hoa.
PET_TANTHU = []   # 01/10: ban Tan Thu (cap mang 5) - pet-skin.tsv ban=tanthu
PET_SKINS = []    # 01/10: moi dong pet-skin.tsv dang dict (bot dung cho shop "Chon Pet Boss")
_p = os.path.join(REPO, "docs", "pet-skin.tsv")
if os.path.exists(_p):
    _a, _v, _t = [], [], []
    for _line in open(_p, encoding="utf-8"):
        _c = _line.rstrip("\r\n").split("\t")
        if len(_c) >= 7 and _c[0].isdigit() and _c[0] in PET_IDS:
            {"admin": _a, "tanthu": _t}.get(_c[4], _v).append((_c[0], _c[6]))
            PET_SKINS.append({"id": _c[0], "skin": _c[1], "cap": _c[2], "kieu": _c[3], "ban": _c[4], "tc": PET_TC.get(_c[0], [])})
    if _a and _v:
        PET_12000, PET_V2 = _a, _v
    PET_TANTHU = _t
# 01/10: them nhom Tan Thu (cap mang 5) o CUOI - web panel.js chon nhom theo chi so (0 V2, 1 12000, 2 tat ca, 3 Tan Thu)
PET_GROUPS = [("Huyễn Hóa V2 (8000/4000, 72 con)", PET_V2), ("Huyễn Hóa Admin 12000 (72 con)", PET_12000), ("Tất cả pet", PET_ALL),
              ("Huyễn Hóa Tân Thủ (cấp mang 5, %d con)" % len(PET_TANTHU), PET_TANTHU)]


def khong_dau(s):
    """Tim khong dau: 'Trùng Lâu Giáp' -> 'trung lau giap'."""
    s = unicodedata.normalize("NFD", s.lower().replace("đ", "d"))
    return re.sub(r"[-_·]+", " ", "".join(ch for ch in s if unicodedata.category(ch) != "Mn"))


ITEM_KEY = {i: khong_dau(n) for i, n, _ in ITEMS}


# ---------------------------------------------------------------- hanh dong
RE_ACC = re.compile(r"^[a-z0-9_]{3,20}$")
RE_PASS = re.compile(r"^[A-Za-z0-9_@.!-]{6,32}$")
RE_INT = re.compile(r"^\d{1,10}$")


def accounts():
    # is_online do billing ghi khi dang nhap / thoat. Restart/crash server de lai gia tri cu,
    # nen neu khong co ket noi game nao thi coi nhu khong ai online.
    anyone = online_count() > 0
    return [(r[0].decode(), r[1].decode(), anyone and r[2].decode() == "1")
            for r in sql("SELECT id, name, is_online FROM web.account ORDER BY id")]


def chars():
    rows = sql("SELECT charguid, accname, charname, level FROM tlbbdb.t_char WHERE isvalid=1 ORDER BY charguid")
    return [(r[0].decode(), viscii(r[1]), viscii(r[2]), r[3].decode()) for r in rows]


def gm_guids():
    if not os.path.exists(GMLIST):
        return []
    return re.findall(r"^guid\d+=(\d+)", open(GMLIST, encoding="latin-1").read(), re.M)


def write_gm(guids):
    with open(GMLIST, "w", encoding="ascii", newline="\n") as f:
        f.write("[gm]\ncount=%d\n" % len(guids))
        for i, g in enumerate(guids):
            f.write("guid%d=%s\n" % (i, g))


def tom_tat(pend):
    """Hien qua dang cho cho gon: cong don knb/diemtang/vang (KNB bi chia dong 99999), vang doi tu dong ra vang."""
    out, tong = [], {}
    for p in pend:
        k = p.split()
        if len(k) >= 2 and k[0] in ("knb", "diemtang", "vang") and k[1].isdigit():
            tong[k[0]] = tong.get(k[0], 0) + int(k[1])
        elif len(k) >= 3 and k[0] == "doi":   # nang ngoc: moi loai 1 dong -> dem gop, ghi cap dich
            tong["doi"] = tong.get("doi", 0) + 1
            tong["_cap"] = k[2][2:3]
        else:
            out.append(p + ("  " + ITEM_NAME.get(k[1], "") if k[0] in ("item", "xoa", "popup") and len(k) > 1 else ""))
    cap = tong.pop("_cap", "?")
    for k, n in tong.items():
        out.append("vang %g" % (n / 10000.0) if k == "vang" else ("nang ngoc len cap %s (%d loai)" % (cap, n) if k == "doi" else "%s %d" % (k, n)))
    return out


def pending(guid):
    p = os.path.join(QUEUE, guid + ".txt")
    out = [l.strip() for l in open(p, encoding="ascii", errors="replace") if l.strip()] if os.path.exists(p) else []
    pp = os.path.join(POPUP, guid + ".txt")
    if os.path.exists(pp):
        v = open(pp, encoding="ascii", errors="replace").read().strip()
        if v:
            out.append("popup " + v)
    return out


def act(form):
    a = form.get("a", "")
    v = lambda k: form.get(k, "").strip()
    if a == "tao_tk":
        n, pw = v("ten"), v("mk")
        if not RE_ACC.match(n):
            return "Ten chi gom a-z 0-9 _ (3-20 ky tu)"
        if not RE_PASS.match(pw):
            return "Mat khau 6-32 ky tu: chu, so, _@.!-"
        if sql("SELECT id FROM web.account WHERE name='%s'" % n):
            return "Tai khoan %s da ton tai" % n
        sql("INSERT INTO web.account (name, password) VALUES ('%s', MD5('%s'))" % (n, pw))
        audit("tao tai khoan %s" % n)
        return "Da tao tai khoan %s" % n
    if a == "doi_mk":
        n, pw = v("ten"), v("mk")
        if not (RE_ACC.match(n) and RE_PASS.match(pw)):
            return "Ten hoac mat khau khong hop le"
        sql("UPDATE web.account SET password=MD5('%s') WHERE name='%s'" % (pw, n))
        audit("doi mat khau %s" % n)
        return "Da doi mat khau %s" % n
    if a == "kiem_mk":
        # 30/09: bot mini game (BotDoMin) cho nguoi choi dang nhap web bang TAI KHOAN GAME.
        # Bot gui MD5 (khong gui mat khau tho); tra "Da khop <id>" hoac "Sai mat khau". Khong audit noi dung.
        n, h = v("ten"), v("md5").lower()
        if not (RE_ACC.match(n) and re.fullmatch(r"[0-9a-f]{32}", h)):
            return "Ten hoac ma bam khong hop le"
        r = sql("SELECT id FROM web.account WHERE name='%s' AND password='%s'" % (n, h))
        return ("Da khop %s" % r[0][0].decode()) if r else "Sai mat khau"
    if a == "xoa_tk":
        n = v("ten")
        if not RE_ACC.match(n) or n == "admin":
            return "Khong xoa duoc tai khoan nay"
        sql("DELETE FROM web.account WHERE name='%s'" % n)
        audit("xoa tai khoan %s" % n)
        return "Da xoa tai khoan %s" % n
    if a == "qua":
        g, kind, val, cnt = v("guid"), v("loai"), v("gt"), v("sl") or "1"
        if kind in ("pet12", "petv2", "petall", "pettt"):   # 4 o chon pet (cung danh sach ten, khac ban) -> loai "pet"
            kind, val = "pet", v("gtpet") or val
        if g == "all":
            targets = [c[0] for c in chars()]
            if not targets:
                return "Chua co nhan vat nao"
            msgs = [act(dict(form, guid=t)) for t in targets]
            bad = [m for m in msgs if not m.startswith("Da xep")]
            return bad[0] if bad else "Da xep hang qua cho %d nhan vat" % len(targets)
        if not RE_INT.match(g) or kind not in ("item", "xoa", "knb", "vang", "diemtang", "level", "nangngoc", "vip", "popup", "pet") or not RE_INT.match(val) or not RE_INT.match(cnt):
            return "Du lieu qua khong hop le"
        if kind == "pet" and val not in PET_IDS:
            return "Khong co pet ID %s trong PetAttrTable (xem docs/pet-huyen-hoa.md)" % val
        if kind in ("item", "xoa", "popup") and val not in ITEM_NAME:
            return "Khong co vat pham ID %s trong danh muc" % val
        if kind in ("item", "xoa") and not 1 <= int(cnt) <= 999:
            return "So luong 1-999"
        if kind == "vip" and not 0 <= int(val) <= 10:
            return "VIP 0-10"
        if kind == "knb" and not 1 <= int(val) <= 10000000:
            return "KNB 1-10000000 moi lan"
        if kind == "vang" and not 1 <= int(val) <= 100000:  # don vi vang; AddMoney nhan dong (int32)
            return "Vang 1-100000 moi lan"
        if kind == "diemtang" and not 1 <= int(val) <= 10000000:
            return "Diem Tang 1-10000000 moi lan"
        if kind == "level" and not 1 <= int(val) <= 119:
            return "Cap 1-119"
        if kind == "nangngoc" and not 2 <= int(val) <= 7:
            return "Cap ngoc 2-7 (cap 7 la cao nhat)"
        if kind == "popup":
            os.makedirs(POPUP, exist_ok=True)
            with open(os.path.join(POPUP, g + ".txt"), "w", encoding="ascii", newline="\n") as f:
                f.write(val + "\n")
            audit("popup GUID %s: item %s %s" % (g, val, ITEM_NAME.get(val, "")))
            return "Da dat qua popup cho GUID %s: %s. Nguoi choi thay cua so qua khi vao game (moi nguoi 1 mon, dat lai se thay mon cu)." % (g, ITEM_NAME.get(val, val))
        os.makedirs(QUEUE, exist_ok=True)
        if kind in ("item", "xoa"):
            lines = ["%s %s %s" % (kind, val, cnt)]
        elif kind == "knb":  # YuanBao chi nen cong toi da 99999 moi lan (docs/lenh-gm.txt): chia nhieu dong
            n = int(val)
            lines = ["knb %d" % min(99999, n - i) for i in range(0, n, 99999)]
        elif kind == "vang":  # 1 vang = 100 bac = 10000 dong; AddMoney nhan dong
            lines = ["vang %d" % (int(val) * 10000)]
        elif kind == "nangngoc":  # ngoc ID 50<cap><loai 5 so>: moi loai duoi cap N co ban cap N -> "doi" (quatang.lua)
            lv = int(val)
            lines = ["doi %s 50%d%s" % (i, lv, i[3:]) for i in sorted(ITEM_NAME)
                     if re.match(r"^50[1-7]\d{5}$", i) and int(i[2]) < lv and ("50%d%s" % (lv, i[3:])) in ITEM_NAME]
            if not lines:
                return "Khong co loai ngoc nao nang len cap %d duoc" % lv
        else:
            lines = ["%s %s" % (kind, val)]
        with open(os.path.join(QUEUE, g + ".txt"), "a", encoding="ascii", newline="\n") as f:
            f.write("".join(l + "\n" for l in lines))
        line = "%s %s" % (kind, val) + (" (%d dong)" % len(lines) if len(lines) > 1 else "") if kind not in ("item", "xoa") else lines[0]
        audit("qua GUID %s: %s %s" % (g, line, ITEM_NAME.get(val, "") if kind in ("item", "xoa") else ""))
        return "Da xep hang qua cho GUID %s: %s. Nhan vat nhan khi dang nhap hoac doi ban do (dang online: dung truyen tong / qua cong)." % (g, line)
    if a == "capmin":
        val = v("gt")
        if not RE_INT.match(val) or not 0 <= int(val) <= 119:
            return "Cap toi thieu 0-119 (0 = tat)"
        os.makedirs(QUEUE, exist_ok=True)
        with open(CAPMIN, "w", encoding="ascii", newline="\n") as f:
            f.write(str(int(val)) + "\n")
        audit("cap toi thieu toan server = %s" % int(val))
        return ("Da tat cap toi thieu" if int(val) == 0 else
                "Cap toi thieu = %s: nhan vat se len cap khi dang nhap/doi ban do (ca nhan vat moi)" % int(val))
    if a == "capmax":   # 01/10: khoa cap - cay exp toi da cap N (10-119; bang cap engine cung 255 nen 120 trong ini van an toan), admin mo dan; restart=1 thi restart luon
        val = v("gt")
        if not RE_INT.match(val) or not 10 <= int(val) <= 119:
            return "Cap toi da 10-119 (119 = mo het)"
        n = int(val)
        capmax_set(n)
        rs = v("restart") == "1"
        audit("cap toi da (khoa cap) = %d%s (online: %d)" % (n, ", restart" if rs else "", online_count()))
        msg = "Da dat cap toi da = %d (ConfigInfo.ini HumanMaxDefaultLevel=%d). Nhan vat da cao hon giu nguyen cap." % (n, n + 1)
        if rs:
            subprocess.Popen(["systemctl", "restart", "tlbb"], stdin=subprocess.DEVNULL,
                             stdout=open("/tmp/panel-restart.log", "w"), stderr=subprocess.STDOUT)
            return msg + " Dang restart server (khoang 3 phut)."
        return msg + " Co hieu luc sau khi restart server."
    if a in ("expparam", "expreset"):   # 03/10: EXP toan server (ConfigInfo.ini ExpParam); restart=1 thi restart luon
        if a == "expparam":
            val = v("gt")
            if not RE_EXP.match(val) or not 0.1 <= float(val) <= 50:
                return "EXP 0.1-50, toi da 1 so le (vd 3 hoac 2.5)"
            s = exp_set(float(val), giu=True)
            msg = "Da dat EXP toan server x%s (ConfigInfo.ini ExpParam=%s)." % (s, s)
        else:
            s = exp_set(exp_macdinh(), giu=False)
            msg = "Da tra EXP ve mac dinh cua repo x%s." % s
        rs = v("restart") == "1"
        audit("EXP toan server = x%s (%s)%s (online: %d)" % (s, a, ", restart" if rs else "", online_count()))
        if rs:
            restart_game()
            return msg + " Dang restart server (khoang 3 phut)."
        return msg + " Co hieu luc sau khi restart server."
    if a in ("roi_them", "roi_xoa"):   # 03/10: roi them qua script (Ky Cuoc...), hieu luc ngay, khong restart
        rows = roi_doc()
        if a == "roi_xoa":
            st = v("stt")
            if not RE_INT.match(st) or int(st) >= len(rows):
                return "Dong khong ton tai (tai lai trang roi thu lai)"
            r = rows.pop(int(st))
            roi_ghi(rows)
            audit("roi them: xoa %s %s%% %s" % (r["k"], r["pct"], ",".join(r["ids"])))
            return "Da xoa dong roi them: %s %s%% %s" % (r["k"], r["pct"], ",".join(r["ids"]))
        k, pct, ids = v("khoa"), v("pct").replace(",", "."), [t.strip() for t in v("ids").replace(" ", ",").split(",") if t.strip()]
        if k not in ROI_KHOA:
            return "Hoat dong khong hop le"
        if not RE_ROI_PCT.match(pct) or not 0.01 <= float(pct) <= 100:
            return "Ti le 0.01-100 (%), toi da 2 so le"
        if not ids or len(ids) > 8:
            return "Nhap 1-8 ID vat pham hoac nhom (@ngoc6), cach nhau dau phay"
        for t in ids:
            if not RE_ROI_TU.match(t):
                return "ID khong hop le: %s" % t
            if t.startswith("@") and t not in ROI_NHOM:
                return "Khong co nhom %s (co: %s)" % (t, ", ".join(ROI_NHOM))
            if not t.startswith("@") and t not in ITEM_NAME:
                return "Khong co vat pham ID %s" % t
        if len(rows) >= 60:
            return "Toi da 60 dong"
        rows.append({"k": k, "pct": pct, "ids": ids})
        roi_ghi(rows)
        audit("roi them: them %s %s%% %s" % (k, pct, ",".join(ids)))
        return "Da them: %s - %s%% - %s. Co hieu luc ngay (quai chet tiep theo)." % (ROI_KHOA[k][0], pct, ", ".join(ROI_NHOM.get(t) or ITEM_NAME.get(t, t) for t in ids))
    if a == "luu_chung":   # 03/10: luu nhieu o 1 lan (cap toi thieu / khoa cap / EXP) - kiem het truoc roi moi ghi, restart 1 lan neu can
        cmin, cmax, ex, tp = v("capmin"), v("capmax"), v("exp"), v("tpmax")
        if not (cmin or cmax or ex or tp):
            return "Khong co o nao thay doi"
        if tp and (not RE_INT.match(tp) or not (int(tp) == 0 or 10 <= int(tp) <= 159)):
            return "Tam phap toi da 10-159 (0 = luat goc: cap nhan vat + 10). Chua luu gi."
        if cmin and (not RE_INT.match(cmin) or not 0 <= int(cmin) <= 119):
            return "Cap toi thieu 0-119 (0 = tat). Chua luu gi."
        if cmax and (not RE_INT.match(cmax) or not 10 <= int(cmax) <= 119):
            return "Cap toi da 10-119 (119 = mo het). Chua luu gi."
        if ex and ex != "macdinh" and (not RE_EXP.match(ex) or not 0.1 <= float(ex) <= 50):
            return "EXP 0.1-50, toi da 1 so le (vd 3 hoac 2.5). Chua luu gi."
        try:
            cmin_cu = int(open(CAPMIN).read().strip() or "0")
        except (OSError, ValueError):
            cmin_cu = 0
        lo = int(cmin) if cmin else cmin_cu
        hi = int(cmax) if cmax else capmax_get()
        if lo > 0 and hi > 0 and lo > hi:
            return "Cap toi thieu (%d) cao hon cap toi da (%d). Chua luu gi." % (lo, hi)
        doi = []
        if cmin:
            os.makedirs(QUEUE, exist_ok=True)
            with open(CAPMIN, "w", encoding="ascii", newline="\n") as f:
                f.write(str(int(cmin)) + "\n")
            doi.append("cap toi thieu %d" % int(cmin))
        if cmax:
            capmax_set(int(cmax))
            doi.append("cap toi da %d" % int(cmax))
        if ex:
            s = exp_set(exp_macdinh(), giu=False) if ex == "macdinh" else exp_set(float(ex), giu=True)
            doi.append("EXP x%s%s" % (s, " (mac dinh)" if ex == "macdinh" else ""))
        if tp:
            tpmax_set(int(tp))
            doi.append("tam phap toi da %s" % (int(tp) or "luat goc (cap nhan vat + 10)"))
        rs = bool(cmax or ex)   # cap toi thieu + tam phap toi da la script, khong can restart
        audit("luu chung: %s%s (online: %d)" % (", ".join(doi), ", restart" if rs else "", online_count()))
        if rs:
            restart_game()
            return "Da luu: %s. Dang restart server (khoang 3 phut)." % ", ".join(doi)
        return "Da luu: %s. Khong can restart." % ", ".join(doi)
    if a in ("doche_ap", "doche_tra"):   # 02/10: mau do che 8x/9x - doi EquipBase cua game (ngoai repo), restart=1 thi restart luon
        id_ = v("id")
        if a == "doche_ap":
            try:
                dong = [int(x) for x in v("dong").split(",") if x.strip()]
                cap_pc, tc = int(v("cap") or 0), int(v("tc") or 0)
            except ValueError:
                return "Du lieu mau khong hop le"
            ok, msg = maudoche.ap(id_, dong, cap_pc, tc)
        else:
            if id_ != "all" and not RE_INT.match(id_):
                return "ID khong hop le"
            ok, msg = maudoche.tra(id_)
        if not ok:
            return msg
        rs = v("restart") == "1"
        audit("mau do che: %s%s (online: %d)" % (msg, ", restart" if rs else "", online_count()))
        if rs:
            subprocess.Popen(["systemctl", "restart", "tlbb"], stdin=subprocess.DEVNULL,
                             stdout=open("/tmp/panel-restart.log", "w"), stderr=subprocess.STDOUT)
            return msg + " Dang restart server (khoang 3 phut)."
        return msg
    if a == "huy_qua":
        g = v("guid")
        if RE_INT.match(g):
            open(os.path.join(QUEUE, g + ".txt"), "w").close()
            pp = os.path.join(POPUP, g + ".txt")
            if os.path.exists(pp):
                open(pp, "w").close()
            audit("huy qua GUID %s" % g)
            return "Da huy qua cho GUID %s" % g
    if a in ("gm_bat", "gm_tat"):
        g = v("guid")
        if not RE_INT.match(g):
            return "GUID khong hop le"
        cur = gm_guids()
        cur = sorted(set(cur) | {g}) if a == "gm_bat" else [x for x in cur if x != g]
        write_gm(cur)
        audit("%s GUID %s" % (a, g))
        return "Da cap nhat GM list. Can RESTART server de co hieu luc."
    if a == "go_ket":
        # Bi disconnect ma khong vao lai duoc: xoa co online + chi khoi dong lai Login (~3 giay).
        # Nguoi dang choi khong bi van (ho ket noi toi Server:3731, khong phai Login:7384).
        n = v("ten")
        if n and not RE_ACC.match(n):
            return "Ten khong hop le"
        sql("UPDATE web.account SET is_online=0" + (" WHERE name='%s'" % n if n else ""))
        subprocess.run(["pkill", "-x", "Login"])
        for _ in range(10):
            if not running("Login"):
                break
            time.sleep(1)
        if running("Login"):
            subprocess.run(["pkill", "-9", "-x", "Login"])
            time.sleep(1)
        # systemd-run: Login chay trong unit rieng, khong dinh cgroup cua panel
        subprocess.run(["systemd-run", "--quiet", "--collect", "--unit", "tlbb-login-%d" % int(time.time()),
                        "chroot", ROOT, "/bin/bash", "-c", "ulimit -n 65535; cd /home/tlbb/Server && exec ./Login"])
        time.sleep(3)
        audit("go ket dang nhap %s (restart Login)" % (n or "tat ca"))
        return ("Da go ket %s. Doi 5-10 giay roi dang nhap lai. Neu van bi bao dang online, doi 1-2 phut "
                "(server con giu nhan vat cu) roi thu lai." % (n or "tat ca tai khoan")) if running("Login") else \
            "Login KHONG len lai duoc - bam Restart server"
    if a == "restart":
        audit("restart server (online: %d)" % online_count())
        # QUA systemd: tien trinh game phai nam trong tlbb.service, KHONG nam trong cgroup cua panel.
        # (28/09: restart game tu panel roi restart panel -> systemd tat luon ca game, mat du lieu.)
        subprocess.Popen(["systemctl", "restart", "tlbb"], stdin=subprocess.DEVNULL,
                         stdout=open("/tmp/panel-restart.log", "w"), stderr=subprocess.STDOUT)
        return "Dang restart (khoang 3 phut). Tai lai trang sau do."
    return "Hanh dong la: " + a


# ---------------------------------------------------------------- giao dien
CSS = """
body{font-family:system-ui,sans-serif;margin:0;background:#f4f5f7;color:#1d2330}
header{background:#1d2330;color:#fff;padding:12px 20px;display:flex;gap:20px;align-items:center;flex-wrap:wrap}
header b{font-size:18px}.st{font-size:13px;opacity:.85}
main{max-width:1100px;margin:0 auto;padding:16px;display:grid;gap:16px}
section{background:#fff;border-radius:8px;padding:14px 16px;box-shadow:0 1px 2px #0001}
h2{font-size:16px;margin:0 0 10px}table{border-collapse:collapse;width:100%;font-size:14px}
td,th{border-bottom:1px solid #e5e7eb;padding:6px 8px;text-align:left;vertical-align:top}
input,select,button{font:inherit;padding:5px 8px;border:1px solid #c9ced6;border-radius:5px}
button{background:#2457d6;color:#fff;border:0;cursor:pointer}button.r{background:#c0392b}button.g{background:#5b6475}
form.in{display:inline}.msg{background:#e7f6ec;border:1px solid #9bd3ad;padding:8px 12px;border-radius:6px}
.row{display:flex;gap:8px;flex-wrap:wrap;align-items:center}.muted{color:#6b7280;font-size:13px}
.on{color:#138a36}.off{color:#c0392b}code{background:#eef0f3;padding:1px 4px;border-radius:3px}
"""


def esc(s):
    return html.escape(str(s))


def btn(action, label, hidden=None, cls="", confirm=None):
    h = "".join('<input type="hidden" name="%s" value="%s">' % (esc(k), esc(v)) for k, v in (hidden or {}).items())
    oc = ' onsubmit="return confirm(%s)"' % esc(json.dumps(confirm)) if confirm else ""
    return ('<form class="in" method="post"%s><input type="hidden" name="t" value="%s">'
            '<input type="hidden" name="a" value="%s">%s<button class="%s">%s</button></form>') % (
        oc, TOKEN, action, h, cls, esc(label))


def page(msg="", q=""):
    procs = " ".join('<span class="%s">%s</span>' % ("on" if running(p) else "off", p)
                     for p in ["mysqld", "billing", "ShareMemory", "Login", "World", "Server"])
    mem = open("/proc/meminfo").read()
    tot = int(re.search(r"MemTotal:\s+(\d+)", mem).group(1)) // 1024
    avail = int(re.search(r"MemAvailable:\s+(\d+)", mem).group(1)) // 1024
    out = ['<!doctype html><meta charset="utf-8"><meta name="viewport" content="width=device-width">',
           '<title>NetCo4 Admin</title><style>%s</style>' % CSS,
           '<header><b>NetCo4 Admin</b><span class="st">%s</span><span class="st">Online: %d</span>'
           '<span class="st">RAM: %d/%d MB</span><a href="/logout" style="color:#fff;margin-left:auto">Dang xuat</a></header><main>' % (procs, online_count(), tot - avail, tot)]
    if msg:
        out.append('<div class="msg">%s</div>' % esc(msg))
    try:
        accs, chs = accounts(), chars()
    except Exception as e:  # MySQL tat
        out.append('<section><b class="off">Khong doc duoc database: %s</b></section>' % esc(e))
        accs, chs = [], []
    gms = set(gm_guids())

    # Tai khoan
    out.append('<section><h2>Tai khoan (%d)</h2>' % len(accs))
    out.append('<form method="post" class="row"><input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="tao_tk">'
               '<input name="ten" placeholder="ten dang nhap" required pattern="[a-z0-9_]{3,20}">'
               '<input name="mk" placeholder="mat khau" required pattern="[A-Za-z0-9_@.!\\-]{6,32}"><button>Tao tai khoan</button>'
               '<span class="muted">a-z 0-9 _ ; mat khau 6-32 ky tu</span></form><table><tr><th>ID</th><th>Ten</th><th>Online</th><th></th></tr>' % TOKEN)
    online_acc = {n for _, n, on in accs if on}
    for i, n, on in accs:
        doi = ('<form class="in" method="post"><input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="doi_mk">'
               '<input type="hidden" name="ten" value="%s"><input name="mk" placeholder="mat khau moi" size="12" required>'
               '<button class="g">Doi MK</button></form> ') % (TOKEN, esc(n))
        xoa = btn("xoa_tk", "Xoa", {"ten": n}, "r", "Xoa tai khoan %s?" % n) if n != "admin" else ""
        ket = btn("go_ket", "Go ket", {"ten": n}, "g")
        out.append("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s%s %s</td></tr>" % (
            esc(i), esc(n), '<b class="on">online</b>' if on else '<span class="muted">-</span>', doi, ket, xoa))
    out.append("</table></section>")

    # Nhan vat + phat qua
    give_form = ('<form method="post" class="row"><input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="qua">'
                 '<input type="hidden" name="guid" value="%%s"><select name="loai"><option value="item">Vat pham (ID)</option><option value="xoa">XOA vat pham (ID)</option><option value="nangngoc">Nang ngoc trong tui len cap (2-7)</option>'
                 '<option value="knb">KNB</option><option value="vang">Vang</option><option value="diemtang">Diem Tang</option><option value="level">Len cap (1-119)</option><option value="vip">Cap VIP (0-10)</option><option value="popup">Qua popup (cua so, chon nguoi)</option><option value="pet12">Pet Huyen Hoa 12000 (admin cap)</option><option value="petv2">Pet Huyen Hoa V2 (chi so binh thuong)</option><option value="pettt">Pet Huyen Hoa Tan Thu (cap mang 5)</option><option value="petall">Pet khac (tat ca)</option></select>'
                 '<input name="gt" placeholder="ID vat pham" size="12" required pattern="\\d{1,10}">'
                 '<select name="gtpet" style="display:none;max-width:300px"></select>'
                 '<input name="sl" placeholder="SL" size="3" value="1" pattern="\\d{1,3}"><button%%s>%%s</button></form>') % TOKEN
    out.append('<section><h2>Nhan vat (%d) - phat qua / GM</h2>' % len(chs))
    out.append('<div class="row"><b>Gui cho TAT CA nhan vat:</b> %s</div><br>' % (
        give_form % ("all", ' class="r" onclick="return confirm(\'Gui cho tat ca nhan vat?\')"', "Gui tat ca")))
    try:
        capmin = open(CAPMIN).read().strip() or "0"
    except OSError:
        capmin = "0"
    out.append('<form method="post" class="row"><input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="capmin">'
               '<b>Cap toi thieu toan server:</b><input name="gt" value="%s" size="4" required pattern="\\d{1,3}"><button>Luu</button>'
               '<span class="muted">0 = tat. Nhan vat thap hon se len cap khi dang nhap/doi ban do, ke ca nhan vat tao sau nay.'
               ' Can script moi (restart game sau lan deploy dau).</span></form><br>' % (TOKEN, esc(capmin)))
    out.append('<form method="post" class="row" onsubmit="return confirm(\'Luu cap toi da va RESTART server? Nguoi dang choi se bi ngat.\')">'
               '<input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="capmax"><input type="hidden" name="restart" value="1">'
               '<b>Cap toi da (khoa cap):</b><input name="gt" value="%d" size="4" required pattern="\\d{2,3}"><button class="r">Luu + Restart</button>'
               '<span class="muted">10-119 (119 = mo het). Nguoi choi cay exp toi da toi cap nay; nhan vat da cao hon giu nguyen.</span></form><br>' % (TOKEN, capmax_get()))
    out.append('<form method="post" class="row" onsubmit="return confirm(\'Luu EXP toan server va RESTART server? Nguoi dang choi se bi ngat.\')">'
               '<input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="expparam"><input type="hidden" name="restart" value="1">'
               '<b>EXP toan server: x</b><input name="gt" value="%g" size="4" required pattern="\\d{1,2}(\\.\\d)?"><button class="r">Luu + Restart</button>'
               '<span class="muted">0.1-50 (ConfigInfo.ini ExpParam). Mac dinh repo: x%g.</span></form>'
               '<form method="post" class="row" onsubmit="return confirm(\'Tra EXP ve mac dinh va RESTART server?\')">'
               '<input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="expreset"><input type="hidden" name="restart" value="1">'
               '<button class="r">Tra ve mac dinh + Restart</button></form><br>' % (TOKEN, exp_get(), exp_macdinh(), TOKEN))
    out.append('<table><tr><th>GUID</th><th>Tai khoan</th><th>Nhan vat</th>'
               '<th>Cap</th><th>Online</th><th>GM</th><th>Qua dang cho</th><th>Phat qua</th></tr>')
    for g, acc, name, lv in chs:
        pend = pending(g)
        pend_s = "<br>".join(esc(p) for p in tom_tat(pend)) or '<span class="muted">-</span>'
        if pend:
            pend_s += "<br>" + btn("huy_qua", "Huy", {"guid": g}, "g")
        gm = (btn("gm_tat", "Tat GM", {"guid": g}, "r") if g in gms else btn("gm_bat", "Cap GM", {"guid": g}, "g"))
        give = give_form % (esc(g), "", "Gui")
        on = '<b class="on">online</b>' if acc in online_acc else '<span class="muted">-</span>'
        out.append("<tr><td>%s</td><td>%s</td><td><b>%s</b></td><td>%s</td><td>%s</td><td>%s%s</td><td>%s</td><td>%s</td></tr>" % (
            esc(g), esc(acc), esc(name), esc(lv), on, "GM " if g in gms else "", gm, pend_s, give))
    out.append('</table><p class="muted">Qua duoc phat khi nhan vat <b>dang nhap hoac doi ban do</b> (dang online: dung truyen tong / qua cong). '
               'Tui day thi phan con lai nhan o lan sau. Doi GM can restart.</p></section>')

    # Tim vat pham
    out.append('<section><h2>Tim ID vat pham</h2><form method="get" class="row"><input name="q" value="%s" placeholder="vd: trung lau giap, nhan thach, 10553110 (khong can dau)" size="40">'
               '<button>Tim</button><span class="muted">%d vat pham trong danh muc</span></form>' % (esc(q), len(ITEMS)))
    if q:
        ql = khong_dau(q.strip())
        hits = [it for it in ITEMS if ql in ITEM_KEY[it[0]] or ql == it[0]][:80]
        out.append("<table><tr><th>ID</th><th>Ten</th><th>Loai</th></tr>")
        for i, n, k in hits:
            out.append("<tr><td><code>%s</code></td><td>%s</td><td>%s</td></tr>" % (esc(i), esc(n), esc(k)))
        out.append("</table>" if hits else '</table><p class="muted">Khong thay</p>')
    out.append("</section>")

    # Server
    out.append('<section><h2>Server</h2><div class="row">%s<span class="muted">Bi disconnect ma khong vao lai duoc: '
               'chi khoi dong lai Login, nguoi dang choi khong bi van.</span></div><br><div class="row">%s'
               '<span class="muted">Dang co %d nguoi online se bi ngat ket noi (~3 phut).</span></div></section>' % (
        btn("go_ket", "Go ket dang nhap (tat ca)", cls="g"),
        btn("restart", "Restart server", cls="r", confirm="Restart server? Nguoi dang choi se bi ngat."), online_count()))
    out.append("</main>")
    # Form phat qua: o "gt" la ID (vat pham/popup) hoac so (KNB/vang/VIP); o SL chi dung cho vat pham
    # Gan su kien trong script, KHONG dung onchange="..." inline: trong handler inline, ten "loai" bi form.loai (chinh o select) che mat
    # danh sach pet render 1 lan (6.368 lua chon), JS sao chep vao form khi chon Pet
    for tid, glist in (("petTpl12", PET_12000), ("petTplV2", PET_V2), ("petTplAll", PET_ALL), ("petTplTT", PET_TANTHU)):
        out.append('<select id="%s" style="display:none">%s</select>' % (tid, "".join('<option value="%s">%s - %s</option>' % (esc(i), esc(i), esc(n)) for i, n in glist)))
    out.append('<script>function doiLoai(s){var f=s.form,it=s.value=="item"||s.value=="xoa";'
               'f.gt.placeholder={item:"ID vat pham",xoa:"ID can xoa",nangngoc:"Cap ngoc (2-7)",knb:"So KNB (1-10000000)",vang:"So vang (1-100000)",diemtang:"So Diem Tang",level:"Cap (1-119)",vip:"Cap VIP 0-10",popup:"ID vat pham"}[s.value];'
               'var tpl={pet12:"petTpl12",petv2:"petTplV2",petall:"petTplAll",pettt:"petTplTT"}[s.value],pet=!!tpl;f.gt.style.display=pet?"none":"";f.gt.disabled=pet;f.gt.required=!pet;if(f.gtpet){f.gtpet.style.display=pet?"":"none";f.gtpet.disabled=!pet;if(pet&&f.gtpet.dataset.tpl!=tpl){f.gtpet.innerHTML=document.getElementById(tpl).innerHTML;f.gtpet.dataset.tpl=tpl}}'
               'f.sl.style.display=it?"":"none";f.sl.disabled=!it}'
               'document.querySelectorAll("select[name=loai]").forEach(function(s){s.onchange=function(){doiLoai(s)};doiLoai(s)})</script>')
    return "".join(out)


# ---------------------------------------------------------------- API noi bo (panel mini game)
# 29/09: tab "GM Thien Long" trong panel mini game (admin.netco4.click, repo bialk) dung chung
# logic nay qua JSON. Chi nhan ket noi THANG tu 127.0.0.1 (khong qua nginx: nginx luon them
# X-Real-IP) + header X-NetCo4-Key = PANEL_PASS (bot cung VPS doc tu secrets.env).
def api_state():
    procs = {p: running(p) for p in ["mysqld", "billing", "ShareMemory", "Login", "World", "Server"]}
    mem = open("/proc/meminfo").read()
    tot = int(re.search(r"MemTotal:\s+(\d+)", mem).group(1)) // 1024
    avail = int(re.search(r"MemAvailable:\s+(\d+)", mem).group(1)) // 1024
    err = None
    try:
        accs, chs = accounts(), chars()
    except Exception as e:  # MySQL tat
        accs, chs, err = [], [], str(e)
    online_acc = {n for _, n, on in accs if on}
    gms = set(gm_guids())
    try:
        capmin = open(CAPMIN).read().strip() or "0"
    except OSError:
        capmin = "0"
    out_chars = []
    for g, acc, name, lv in chs:
        pend = pending(g)
        out_chars.append({"guid": g, "account": acc, "name": name, "level": lv, "online": acc in online_acc,
                          "gm": g in gms, "pending": tom_tat(pend), "hasPending": bool(pend)})
    return {"procs": procs, "online": online_count(), "ram": [tot - avail, tot], "dbError": err,
            "accounts": [{"id": i, "name": n, "online": on} for i, n, on in accs],
            "chars": out_chars, "capmin": capmin, "capmax": capmax_get(), "itemCount": len(ITEMS),
            "expparam": exp_get(), "expDefault": exp_macdinh(), "tpmax": tpmax_get(), "roithem": roi_state(),   # 03/10
            "pets": [{"id": i, "name": n} for i, n in PET_V2]}


def api_items(q):
    ql = khong_dau((q or "").strip())
    if not ql:
        return []
    return [{"id": i, "name": n, "kind": k} for i, n, k in ITEMS if ql in ITEM_KEY[i] or ql == i][:80]


LOGIN_PAGE = ('<!doctype html><meta charset="utf-8"><meta name="viewport" content="width=device-width">'
              '<title>NetCo4 Admin</title><style>{CSS}</style><main style="max-width:360px;margin:12vh auto">'
              '<section><h2>NetCo4 Admin</h2>{MSG}<form method="post" action="/login" class="row">'
              '<input type="password" name="p" placeholder="mat khau panel" autofocus required style="flex:1">'
              '<button>Dang nhap</button></form></section></main>').replace('{CSS}', CSS)


def login_page(msg):
    return LOGIN_PAGE.replace("{MSG}", msg)


class H(BaseHTTPRequestHandler):
    def _host_ok(self):
        return self.headers.get("Host", "") in ("%s:%d" % (h, PORT) for h in (PUBLIC_IP, "127.0.0.1", "localhost"))

    def _ip(self):
        # Sau nginx (gm.netco4.click) moi ket noi deu tu 127.0.0.1: lay IP that tu X-Real-IP,
        # chi tin header nay khi ket noi den tu chinh may (nguoi ngoai khong gia duoc).
        ip = self.client_address[0]
        if ip in ("127.0.0.1", "::1") and self.headers.get("X-Real-IP"):
            return self.headers.get("X-Real-IP").strip()[:45]
        return ip

    def _cookie(self):
        m = re.search(r"(?:^|;\s*)nc4=([A-Za-z0-9_-]+)", self.headers.get("Cookie", ""))
        return m.group(1) if m else ""

    def _authed(self):
        c = self._cookie()
        exp = SESSIONS.get(c)
        if exp and exp > time.time():
            return True
        SESSIONS.pop(c, None)
        return False

    def _login(self):
        ip = self._ip()
        n, until = FAILS.get(ip, [0, 0])
        if until > time.time():
            return self._send(login_page('<p class="off">IP bi khoa %d phut do sai qua nhieu lan.</p>' % LOCK_MIN), 429)
        ln = int(self.headers.get("Content-Length", 0) or 0)
        p = parse_qs(self.rfile.read(min(ln, 2000)).decode("utf-8", "replace")).get("p", [""])[0]
        if PANEL_PASS and secrets.compare_digest(p, PANEL_PASS):
            FAILS.pop(ip, None)
            c = secrets.token_urlsafe(32)
            SESSIONS[c] = time.time() + SESSION_HOURS * 3600
            audit("dang nhap panel tu %s" % ip)
            self.send_response(303)
            self.send_header("Set-Cookie", "nc4=%s; Path=/; Max-Age=%d; HttpOnly; Secure; SameSite=Strict" % (c, SESSION_HOURS * 3600))
            self.send_header("Location", "/")
            self.send_header("Content-Length", "0")
            self.end_headers()
            return
        n += 1
        FAILS[ip] = [n, time.time() + LOCK_MIN * 60 if n >= MAX_FAIL else 0]
        audit("SAI mat khau panel tu %s (lan %d)" % (ip, n))
        time.sleep(1)
        self._send(login_page('<p class="off">Sai mat khau.</p>'), 401)

    def _internal_ok(self):
        return (self.client_address[0] in ("127.0.0.1", "::1") and not self.headers.get("X-Real-IP")
                and bool(PANEL_PASS) and secrets.compare_digest(self.headers.get("X-NetCo4-Key", ""), PANEL_PASS))

    def _json(self, obj, code=200):
        b = json.dumps(obj, ensure_ascii=False).encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(b)))
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        self.wfile.write(b)

    def _api(self, method):
        if not self._internal_ok():
            audit("API noi bo bi tu choi tu %s" % self._ip())
            return self._json({"ok": False, "error": "forbidden"}, 403)
        u = urlparse(self.path)
        try:
            if method == "GET" and u.path == "/api/state":
                return self._json({"ok": True, "state": api_state()})
            if method == "GET" and u.path == "/api/pets":   # 30/09: danh sach pet theo nhom cho o chon tren tab GM web (tai 1 lan)
                return self._json({"ok": True, "groups": [{"name": g, "pets": [{"id": i, "name": n} for i, n in l]} for g, l in PET_GROUPS], "skins": PET_SKINS})
            if method == "GET" and u.path == "/api/doche":   # 02/10: danh sach do che 8x/9x + mau dang ap
                return self._json({"ok": True, "data": maudoche.du_lieu(), "mau": maudoche.doc_mau()})
            if method == "GET" and u.path == "/api/items":
                qs = parse_qs(u.query)
                if qs.get("all") == ["1"]:  # ca danh muc cho bot mini game (shop item / qua moi ngay)
                    return self._json({"ok": True, "items": [{"id": i, "name": n, "kind": k} for i, n, k in ITEMS]})
                return self._json({"ok": True, "items": api_items(qs.get("q", [""])[0])})
            if method == "POST" and u.path == "/api/act":
                n = int(self.headers.get("Content-Length", 0) or 0)
                form = json.loads(self.rfile.read(min(n, 10000)).decode("utf-8", "replace") or "{}")
                form = {str(k): str(v) for k, v in form.items()}
                if form.get("a") != "kiem_mk":  # 30/09: khong ghi ma bam mat khau vao audit
                    audit("[admin.netco4.click] %s" % json.dumps(form, ensure_ascii=False)[:200])
                msg = act(form)
                return self._json({"ok": True, "msg": msg, "done": msg.startswith(("Da ", "Dang "))})
        except Exception as e:
            return self._json({"ok": False, "error": "Loi: %s" % e}, 500)
        return self._json({"ok": False, "error": "khong co API nay"}, 404)

    def _send(self, body, code=200):
        b = body.encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(b)))
        # Chi cho panel mini game (admin.netco4.click, tab "Thien Long & KNB") nhung trang nay; trang khac bi chan
        self.send_header("Content-Security-Policy", "frame-ancestors 'self' https://admin.netco4.click")
        self.send_header("Cache-Control", "no-store")
        self.send_header("Strict-Transport-Security", "max-age=86400")
        self.end_headers()
        self.wfile.write(b)

    def _redirect(self, msg):
        # Post/Redirect/Get: F5 sau khi gui form khong gui lai lan nua
        self.send_response(303)
        self.send_header("Location", "/?" + urlencode({"m": msg}))
        self.send_header("Content-Length", "0")
        self.end_headers()

    def do_GET(self):
        if not self._host_ok():
            return self._send("Forbidden", 403)
        if urlparse(self.path).path.startswith("/api/"):
            return self._api("GET")
        if urlparse(self.path).path == "/logout":
            SESSIONS.pop(self._cookie(), None)
            return self._send(login_page(""))
        if not self._authed():
            return self._send(login_page(""))
        qs = parse_qs(urlparse(self.path).query)
        self._send(page(msg=qs.get("m", [""])[0], q=qs.get("q", [""])[0]))

    def do_POST(self):
        if not self._host_ok():
            return self._send("Forbidden", 403)
        if urlparse(self.path).path.startswith("/api/"):
            return self._api("POST")
        if urlparse(self.path).path == "/login":
            return self._login()
        if not self._authed():
            return self._send(login_page(""), 401)
        n = int(self.headers.get("Content-Length", 0) or 0)
        form = {k: v[0] for k, v in parse_qs(self.rfile.read(min(n, 10000)).decode("utf-8", "replace")).items()}
        if not secrets.compare_digest(form.get("t", ""), TOKEN):
            return self._redirect("Phien het han (panel vua khoi dong lai). Thu lai.")
        try:
            msg = act(form)
        except Exception as e:
            msg = "Loi: %s" % e
        self._redirect(msg)

    def log_message(self, *a):
        pass


if __name__ == "__main__":
    import ssl
    if not PANEL_PASS or len(PANEL_PASS) < 16:
        raise SystemExit("Thieu PANEL_PASS (>=16 ky tu) trong deploy/secrets.env")
    os.makedirs(QUEUE, exist_ok=True)
    os.makedirs(POPUP, exist_ok=True)
    crt, key = CERT_DIR + "/panel.crt", CERT_DIR + "/panel.key"
    if not os.path.exists(crt):
        os.makedirs(CERT_DIR, mode=0o700, exist_ok=True)
        subprocess.run(["openssl", "req", "-x509", "-newkey", "rsa:2048", "-nodes", "-days", "3650",
                        "-subj", "/CN=%s" % PUBLIC_IP, "-addext", "subjectAltName=IP:%s" % PUBLIC_IP,
                        "-keyout", key, "-out", crt], check=True, capture_output=True)
        os.chmod(key, 0o600)
    srv = ThreadingHTTPServer((HOST, PORT), H)
    ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    ctx.minimum_version = ssl.TLSVersion.TLSv1_2
    ctx.load_cert_chain(crt, key)
    srv.socket = ctx.wrap_socket(srv.socket, server_side=True)
    print("NetCo4 panel: https://%s:%d" % (PUBLIC_IP, PORT))
    srv.serve_forever()
