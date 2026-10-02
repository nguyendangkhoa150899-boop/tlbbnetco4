#!/usr/bin/env python3
"""02/10: MAU DO CHE 8x/9x - admin chon dong, so dong, cap pham chat, tu chat cho 1 mon do che (ItemCompound) cap 80-99
(tru vu khi - vu khi len than khi) + THAI CO THAN KHI 9 sao (x895111_TaiGu_shenqi, tay bang Ma Huyet Thach 30505813:
wuyazi85o.lua tepp 20 = TryRecieveItem cung ID -> mon moi di qua CreateBlueEquipAttrib -> an mau y nhu do che).

Co che (dich nguoc Server.elf, docs/TRANG-THAI.md muc 02/10 C):
  - Luc tao do, CreateBlueEquipAttrib boc dong theo trong so EquipBase cot k+32 (thuoc tinh k = 0..57, -1 = tat),
    so dong = rand[cot 92, cot 93], cap pham chat = ItemSegQuality/ItemSegAffect theo quy tac cot 90,
    tu chat = rand[cot 94, cot 95]. Mon luu: dong nao bat, cap pham chat, 1 so rand 0-99, tu chat.
  - So cua tung dong KHONG luu: moi lan nhan vat vao game (Obj_Human::Init -> CheckAllItem) server tinh lai
    = ceil(ItemSegValue[cot 91][k] x (Rate[cap] + (Rate[cap+1]-Rate[cap]) x rand/100 / T) / 100), T = cot 100.
  => Mau tam chi doi cot 32-89 (dong), 92-93 (so dong), 90 (quy tac = cap L, quy tac 1..9 luon ra cap L),
     94-95 (tu chat). Giu nguyen cot 91 + 100 nen tra mau ve goc thi so tren mon da che KHONG doi.

Mau dang ap luu o Server/txt/NetCo4Cfg/maudoche.json (ngoai repo). cap-nhat.sh rsync ghi de EquipBase.txt bang ban repo
roi goi `python3 maudoche.py --ap-lai` de ap lai mau con hieu luc. Mau co hieu luc sau khi restart game.
"""
import json
import math
import os
import sys
import time

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GAME = "/opt/tlbb-root/home/tlbb"
CFG = GAME + "/Server/txt/NetCo4Cfg/maudoche.json"
EB_GAME = GAME + "/Public/Config/EquipBase.txt"
SRV = os.path.join(REPO, "server")
EB_REPO = os.path.join(SRV, "Public", "Config", "EquipBase.txt")
COMPOUND = os.path.join(SRV, "Public", "Config", "ItemCompound.txt")
SEGVAL = os.path.join(SRV, "Public", "Config", "ItemSegValue.txt")
SEGRATE = os.path.join(SRV, "Server", "Config", "ItemSegRate.txt")
SEGQ = os.path.join(SRV, "Server", "Config", "ItemSegQuality.txt")
SEGA = os.path.join(SRV, "Server", "Config", "ItemSegAffect.txt")
TENVIET = os.path.join(REPO, "docs", "vat-pham", "ten-viet.tsv")
WUYAZI = os.path.join(SRV, "Public", "Data", "Script", "MyLua", "shenqinew", "wuyazi85o.lua")   # danh sach Thai Co
HIEUUNG = {"吸血": "Hút máu", "减速": "Giảm tốc", "破绽": "Phá phòng", "虚弱": "Suy nhược", "吸气": "Hút nội lực", "打怒": "Đả nộ"}
LV_MIN, LV_MAX = 80, 99

