#!/usr/bin/env python3
"""10/10: TINH THONG - ADMIN CHON 3 DONG (trang admin bot: Cong cu > Tinh Thong, chi SUPER).

Tinh Thong luu trong o "nguoi che tao" cua mon: "&JT" + 3 dong (ma 2 chu + cap 2 so), vd &JTBG01HG01XG01.
Toi luyen (Ly Hoa 20700063 x10 + 100 vang) o script 890087 (MyLua/jingtong/jingtongClient.lua x890087_chuilian) doc file
Server/txt/NetCo4Cfg/tinhthong.txt MOI LAN tay -> moi nhom ra CHAC CHAN 3 dong admin chon:
    cong BG HG XG     <- nhan / hang lien / ho phu / ho uyen (diem trang bi 6, 7, 12, 14)
    thu TL TL TL      <- mu / ao / bao tay / giay / dai / ho kien (1, 2, 3, 4, 5, 15)
Dong dang khoa giu nguyen; dong trung ma giu cap; mon da du 3 dong -> khong tru Ly Hoa. Khong co file / thieu nhom ->
tay ngau nhien nhu goc. Luu la co hieu luc NGAY lan tay ke tiep, KHONG restart. Thang cap: Tinh Kim Thach 20700055.
"""
import os
import re
import shutil
import time

GAME = os.environ.get("TLBB_GAME", "/opt/tlbb-root/home/tlbb")
BACKUP = os.environ.get("TLBB_BACKUP", "/opt/tlbb-backup")
FILE = GAME + "/Server/txt/NetCo4Cfg/tinhthong.txt"

# ma -> ten (ShuaXinClient.lua x892002_LPbuffa cong don cap cua tung ma)
TEN = {"XS": "Sinh lực", "SB": "Né tránh", "TL": "Thể lực", "LL": "Cường lực", "LQ": "Nội lực", "DL": "Trí lực",
       "SF": "Thân pháp", "WF": "Ngoại thủ", "NF": "Nội thủ",
       "MZ": "Chính xác", "BG": "Băng công", "HG": "Hỏa công", "XG": "Huyền công", "DG": "Độc công",
       "WG": "Ngoại công", "NG": "Nội công"}
# bo dong goc cua tung nhom (jingtongClient.lua JTtable) - chi cho chon trong bo nay de client hien dung
NHOM = {
    "cong": {"ten": "Đồ công", "o": "Nhẫn, Hạng liên, Hộ phù, Hộ uyển", "ma": ["MZ", "BG", "HG", "XG", "DG", "WG", "NG"]},
    "thu": {"ten": "Đồ thủ", "o": "Mũ, Áo, Bao tay, Giày, Đai, Hộ kiên", "ma": ["XS", "SB", "TL", "LL", "LQ", "DL", "SF", "WF", "NF"]},
}


def doc():
    """{cong: [3 ma] | None, thu: [3 ma] | None, co: file co ton tai, ai, t}."""
    cfg = {"cong": None, "thu": None, "co": os.path.exists(FILE), "ai": "", "t": 0}
    if not cfg["co"]:
        return cfg
    for line in open(FILE, encoding="ascii", errors="replace"):
        line = line.strip()
        m = re.match(r"^# ai=(.*) t=(\d+)$", line)
        if m:
            cfg["ai"], cfg["t"] = m.group(1), int(m.group(2))
            continue
        p = line.split()
        if len(p) >= 4 and p[0] in NHOM and all(x in NHOM[p[0]]["ma"] for x in p[1:4]):
            cfg[p[0]] = p[1:4]
    return cfg


def du_lieu():
    return {"ten": TEN, "nhom": NHOM, "cfg": doc(), "thangcap": {"id": 20700055, "ten": "Tinh Kim Thạch"},
            "toiluyen": {"id": 20700063, "ten": "Ly Hỏa", "sl": 10}}


def kiem(cfg):
    for k, ds in cfg.items():
        if k not in NHOM:
            return "Nhóm %s không có" % k
        if ds is None:
            continue
        if not isinstance(ds, list) or len(ds) != 3:
            return "%s: cần đúng 3 dòng" % NHOM[k]["ten"]
        sai = [x for x in ds if x not in NHOM[k]["ma"]]
        if sai:
            return "%s: dòng %s không thuộc nhóm này" % (NHOM[k]["ten"], ", ".join(map(str, sai)))
    return None


def luu(cfg, ai=""):
    """cfg = {cong: [3 ma] | None, thu: [3 ma] | None}; None = nhom do tay ngau nhien nhu goc. Ghi file ASCII + sao luu ban cu."""
    cfg = {k: (list(cfg.get(k)) if cfg.get(k) else None) for k in NHOM}
    err = kiem(cfg)
    if err:
        return False, err
    if not cfg["cong"] and not cfg["thu"]:
        return ve_mac_dinh()
    ai = re.sub(r"[^ -~]", "?", ai)[:60]
    dong = ["# NetCo4 Tinh Thong admin chon 3 dong - trang admin bot (panel/tinhthong.py). '<cong|thu> <ma1> <ma2> <ma3>'; thieu nhom = ngau nhien goc.",
            "# ai=%s t=%d" % (ai, int(time.time()))]
    dong += ["%s %s" % (k, " ".join(cfg[k])) for k in NHOM if cfg[k]]
    _sao_luu()
    os.makedirs(os.path.dirname(FILE), exist_ok=True)
    tmp = FILE + ".tmp"
    with open(tmp, "w", encoding="ascii", newline="\n") as f:
        f.write("\n".join(dong) + "\n")
    os.replace(tmp, FILE)
    tom = "; ".join("%s: %s" % (NHOM[k]["ten"], " / ".join(TEN[x] for x in cfg[k]) if cfg[k] else "ngẫu nhiên gốc") for k in NHOM)
    return True, "Đã lưu Tinh Thông: %s. Có hiệu lực NGAY lần tôi luyện kế tiếp, không cần restart." % tom


def ve_mac_dinh():
    """Xoa file -> toi luyen ngau nhien nhu goc."""
    if os.path.exists(FILE):
        _sao_luu()
        os.remove(FILE)
    return True, "Đã xóa cấu hình Tinh Thông: tôi luyện về ngẫu nhiên như gốc."


def _sao_luu():
    if os.path.exists(FILE):
        os.makedirs(BACKUP, exist_ok=True)
        shutil.copy2(FILE, os.path.join(BACKUP, "tinhthong-" + time.strftime("%Y%m%d-%H%M%S") + ".txt"))


if __name__ == "__main__":
    import json
    print(json.dumps(du_lieu(), ensure_ascii=False, indent=1))
