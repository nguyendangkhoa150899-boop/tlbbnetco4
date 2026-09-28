#!/bin/bash
# Buoc 04: doi ten server cu ("Tan Than Long", link web/fanpage cu) thanh ten moi trong script va thong bao.
# Chay lai nhieu lan khong sao. Can ./tlbb.sh restart de co hieu luc.
#   ./04-doi-ten.sh            dung SERVER_NAME trong config.env (mac dinh NetCo4)
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root
export LC_ALL=C

NAME="${SERVER_NAME:-NetCo4}"
[[ "$NAME" =~ ^[A-Za-z0-9\ ._-]{2,20}$ ]] || die "Ten server chi dung chu khong dau / so (2-20 ky tu): $NAME"
T="$ROOT/home/tlbb"

# "Tan Than Long" trong bang ma cua game (khong phai UTF-8): T \xe2 n  T h \xa5 n  L/l ong
OLD_NAME=$(printf 'T\xe2n Th\xa5n [Ll]ong')
OLD_WEB='(https?://)?(www\.)?(fb|facebook)\.com/tanthanlong/?|(https?://)?(www\.)?(hoiucthienlong|tanthanlong)\.com/?'

files=$(grep -rlaE "$OLD_NAME|$OLD_WEB" "$T/Public" "$T/Server/Config" 2>/dev/null | grep -vE '\.(goc|truoc-doi-ten)$' || true)
[ -n "$files" ] || { log "Khong con ten server cu nao"; exit 0; }

stamp=$(date +%Y%m%d-%H%M%S)
mkdir -p "$BACKUP_DIR"
echo "$files" | sed "s#^$ROOT/##" | tar -C "$ROOT" -czf "$BACKUP_DIR/truoc-doi-ten-$stamp.tar.gz" -T -
log "Da sao luu $(echo "$files" | wc -l) file -> $BACKUP_DIR/truoc-doi-ten-$stamp.tar.gz"

echo "$files" | while read -r f; do
    sed -i -E -e "s#$OLD_WEB#$NAME#g" -e "s#$OLD_NAME#$NAME#g" "$f"
    echo "  ${f#$T/}"
done

left=$(grep -rlaE "$OLD_NAME|$OLD_WEB" "$T/Public" "$T/Server/Config" 2>/dev/null | grep -vE '\.(goc|truoc-doi-ten)$' || true)
[ -z "$left" ] && log "Da doi het thanh: $NAME. Khoi dong lai: ./tlbb.sh restart" || { warn "Con sot:"; echo "$left"; }
