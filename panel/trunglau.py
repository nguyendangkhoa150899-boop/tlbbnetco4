#!/usr/bin/env python3
"""08/10: CUSTOM TRUNG LAU (chi dong moi 10553100-10553114, bo dong cu 1042xxxx) - trang admin bot (tab GM, chi cong SUPER).

Admin chinh cho tung ma Trung Lau:
  - DONG thuoc tinh: bat dong nao (58 loai, tran 16 dong). Luu tren mon LUC TAO -> chi mon moi tao / Chan Trung Lau dem tay
    moi an dong moi; mon dang co giu dong cu.
  - DIEM tung dong: server TINH LAI moi lan nhan vat vao game = ceil(V x Rate[cap][k] / 100) (Trung Lau quy tac pham chat
    cot 90 = cap co dinh, T = cot 100 = 0 -> khong rand; da kiem khop tooltip 08/10: Trung Lau Ngoc HP 12520 x 90 = 11268).
    Moi ma co doan gia tri RIENG 4501-4515 (doan goc 100 dung chung 352 mon, 4321 chung 6 mon Chan) -> doi diem chi anh
    huong ma do, va ap cho CA mon dang co (sau restart) o nhung dong mon do co.
  - HIEU UNG than khi (StandardImpact, chung toan server): ti le kich hoat, thoi gian hieu ung con, Vai mien %, Giap phan % / tran.
    Hai ma dung chung 1 hieu ung (vd Lien 10553100 va 10553112) -> doi la doi ca hai.

Cach ghi (idempotent): moi lan ap DUNG LAI tu ban repo cho dung 15 dong EquipBase + cac dong StandardImpact Trung Lau,
xoa roi them lai doan 4501-4515 trong ItemSegValue. Cac dong khac cua 3 file game giu nguyen (mau do che, Drop Boss...).
Cau hinh luu Server/txt/NetCo4Cfg/trunglau.json (ngoai repo); cap-nhat.sh goi `--ap-lai` sau rsync. Co hieu luc sau restart.
Sao luu 3 file game truoc moi lan ghi: /opt/tlbb-backup/trunglau-<thoi gian>/.
"""
import json
import math
import os
import shutil
import sys
import time

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GAME = os.environ.get("TLBB_GAME", "/opt/tlbb-root/home/tlbb")
BACKUP = os.environ.get("TLBB_BACKUP", "/opt/tlbb-backup")
CFG = GAME + "/Server/txt/NetCo4Cfg/trunglau.json"
SRV = os.path.join(REPO, "server")
F_EB, F_SV, F_SI = "Public/Config/EquipBase.txt", "Public/Config/ItemSegValue.txt", "Server/Config/StandardImpact.txt"
F_RATE = "Server/Config/ItemSegRate.txt"
TENVIET = os.path.join(REPO, "docs", "vat-pham", "ten-viet.tsv")

