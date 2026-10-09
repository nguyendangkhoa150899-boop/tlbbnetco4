#!/usr/bin/env python3
"""10/10: CUSTOM % TAY TU CHAT - giam dinh lai tu chat trang bi o Trieu Tiet (trang admin bot: Cong cu > Custom tay tu chat, chi SUPER).

Engine goc (dich nguoc Server.elf, ItemContainer::ReSetItemAptitude): moi lan tay quay lai CA 6 chi so tu chat, moi chi so deu
trong [cot 94 EquipBase, 255]; % = ItemAptRate.txt (250 = 20%, 251 = 25, 252 = 30, 253 = 35, 254 = 45, 255 = 60). Luc che chi
ra toi da 250 (cot 95) -> 25-60% CHI co qua tay. Engine khong co ham GHI tu chat.

Script 809261 (event/equip/judge_aptitude.lua, x809261_NetCo4_TuChat) doc file Server/txt/NetCo4Cfg/tuchat.txt MOI LAN tay:
chon moc dich theo ti le duoi day roi goi lai LuaFnReSetItemApt (trong server, khong ton them Kim Cuong Sa) toi khi % cong/thu
CAO NHAT cua mon bang dung moc (toi da 3000 lan). Tu chat ra la that -> tooltip client dung. Luu la co hieu luc ngay, KHONG restart.
File ASCII:
    bat 1          <- 1 = bat custom; 0 / khong co file = engine goc
    60 0.5         <- ti le % moi lan tay ra DUNG moc 60%
    45 1 ...       <- cac moc 45 / 35 / 30 / 25 / 20
Phan con lai (100 - tong) ra duoi 20%.
"""
import os
import re
import shutil
import time

GAME = os.environ.get("TLBB_GAME", "/opt/tlbb-root/home/tlbb")
BACKUP = os.environ.get("TLBB_BACKUP", "/opt/tlbb-backup")
FILE = GAME + "/Server/txt/NetCo4Cfg/tuchat.txt"
MOC = [60, 45, 35, 30, 25, 20]
BYTE = {60: 255, 45: 254, 35: 253, 30: 252, 25: 251, 20: 250}   # moc % -> chi so tu chat (ItemAptRate cot cong / thu)


def goc(mn, k=2):
    """Ti le % engine goc cho % cong/thu CAO NHAT cua mon: k chi so (vu khi: ngoai + noi cong = 2) deu trong [mn, 255]."""
    n = 256 - mn
    le = lambda v: max(0, v - mn + 1) / n   # P(1 chi so <= v)
    out = {m: (le(BYTE[m]) ** k - le(BYTE[m] - 1) ** k) * 100 for m in MOC}
    out["duoi"] = le(249) ** k * 100
    return out


def doc():
    """{bat: 0|1, p: {moc: %}, co: file co ton tai, ai, t}."""
    cfg = {"bat": 0, "p": {m: 0 for m in MOC}, "co": os.path.exists(FILE), "ai": "", "t": 0}
    if not cfg["co"]:
        return cfg
    for line in open(FILE, encoding="ascii", errors="replace"):
        line = line.strip()
        m = re.match(r"^# ai=(.*) t=(\d+)$", line)
        if m:
            cfg["ai"], cfg["t"] = m.group(1), int(m.group(2))
            continue
        p = line.split()
        if len(p) < 2:
            continue
        if p[0] == "bat":
            cfg["bat"] = 1 if p[1].startswith("1") else 0
        elif p[0].isdigit() and int(p[0]) in MOC:
            try:
                cfg["p"][int(p[0])] = float(p[1])
            except ValueError:
                pass
    return cfg


def du_lieu():
    return {"moc": MOC, "byte": BYTE, "goc": {"1": goc(1), "126": goc(126), "1x1": goc(1, 1)}, "cfg": doc()}


def kiem(bat, p):
    if bat not in (0, 1):
        return "bat phải 0 / 1"
    for m, x in p.items():
        if m not in MOC:
            return "Mốc %s%% không có" % m
        if not 0 <= x <= 100:
            return "Tỉ lệ mốc %d%% phải trong 0 - 100" % m
    if sum(p.values()) > 100.0001:
        return "Tổng các mốc %.2f%% vượt 100%%" % sum(p.values())
    return None


def luu(bat, p, ai=""):
    """p = {moc: %}; lam tron 2 so le (Lua quay tren 10000). Ghi file ASCII + sao luu ban cu."""
    p = {m: round(float(p.get(m, 0) or 0), 2) for m in MOC}
    err = kiem(bat, p)
    if err:
        return False, err
    ai = re.sub(r"[^ -~]", "?", ai)[:60]
    dong = ["# NetCo4 Custom tay tu chat - trang admin bot (panel/tuchat.py). bat 1 = bat; '<moc> <ti le %>'; con lai ra duoi 20%.",
            "# ai=%s t=%d" % (ai, int(time.time())), "bat %d" % bat]
    dong += ["%d %s" % (m, ("%.2f" % p[m]).rstrip("0").rstrip(".")) for m in MOC]
    _sao_luu()
    os.makedirs(os.path.dirname(FILE), exist_ok=True)
    tmp = FILE + ".tmp"
    with open(tmp, "w", encoding="ascii", newline="\n") as f:
        f.write("\n".join(dong) + "\n")
    os.replace(tmp, FILE)
    tom = ", ".join("%d%%: %s%%" % (m, ("%.2f" % p[m]).rstrip("0").rstrip(".")) for m in MOC if p[m] > 0) or "moi moc 0"
    return True, ("Da luu tay tu chat: %s (%s; con lai %.2f%% ra duoi 20%%). Co hieu luc NGAY lan tay ke tiep, khong can restart."
                  % ("BAT" if bat else "TAT - dang chay engine goc", tom, 100 - sum(p.values())))


def ve_mac_dinh():
    """Xoa file -> tay chay dung engine goc."""
    if os.path.exists(FILE):
        _sao_luu()
        os.remove(FILE)
    return True, "Da xoa cau hinh tay tu chat: ve engine goc (moi chi so deu trong [cot 94 EquipBase, 255])."


def _sao_luu():
    if os.path.exists(FILE):
        os.makedirs(BACKUP, exist_ok=True)
        shutil.copy2(FILE, os.path.join(BACKUP, "tuchat-" + time.strftime("%Y%m%d-%H%M%S") + ".txt"))


if __name__ == "__main__":
    import json
    print(json.dumps(du_lieu(), ensure_ascii=False, indent=1))
