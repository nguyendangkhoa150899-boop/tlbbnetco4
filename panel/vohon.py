#!/usr/bin/env python3
"""09/10: CUSTOM VO HON - ti le chieu tung o khi linh ngo / tay ky nang Vo Hon (trang admin bot: Cong cu > Custom Vo Hon, chi SUPER).

Script 892101 (MyLua/wuhunxt/odali_wuyazi.lua, x892101_NetCo4_Roll3) doc file Server/txt/NetCo4Cfg/vohon.txt MOI LAN nguoi choi
bam Linh ngo / Tay -> luu la co hieu luc ngay, KHONG can restart game. File ASCII:
    1 q:1 w:1 e:1 r:1          <- nhom 1 = o 1 (ca 2 loai Vo Hon)
    2 t:1 y:1 ...               <- nhom 2 = o 2
    3 I:1 ...                   <- nhom 3 = o 3 Luu Ly Diem (10156200-208)
    4 Q:1 ...                   <- nhom 4 = o 3 Ngu Dao Ban (10156100-108)
    giucap 0|1                  <- 1 = tay giu cap tung o (giao dien client hua "giu cap cu"); 0 = ve cap 1 nhu GM cu
Trong so nguyen >= 0 (0 = tat chieu). Nhom khong co dong / tong 0 -> chon deu nhu GM cu. Xoa file = ve dung GM cu.
Ghi chu chieu lay theo tooltip client (SuperToolTip skilllistaec) - chu nguoi choi thay.
"""
import os
import re
import shutil
import time

GAME = os.environ.get("TLBB_GAME", "/opt/tlbb-root/home/tlbb")
BACKUP = os.environ.get("TLBB_BACKUP", "/opt/tlbb-backup")
FILE = GAME + "/Server/txt/NetCo4Cfg/vohon.txt"
MAX_W = 100000