# Ten dong (thuoc tinh 0..57). Ten co dau * da doi chieu tooltip game (docs/TRANG-THAI.md, bang ten dong 28/09).
DONG = ["Sinh lực tối đa*", "Sinh lực tối đa %*", "Hồi sinh lực", "Nội lực tối đa (MP)", "Nội lực tối đa % (MP)", "Hồi nội lực (MP)",
        "Băng công*", "Kháng băng", "Giảm thời gian băng", "Hỏa công*", "Kháng hỏa", "Giảm thời gian hỏa",
        "Huyền công*", "Kháng huyền", "Giảm thời gian huyền", "Độc công*", "Kháng độc", "Giảm thời gian độc",
        "Triệt tiêu thuộc tính %", "Ngoại công*", "Ngoại công %", "Ngoại công gốc trang bị %", "Phòng ngoại",
        "Phòng ngoại %", "Phòng ngoại gốc trang bị %", "Triệt ngoại công %", "Nội công*", "Nội công %",
        "Nội công gốc trang bị %", "Phòng nội", "Phòng nội %", "Phòng nội gốc trang bị %", "Triệt nội công %",
        "Tốc đánh", "Hồi chiêu", "Chính xác*", "Né tránh*", "Hội công*", "Bỏ qua phòng thủ %", "Tốc độ di chuyển %",
        "Phản đòn", "Nội lực hấp thụ sát thương", "Cường lực*", "Nội lực*", "Thể lực*", "Trí lực*", "Thân pháp*",
        "Phòng hội công", "Tất cả thuộc tính*", "Hút sinh lực", "Hút nội lực", "Tăng 1 kỹ năng", "Tăng mọi kỹ năng",
        "Tỉ lệ kỹ năng đặc biệt", "Bỏ qua kháng băng*", "Bỏ qua kháng hỏa*", "Bỏ qua kháng huyền*", "Bỏ qua kháng độc*"]
VITRI = {0: "Vũ khí", 1: "Mũ", 2: "Áo", 3: "Bao tay", 4: "Giày", 5: "Đai lưng", 6: "Nhẫn", 7: "Dây chuyền",
         12: "Hộ phù", 14: "Hộ uyển", 15: "Hộ kiên"}


def _lines(path):
    s = open(path, "rb").read().decode("latin-1")
    eol = "\r\n" if "\r\n" in s else "\n"
    return s.split(eol), eol


def _rows(path):
    L, _ = _lines(path)
    return {l.split("\t", 1)[0]: l.split("\t") for l in L if l.split("\t", 1)[0].isdigit()}


_CACHE = {"key": None, "data": None}


def _cache_key():
    return tuple(os.path.getmtime(p) for p in (EB_REPO, COMPOUND, SEGVAL, SEGRATE, SEGQ, SEGA, WUYAZI))


def thai_co():
    import re
    s = open(WUYAZI, "rb").read().decode("latin-1")
    m = re.search(r"x895111_TaiGu_shenqi\s*=\s*\{([^}]*)\}", s)
    return [x.strip() for x in m.group(1).split(",") if x.strip().isdigit()] if m else []


