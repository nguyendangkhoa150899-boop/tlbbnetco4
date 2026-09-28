#!/bin/bash
# Buoc 01: lay toan bo he dieu hanh trong Ubuntu.vmdk ra thu muc $ROOT.
# Lam tren Linux de giu nguyen ten file tieng Trung, phan biet hoa/thuong, quyen file.
set -euo pipefail
. "$(dirname "$0")/common.sh"
need_root

[ -f "$VMDK" ] || die "Khong thay $VMDK. Upload Ubuntu.vmdk len VPS truoc."
[ -e "$ROOT/home/tlbb" ] && die "$ROOT da co du lieu. Muon lam lai thi xoa: rm -rf $ROOT"

RAW="${VMDK%.vmdk}.raw"
MNT=/mnt/tlbb-vmdk
mkdir -p "$MNT" "$ROOT" "$BACKUP_DIR"

log "Chuyen vmdk sang raw (mat vai phut)"
qemu-img convert -p -O raw "$VMDK" "$RAW"

LOOP=$(losetup -Pf --show "$RAW")
cleanup() { umount "$MNT" 2>/dev/null || true; losetup -d "$LOOP" 2>/dev/null || true; }
trap cleanup EXIT
sleep 1

PART=""
for p in "${LOOP}"p*; do
    [ -b "$p" ] || continue
    if mount -o ro "$p" "$MNT" 2>/dev/null; then
        if [ -d "$MNT/home/tlbb" ]; then PART=$p; break; fi
        umount "$MNT"
    fi
done
[ -n "$PART" ] || die "Khong tim thay phan vung co /home/tlbb trong $VMDK"
log "Phan vung he thong: $PART"

log "Chep he dieu hanh vao $ROOT"
rsync -aHAX --numeric-ids "$MNT"/ "$ROOT"/

log "Luu ban goc cua /home (de doi chieu hoac quay lai)"
tar -C "$MNT" -czf "$BACKUP_DIR/home-goc.tar.gz" home
tar -C "$MNT" -czf "$BACKUP_DIR/mysql-var-goc.tar.gz" usr/local/mysql5.0.45/var

cleanup
trap - EXIT
rm -f "$RAW"

if [ ! -f "$DEPLOY_DIR/secrets.env" ]; then
    log "Sinh mat khau MySQL moi"
    gen() { tr -dc 'A-Za-z0-9' </dev/urandom | head -c 20; }
    umask 077
    cat > "$DEPLOY_DIR/secrets.env" <<EOF
# Mat khau moi. Giu kin file nay.
MYSQL_ROOT_PASS=$(gen)
DB_PASS=$(gen)
EOF
fi

log "Kiem tra chuong trinh 32-bit chay duoc tren VPS nay"
mount_chroot
if in_chroot "/bin/true"; then
    log "OK: Ubuntu 10.04 chay duoc trong chroot"
else
    umount_chroot
    die "Khong chay duoc chuong trinh 32-bit. Kernel VPS khong ho tro IA32."
fi
umount_chroot

log "Xong buoc 01. Tiep theo: ./02-don-dep.sh"