# chu (trong chuoi &WH tren mon) -> ten, ma ky nang cap 1, ghi chu cap 1 -> cap 6 (tooltip client)
NHOM = {
    1: {"ten": "Ô 1 (cả 2 loại Võ Hồn)", "chieu": [
        ("q", "Thanh Dật Chi Hồn", 1361, "Vũ khí Phiến / Hoàn: công cơ bản của vũ khí +70% (cấp 1) → +120% (cấp 6)"),
        ("w", "Hàn Phong Chi Hồn", 1367, "Vũ khí Đơn đoản / Song đoản: công cơ bản của vũ khí +70% → +120%"),
        ("e", "Võ Dũng Chi Hồn", 1373, "Vũ khí Thương / Bổng (trường binh): công cơ bản của vũ khí +70% → +120%"),
        ("r", "Ngự Thể Chi Hồn", 1379, "Phòng cụ: nội / ngoại thủ cơ bản +70% → +120%"),
    ]},
    2: {"ten": "Ô 2 (cả 2 loại Võ Hồn) - khi đánh có tỉ lệ kích hoạt, kéo dài 10 giây", "chieu": [
        ("t", "Du Thân Chi Hồn", 1385, "Tăng Thân pháp bản thân 56 → 89"),
        ("y", "Thượng Võ Chi Hồn", 1391, "Tăng MỌI thuộc tính (Cường / Nội / Thể / Trí / Thân) bản thân 34 → 59"),
        ("u", "Phạp Lực Chi Hồn", 1397, "Giảm Cường lực mục tiêu 23 → 178"),
        ("i", "Diệt Linh Chi Hồn", 1403, "Giảm Nội lực mục tiêu 23 → 178"),
        ("o", "Phá Thể Chi Hồn", 1409, "Giảm Thể lực mục tiêu 23 → 178"),
        ("p", "Loạn Định Chi Hồn", 1415, "Giảm Trí lực mục tiêu 23 → 178"),
        ("a", "Trọng Thân Chi Hồn", 1421, "Giảm Thân pháp mục tiêu 16 → 89"),
        ("s", "Tuyệt Tình Chi Hồn", 1427, "Giảm MỌI thuộc tính (5 chỉ số) mục tiêu 14 → 59"),
        ("d", "Lệ Cương Chi Hồn", 1433, "Giảm Ngoại công mục tiêu 1256 → 2131"),
        ("f", "Toàn Nhu Chi Hồn", 1439, "Giảm Nội công mục tiêu 1256 → 2131"),
        ("g", "Võ Nhận Chi Hồn", 1445, "Giảm Ngoại thủ mục tiêu 1249 → 2121"),
        ("h", "Âm Miên Chi Hồn", 1451, "Giảm Nội thủ mục tiêu 1249 → 2121"),
        ("j", "Tinh Chuẩn Chi Hồn", 1457, "Giảm Chính xác mục tiêu 1398 → 2372"),
        ("k", "Linh Sái Chi Hồn", 1463, "Giảm Né tránh mục tiêu 464 → 790"),
        ("l", "Đoạn Cương Chi Hồn", 1469, "Giảm Ngoại công mục tiêu 1256 → 2131 (client ghi giống Lệ Cương)"),
        ("z", "Liệt Nhu Chi Hồn", 1475, "Giảm Nội công mục tiêu 1256 → 2131 (client ghi giống Toàn Nhu)"),
        ("x", "Ảm Nhận Chi Hồn", 1481, "Giảm Ngoại thủ mục tiêu 1249 → 2121 (client ghi giống Võ Nhận)"),
        ("c", "Thứ Miên Chi Hồn", 1487, "Giảm Nội thủ mục tiêu 1249 → 2121 (client ghi giống Âm Miên)"),
        ("v", "Nhiễu Chuẩn Chi Hồn", 1493, "Giảm Chính xác mục tiêu 1398 → 2372 (client ghi giống Tinh Chuẩn)"),
        ("b", "Tuyệt Sái Chi Hồn", 1499, "Giảm Né tránh mục tiêu 464 → 790 (client ghi giống Linh Sái)"),
        ("n", "Cường Kích Chi Hồn", 1505, "Có tỉ lệ cộng thêm sát thương 3870 điểm (client ghi cấp 6 = 320, số client có vẻ sai)"),
        ("m", "Tuyệt Khí Chi Hồn", 1511, "Có tỉ lệ trừ Khí mục tiêu 720 điểm (client ghi cấp 6 = 128)"),
    ]},
    3: {"ten": "Ô 3 - Lưu Ly Diễm (10156200-208), đánh đơn mục tiêu", "chieu": [
        ("I", "Cương Mãnh Trọng Kích", 1559, "Ngoại công +21858 → +36664"),
        ("O", "Nhu Xà Đột Tập", 1565, "Nội công +21858 → +36664"),
        ("P", "Hàn Băng Xuyên Thích", 1571, "Băng công +528 → +3567"),
        ("A", "Liệt Diễm Chước Thân", 1577, "🔥 Hỏa công +528 → +3567"),
        ("S", "Thiên Lôi Oanh Đỉnh", 1583, "Huyền công +528 → +3567"),
        ("D", "Vụ Hủ Thực Độc", 1589, "Độc công +528 → +3567"),
        ("F", "Lôi Đình Mãnh Kích", 1595, "Sát thương +1746 → +4000"),
    ]},
    4: {"ten": "Ô 3 - Ngự Dao Bàn (10156100-108), đánh lan 3 mục tiêu quanh", "chieu": [
        ("Q", "Diệt Thế Bát Phương", 1517, "Ngoại công +21858 → +36664, lan 3 mục tiêu"),
        ("W", "Tuyệt Cảnh Tán Sát", 1523, "Nội công +21858 → +36664, lan 3 mục tiêu"),
        ("E", "Băng Phong Vạn Lý", 1529, "Băng công +528 → +3567, lan 3 mục tiêu"),
        ("R", "Thiên Hỏa Liệu Nguyên", 1535, "🔥 Hỏa công +528 → +3567, lan 3 mục tiêu"),
        ("T", "Cuồng Lôi Thiên Giáng", 1541, "Huyền công +528 → +3567, lan 3 mục tiêu"),
        ("Y", "Kịch Độc Ôn Dịch", 1547, "Độc công +528 → +3567, lan 3 mục tiêu (client ghi cấp 1 = 5228, có vẻ sai)"),
        ("U", "Nộ Đào Liên Kích", 1553, "Sát thương +1476 → +4000, lan 3 mục tiêu"),
    ]},
}
CHU = {n: [c[0] for c in g["chieu"]] for n, g in NHOM.items()}


