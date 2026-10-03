#!/usr/bin/env python3
"""04/10: TAY 3 DONG AM KHI (Phap bao, he "Dark" cua engine) - admin chinh trong so boc ky nang cua 3 dong.

Co che (dich nguoc Server.elf 04/10):
  - Am khi hoc ky nang o 3 moc cap 40 / 70 / 90 = 3 dong. Lua tay ky nang (obj/item/darkitem.lua 332207,
    vat pham 30503118 + 50.000 tien) goi AdjustDarkSkillForBagItem -> Item::AdjustDarkSkill (0x833b19c):
    doc g_DarkSkillStudyTbl (nap tu Server/Config/DarkSkillStudy.txt) roi rand theo trong so, SetDarkSkillId.
  - DarkSkillStudy.txt: moi hang = 1 lua chon, cot 1/2 = ky nang + trong so dong 1 (cap 40), cot 3/4 = dong 2 (cap 70),
    cot 5/6 = dong 3 (cap 90). Ky nang -1 = khong co. Ty le = trong so / tong trong so cua dong.
  => Chi doi 3 cot trong so (2, 4, 6), giu nguyen ID ky nang va moi byte khac. Co hieu luc sau restart.

Trong so dang ap luu o Server/txt/NetCo4Cfg/amkhi.json (ngoai repo). cap-nhat.sh rsync ghi de DarkSkillStudy.txt bang ban
repo roi goi `python3 amkhi.py --ap-lai`. Tra ve goc = chep lai ban repo.
"""
import json
import os
import sys
import time

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GAME = "/opt/tlbb-root/home/tlbb"
CFG = GAME + "/Server/txt/NetCo4Cfg/amkhi.json"
F_GAME = GAME + "/Server/Config/DarkSkillStudy.txt"
F_REPO = os.path.join(REPO, "server", "Server", "Config", "DarkSkillStudy.txt")
DONG = [(40, 1, 2), (70, 3, 4), (90, 5, 6)]   # (moc cap, cot ky nang, cot trong so)

# Ten ky nang (StandardImpact.txt cot 1, GBK "法宝..." -> Viet). Dong 1 cong cong, dong 2 hieu ung len dich, dong 3 chi so.
TEN = {
    32003: "+Ngoại công", 32019: "+Nội công", 32035: "+Băng công", 32051: "+Hỏa công", 32067: "+Huyền công",
    32083: "+Độc công", 32099: "+Sát thương trực tiếp", 32115: "Độc (mất máu dần)",
    32150: "Giảm công kích địch", 32166: "Giảm phòng thủ địch", 32182: "Giảm tốc", 32198: "Định thân", 32214: "Tán công",
    32230: "Mù", 32262: "Phong huyệt", 32278: "Tê liệt", 32294: "Vây hãm", 32310: "Hôn mê",
    32328: "+Lực", 32344: "+Linh khí", 32360: "+Thể lực", 32376: "+Định lực", 32392: "+Thân pháp",
    32400: "+Sinh lực tối đa %", 32401: "+Nội lực tối đa %", 32402: "+Ngoại công %", 32403: "+Nội công %",
    32404: "+Phòng ngoại %", 32405: "+Phòng nội %",
}


def _doc(path):
    s = open(path, "rb").read().decode("latin-1")
    eol = "\r\n" if "\r\n" in s else "\n"
    return s.split(eol), eol


def _hang(lines):
    """Chi so cac hang du lieu (cot 0 la so) trong file."""
    return [i for i, l in enumerate(lines) if l.split("\t")[0].strip().isdigit()]


def doc_cfg():
    try:
        return json.load(open(CFG, encoding="utf-8"))
    except (OSError, ValueError):
        return {}