# dong moi 10553100-10553114 + 2 ma CU giao dich duoc han (khong khoa): Gioi 10422016, Ngoc 10423024 (them 08/10, chu server can ban trade)
IDS = [str(i) for i in range(10553100, 10553115)] + ["10422016", "10423024"]
SEG0 = 4501                      # doan rieng theo thu tu IDS: 10553100 -> 4501 ... 10553114 -> 4515, 10422016 -> 4516, 10423024 -> 4517
MAX_DONG = 16                    # tran so dong cua engine (cot 93)
DONG = ["Sinh lực tối đa", "Sinh lực tối đa %", "Hồi sinh lực", "Nội lực tối đa (MP)", "Nội lực tối đa % (MP)", "Hồi nội lực (MP)",
        "Băng công", "Kháng băng", "Giảm thời gian băng", "Hỏa công", "Kháng hỏa", "Giảm thời gian hỏa",
        "Huyền công", "Kháng huyền", "Giảm thời gian huyền", "Độc công", "Kháng độc", "Giảm thời gian độc",
        "Triệt tiêu thuộc tính %", "Ngoại công", "Ngoại công %", "Ngoại công gốc trang bị %", "Phòng ngoại",
        "Phòng ngoại %", "Phòng ngoại gốc trang bị %", "Triệt ngoại công %", "Nội công", "Nội công %",
        "Nội công gốc trang bị %", "Phòng nội", "Phòng nội %", "Phòng nội gốc trang bị %", "Triệt nội công %",
        "Tốc đánh", "Hồi chiêu", "Chính xác", "Né tránh", "Hội công", "Bỏ qua phòng thủ %", "Tốc độ di chuyển %",
        "Phản đòn", "Nội lực hấp thụ sát thương", "Cường lực", "Nội lực", "Thể lực", "Trí lực", "Thân pháp",
        "Phòng hội công", "Tất cả thuộc tính", "Hút sinh lực", "Hút nội lực", "Tăng 1 kỹ năng", "Tăng mọi kỹ năng",
        "Tỉ lệ kỹ năng đặc biệt", "Bỏ qua kháng băng", "Bỏ qua kháng hỏa", "Bỏ qua kháng huyền", "Bỏ qua kháng độc"]
# tham so hieu ung: khoa -> ten o (GBK) trong dong StandardImpact; "dur" = cot 21 (chi so 20) cua dong hieu ung con
THAM = {"rate": "伤害目标时的激发几率", "mien": "免疫率", "phan": "反射率", "tran": "反射伤害上限"}
SUB = ("给目标或攻击者的子效果1", "给自己的子效果1")
HIEUUNG_TEN = {"遮目": "Che mắt", "望月": "Phong huyệt", "逆天": "Tê liệt", "破军": "Phá Quân (bỏ qua phòng thủ)",
               "减免": "Giảm miễn", "反伤": "Phản đòn"}


# ------------------------------------------------------------------ doc / ghi file (latin-1, giu CR/LF)
def _lines(path):
    s = open(path, "rb").read().decode("latin-1")
    eol = "\r\n" if "\r\n" in s else "\n"
    return s.split(eol), eol


def _rows(path):
    L, _ = _lines(path)
    return {l.split("\t", 1)[0]: l.split("\t") for l in L if l.split("\t", 1)[0].isdigit()}


def _gbk(s):
    return s.encode("latin-1").decode("gbk", "replace")


def _repo(f):
    return os.path.join(SRV, f)


def _game(f):
    return os.path.join(GAME, f)


def _tim(row, ten):
    """chi so o GIA TRI cua tham so co ten `ten` trong dong StandardImpact (o ngay sau o ten), None neu khong co"""
    for i, c in enumerate(row[:-1]):
        if c and _gbk(c) == ten:
            return i + 1
    return None


def _so(x):
    try:
        return int(float(x))
    except (TypeError, ValueError):
        return None


# ------------------------------------------------------------------ du lieu
def _ten_viet():
    ten = {}
    if os.path.exists(TENVIET):
        for line in open(TENVIET, encoding="utf-8"):
            c = line.rstrip("\r\n").split("\t")
            if len(c) >= 5 and c[0] in IDS:
                ten[c[0]] = {"ten": c[1], "loai": c[2], "gd": c[4]}
    return ten


def _dong_co(eb_row, seg, rr):
    """Dong game CO cho ma nay: dong mon tu ra (co bat o ban repo) + dong doan gia tri goc co so > 0 (va he so cap > 0).
    Dong khong co so goc (vd Giam thoi gian huyen, V = 0) bi an / chan - chu server 08/10: 'giu nhung gi game co thoi'."""
    co = []
    for k in range(58):
        v = int(seg[k + 1]) if seg[k + 1].lstrip("-").isdigit() else 0
        if rr[k] > 0 and (eb_row[k + 32] != "-1" or v > 0):
            co.append(k)
    return co