def doc():
    """{w: {nhom: {chu: trong so}}, giucap: 0|1, co: file co ton tai, ai, t} - nhom khong co dong = chon deu (GM cu)."""
    cfg = {"w": {}, "giucap": 0, "co": os.path.exists(FILE), "ai": "", "t": 0}
    if not cfg["co"]:
        return cfg
    for line in open(FILE, encoding="ascii", errors="replace"):
        line = line.strip()
        m = re.match(r"^# ai=(.*) t=(\d+)$", line)
        if m:
            cfg["ai"], cfg["t"] = m.group(1), int(m.group(2))
            continue
        p = line.split()
        if len(p) >= 2 and p[0] == "giucap":
            cfg["giucap"] = 1 if p[1].startswith("1") else 0
        elif p and p[0].isdigit() and int(p[0]) in NHOM:
            cfg["w"][int(p[0])] = {c: int(n) for c, n in (x.split(":") for x in p[1:] if re.match(r"^[A-Za-z]:\d+$", x))}
    return cfg


def du_lieu():
    return {"nhom": {n: {"ten": g["ten"], "chieu": [{"chu": c, "ten": t, "id": i, "ghi": gh} for c, t, i, gh in g["chieu"]]}
                     for n, g in NHOM.items()}, "cfg": doc()}


def kiem(w, giucap):
    if giucap not in (0, 1):
        return "giucap phải 0 / 1"
    for n, t in w.items():
        if n not in NHOM:
            return "Nhóm %s không có" % n
        for c, x in t.items():
            if c not in CHU[n]:
                return "Chiêu '%s' không thuộc %s" % (c, NHOM[n]["ten"])
            if not isinstance(x, int) or not 0 <= x <= MAX_W:
                return "Trọng số phải là số nguyên 0 - %d" % MAX_W
        if sum(t.values()) <= 0:
            return "%s: phải có ít nhất 1 chiêu trọng số > 0 (muốn chọn đều như GM cũ thì bấm Về mặc định cho ô đó)" % NHOM[n]["ten"]
    return None


def luu(w, giucap, ai=""):
    """w = {nhom: {chu: trong so}} chi gom nhom admin chinh (nhom bo trong = chon deu). Ghi file ASCII + sao luu ban cu."""
    err = kiem(w, giucap)
    if err:
        return False, err
    ai = re.sub(r"[^ -~]", "?", ai)[:60]
    dong = ["# NetCo4 Custom Vo Hon - trang admin bot (panel/vohon.py). Nhom 1 = o 1, 2 = o 2, 3 = o 3 Luu Ly Diem, 4 = o 3 Ngu Dao Ban.",
            "# ai=%s t=%d" % (ai, int(time.time()))]
    for n in sorted(w):
        dong.append("%d %s" % (n, " ".join("%s:%d" % (c, w[n].get(c, 0)) for c in CHU[n])))
    dong.append("giucap %d" % giucap)
    _sao_luu()
    os.makedirs(os.path.dirname(FILE), exist_ok=True)
    tmp = FILE + ".tmp"
    with open(tmp, "w", encoding="ascii", newline="\n") as f:
        f.write("\n".join(dong) + "\n")
    os.replace(tmp, FILE)
    return True, "Da luu Custom Vo Hon (%s; tay %s cap). Co hieu luc NGAY lan linh ngo / tay ke tiep, khong can restart." % (
        ", ".join("nhom %d" % n for n in sorted(w)) or "moi o chon deu", "giu" if giucap else "ve 1")


def ve_mac_dinh():
    """Xoa file -> script chon deu + tay ve cap 1 (dung GM cu)."""
    if os.path.exists(FILE):
        _sao_luu()
        os.remove(FILE)
    return True, "Da xoa cau hinh Vo Hon: chon deu + tay ve cap 1 nhu GM cu."


def _sao_luu():
    if os.path.exists(FILE):
        os.makedirs(BACKUP, exist_ok=True)
        shutil.copy2(FILE, os.path.join(BACKUP, "vohon-" + time.strftime("%Y%m%d-%H%M%S") + ".txt"))


if __name__ == "__main__":
    import json
    print(json.dumps(doc(), ensure_ascii=False))
