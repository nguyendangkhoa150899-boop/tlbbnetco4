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
POPUP = GAME + "/Server/txt/NetCo4Popup"   # qua popup (cua so Qua ngay le) do admin chon nguoi
GMLIST = GAME + "/Server/Config/GMList.ini"
MYSQL = "/usr/local/mysql5.0.45/bin/mysql"
LOG = "/opt/tlbb-backup/panel.log"
TOKEN = secrets.token_urlsafe(24)  # doi moi lan khoi dong panel (chong CSRF)


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
        else:
            out.append(p + ("  " + ITEM_NAME.get(k[1], "") if k[0] in ("item", "popup") and len(k) > 1 else ""))
    for k, n in tong.items():
        out.append("vang %g" % (n / 10000.0) if k == "vang" else "%s %d" % (k, n))
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
    if a == "xoa_tk":
        n = v("ten")
        if not RE_ACC.match(n) or n == "admin":
            return "Khong xoa duoc tai khoan nay"
        sql("DELETE FROM web.account WHERE name='%s'" % n)
        audit("xoa tai khoan %s" % n)
        return "Da xoa tai khoan %s" % n
    if a == "qua":
        g, kind, val, cnt = v("guid"), v("loai"), v("gt"), v("sl") or "1"
        if g == "all":
            targets = [c[0] for c in chars()]
            if not targets:
                return "Chua co nhan vat nao"
            msgs = [act(dict(form, guid=t)) for t in targets]
            bad = [m for m in msgs if not m.startswith("Da xep")]
            return bad[0] if bad else "Da xep hang qua cho %d nhan vat" % len(targets)
        if not RE_INT.match(g) or kind not in ("item", "knb", "vang", "diemtang", "level", "vip", "popup") or not RE_INT.match(val) or not RE_INT.match(cnt):
            return "Du lieu qua khong hop le"
        if kind in ("item", "popup") and val not in ITEM_NAME:
            return "Khong co vat pham ID %s trong danh muc" % val
        if kind == "item" and not 1 <= int(cnt) <= 999:
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
        if kind == "popup":
            os.makedirs(POPUP, exist_ok=True)
            with open(os.path.join(POPUP, g + ".txt"), "w", encoding="ascii", newline="\n") as f:
                f.write(val + "\n")
            audit("popup GUID %s: item %s %s" % (g, val, ITEM_NAME.get(val, "")))
            return "Da dat qua popup cho GUID %s: %s. Nguoi choi thay cua so qua khi vao game (moi nguoi 1 mon, dat lai se thay mon cu)." % (g, ITEM_NAME.get(val, val))
        os.makedirs(QUEUE, exist_ok=True)
        if kind == "item":
            lines = ["item %s %s" % (val, cnt)]
        elif kind == "knb":  # YuanBao chi nen cong toi da 99999 moi lan (docs/lenh-gm.txt): chia nhieu dong
            n = int(val)
            lines = ["knb %d" % min(99999, n - i) for i in range(0, n, 99999)]
        elif kind == "vang":  # 1 vang = 100 bac = 10000 dong; AddMoney nhan dong
            lines = ["vang %d" % (int(val) * 10000)]
        else:
            lines = ["%s %s" % (kind, val)]
        with open(os.path.join(QUEUE, g + ".txt"), "a", encoding="ascii", newline="\n") as f:
            f.write("".join(l + "\n" for l in lines))
        line = "%s %s" % (kind, val) + (" (%d dong)" % len(lines) if len(lines) > 1 else "") if kind != "item" else lines[0]
        audit("qua GUID %s: %s %s" % (g, line, ITEM_NAME.get(val, "") if kind == "item" else ""))
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
                "Cap toi thieu = %s: nhan vat da vao mon phai se len cap khi dang nhap/doi ban do (ca nhan vat moi)" % int(val))
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
                 '<input type="hidden" name="guid" value="%%s"><select name="loai"><option value="item">Vat pham (ID)</option>'
                 '<option value="knb">KNB</option><option value="vang">Vang</option><option value="diemtang">Diem Tang</option><option value="level">Len cap (1-119)</option><option value="vip">Cap VIP (0-10)</option><option value="popup">Qua popup (cua so, chon nguoi)</option></select>'
                 '<input name="gt" placeholder="ID vat pham" size="12" required pattern="\\d{1,10}">'
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
               '<span class="muted">0 = tat. Nhan vat da vao mon phai ma thap hon se len cap khi dang nhap/doi ban do, ke ca nhan vat tao sau nay.'
               ' Can script moi (restart game sau lan deploy dau).</span></form><br>' % (TOKEN, esc(capmin)))
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
    out.append('<script>function doiLoai(s){var f=s.form,it=s.value=="item";'
               'f.gt.placeholder={item:"ID vat pham",knb:"So KNB (1-10000000)",vang:"So vang (1-100000)",diemtang:"So Diem Tang",level:"Cap (1-119)",vip:"Cap VIP 0-10",popup:"ID vat pham"}[s.value];'
               'f.sl.style.display=it?"":"none";f.sl.disabled=!it}'
               'document.querySelectorAll("select[name=loai]").forEach(function(s){s.onchange=function(){doiLoai(s)};doiLoai(s)})</script>')
    return "".join(out)


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
        return self.client_address[0]

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

    def _send(self, body, code=200):
        b = body.encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(b)))
        self.send_header("X-Frame-Options", "DENY")
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