def du_lieu():
    """Danh sach mon do che 80-99 (tu nhien, theo ban repo) + bang he so. Cache theo mtime file."""
    k = _cache_key()
    if _CACHE["key"] == k:
        return _CACHE["data"]
    eb = _rows(EB_REPO)
    sv = _rows(SEGVAL)
    rate = {int(i): [int(x) for x in c[1:65]] for i, c in _rows(SEGRATE).items()}
    sq = {i: set(c[1:]) for i, c in _rows(SEGQ).items()}
    sa = {i: [int(x) for x in c[2:11]] for i, c in _rows(SEGA).items()}
    ten = {}
    if os.path.exists(TENVIET):
        for line in open(TENVIET, encoding="utf-8"):
            c = line.rstrip("\r\n").split("\t")
            if len(c) >= 3 and c[0].isdigit():
                ten[c[0]] = (c[1], c[2])
    mon, seen = [], set()
    nguon = []
    for c in _rows(COMPOUND).values():
        rid = c[2] if len(c) > 2 else ""
        e = eb.get(rid)
        if e and rid not in seen and e[11].lstrip("-").isdigit() and LV_MIN <= int(e[11]) <= LV_MAX and e[5] != "0":   # bo vu khi
            seen.add(rid)
            nguon.append((rid, e, "che"))
    for rid in thai_co():
        e = eb.get(rid)
        if e and rid not in seen:
            seen.add(rid)
            nguon.append((rid, e, "thaico"))
    nhom_id, thu_tu = {}, []   # 02/10: gop ID giong het (Thai Co: moi nhanh nang cap 1 ID, du lieu nhu nhau)
    for rid, e, nhom in nguon:
        sig = (nhom, tuple(e[1:4] + e[5:]))
        if sig not in nhom_id:
            nhom_id[sig] = []
            thu_tu.append((sig, rid, e, nhom))
        nhom_id[sig].append(rid)
    for sig, rid, e, nhom in thu_tu:
        ids = sorted(nhom_id[sig])
        rid = ids[0]
        dong = [k for k in range(58) if e[k + 32] != "-1"]
        seg = sv.get(e[91])
        caps = set()   # cap pham chat tu nhien tu quy tac cot 90 (moi nguon roi)
        for code in sq.get(e[90], ()):
            for j, w in enumerate(sa.get(code, [])):
                if w > 0:
                    caps.add(j + 1)
        nl, loai = ten.get(rid, ("#" + rid, ""))
        vitri = VITRI.get(int(e[5]), "vị trí " + e[5])
        if nhom == "thaico":
            mo = e[13].encode("latin-1").decode("gbk", "replace")
            hu = next((v for k, v in HIEUUNG.items() if "施放" + k in mo), "")
            vitri = "Thái Cổ Thần Khí 9 sao (tẩy bằng Ma Huyết Thạch)"
            nl = nl + (" - " + hu if hu else "")
        mon.append({"id": rid, "ids": ids, "ten": nl, "loai": loai, "cap": int(e[11]), "vitri": vitri, "nhom": nhom,
                    "pt": int(e[5]), "dong": dong, "v": {str(k): int(seg[k + 1]) if seg else 0 for k in dong},
                    "min": int(e[92]), "max": int(e[93]), "capMax": max(caps) if caps else 9, "capMin": min(caps) if caps else 1,
                    "T": int(e[100]) if e[100].lstrip("-").isdigit() else -1,
                    "coTuChat": e[24] == "1", "tcMin": int(e[94]), "tcMax": int(e[95])})
    mon.sort(key=lambda m: (m["nhom"] == "thaico", m["pt"], m["cap"], m["id"]))
    data = {"mon": mon, "rate": {str(i): r for i, r in rate.items() if 1 <= i <= 12}, "dongTen": DONG}
    _CACHE.update(key=k, data=data)
    return data


def doc_mau():
    try:
        return json.load(open(CFG, encoding="utf-8"))
    except (OSError, ValueError):
        return {}


def _ghi_mau(m):
    os.makedirs(os.path.dirname(CFG), exist_ok=True)
    tmp = CFG + ".tmp"
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(m, f, ensure_ascii=False, indent=1)
    os.replace(tmp, CFG)


def _dong_mau(goc, mau):
    c = list(goc)
    for k in range(58):
        c[k + 32] = "1" if k in mau["dong"] else "-1"
    c[90] = str(mau["capPC"])
    c[92] = c[93] = str(len(mau["dong"]))
    if mau.get("tuChat"):
        c[94] = c[95] = str(mau["tuChat"])
    return c


def _ghi_eb(thay):
    """thay: {id: list cot}. Ghi de dung cac dong do trong EquipBase cua game, giu nguyen moi byte khac."""
    L, eol = _lines(EB_GAME)
    con = set(thay)
    for i, l in enumerate(L):
        k = l.split("\t", 1)[0]
        if k in con:
            L[i] = "\t".join(thay[k])
            con.discard(k)
    if con:
        raise RuntimeError("EquipBase của game không có dòng " + ", ".join(sorted(con)))
    tmp = EB_GAME + ".maudoche.tmp"
    with open(tmp, "wb") as f:
        f.write(eol.join(L).encode("latin-1"))
    os.replace(tmp, EB_GAME)


