#!/usr/bin/env python3
"""Doi chu tieng Viet (UTF-8) sang chuoi Lua dung duoc trong game TLBB NetCo4.

Game hien thi tieng Viet theo bang ma VISCII. Cong cu nay xuat chuoi Lua chi gom ky tu ASCII,
chu co dau duoc viet bang escape thap phan \\ddd (Lua 4 ho tro), nen file .lua luon an toan
khi mo/luu bang bat ky editor nao.

    python tools/vn.py "Chào mừng đến NetCo4"
    -> "Ch\\224o m\\215ng \\240\\170n NetCo4"

    python tools/vn.py --giai "Ch\\224o"      doi nguoc tu escape / byte VISCII ve UTF-8 de doc
"""
import json
import os
import re
import sys

MAP = json.load(open(os.path.join(os.path.dirname(__file__), "viscii-map.json"), encoding="utf-8"))
REV = {v: k for k, v in MAP.items()}


def to_lua(text: str) -> str:
    out = []
    for ch in text:
        if ch in MAP:
            out.append("\\%03d" % MAP[ch])
        elif ch == '"':
            out.append('\\"')
        elif ch == "\\":
            out.append("\\\\")
        elif ord(ch) < 128:
            out.append(ch)
        else:
            raise SystemExit(f"Ky tu khong co trong VISCII: {ch!r} (U+{ord(ch):04X})")
    # Luon ghi du 3 chu so (\005) de chu so dung sau khong bi doc lan vao escape
    return '"' + "".join(out) + '"'


def decode(s: str) -> str:
    s = re.sub(r"\\(\d{1,3})", lambda m: chr(int(m.group(1))), s)
    return "".join(REV.get(ord(c), c) for c in s)


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "--giai":
        print(decode(" ".join(sys.argv[2:])))
    elif len(sys.argv) >= 2:
        print(to_lua(" ".join(sys.argv[1:])))
    else:
        print(__doc__)
