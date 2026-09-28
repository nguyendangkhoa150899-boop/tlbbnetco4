#!/bin/bash
# Tao tai khoan choi game (chi admin tao duoc, nguoi choi khong tu dang ky).
#   ./tao-account.sh <ten> <mat khau>      tao moi
#   ./tao-account.sh --doi <ten> <mat khau> doi mat khau
#   ./tao-account.sh --xoa <ten>            xoa tai khoan
#   ./tao-account.sh --ds                   danh sach
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root
is_running mysqld || die "MySQL chua chay (./tlbb.sh start)"

q() { mysql_root "-N -B web -e \"$1\""; }
valid_name() { [[ "$1" =~ ^[a-z0-9_]{3,20}$ ]] || die "Ten chi gom a-z 0-9 _ (3-20 ky tu): $1"; }
valid_pass() { [[ "$1" =~ ^[A-Za-z0-9_@.!-]{6,32}$ ]] || die "Mat khau 6-32 ky tu, chi gom chu, so va _@.!-"; }

case "${1:-}" in
    --ds)
        q "SELECT id, name, point, is_lock FROM account ORDER BY id" ;;
    --xoa)
        valid_name "${2:-}"
        q "DELETE FROM account WHERE name='$2'"; log "Da xoa $2" ;;
    --doi)
        valid_name "${2:-}"; valid_pass "${3:-}"
        q "UPDATE account SET password=MD5('$3') WHERE name='$2'"; log "Da doi mat khau $2" ;;
    ""|-h|--help)
        sed -n '2,7p' "$0" ;;
    *)
        valid_name "$1"; valid_pass "${2:-}"
        [ -z "$(q "SELECT id FROM account WHERE name='$1'")" ] || die "Tai khoan $1 da ton tai"
        q "INSERT INTO account (name, password) VALUES ('$1', MD5('$2'))"
        log "Da tao tai khoan: $1" ;;
esac