def du_lieu():
    """3 dong: moi lua chon {id, ten, goc (trong so ban repo), hien (trong so file game)}."""
    goc, _ = _doc(F_REPO)
    try:
        hien, _ = _doc(F_GAME)
    except OSError:
        hien = goc
    hg, hh = _hang(goc), _hang(hien)
    out = []
    for cap, ck, cw in DONG:
        ds = []
        for n, i in enumerate(hg):
            c = goc[i].split("\t")
            sk = int(c[ck])
            if sk < 0:
                continue
            w_hien = int(hien[hh[n]].split("\t")[cw]) if n < len(hh) else int(c[cw])
            ds.append({"id": sk, "ten": TEN.get(sk, "#%d" % sk), "goc": int(c[cw]), "hien": w_hien})
        out.append({"cap": cap, "ds": ds})
    cfg = doc_cfg()
    return {"dong": out, "dangAp": bool(cfg), "t": cfg.get("t", 0), "ai": cfg.get("ai", "")}


def _ghi(w):
    """w = {40: [..], 70: [..], 90: [..]} theo thu tu hang co ky nang. Dung ban repo lam khuon."""
    goc, eol = _doc(F_REPO)
    for cap, ck, cw in DONG:
        k = 0
        for i in _hang(goc):
            c = goc[i].split("\t")
            if int(c[ck]) < 0:
                continue
            c[cw] = str(w[cap][k])
            k += 1
            goc[i] = "\t".join(c)
    tmp = F_GAME + ".moi"
    open(tmp, "wb").write(eol.join(goc).encode("latin-1"))
    os.replace(tmp, F_GAME)


def kiem(d40, d70, d90):
    base = {x["cap"]: len(x["ds"]) for x in du_lieu()["dong"]}
    w = {}
    for cap, s in ((40, d40), (70, d70), (90, d90)):
        try:
            a = [int(x) for x in str(s).replace(" ", "").split(",") if x != ""]
        except ValueError:
            return None, "Dong cap %d: trong so phai la so nguyen" % cap
        if len(a) != base[cap]:
            return None, "Dong cap %d can %d trong so (dang co %d)" % (cap, base[cap], len(a))
        if any(x < 0 or x > 9999 for x in a):
            return None, "Dong cap %d: moi trong so 0-9999" % cap
        if sum(a) <= 0:
            return None, "Dong cap %d: tong trong so phai > 0" % cap
        w[cap] = a
    return w, None


def ap(d40, d70, d90, ai=""):
    w, err = kiem(d40, d70, d90)
    if err:
        return False, err
    _ghi(w)
    os.makedirs(os.path.dirname(CFG), exist_ok=True)
    tmp = CFG + ".moi"
    json.dump({"w": {str(k): v for k, v in w.items()}, "t": int(time.time()), "ai": ai}, open(tmp, "w", encoding="utf-8"))
    os.replace(tmp, CFG)
    return True, "Da ap trong so tay am khi (3 dong). Co hieu luc sau khi restart."


def tra():
    if not doc_cfg():
        return False, "Dang dung trong so goc roi"
    open(F_GAME, "wb").write(open(F_REPO, "rb").read())
    try:
        os.remove(CFG)
    except OSError:
        pass
    return True, "Da tra trong so tay am khi ve goc. Co hieu luc sau khi restart."


def ap_lai():
    """Goi tu cap-nhat.sh sau rsync: ap lai amkhi.json (neu co) len ban repo moi nhat."""
    cfg = doc_cfg()
    if not cfg:
        return "khong co trong so am khi rieng"
    w = {int(k): v for k, v in cfg.get("w", {}).items()}
    base = {x["cap"]: len(x["ds"]) for x in du_lieu()["dong"]}
    if set(w) != {40, 70, 90} or any(len(w[c]) != base[c] for c in base):
        return "BO QUA: amkhi.json khong khop so lua chon cua ban repo (kiem lai tren admin)"
    _ghi(w)
    return "ap lai trong so tay am khi"


if __name__ == "__main__":
    if sys.argv[1:] == ["--ap-lai"]:
        print(ap_lai())
    else:
        d = du_lieu()
        for x in d["dong"]:
            tg, th = sum(o["goc"] for o in x["ds"]), sum(o["hien"] for o in x["ds"])
            print("== dong cap %d" % x["cap"])
            for o in x["ds"]:
                print("   %5d %-24s goc %4d (%5.1f%%)  hien %4d (%5.1f%%)" % (o["id"], o["ten"], o["goc"], 100.0 * o["goc"] / tg, o["hien"], 100.0 * o["hien"] / th))
        print("dang ap:", d["dangAp"])
