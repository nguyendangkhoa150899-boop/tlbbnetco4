#!/bin/bash
# Sao luu database khi server dang chay. Giu 14 ban gan nhat.
# Tu chay hang ngay luc 4h sang qua /etc/cron.d/tlbb-sao-luu.
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root
is_running mysqld || die "MySQL chua chay"

mkdir -p "$BACKUP_DIR/hang-ngay"
f="$BACKUP_DIR/hang-ngay/db-$(date +%Y%m%d-%H%M).sql.gz"
in_chroot "$MYSQL_BIN/mysqldump -uroot -p'$MYSQL_ROOT_PASS' --single-transaction --routines --databases tlbbdb web" | gzip > "$f"
[ -s "$f" ] || die "Sao luu that bai"
ls -1t "$BACKUP_DIR"/hang-ngay/db-*.sql.gz | tail -n +15 | xargs -r rm -f
log "Da sao luu: $f ($(du -h "$f" | cut -f1))"
