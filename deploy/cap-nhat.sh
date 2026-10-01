#!/bin/bash
# Dua code moi tu GitHub len server that.
#   ./cap-nhat.sh            keo code, xem truoc thay doi, hoi truoc khi ap dung va truoc khi restart
#   ./cap-nhat.sh -y         khong hoi (van KHONG tu restart)
#   ./cap-nhat.sh -y -r      khong hoi va restart luon (chi dung khi khong ai online)
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root

YES=0; RESTART=0
for a in "$@"; do case "$a" in -y) YES=1 ;; -r) RESTART=1 ;; *) die "Tham so la: $a" ;; esac; done
ask() { [ "$YES" = 1 ] && return 0; read -r -p "$1 [y/N] " x; [ "$x" = y ] || [ "$x" = Y ]; }

REPO="$(cd "$DEPLOY_DIR/.." && pwd)"
SRC="$REPO/server/"
DST="$ROOT/home/tlbb/"
FILTER="merge $DEPLOY_DIR/dong-bo.list"

log "Keo code moi tu GitHub"
git -C "$REPO" pull --ff-only
log "Commit: $(git -C "$REPO" log -1 --format='%h %an: %s')"

changes=$(rsync -rlt --checksum --dry-run --itemize-changes --out-format='%n' --filter="$FILTER" "$SRC" "$DST" | grep -v '/$' || true)
if [ -z "$changes" ]; then log "Server da giong repo, khong co gi de cap nhat"; exit 0; fi
log "Se thay doi $(echo "$changes" | wc -l) file:"
echo "$changes" | sed 's/^/  /' | head -50

# Canh bao file .lua/.txt/.ini luu nham UTF-8 (game dung VISCII/GBK, chu se bi loi)
bad=""
while read -r f; do
    [ -f "$SRC$f" ] || continue
    case "$f" in *.lua|*.txt|*.ini) ;; *) continue ;; esac
    if head -c3 "$SRC$f" | grep -q $'\xef\xbb\xbf'; then bad+="  $f (co BOM UTF-8)"$'\n'
    elif LC_ALL=C grep -q '[^[:print:][:space:]]' "$SRC$f" && iconv -f UTF-8 -t UTF-8 "$SRC$f" >/dev/null 2>&1 \
         && LC_ALL=C grep -qP '[\xC0-\xDF][\x80-\xBF]|[\xE0-\xEF][\x80-\xBF]{2}' "$SRC$f"; then
        bad+="  $f (co ve la UTF-8, game se hien sai chu - dung tools/vn.py)"$'\n'
    fi
done <<< "$changes"
if [ -n "$bad" ]; then warn "File co the sai bang ma:"; printf '%s' "$bad"; fi

ask "Ap dung len server?" || { warn "Da huy"; exit 1; }

stamp=$(date +%Y%m%d-%H%M%S)
bk="$BACKUP_DIR/cap-nhat-$stamp"
rsync -rlt --checksum --backup --backup-dir="$bk" --filter="$FILTER" "$SRC" "$DST"
git -C "$REPO" rev-parse HEAD > "$BACKUP_DIR/da-deploy-commit"
# 01/10: KHOA CAP admin chon tren web (panel act capmax) nam NGOAI repo -> ap lai, khong thi ConfigInfo.ini cua repo de len
CAPMAX="$DST/Server/txt/NetCo4Cfg/capmax.txt"
if [ -s "$CAPMAX" ]; then
    n=$(tr -dc 0-9 < "$CAPMAX")
    if [ -n "$n" ] && [ "$n" -ge 10 ] && [ "$n" -le 118 ]; then
        LC_ALL=C sed -i -E "s/^HumanMaxDefaultLevel=[0-9]+/HumanMaxDefaultLevel=$((n + 1))/" "$DST/Server/Config/ConfigInfo.ini"
        log "Giu khoa cap toi da $n theo panel (HumanMaxDefaultLevel=$((n + 1)))"
    fi
fi
log "Da cap nhat. Ban cu cua cac file bi thay: $bk"
log "Quay lai: rsync -a $bk/ $DST"

gone=$(git -C "$REPO" diff --name-only --diff-filter=D HEAD@{1} HEAD 2>/dev/null | grep '^server/' || true)
[ -z "$gone" ] || { warn "File bi xoa trong repo nhung VAN CON tren server (khong tu xoa):"; echo "$gone"; }

online=$(ss -Htn state established '( sport = :3731 )' | wc -l)
if [ "$RESTART" = 1 ] || { [ "$YES" = 0 ] && ask "Restart server ngay? ($online ket noi dang online)"; }; then
    "$DEPLOY_DIR/tlbb.sh" restart
else
    log "Chua restart. Script Lua/cau hinh chi co hieu luc sau: ./tlbb.sh restart"
fi