def kiem(id_, dong, cap_pc, tu_chat):
    m = next((x for x in du_lieu()["mon"] if x["id"] == id_), None)
    if not m:
        return None, "ID %s không phải đồ chế cấp %d-%d (trừ vũ khí) hay Thái Cổ Thần Khí" % (id_, LV_MIN, LV_MAX)
    if not dong:
        return None, "Chưa chọn dòng nào"
    if len(set(dong)) != len(dong) or any(k not in m["dong"] for k in dong):
        return None, "Chỉ chọn trong các dòng món này tự ra được"
    if len(dong) > m["max"]:
        return None, "Món này tối đa %d dòng" % m["max"]
    if not 1 <= cap_pc <= m["capMax"]:
        return None, "Cấp phẩm chất 1-%d (cao nhất món này tự ra được)" % m["capMax"]
    if tu_chat and not (m["coTuChat"] and m["tcMin"] <= tu_chat <= m["tcMax"]):
        return None, "Tư chất %d-%d" % (m["tcMin"], m["tcMax"])
    return m, None


def ap(id_, dong, cap_pc, tu_chat, ai=""):
    m, err = kiem(id_, dong, cap_pc, tu_chat)
    if err:
        return False, err
    ids = m["ids"]
    mau = {"dong": sorted(dong), "capPC": cap_pc, "tuChat": tu_chat or 0, "t": int(time.time()), "ai": ai, "ids": ids}
    goc = _rows(EB_REPO)
    _ghi_eb({i: _dong_mau(goc[i], mau) for i in ids})
    tat = doc_mau()
    tat[id_] = mau
    _ghi_mau(tat)
    return True, "Da ap mau %s (%s): %d dong, cap pham chat %d%s. Co hieu luc sau khi restart. Xong nho TRA MAU." % (
        m["ten"], ", ".join(ids), len(dong), cap_pc, ", tu chat %d" % tu_chat if tu_chat else "")


def tra(id_):
    tat = doc_mau()
    ids = list(tat) if id_ == "all" else [id_]
    ids = [i for i in ids if i in tat]
    if not ids:
        return False, "Khong co mau nao dang ap" if id_ == "all" else "Mon %s khong co mau dang ap" % id_
    goc = _rows(EB_REPO)
    tat_ca = [j for i in ids for j in tat[i].get("ids", [i])]
    _ghi_eb({j: goc[j] for j in tat_ca})
    for i in ids:
        tat.pop(i, None)
    _ghi_mau(tat)
    return True, "Da tra mau ve goc: %s. Co hieu luc sau khi restart." % ", ".join(tat_ca)


def ap_lai():
    """Goi tu cap-nhat.sh sau rsync: ap lai moi mau con trong maudoche.json (theo ban repo moi nhat)."""
    tat = doc_mau()
    if not tat:
        return "khong co mau do che nao"
    goc = _rows(EB_REPO)
    thay, bo = {}, []
    for i, mau in tat.items():
        for j in mau.get("ids", [i]):
            if j in goc:
                thay[j] = _dong_mau(goc[j], mau)
            else:
                bo.append(j)
    if thay:
        _ghi_eb(thay)
    return "ap lai %d mau do che: %s%s" % (len(thay), ", ".join(thay), (" (bo %s: khong con trong repo)" % ", ".join(bo)) if bo else "")


def khoang(m, k, cap_pc, rate):
    """Khoang so cua dong k o cap pham chat cap_pc (rand 0..99)."""
    v = m["v"][str(k)]
    a, b = rate[str(cap_pc)][k], rate.get(str(cap_pc + 1), rate[str(cap_pc)])[k]
    lo = math.ceil(v * a / 100)
    hi = math.ceil(v * (a + (b - a) * 0.99 / m["T"]) / 100) if m["T"] > 0 else lo
    return lo, hi


if __name__ == "__main__":
    if sys.argv[1:] == ["--ap-lai"]:
        print(ap_lai())
    elif sys.argv[1:2] == ["--xem"]:
        d = du_lieu()
        for m in d["mon"]:
            if len(sys.argv) < 3 or m["id"] == sys.argv[2]:
                print(m["id"], m["ten"], m["vitri"], m["cap"], "dong", m["min"], "-", m["max"], "cap PC", m["capMin"], "-", m["capMax"], "T", m["T"])
                if len(sys.argv) >= 3:
                    for k in m["dong"]:
                        print("   ", k, DONG[k], "cap 9:", khoang(m, k, min(9, m["capMax"]), d["rate"]))
        print(len(d["mon"]), "mon; dang ap:", json.dumps(doc_mau(), ensure_ascii=False))
    else:
        print(__doc__)
