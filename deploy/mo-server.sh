#!/bin/bash
# Mo server chinh thuc: xoa du lieu choi thu, GIU DUY NHAT nhan vat KEEP_GUID va tai khoan KEEP_ACC (+ admin).
# Dua tren reset-choi-that.sh. Quy trinh day du: docs/MO-SERVER.md muc 3.
#   ./mo-server.sh --thu   chay thu tren BAN SAO DB (tlbbdb_thu, web_thu), game van chay, khong dung file. Xoa ban sao sau khi dem.
#   ./mo-server.sh         chay that. Server phai TAT (./tlbb.sh stop). Tu sao luu truoc khi xoa. Hoi go MOSERVER.
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root

KEEP_GUID=1010100008      # bia1
KEEP_ACC=bialk1           # tai khoan cua bia1
THU=0; [ "${1:-}" = --thu ] && THU=1

sql() { mysql_root "-N -B -e \"$1\""; }

# Bang giu nguyen ca bang (giong reset-choi-that.sh)
KEEP_TABLES=" t_var t_global t_general_set t_itemkey t_crc32 t_xfallexp t_guild_new t_city_new t_city_info "

xu_ly_db() {   # $1 = ten DB game, $2 = ten DB web
    local D=$1 W=$2 t
    for t in $(sql "SHOW TABLES FROM $D"); do
        case "$KEEP_TABLES" in *" $t "*) continue ;; esac
        if [ -n "$(sql "SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='$D' AND TABLE_NAME='$t' AND COLUMN_NAME='charguid'")" ] \
           && [ "$t" != t_guild_user ] && [ "$t" != t_relation ]; then
            sql "DELETE FROM $D.$t WHERE charguid <> $KEEP_GUID"
        elif [ "$t" = t_mail ]; then
            sql "DELETE FROM $D.t_mail WHERE recer <> (SELECT charname FROM $D.t_char WHERE charguid = $KEEP_GUID)"
        else
            sql "DELETE FROM $D.$t"            # bang, thanh, lien minh, quan he ban be, shop, giong reset
        fi
    done
    # bia1 ra khoi bang (bang bi xoa het)
    sql "UPDATE $D.t_char SET guldid = -1 WHERE charguid = $KEEP_GUID"
    sql "UPDATE $D.t_charextra SET leagueid = -1 WHERE charguid = $KEEP_GUID"
    # O bang / o thanh tao san: tra ve trong (KHONG DELETE, xem CLAUDE.md quy tac 3)
    reset_slots() {
        local cols empty="$3='' AND $4=-1"
        cols=$(sql "SELECT GROUP_CONCAT(CONCAT('a.',COLUMN_NAME,'=e.',COLUMN_NAME)) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='$D' AND TABLE_NAME='$1' AND COLUMN_NAME<>'$2'")
        sql "UPDATE $D.$1 a JOIN (SELECT * FROM $D.$1 WHERE $empty LIMIT 1) e SET $cols WHERE NOT (a.$3='' AND a.$4=-1)"
    }
    sql "SET GLOBAL group_concat_max_len = 65535"
    reset_slots t_guild_new guildid guildname chiefguid
    reset_slots t_city_new  poolid  cityname  guildid
    sql "UPDATE $D.t_city_info SET isvalid = 0"
    sql "UPDATE $D.t_global SET data1 = 0"
    # Tai khoan: giu KEEP_ACC va admin
    sql "DELETE FROM $W.account WHERE name NOT IN ('$KEEP_ACC','admin')"
}

dem() {   # $1 DB game, $2 DB web
    local D=$1 W=$2
    log "Con lai sau khi xu ly ($D / $W):"
    for t in t_char t_iteminfo t_pet t_skill t_xinfa t_ability t_mission t_impact t_charextra t_mail t_guild_user t_relation t_guild t_city; do
        printf '   %-14s %s\n' "$t" "$(sql "SELECT COUNT(*) FROM $D.$t")"
    done
    printf '   %-14s %s\n' "t_char khac"   "$(sql "SELECT COUNT(*) FROM $D.t_char WHERE charguid <> $KEEP_GUID")"
    printf '   %-14s %s\n' "item bia1"     "$(sql "SELECT COUNT(*) FROM $D.t_iteminfo WHERE charguid = $KEEP_GUID AND isvalid = 1")"
    printf '   %-14s %s\n' "guild dang dung" "$(sql "SELECT COUNT(*) FROM $D.t_guild_new WHERE NOT (guildname='' AND chiefguid=-1)")"
    printf '   %-14s %s\n' "bia1"          "$(sql "SELECT CONCAT(charname,' cap ',level,' guldid ',guldid) FROM $D.t_char WHERE charguid = $KEEP_GUID")"
    printf '   %-14s %s\n' "maxcharguid"   "$(sql "SELECT maxcharguid FROM $D.t_var LIMIT 1")"
    printf '   %-14s %s\n' "web.account"   "$(sql "SELECT GROUP_CONCAT(name) FROM $W.account")"
}

