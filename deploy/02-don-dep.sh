#!/bin/bash
# Buoc 02: don sach tan du cua server cu trong $ROOT (file, cau hinh, script).
# Chi sua file khi md5 khop dung ban da duoc ra soat; khong khop thi bo qua va canh bao.
# Chay lai nhieu lan khong sao (file da va se bi bo qua vi md5 da doi).
set -euo pipefail
. "$(dirname "$0")/common.sh"
[ "${TEST:-0}" = 1 ] || need_root
[ -n "${DB_PASS:-}" ] || die "Chua co secrets.env (chay buoc 01 truoc)"
[ -n "$PUBLIC_IP" ] || die "Chua dien PUBLIC_IP trong config.env"

export LC_ALL=C
H="$ROOT/home"
T="$H/tlbb"
S="$T/Public/Data/Script"
C="$T/Server/Config"
[ -d "$S" ] || die "Khong thay $S"

SKIPPED=0
# patch <file> <md5 ban goc> <sed script...>
patch() {
    local f="$1" md5="$2"; shift 2
    if [ ! -f "$f" ]; then warn "Khong co file: ${f#$ROOT}"; SKIPPED=$((SKIPPED+1)); return; fi
    local cur; cur=$(md5sum "$f" | cut -d' ' -f1)
    if [ "$cur" != "$md5" ]; then
        warn "Bo qua (da sua hoac khac ban ra soat): ${f#$ROOT}"
        SKIPPED=$((SKIPPED+1)); return
    fi
    cp -p "$f" "$f.goc"
    sed -i -E "$@" "$f"
    log "Da va: ${f#$ROOT}"
}

# ---------------------------------------------------------------------------
log "1. Va script: phat qua, lo de, gift code, GUID cung cua server cu"

# NPC 001113 (Lau Lan): chi giu Qua Tan Thu (8887), Buff (15000), Huy hieu ung (30030).
# Chan: 8888 (300k Diem Tang vo han), 8889 (1 ty vang cho 1 GUID + lo IP/MAC),
# 7777 (1 ty vang + 1 trieu KNB), 30000, 4444, 9999, 6666, 5555...
patch "$S/obj/loulangucheng/oloulan_malan.lua" fada6bfe32e6ef4be202dd0aeec2ba70 \
    -e '39a if key ~= 8887 and key ~= 15000 and key ~= 30030 then return end -- [don-dep] chan qua cua server cu' \
    -e 's/^([[:space:]]*)(AddNumText\( sceneId, x001113_g_scriptId, .*, 6, 888[89] \))/\1--\2/' \
    -e 's/strGUID ==  *10[0-9]{8}/strGUID == -1/g'

# Tien trang 181000: tat lo de (so trung viet cung 55/56, tra x70 KNB) va doi the cao (thu vang khong tra gi).
# Giu nguyen cho the gioi (TuiBing_A idx 40/50/60/70) va doi KNB.
patch "$S/obj/qianzhuang/oqianzhuang_yuanbao.lua" b3edd795516a0655a6f52ed6ebe430af \
    -e 's/^x999999_ketqualo  = \{55\}/x999999_ketqualo  = {}/' \
    -e 's/^x999999_ketquade  = \{56\}/x999999_ketquade  = {}/' \
    -e '85a local k_dd = GetNumText() if k_dd == 19 or k_dd == 190 or k_dd == 191 or k_dd == 192 then return end -- [don-dep] tat doi the cao' \
    -e '341a if idx == 9999 or idx == 31 then return end -- [don-dep] tat lo de'

# NPC 999999 (CDK): tat toan bo Gift Code + Lo De. ~2000 ma VIP (50k KNB/ma) va ma chia se da bi lo.
patch "$S/CDK/CDK.lua" ff6a826d81f1b38d4487c2880bbbce41 \
    -e '11a BeginEvent(sceneId) AddText(sceneId,"Chuc nang Gift Code / Lo De da tat.") EndEvent(sceneId) DispatchEventList(sceneId,selfId,targetId) if 1 then return end -- [don-dep]' \
    -e '38a if 1 then return end -- [don-dep]' \
    -e '347a if 1 then return end -- [don-dep]' \
    -e '454a if 1 then return end -- [don-dep]' \
    -e '546a if 1 then return end -- [don-dep]'

# Danh hieu Top gan cung cho GUID 1010000007/36/66/41 (se trung nhan vat ban be)
patch "$S/MyNew/doidanhhieu.lua" 46251d56e3013f1486a6ca512ad3e43a \
    -e 's/strGUID == 10[0-9]{8}/strGUID == -1/g'

# Cam loa gan cung theo GUID cu
patch "$S/obj/commonitem/speaker.lua" dd16bb0daeeb43b65e91c4002649629c \
    -e 's/strGUID == 10[0-9]{8}/strGUID == -1/g'

# Handler an: buff tang hinh GM (111)
patch "$S/obj/luoyang/oluoyang_longbatian.lua" e6e5c261ad5481c1c46e20038351e5b7 \
    -e 's/if key == 111 then/if key == -111 then/'

# Handler an (99)
patch "$S/obj/luoyang/oluoyang_qiaofusheng.lua" 08bc9d568139666ff8e5566d11689e00 \
    -e 's/if GetNumText\(\) == 99 then/if GetNumText() == -99 then/'

# Handler an: +10000 diem tiem nang vo han (916)
patch "$S/MyNew/jiarumenpai.lua" 7955b7d0ffa3f7079eda23d417c58931 \
    -e 's/if GetNumText\(\) == 916 then/if GetNumText() == -916 then/'

# Thuy Lao: cam doi co >= 3 nguoi cung IP. Ban be choi chung nha se bi chan.
patch "$S/event/xunhuan/shuilao_12.lua" fd0fc31c4284dd60c3f54975eae55d66 \
    -e 's/^x232002_g_MaxSameIPNum = 3/x232002_g_MaxSameIPNum = 99/'