def _hieu_ung(si, eb_row):
    """hieu ung than khi cua 1 dong EquipBase: {id, ten, tham:{rate|mien|phan|tran: gia tri}, sub, dur(ms)}"""
    hid = eb_row[19]
    r = si.get(hid)
    if not r:
        return None
    ten_cn = _gbk(r[1])
    hu = {"id": hid, "tenCN": ten_cn, "ten": next((v for k, v in HIEUUNG_TEN.items() if k in ten_cn), ten_cn), "tham": {}}
    for k, t in THAM.items():
        i = _tim(r, t)
        if i is not None:
            hu["tham"][k] = _so(r[i])
    for t in SUB:
        i = _tim(r, t)
        if i is not None and r[i].isdigit() and r[i] in si:
            hu["sub"] = r[i]
            hu["dur"] = _so(si[r[i]][20])
            hu["cho"] = "ban than" if t == SUB[1] else "muc tieu"
    return hu


def du_lieu():
    eb_r, eb_g = _rows(_repo(F_EB)), _rows(_game(F_EB))
    sv_r, sv_g = _rows(_repo(F_SV)), _rows(_game(F_SV))
    si_r, si_g = _rows(_repo(F_SI)), _rows(_game(F_SI))
    rate = {int(i): [int(x) for x in c[1:59]] for i, c in _rows(_repo(F_RATE)).items()}
    ten = _ten_viet()
    cung = {}   # hieu ung -> MOI ma EquipBase dung no (ke ca ma khong co tren trang, vd 10422018 / 10423026 ban khoa)
    for r in eb_g.values():
        if len(r) > 19 and r[19] not in ("", "-1", "0"):
            cung.setdefault(r[19], []).append(r[0])
    mon = []
    for i in IDS:
        g, c = eb_r[i], eb_g.get(i, eb_r[i])
        cap = int(g[90])
        rr = rate.get(cap, [0] * 58)
        seg_g, seg_c = sv_r[g[91]], sv_g.get(c[91]) or sv_r[g[91]]
        diem = lambda seg, k: math.ceil(int(seg[k + 1]) * rr[k] / 100) if seg[k + 1].lstrip("-").isdigit() and int(seg[k + 1]) > 0 else 0
        t = ten.get(i, {"ten": "#" + i, "loai": "", "gd": ""})
        mon.append({
            "id": i, "ten": t["ten"], "loai": t["loai"], "gd": t["gd"], "chan": t["ten"].startswith("Chân"),
            "cap": cap, "T": _so(g[100]), "rate": rr,
            "dongGoc": [k for k in range(58) if g[k + 32] != "-1"], "dong": [k for k in range(58) if c[k + 32] != "-1"],
            "dongCo": _dong_co(g, seg_g, rr),
            "soDongGoc": [int(g[92]), int(g[93])], "soDong": [int(c[92]), int(c[93])],
            "diemGoc": [diem(seg_g, k) for k in range(58)], "diem": [diem(seg_c, k) for k in range(58)],
            "segGoc": g[91], "seg": c[91],
            "huGoc": _hieu_ung(si_r, g), "hu": _hieu_ung(si_g, c), "huCung": sorted(cung.get(c[19], [i])),
        })
    return {"mon": mon, "dongTen": DONG, "maxDong": MAX_DONG, "cfg": doc_cfg()}


def doc_cfg():
    try:
        return json.load(open(CFG, encoding="utf-8"))
    except (OSError, ValueError):
        return {}


def _ghi_cfg(cfg):
    os.makedirs(os.path.dirname(CFG), exist_ok=True)
    tmp = CFG + ".tmp"
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(cfg, f, ensure_ascii=False, indent=1)
    os.replace(tmp, CFG)


# ------------------------------------------------------------------ tinh V cho diem mong muon
def v_cho(x, r):
    """V de ceil(V*r/100) gan x nhat (bang nhau thi lay ben lon). He so r > 100 (vd 180) chi ra duoc mot so gia tri:
    dat 100 se ra 101. Trang admin tinh cung cong thuc nay de hien "se ra" truoc khi luu."""
    if x <= 0 or r <= 0:
        return 0
    v = (x - 1) * 100 // r + 1          # V nho nhat cho diem >= x
    while math.ceil(v * r / 100) < x:
        v += 1
    if v > 1 and x - math.ceil((v - 1) * r / 100) < math.ceil(v * r / 100) - x:
        v -= 1
    return v


