#!/bin/bash
# Xoa sach du lieu choi thu (nhan vat, do, bang, thu, xep hang, diem danh...) de bat dau choi that.
# Giu nguyen: code/script, cau hinh, bo dem GUID (tiep tuc tang), mat khau MySQL.
#   ./reset-choi-that.sh              xoa nhan vat, GIU tai khoan dang nhap
#   ./reset-choi-that.sh --ca-tai-khoan   xoa ca tai khoan (tru admin)
# Server phai dang TAT. Luon sao luu truoc khi xoa.
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root
is_running ShareMemory && die "Server dang chay. Tat truoc: ./tlbb.sh stop"

ALL_ACC=0; [ "${1:-}" = --ca-tai-khoan ] && ALL_ACC=1
echo "Se XOA: toan bo nhan vat, vat pham, pet, bang hoi, thanh thi, thu, xep hang, diem danh."
[ "$ALL_ACC" = 1 ] && echo "Se XOA ca tai khoan dang nhap (tru admin)." || echo "Giu lai tai khoan dang nhap."
read -r -p "Go RESET de xac nhan: " x; [ "$x" = RESET ] || die "Da huy"

mount_chroot
trap umount_chroot EXIT
spawn_chroot "$MYSQL_BIN/mysqld_safe --user=root"
wait_mysql "-uroot -p'$MYSQL_ROOT_PASS'" || die "MySQL khong len"
sql() { mysql_root "-N -B -e \"$1\""; }

stamp=$(date +%Y%m%d-%H%M%S)
f="$BACKUP_DIR/truoc-reset-$stamp.sql.gz"
in_chroot "$MYSQL_BIN/mysqldump -uroot -p'$MYSQL_ROOT_PASS' --routines --databases tlbbdb web" | gzip > "$f"
[ -s "$f" ] || die "Sao luu that bai, KHONG xoa gi"
log "Da sao luu: $f"

KEEP=" t_var t_global t_general_set t_itemkey t_crc32 t_xfallexp t_guild_new t_city_new t_city_info "
for t in $(sql "SHOW TABLES FROM tlbbdb"); do
    case "$KEEP" in *" $t "*) continue ;; esac
    sql "DELETE FROM tlbbdb.$t"
done
# O bang / o thanh tao san: tra ve trong (xem 03-database.sh)
reset_slots() {
    local cols empty="$3='' AND $4=-1"
    cols=$(sql "SELECT GROUP_CONCAT(CONCAT('a.',COLUMN_NAME,'=e.',COLUMN_NAME)) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='tlbbdb' AND TABLE_NAME='$1' AND COLUMN_NAME<>'$2'")
    sql "UPDATE tlbbdb.$1 a JOIN (SELECT * FROM tlbbdb.$1 WHERE $empty LIMIT 1) e SET $cols WHERE NOT (a.$3='' AND a.$4=-1)"
}
sql "SET GLOBAL group_concat_max_len = 65535"
reset_slots t_guild_new guildid guildname chiefguid
reset_slots t_city_new  poolid  cityname  guildid
sql "UPDATE tlbbdb.t_city_info SET isvalid = 0"
sql "UPDATE tlbbdb.t_global SET data1 = 0"
log "Da xoa du lieu nhan vat. GUID moi tiep tuc tu: $(sql 'SELECT maxcharguid FROM tlbbdb.t_var LIMIT 1')"

if [ "$ALL_ACC" = 1 ]; then
    sql "DELETE FROM web.account WHERE name <> 'admin'"
    log "Da xoa tai khoan (giu admin)"
fi
sql "UPDATE web.account SET point = 0"

in_chroot "$MYSQL_BIN/mysqladmin -uroot -p'$MYSQL_ROOT_PASS' shutdown"
for i in $(seq 1 30); do is_running mysqld || break; sleep 1; done

# Du lieu script ghi ra file (theo GUID / xep hang) + GM list
T="$ROOT/home/tlbb"; C="$T/Server/Config"
find "$C/QianDao" "$T/Server/txt/DBShopData" "$T/Server/txt/NetCo4Qua" "$T/Server/txt/NetCo4Popup" -type f -delete 2>/dev/null || true
for d in HQYZ YiRong TuiJian HuiShou; do find "$T/Server/txt/$d" -type f -delete 2>/dev/null || true; done
for g in "$C"/Paiming/*.txt "$C"/MingRenTang/*.txt "$C"/YbMarket/*.txt "$T"/Server/txt/JuDian/*.txt \
         "$T"/Server/txt/ShiJianTx/*.txt "$T"/Server/LoDe/*.txt "$T"/Server/IP/*.txt; do
    [ -f "$g" ] && : > "$g"
done
printf '[gm]\ncount=0\n' > "$C/GMList.ini"
log "Da xoa xep hang, diem danh, GM list. Cap GM lai sau khi tao nhan vat: ./cap-gm.sh <ten>"
log "Bat server: ./tlbb.sh start"
