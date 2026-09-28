#!/bin/bash
# Buoc 03: sao luu database cu, xoa sach nhan vat/tai khoan cua server cu,
# doi mat khau MySQL, xoa user MySQL mo ra mang 192.168.1.%.
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root
[ -n "${DB_PASS:-}" ] && [ -n "${MYSQL_ROOT_PASS:-}" ] || die "Chua co secrets.env (chay buoc 01)"
is_running mysqld && die "MySQL dang chay. Tat server truoc: ./tlbb.sh stop"

mount_chroot
trap umount_chroot EXIT

log "Bat MySQL o che do bao tri (khong mat khau, khong mo mang)"
spawn_chroot "$MYSQL_BIN/mysqld_safe --user=root --skip-grant-tables --skip-networking"
wait_mysql "" || die "MySQL khong khoi dong duoc. Xem $ROOT/usr/local/mysql5.0.45/var/*.err"

sql() { in_chroot "$MYSQL_BIN/mysql -N -B -e \"$1\""; }

stamp=$(date +%Y%m%d-%H%M%S)
log "Sao luu toan bo database cu -> $BACKUP_DIR/db-goc-$stamp.sql.gz"
mkdir -p "$BACKUP_DIR"
in_chroot "$MYSQL_BIN/mysqldump --routines --databases tlbbdb web mysql" | gzip > "$BACKUP_DIR/db-goc-$stamp.sql.gz"
[ -s "$BACKUP_DIR/db-goc-$stamp.sql.gz" ] || die "Sao luu that bai"

log "So dong truoc khi xoa:"
for db in tlbbdb web; do
    for t in $(sql "SHOW TABLES FROM $db"); do
        printf '  %-28s %s\n' "$db.$t" "$(sql "SELECT COUNT(*) FROM $db.$t")"
    done
done

# Bang giu lai: t_var (bo dem GUID), t_global (bien toan server, se dat ve 0),
# t_general_set, t_itemkey (bo dem serial vat pham), t_crc32, t_xfallexp (du lieu tinh),
# t_guild_new (1024 o bang tao san), t_city_new / t_city_info (255 o thanh tao san):
# 3 bang o tao san KHONG duoc xoa, chi tra cac o da dung ve trang thai trong.
KEEP=" t_var t_global t_general_set t_itemkey t_crc32 t_xfallexp t_guild_new t_city_new t_city_info "
log "Xoa du lieu nguoi choi trong tlbbdb"
for t in $(sql "SHOW TABLES FROM tlbbdb"); do
    case "$KEEP" in *" $t "*) continue ;; esac
    sql "DELETE FROM tlbbdb.$t"
    echo "  da xoa tlbbdb.$t"
done
log "Tra o bang / o thanh da dung ve trang thai trong (chep tu 1 o trong)"
# set_from_empty <bang> <khoa chinh> <cot ten> <cot chu so huu>: o trong la ten='' va chu=-1
set_from_empty() {
    local cols empty="$3='' AND $4=-1" used="NOT (a.$3='' AND a.$4=-1)"
    cols=$(sql "SELECT GROUP_CONCAT(CONCAT('a.',COLUMN_NAME,'=e.',COLUMN_NAME)) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='tlbbdb' AND TABLE_NAME='$1' AND COLUMN_NAME<>'$2'")
    sql "UPDATE tlbbdb.$1 a JOIN (SELECT * FROM tlbbdb.$1 WHERE $empty LIMIT 1) e SET $cols WHERE $used"
    echo "  $1: con $(sql "SELECT COUNT(*) FROM tlbbdb.$1 WHERE NOT ($empty)") o dang dung / $(sql "SELECT COUNT(*) FROM tlbbdb.$1") o"
}
sql "SET GLOBAL group_concat_max_len = 65535"
set_from_empty t_guild_new guildid guildname chiefguid
set_from_empty t_city_new  poolid  cityname  guildid
sql "UPDATE tlbbdb.t_city_info SET isvalid = 0"
sql "UPDATE tlbbdb.t_global SET data1 = 0"
sql "UPDATE tlbbdb.t_var SET maxcharguid = GREATEST(maxcharguid, $GUID_START)"
log "Nhan vat moi se co GUID tu: $(sql 'SELECT maxcharguid FROM tlbbdb.t_var LIMIT 1')"

log "Xoa tai khoan / nap tien cua server cu trong web"
for t in account pay card dos_ip dos_session; do
    sql "DELETE FROM web.$t" 2>/dev/null && echo "  da xoa web.$t" || true
done

log "Lam lai user MySQL: chi con root va tlbb, chi ket noi tu may nay"
# Tat ca trong MOT phien: sau FLUSH PRIVILEGES, ket noi MOI se bi kiem tra quyen (va bi tu choi),
# nhung phien dang mo van duoc tiep tuc.
cat > "$ROOT/tmp/users.sql" <<EOF
DELETE FROM mysql.user WHERE NOT (User='root' AND Host IN ('localhost','127.0.0.1'));
DELETE FROM mysql.db; DELETE FROM mysql.tables_priv; DELETE FROM mysql.columns_priv; DELETE FROM mysql.procs_priv;
UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASS') WHERE User='root';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON tlbbdb.* TO 'tlbb'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON web.*    TO 'tlbb'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON tlbbdb.* TO 'tlbb'@'127.0.0.1' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON web.*    TO 'tlbb'@'127.0.0.1' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES;
SELECT User, Host FROM mysql.user;
EOF
in_chroot "$MYSQL_BIN/mysql -N -B < /tmp/users.sql" | sed 's/^/  /'
rm -f "$ROOT/tmp/users.sql"

log "Tat MySQL bao tri"
in_chroot "$MYSQL_BIN/mysqladmin -uroot -p'$MYSQL_ROOT_PASS' shutdown"
for i in $(seq 1 30); do is_running mysqld || break; sleep 1; done

log "Kiem tra dang nhap bang mat khau moi"
spawn_chroot "$MYSQL_BIN/mysqld_safe --user=root"
wait_mysql "-utlbb -p'$DB_PASS' -h127.0.0.1" || die "User tlbb khong dang nhap duoc"
log "OK: tlbb@127.0.0.1 dang nhap duoc"
in_chroot "$MYSQL_BIN/mysqladmin -uroot -p'$MYSQL_ROOT_PASS' shutdown"
for i in $(seq 1 30); do is_running mysqld || break; sleep 1; done

log "Xong buoc 03. Tiep theo: ./tlbb.sh start"