def nguoi_giu(sql, viscii):
    """Ai dang giu Trung Lau dong moi (doc DB - tre vai phut so voi trong game vi ShareMemory luu dinh ky).
    pos: < 100 tui, 100-118 dang mac (100 + vi tri trang bi), >= 119 kho."""
    rows = sql("SELECT c.charguid, c.charname, c.accname, i.itemtype, i.pos FROM tlbbdb.t_iteminfo i "
               "JOIN tlbbdb.t_char c ON c.charguid = i.charguid WHERE i.isvalid = 1 "
               "AND i.itemtype IN (%s) ORDER BY i.itemtype, i.pos" % ",".join(IDS))
    ten = _ten_viet()
    out = []
    for r in rows:
        guid, nv, acc, it, pos = r[0].decode(), viscii(r[1]), viscii(r[2]), r[3].decode(), int(r[4])
        cho = "túi" if pos < 100 else ("đang mặc" if pos <= 118 else "kho")
        out.append({"guid": guid, "nv": nv, "acc": acc, "id": it, "ten": ten.get(it, {}).get("ten", "#" + it), "pos": pos, "cho": cho})
    return out


# ------------------------------------------------------------------ kiem + ap
def kiem_mon(i, m, rate_cap, co=None):
    if i not in IDS:
        return "Mã %s không nằm trong danh sách Trùng Lâu chỉnh được (10553100-10553114, 10422016, 10423024)" % i
    dong = m.get("dong")
    if not isinstance(dong, list) or not dong:
        return "Mã %s: chưa chọn dòng nào" % i
    if any(not isinstance(k, int) or not 0 <= k < 58 for k in dong) or len(set(dong)) != len(dong):
        return "Mã %s: dòng không hợp lệ" % i
    if co is not None and any(k not in co for k in dong):
        return "Mã %s: có dòng game không có số cho món này (%s)" % (i, ", ".join(DONG[k] for k in dong if k not in co))
    if len(dong) > MAX_DONG:
        return "Mã %s: tối đa %d dòng" % (i, MAX_DONG)
    for k, x in (m.get("diem") or {}).items():
        if not str(k).isdigit() or int(k) not in dong:
            return "Mã %s: có điểm cho dòng không bật" % i
        if not isinstance(x, int) or not 1 <= x <= 10000000:
            return "Mã %s: điểm phải 1 - 10.000.000" % i
        if rate_cap[int(k)] <= 0:
            return "Mã %s: dòng %s không có hệ số ở cấp này, không đặt điểm được" % (i, DONG[int(k)])
    return None


def kiem_hu(hu, si_r, cho_phep):
    for hid, tham in hu.items():
        if hid not in cho_phep:
            return "Hiệu ứng %s không phải của Trùng Lâu dòng mới" % hid
        for k, x in tham.items():
            if k not in cho_phep[hid]:
                return "Hiệu ứng %s không có tham số %s" % (hid, k)
            if not isinstance(x, int) or x < 0 or x > {"rate": 100, "mien": 100, "phan": 100, "tran": 100000000, "dur": 600000}[k]:
                return "Hiệu ứng %s: %s ngoài khoảng cho phép" % (hid, k)
    return None


