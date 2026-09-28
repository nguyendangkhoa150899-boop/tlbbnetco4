#!/bin/bash
# Ham dung chung cho cac script trong thu muc deploy. Khong chay truc tiep.

DEPLOY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

log()  { echo -e "\033[1;32m[+]\033[0m $*"; }
warn() { echo -e "\033[1;33m[!]\033[0m $*"; }
die()  { echo -e "\033[1;31m[x]\033[0m $*" >&2; exit 1; }

[ -f "$DEPLOY_DIR/config.env" ] || die "Chua co config.env. Chay: cp config.env.example config.env && nano config.env"
# shellcheck source=/dev/null
. "$DEPLOY_DIR/config.env"
[ -f "$DEPLOY_DIR/secrets.env" ] && . "$DEPLOY_DIR/secrets.env"

MYSQL_BIN="/usr/local/mysql5.0.45/bin"

need_root() { [ "$(id -u)" = 0 ] || die "Can chay bang root (sudo -i)"; }

# Gan /proc /sys /dev vao chroot de chuong trinh cu chay duoc
mount_chroot() {
    local d
    for d in proc sys dev dev/pts; do
        mkdir -p "$ROOT/$d"
        mountpoint -q "$ROOT/$d" || mount --bind "/$d" "$ROOT/$d"
    done
}

umount_chroot() {
    local d
    for d in dev/pts dev sys proc; do
        mountpoint -q "$ROOT/$d" && umount -l "$ROOT/$d"
    done
    return 0
}

# Chay lenh trong Ubuntu 10.04 cu
in_chroot() { chroot "$ROOT" /bin/bash -c "$*"; }

# Chay lenh trong chroot, tach khoi phien SSH (logout khong bi tat)
spawn_chroot() {
    setsid chroot "$ROOT" /bin/bash -c "ulimit -n 65535; $*" </dev/null >/dev/null 2>&1 &
}

mysql_root() { in_chroot "$MYSQL_BIN/mysql -uroot -p'$MYSQL_ROOT_PASS' $*"; }

is_running() { pgrep -x "$1" >/dev/null 2>&1; }

wait_mysql() {
    local i
    for i in $(seq 1 60); do
        in_chroot "$MYSQL_BIN/mysqladmin $1 ping" >/dev/null 2>&1 && return 0
        sleep 1
    done
    return 1
}
