#!/usr/bin/env python3
# Va binary Server: doi truong bam "To doi di theo" -> moi dong doi trong AvailableFollowDist TU DONG dong y
# (khong hien bang hoi). Lam 03/10/2026.
#
# Cach lam: trong vong lap gui bang hoi cua Packets::CGAskTeamFollowHandler::Execute (0x081c15dc),
# thay doan gui GCAskTeamFollow (0x081c1bad..0x081c1bf0, 67 byte) bang:
#     cmp  %eax,%ebx            ; eax = dong doi, ebx = doi truong -> bo qua chinh doi truong
#     je   SKIP
#     lea  -0xd8(%ebp),%edx     ; vung nho goi tin san co trong khung ham
#     movb $1,0xc(%edx)         ; CGReturnTeamFollow::m_Return (Read() doc 1 byte vao this+0xc) = 1
#     push 0x17c24(%eax)        ; Player* cua dong doi (giong cho goi SendPacket goc)
#     push %edx
#     call CGReturnTeamFollowHandler::Execute (0x081c1c90)   ; nhu the dong doi bam "Dong y"
#     add  $8,%esp
# SKIP:
#     jmp  0x081c1b1e           ; inc edi, quay lai vong lap
# Handler dong y tu kiem: dong doi con song, doi truong dang o che do di theo, khoang cach (AvailableFollowDist)...
#
# Dung:  python3 va-tu-di-theo.py <Server.elf giai nen UPX> <file ra>
# File vao phai la ban giai nen UPX cua Server goc (md5 c7b0a0ba3cafba76da2fe769d3424be1, /root/re/Server.elf tren VPS).
import hashlib, sys

MD5_VAO = "c7b0a0ba3cafba76da2fe769d3424be1"
VADDR_TEXT, OFF_TEXT = 0x08048000, 0x0
A = 0x081c1bad                       # dau doan thay
GOC = bytes.fromhex(
    "8db528ffffff" "83ec0c" "56" "e8a08e2300" "58" "8b44bd90" "5a" "8b80247c0100"
    "c78528ffffff88424308" "8b10" "56" "50" "ff520c" "c78528ffffff88424308" "893424"
    "e8b18e2300" "e92bffffff")
assert len(GOC) == 67


def rel32(tu_sau_lenh, dich):
    return ((dich - tu_sau_lenh) & 0xffffffff).to_bytes(4, "little")


moi = bytearray()
moi += bytes.fromhex("39c3")                 # cmp %eax,%ebx
moi += bytes.fromhex("7419")                 # je +0x19 -> SKIP
moi += bytes.fromhex("8d9528ffffff")         # lea -0xd8(%ebp),%edx
moi += bytes.fromhex("c6420c01")             # movb $1,0xc(%edx)
moi += bytes.fromhex("ffb0247c0100")         # push 0x17c24(%eax)
moi += bytes.fromhex("52")                   # push %edx
moi += b"\xe8" + rel32(A + len(moi) + 5, 0x081c1c90)   # call CGReturnTeamFollowHandler::Execute
moi += bytes.fromhex("83c408")               # add $8,%esp
assert len(moi) == 29                        # SKIP = A+29 (khop voi je +0x19 tu A+4)
moi += b"\xe9" + rel32(A + len(moi) + 5, 0x081c1b1e)   # jmp vong lap
moi += b"\x90" * (len(GOC) - len(moi))
assert len(moi) == len(GOC)

vao, ra = sys.argv[1], sys.argv[2]
data = bytearray(open(vao, "rb").read())
md5 = hashlib.md5(data).hexdigest()
if md5 != MD5_VAO:
    sys.exit("md5 file vao %s khac %s -> DUNG (khong phai ban giai nen Server goc)" % (md5, MD5_VAO))
off = A - VADDR_TEXT + OFF_TEXT
if bytes(data[off:off + len(GOC)]) != GOC:
    sys.exit("byte goc tai 0x%x khong khop -> DUNG" % A)
data[off:off + len(GOC)] = moi
open(ra, "wb").write(data)
print("da va: offset 0x%x, %d byte, md5 ra %s" % (off, len(moi), hashlib.md5(data).hexdigest()))