def _ghi_dong(path, thay, bo=(), them=()):
    """thay {id: list o}; bo = id xoa; them = list dong (list o) chen cuoi theo thu tu ID tang dan. Giu moi byte khac."""
    L, eol = _lines(path)
    out, con = [], set(thay)
    for l in L:
        k = l.split("\t", 1)[0]
        if k in bo:
            continue
        if k in con:
            out.append("\t".join(thay[k]))
            con.discard(k)
        else:
            out.append(l)
    if con:
        raise RuntimeError("%s không có dòng %s" % (os.path.basename(path), ", ".join(sorted(con))))
    if them:
        ids = [int(l.split("\t", 1)[0]) for l in out if l.split("\t", 1)[0].isdigit()]
        if ids and max(ids) >= int(them[0][0]):
            raise RuntimeError("%s đã có ID >= %s, không chèn cuối được" % (os.path.basename(path), them[0][0]))
        cuoi = len(out)
        while cuoi > 0 and out[cuoi - 1].strip() == "":
            cuoi -= 1
        out[cuoi:cuoi] = ["\t".join(r) for r in them]
    tmp = path + ".trunglau.tmp"
    with open(tmp, "wb") as f:
        f.write(eol.join(out).encode("latin-1"))
    os.replace(tmp, path)


def ap(cfg):
    """Ap TOAN BO cau hinh (tu ban repo). Tra ve (ok, thong diep)."""
    eb_r, sv_r, si_r = _rows(_repo(F_EB)), _rows(_repo(F_SV)), _rows(_repo(F_SI))
    rate = {int(i): [int(x) for x in c[1:59]] for i, c in _rows(_repo(F_RATE)).items()}
    mon = cfg.get("mon") or {}
    hu = cfg.get("hu") or {}
    # hieu ung + tham so duoc phep sua
    cho_phep = {}
    for i in IDS:
        h = _hieu_ung(si_r, eb_r[i])
        if not h:
            continue
        cho_phep.setdefault(h["id"], set()).update(h["tham"].keys())
        if h.get("sub"):
            cho_phep.setdefault(h["sub"], set()).add("dur")
    for i, m in mon.items():
        if i not in eb_r:
            return False, "Mã %s không có trong EquipBase" % i
        rr = rate.get(int(eb_r[i][90]), [0] * 58)
        err = kiem_mon(i, m, rr, _dong_co(eb_r[i], sv_r[eb_r[i][91]], rr))
        if err:
            return False, err
    err = kiem_hu(hu, si_r, cho_phep)
    if err:
        return False, err
    # EquipBase: ca 15 dong ve repo, ma co cau hinh -> dong + so dong + doan rieng
    thay_eb, them_sv, ghi = {}, [], []
    for i in IDS:
        c = list(eb_r[i])
        m = mon.get(i)
        if m:
            seg = str(SEG0 + IDS.index(i))
            for k in range(58):
                c[k + 32] = "1" if k in m["dong"] else "-1"
            c[92] = c[93] = str(len(m["dong"]))
            c[91] = seg
            s = list(sv_r[eb_r[i][91]])
            s[0] = seg
            rr = rate.get(int(eb_r[i][90]), [0] * 58)
            for k, x in (m.get("diem") or {}).items():
                s[int(k) + 1] = str(v_cho(x, rr[int(k)]))
            them_sv.append(s)
            ghi.append("%s %d dòng" % (i, len(m["dong"])))
        thay_eb[i] = c
    # StandardImpact: moi dong hieu ung Trung Lau ve repo, roi dat tham so cau hinh
    thay_si = {}
    for hid in cho_phep:
        r = list(si_r[hid])
        for k, x in (hu.get(hid) or {}).items():
            if k == "dur":
                r[20] = str(x)
            else:
                j = _tim(r, THAM[k])
                r[j] = str(x)
        thay_si[hid] = r
    # sao luu roi ghi
    bk = os.path.join(BACKUP, "trunglau-" + time.strftime("%Y%m%d-%H%M%S"))
    os.makedirs(bk, exist_ok=True)
    for f in (F_EB, F_SV, F_SI):
        shutil.copy2(_game(f), os.path.join(bk, os.path.basename(f)))
    _ghi_dong(_game(F_EB), thay_eb)
    _ghi_dong(_game(F_SV), {}, bo={str(SEG0 + n) for n in range(len(IDS))}, them=sorted(them_sv, key=lambda r: int(r[0])))
    _ghi_dong(_game(F_SI), thay_si)
    return True, "Da ap Trung Lau: %s; %d hieu ung chinh. Sao luu %s. Co hieu luc sau restart." % (
        ", ".join(ghi) or "khong ma nao (ve goc)", sum(1 for h in hu.values() if h), bk)