if [ "$THU" = 1 ]; then
    is_running mysqld || die "MySQL chua chay (che do --thu dung MySQL dang chay)"
    log "CHAY THU tren ban sao. Game KHONG bi tat, DB that KHONG bi dong."
    sql "DROP DATABASE IF EXISTS tlbbdb_thu"; sql "DROP DATABASE IF EXISTS web_thu"
    sql "CREATE DATABASE tlbbdb_thu"; sql "CREATE DATABASE web_thu"
    in_chroot "$MYSQL_BIN/mysqldump -uroot -p'$MYSQL_ROOT_PASS' --single-transaction tlbbdb | $MYSQL_BIN/mysql -uroot -p'$MYSQL_ROOT_PASS' tlbbdb_thu"
    in_chroot "$MYSQL_BIN/mysqldump -uroot -p'$MYSQL_ROOT_PASS' --single-transaction web | $MYSQL_BIN/mysql -uroot -p'$MYSQL_ROOT_PASS' web_thu"
    log "Truoc: $(sql "SELECT COUNT(*) FROM tlbbdb_thu.t_char") nhan vat, $(sql "SELECT COUNT(*) FROM tlbbdb_thu.t_iteminfo") dong item, $(sql "SELECT COUNT(*) FROM web_thu.account") tai khoan"
    xu_ly_db tlbbdb_thu web_thu
    dem tlbbdb_thu web_thu
    sql "DROP DATABASE tlbbdb_thu"; sql "DROP DATABASE web_thu"
    log "Da xoa ban sao. File (hang doi qua, GMList...) KHONG dung o che do thu."
    exit 0
fi

is_running ShareMemory && die "Server dang chay. Tat truoc: ./tlbb.sh stop"
echo "Se XOA moi nhan vat/tai khoan/bang/thanh/thu/xep hang/diem danh/hang doi qua."
echo "GIU: nhan vat $KEEP_GUID, tai khoan $KEEP_ACC + admin, bo dem GUID, cau hinh."
read -r -p "Go MOSERVER de xac nhan: " x; [ "$x" = MOSERVER ] || die "Da huy"

mount_chroot
trap umount_chroot EXIT
spawn_chroot "$MYSQL_BIN/mysqld_safe --user=root"
wait_mysql "-uroot -p'$MYSQL_ROOT_PASS'" || die "MySQL khong len"

stamp=$(date +%Y%m%d-%H%M%S)
f="$BACKUP_DIR/truoc-moserver-$stamp.sql.gz"
in_chroot "$MYSQL_BIN/mysqldump -uroot -p'$MYSQL_ROOT_PASS' --routines --databases tlbbdb web" | gzip > "$f"
[ -s "$f" ] || die "Sao luu that bai, KHONG xoa gi"
log "Da sao luu: $f"

xu_ly_db tlbbdb web
dem tlbbdb web

in_chroot "$MYSQL_BIN/mysqladmin -uroot -p'$MYSQL_ROOT_PASS' shutdown"
for i in $(seq 1 30); do is_running mysqld || break; sleep 1; done

T="$ROOT/home/tlbb"; C="$T/Server/Config"; X="$T/Server/txt"
find "$C/QianDao" "$X/DBShopData" "$X/NetCo4Popup" -type f -delete 2>/dev/null || true
find "$X/NetCo4Qua" -maxdepth 1 -type f ! -name "$KEEP_GUID.txt" -delete 2>/dev/null || true     # ca _capmin.txt
find "$X/NetCo4Web" -type f ! -name "$KEEP_GUID.*" ! -name "*$KEEP_GUID*" -delete 2>/dev/null || true
for d in HQYZ YiRong TuiJian HuiShou; do find "$X/$d" -type f -delete 2>/dev/null || true; done
for g in "$C"/Paiming/*.txt "$C"/MingRenTang/*.txt "$C"/YbMarket/*.txt "$X"/JuDian/*.txt \
         "$X"/ShiJianTx/*.txt "$T"/Server/LoDe/*.txt "$T"/Server/IP/*.txt; do
    [ -f "$g" ] && : > "$g"
done
printf '[gm]\ncount=1\nguid0=%s\n' "$KEEP_GUID" > "$C/GMList.ini"
log "Da xoa hang doi qua, co nhan/ngay, xep hang, diem danh (giu cua $KEEP_GUID). GMList chi con $KEEP_GUID."
log "Tiep theo (docs/MO-SERVER.md muc 3): bot reset vi, doi mat khau, ./tlbb.sh start, kiem tra bang tai khoan moi."
