#!/bin/bash
# Chep file dang chay tren server vao repo (thu muc server/) de commit len GitHub.
# Dung khi: lan dau tao repo, hoac khi co ai sua truc tiep tren server (vd qua WinSCP).
#   ./lay-tu-server.sh          chep va hien git status
#   ./lay-tu-server.sh --push   chep, commit va push luon
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root

REPO="$(cd "$DEPLOY_DIR/.." && pwd)"
mkdir -p "$REPO/server"
rsync -rlt --delete --filter="merge $DEPLOY_DIR/dong-bo.list" "$ROOT/home/tlbb/" "$REPO/server/"
git -C "$REPO" add -A server
git -C "$REPO" status --short server | head -30
n=$(git -C "$REPO" status --short server | wc -l)
log "$n file khac voi commit truoc"

if [ "${1:-}" = --push ] && [ "$n" -gt 0 ]; then
    git -C "$REPO" commit -q -m "Dong bo tu server $(date +%Y-%m-%d\ %H:%M)"
    git -C "$REPO" push
    git -C "$REPO" rev-parse HEAD > "$BACKUP_DIR/da-deploy-commit"
    log "Da push"
fi