def luu_mon(i, m, ai=""):
    cfg = doc_cfg()
    cfg.setdefault("mon", {})
    if m is None:
        cfg["mon"].pop(i, None)
    else:
        cfg["mon"][i] = {"dong": sorted(m["dong"]), "diem": {str(k): int(v) for k, v in (m.get("diem") or {}).items()},
                         "t": int(time.time()), "ai": ai}
    ok, msg = ap(cfg)
    if ok:
        _ghi_cfg(cfg)
    return ok, msg


def luu_hu(hu, ai=""):
    cfg = doc_cfg()
    cfg["hu"] = {h: {k: int(v) for k, v in t.items()} for h, t in hu.items() if t}
    cfg["huAi"], cfg["huT"] = ai, int(time.time())
    ok, msg = ap(cfg)
    if ok:
        _ghi_cfg(cfg)
    return ok, msg


def tra_tat_ca():
    ok, msg = ap({})
    if ok:
        _ghi_cfg({})
    return ok, msg


def ap_lai():
    cfg = doc_cfg()
    if not cfg.get("mon") and not cfg.get("hu"):
        return "khong co cau hinh Trung Lau nao"
    ok, msg = ap(cfg)
    return msg if ok else "LOI ap lai Trung Lau: " + msg


def go_khoi_repo():
    """Goi tu lay-tu-server.sh sau rsync (server -> repo): bo phan Trung Lau admin ap khoi 3 file repo (15 dong EquipBase,
    doan 4501-4515, dong hieu ung Trung Lau tra ve ban git HEAD) - giu moi sua khac. Khong thi repo lan cau hinh admin."""
    import subprocess

    def head(f):
        b = subprocess.run(["git", "-C", REPO, "show", "HEAD:server/" + f], capture_output=True, check=True).stdout.decode("latin-1")
        return {l.split("\t", 1)[0]: l.split("\t") for l in b.replace("\r\n", "\n").split("\n") if l.split("\t", 1)[0].isdigit()}
    eb_h, si_h = head(F_EB), head(F_SI)
    hu = set()
    for i in IDS:
        h = _hieu_ung(si_h, eb_h[i])
        if h:
            hu.add(h["id"])
            if h.get("sub"):
                hu.add(h["sub"])
    _ghi_dong(_repo(F_EB), {i: eb_h[i] for i in IDS})
    _ghi_dong(_repo(F_SV), {}, bo={str(SEG0 + n) for n in range(len(IDS))})
    _ghi_dong(_repo(F_SI), {h: si_h[h] for h in hu})
    return "go cau hinh Trung Lau khoi repo: 15 dong EquipBase, doan %d-%d, %d dong hieu ung" % (SEG0, SEG0 + len(IDS) - 1, len(hu))


if __name__ == "__main__":
    if sys.argv[1:] == ["--ap-lai"]:
        print(ap_lai())
    elif sys.argv[1:] == ["--go-khoi-repo"]:
        print(go_khoi_repo())
    elif sys.argv[1:2] == ["--xem"]:
        d = du_lieu()
        for m in d["mon"]:
            print(m["id"], m["ten"], m["gd"], "cap", m["cap"], "T", m["T"], "doan", m["seg"], "dong", m["soDong"], "hu", json.dumps(m["hu"], ensure_ascii=False))
            if len(sys.argv) > 2 and m["id"] == sys.argv[2]:
                for k in m["dong"]:
                    print("   ", k, DONG[k], m["diem"][k], "(goc %d)" % m["diemGoc"][k])
        print("cfg:", json.dumps(d["cfg"], ensure_ascii=False))
    else:
        print(__doc__)