# Thong bao khi dang nhap: bo link web server cu
patch "$C/NotifyOnline.txt" 008ff5c6fe8e87e1f89a3b28db2fe30c \
    -e 's#https?://[^ ]*##g'

# ---------------------------------------------------------------------------
log "2. Xoa du lieu nguoi choi cu nam ngoai database"
empty() { local f; for f in "$@"; do [ -f "$f" ] && : > "$f"; done; return 0; }

# Danh sach ma code da lo (ma VIP, ma chia se, ma tan thu)
empty "$S"/CDK/*.txt
# Diem danh theo GUID (se trung GUID nhan vat moi)
find "$C/QianDao" -type f -delete 2>/dev/null || true
# Du lieu cua hang theo GUID
find "$T/Server/txt/DBShopData" -type f -delete 2>/dev/null || true
for d in HQYZ YiRong TuiJian HuiShou; do find "$T/Server/txt/$d" -type f -delete 2>/dev/null || true; done
# Bang xep hang, danh nhan duong, cho KNB, bao danh, lo de
empty "$C"/Paiming/*.txt "$C"/MingRenTang/*.txt "$C"/YbMarket/*.txt
empty "$T"/Server/txt/JuDian/*.txt "$T"/Server/txt/ShiJianTx/*.txt "$T"/Server/LoDe/*.txt
empty "$S"/VanHoang/*.txt
# Log IP that cua nguoi choi cu, log nap tien, log server
empty "$T"/Server/IP/*.txt
for d in Log Log1 Log2; do [ -d "$T/Server/$d" ] && find "$T/Server/$d" -type f -delete; done
find "$H/billing_logs" "$H/log.log" -maxdepth 0 -exec rm -rf {} + 2>/dev/null || true
# Lich su lenh cua admin cu
[ -f "$ROOT/root/.bash_history" ] && : > "$ROOT/root/.bash_history"

# ---------------------------------------------------------------------------
log "3. Xoa file thua"
rm -f "$T/ip.sh" "$T/IP.sh" "$T/Server/a.sh"            # script quet cong
rm -f "$T/Server/vinhstop.sh" "$T/axiaorun.sh"          # script cua admin cu, sai duong dan
rm -rf "$T/Server/Billing"                              # billing cu (khong dung), chua mat khau root cua ho
rm -f "$H/billing.exe"                                  # ban Windows, khong dung
rm -f "$H/tlbb.tar.gz"

# ---------------------------------------------------------------------------
log "4. Cau hinh server moi"
# GM: de trong. Tao nhan vat xong thi chay ./cap-gm.sh <ten nhan vat>
printf '[gm]\ncount=0\n' > "$C/GMList.ini"

# Database: chi ket noi noi bo 127.0.0.1 voi mat khau moi
for f in "$C/LoginInfo.ini" "$C/ShareMemInfo.ini"; do
    sed -i -E \
        -e "s/^DBIP=[^[:space:];]*/DBIP=127.0.0.1/" \
        -e "s/^DBUser=[^[:space:];]*/DBUser=tlbb/" \
        -e "s/^DBPassword=[^[:space:];]*/DBPassword=$DB_PASS/" "$f"
done
sed -i -E \
    -e "s/^(SERVER[[:space:]]*=[[:space:]]*).*/\1127.0.0.1/" \
    -e "s/^(USER[[:space:]]*=[[:space:]]*).*/\1tlbb/" \
    -e "s/^(Password[[:space:]]*=[[:space:]]*).*/\1$DB_PASS/" "$ROOT/etc/odbc.ini"

# IP: cong cho client = IP public, cong noi bo = 127.0.0.1
sed -i -E \
    -e "s/^IP0=192\.168\.1\.3/IP0=$PUBLIC_IP/" \
    -e "s/^IP1=192\.168\.1\.3/IP1=127.0.0.1/" "$C/ServerInfo.ini"

# MySQL chi nghe tren 127.0.0.1
grep -q '^bind-address' "$ROOT/etc/my.cnf" \
    || sed -i -E 's/^\[mysqld\]/[mysqld]\nbind-address = 127.0.0.1/' "$ROOT/etc/my.cnf"

# Billing: tat tu dang ky, ket noi DB noi bo
cat > "$H/config.json" <<EOF
{
  "ip": "127.0.0.1",
  "port": 12680,
  "db_host": "127.0.0.1",
  "db_port": 3306,
  "db_user": "tlbb",
  "db_password": "$DB_PASS",
  "db_name": "web",
  "allow_old_password": false,
  "auto_reg": false,
  "allow_ips": ["127.0.0.1"],
  "transfer_number": 1000
}
EOF
chmod 600 "$H/config.json"

# Khong de may ao cu tu doi IP khi chay trong chroot (khong anh huong VPS, chi cho sach)
sed -i -E 's/192\.168\.1\.3/127.0.0.1/' "$ROOT/etc/network/interfaces" 2>/dev/null || true

# ---------------------------------------------------------------------------
log "5. Kiem tra con sot 192.168.1.x hoac mat khau cu"
left=$(grep -rIl -e '192\.168\.1\.' -e 'tlbb1234' -e 'Hahung98as' "$T/Server" "$H/config.json" "$ROOT/etc/odbc.ini" 2>/dev/null \
       | grep -v '\.goc$' | grep -v '/Log' || true)
if [ -n "$left" ]; then warn "Con sot trong:"; echo "$left"; else log "Sach"; fi

[ "$SKIPPED" = 0 ] || warn "$SKIPPED file bi bo qua (xem canh bao o tren)"
log "Xong buoc 02. Tiep theo: ./03-database.sh"
