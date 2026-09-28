#!/bin/bash
# Cap quyen GM cho nhan vat. Can khoi dong lai server de co hieu luc.
#   ./cap-gm.sh <ten nhan vat> [ten nhan vat 2 ...]
#   ./cap-gm.sh --ds          xem danh sach nhan vat va GUID
#   ./cap-gm.sh --tat-ca      cap GM cho TAT CA nhan vat hien co (giai doan test)
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root
is_running mysqld || die "MySQL chua chay (./tlbb.sh start)"

GM="$ROOT/home/tlbb/Server/Config/GMList.ini"
q() { mysql_root "-N -B tlbbdb -e \"$1\""; }

if [ "${1:-}" = --ds ] || [ -z "${1:-}" ]; then
    q "SELECT charguid, accname, charname, level FROM t_char WHERE isvalid=1 ORDER BY charguid"
    exit 0
fi

guids=()
if [ "$1" = --tat-ca ]; then
    while read -r g n; do guids+=("$g"); log "$n -> GUID $g"; done \
        < <(q "SELECT charguid, charname FROM t_char WHERE isvalid=1 ORDER BY charguid")
    [ "${#guids[@]}" -gt 0 ] || die "Chua co nhan vat nao"
    set --
fi
for name in "$@"; do
    g=$(q "SELECT charguid FROM t_char WHERE charname='${name//\'/}' AND isvalid=1 LIMIT 1")
    [ -n "$g" ] || die "Khong thay nhan vat: $name (xem ./cap-gm.sh --ds)"
    guids+=("$g"); log "$name -> GUID $g"
done

cp -p "$GM" "$GM.bak"
{
    echo "[gm]"
    echo "count=${#guids[@]}"
    for i in "${!guids[@]}"; do echo "guid$i=${guids[$i]}"; done
} > "$GM"
log "Da ghi GMList.ini. Khoi dong lai: ./tlbb.sh restart"
