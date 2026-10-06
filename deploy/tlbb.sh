#!/bin/bash
# Bat / tat / xem trang thai server TLBB.
#   ./tlbb.sh start | stop | status | restart
set -uo pipefail
. "$(dirname "$0")/common.sh"
need_root

SV=/home/tlbb/Server
PROCS="mysqld billing ShareMemory Login World Server"

status() {
    local p
    for p in $PROCS; do
        if is_running "$p"; then printf '  %-12s \033[32mdang chay\033[0m\n' "$p"
        else printf '  %-12s \033[31mtat\033[0m\n' "$p"; fi
    done
    free -m | awk '/Mem:/ {printf "  RAM: dung %d / %d MB\n", $3, $2}'
}

# wait_gone <ten tien trinh> <so giay>
wait_gone() {
    local i
    for i in $(seq 1 "$2"); do is_running "$1" || return 0; sleep 1; done
    return 1
}

start() {
    is_running ShareMemory && die "Server dang chay roi (./tlbb.sh status)"
    mount_chroot

    log "MySQL"
    if ! is_running mysqld; then
        spawn_chroot "$MYSQL_BIN/mysqld_safe --user=root"
        wait_mysql "-uroot -p'$MYSQL_ROOT_PASS'" || die "MySQL khong len. Xem $ROOT/usr/local/mysql5.0.45/var/*.err"
    fi

    # Server vua bat thi chua ai online (billing chi xoa co online khi thoat dung cach)
    mysql_root "-e 'UPDATE web.account SET is_online=0'" || true

    log "Billing"
    is_running billing || spawn_chroot "cd /home && exec ./billing >>/home/billing.log 2>&1"
    sleep 2
    is_running billing || die "Billing khong chay. Xem $ROOT/home/billing.log"

    log "ShareMemory (doi 30 giay)"
    in_chroot "cd $SV && rm -f exit.cmd quitserver.cmd && ./shm clear >/dev/null 2>&1; true"
    spawn_chroot "cd $SV && exec ./ShareMemory"
    sleep 30
    is_running ShareMemory || die "ShareMemory tu tat. Xem log moi nhat trong $ROOT$SV/Log/"

    log "Login";  spawn_chroot "cd $SV && exec ./Login";  sleep 2
    log "World";  spawn_chroot "cd $SV && exec ./World";  sleep 5
    log "Server (nap ban do 1-2 phut)"; spawn_chroot "cd $SV && exec ./Server"
    sleep 60
    status
}

stop() {
    if is_running Server; then
        log "Tat Server (luu nguoi choi dang online)"
        in_chroot "touch $SV/quitserver.cmd"
        wait_gone Server 180 || { warn "Server khong tu tat sau 3 phut, ep tat"; pkill -9 -x Server; }
    fi
    for p in Login World; do
        is_running "$p" && { log "Tat $p"; pkill -x "$p"; wait_gone "$p" 20 || pkill -9 -x "$p"; }
    done
    if is_running ShareMemory; then
        log "Tat ShareMemory (dang ghi du lieu xuong database, KHONG tat VPS luc nay)"
        in_chroot "touch $SV/exit.cmd"
        if ! wait_gone ShareMemory 600; then
            die "ShareMemory chua tat sau 10 phut. KHONG kill -9 (se mat du lieu). Xem log roi bao Claude."
        fi
        log "ShareMemory da luu xong"
    fi
    is_running billing && { log "Tat Billing"; pkill -x billing; wait_gone billing 10 || pkill -9 -x billing; }
    if is_running mysqld; then
        log "Tat MySQL"
        in_chroot "$MYSQL_BIN/mysqladmin -uroot -p'$MYSQL_ROOT_PASS' shutdown" || true
        wait_gone mysqld 60 || warn "MySQL chua tat"
    fi
    umount_chroot
    log "Da tat an toan"
}

# 06/10: start/stop/restart goi TAY (SSH, Terminal OneDash, cap-nhat.sh tra loi y) -> chuyen sang systemctl, de game LUON nam
# trong tlbb.service. Su co 05/10 21:06 + 06/10 01:31: cap-nhat bam y trong Terminal OneDash -> game nam trong onedash-agent.service;
# lan 01:31 bi ngat giua chung (sau khi tat ShareMemory, truoc khi bat lai) -> game sap 7,5 tieng. systemd goi tlbb.sh voi
# INVOCATION_ID -> chay that. Ep chay truc tiep (khong khuyen): TLBB_TRUC_TIEP=1 ./tlbb.sh <lenh>
if [ -z "${INVOCATION_ID:-}" ] && [ -z "${TLBB_TRUC_TIEP:-}" ]; then
    case "${1:-}" in
        start|stop|restart)
            log "Chuyen sang: systemctl $1 tlbb (game phai nam trong tlbb.service; dong terminal giua chung cung khong sao)"
            systemctl "$1" tlbb; rc=$?
            status
            exit $rc ;;
    esac
fi

case "${1:-}" in
    start)   start ;;
    stop)    stop ;;
    restart) stop; start ;;
    status)  status ;;
    *) echo "Dung: $0 start|stop|restart|status"; exit 1 ;;
esac
