#!/bin/bash
# Buoc 00: chuan bi VPS (Ubuntu 22.04 / 24.04, 64-bit). Chay 1 lan.
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root

[ -n "$PUBLIC_IP" ] || die "Chua dien PUBLIC_IP trong config.env"

log "Kiem tra VPS"
[ "$(uname -m)" = x86_64 ] || die "VPS phai la x86_64 (khong dung ARM)"
grep -q '^CONFIG_IA32_EMULATION=y' "/boot/config-$(uname -r)" 2>/dev/null \
    || warn "Khong xac nhan duoc kernel ho tro chuong trinh 32-bit. Neu buoc 04 bao 'Exec format error' thi VPS nay khong dung duoc."
if ! ip -4 addr | grep -qw "$PUBLIC_IP"; then
    warn "IP $PUBLIC_IP KHONG nam tren card mang cua VPS (VPS dung NAT)."
    warn "Server TLBB can IP public nam truc tiep tren card mang. Hoi nha cung cap VPS, hoac bao Claude."
    exit 1
fi
mem_mb=$(awk '/MemTotal/ {print int($2/1024)}' /proc/meminfo)
[ "$mem_mb" -ge 3500 ] || warn "RAM chi ${mem_mb}MB, khuyen nghi >= 4GB"
free_gb=$(df -BG --output=avail / | tail -1 | tr -dc 0-9)
[ "$free_gb" -ge 25 ] || warn "O dia con ${free_gb}GB trong, can khoang 25GB"

log "Cai goi can thiet"
apt-get update -qq
DEBIAN_FRONTEND=noninteractive apt-get install -y -qq qemu-utils rsync ufw util-linux procps

if ! swapon --show | grep -q .; then
    log "Tao swap 2GB (du phong khi het RAM, tranh bi kill giua chung mat du lieu)"
    fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile >/dev/null && swapon /swapfile
    grep -q '^/swapfile' /etc/fstab || echo '/swapfile none swap sw 0 0' >> /etc/fstab
    echo 'vm.swappiness = 10' > /etc/sysctl.d/61-swap.conf
fi

log "Cau hinh shared memory (ShareMemory can 1GB)"
cat > /etc/sysctl.d/60-tlbb.conf <<'EOF'
kernel.shmmax = 1024000000
kernel.shmall = 4194304
EOF
sysctl -q --system

# Cong SSH that dang dung (iNET dung 24700, khong phai 22). Mo sai cong = tu khoa minh ngoai VPS.
SSH_PORTS=$(ss -Htlnp 2>/dev/null | awk '/sshd/ {n=split($4,a,":"); print a[n]}' | sort -u)
[ -n "$SSH_PORTS" ] || die "Khong xac dinh duoc cong SSH, dung lai de tranh bi khoa ngoai VPS"
log "Tuong lua: chi mo SSH ($SSH_PORTS), Login 7384, Game 3731"
ufw default deny incoming
ufw default allow outgoing
for p in $SSH_PORTS; do ufw allow "$p/tcp" comment 'SSH'; done
ufw allow 7384/tcp comment 'TLBB Login'
ufw allow 3731/tcp comment 'TLBB Game'
ufw --force enable
ufw status verbose

log "Xong buoc 00. Tiep theo: ./01-tach-may-ao.sh"
