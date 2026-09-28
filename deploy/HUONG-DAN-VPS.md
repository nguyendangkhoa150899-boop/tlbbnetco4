# Vận hành server TLBB trên VPS

Thay thế cho `../HUONG-DAN-DUNG-SERVER.md` (bản cũ chạy máy ảo trong mạng nhà).

| Thông tin | Giá trị |
|---|---|
| VPS | `103.216.118.123`, Ubuntu 22.04, SSH cổng `24700` |
| Thư mục script | `/opt/tlbb-deploy` |
| Hệ điều hành game (Ubuntu 10.04 cũ, chạy chroot) | `/opt/tlbb-root` |
| Server game | `/opt/tlbb-root/home/tlbb` |
| Sao lưu | `/opt/tlbb-backup` |
| Mật khẩu MySQL | `/opt/tlbb-deploy/secrets.env` (chỉ root đọc) |
| Cổng mở ra ngoài | `24700` SSH, `7384` Login, `3731` Game. Mọi cổng khác bị chặn |

Mọi lệnh dưới đây chạy bằng root, trong thư mục `/opt/tlbb-deploy`.

## Hằng ngày

```bash
./tlbb.sh start      # bật (khoảng 2 phút)
./tlbb.sh status     # xem tiến trình + RAM
./tlbb.sh stop       # tắt an toàn (đợi báo "Da tat an toan")
./tlbb.sh restart
```

**Không bấm Tắt máy / Khởi động cứng trên iNET khi server đang chạy.** ShareMemory giữ dữ liệu nhân vật trong RAM và chỉ ghi xuống database khi tắt đúng cách. Luôn `./tlbb.sh stop` trước.

## Tài khoản (chỉ admin tạo)

Người chơi không tự đăng ký được (`auto_reg` đã tắt).

```bash
./tao-account.sh ban1 matkhau123        # tạo
./tao-account.sh --doi ban1 matkhaumoi  # đổi mật khẩu
./tao-account.sh --xoa ban1             # xóa
./tao-account.sh --ds                   # danh sách
```

## Cấp GM

1. Tạo tài khoản, vào game tạo nhân vật.
2. `./cap-gm.sh --ds` để xem tên nhân vật.
3. `./cap-gm.sh TenNhanVat`, rồi `./tlbb.sh restart`.

## Sao lưu

```bash
./sao-luu.sh    # sao lưu ngay, giữ 14 bản gần nhất trong /opt/tlbb-backup/hang-ngay
```
Bản gốc trước khi dọn: `/opt/tlbb-backup/db-goc-*.sql.gz`, `home-goc.tar.gz`, `mysql-var-goc.tar.gz`.

## Client cho bạn bè

1. Nén thư mục `Thien Long 3D` gửi cho bạn bè.
2. Mỗi người chạy:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\sua-client.ps1 -ClientDir "D:\...\Thien Long Gate"
   ```
   Script trỏ client về VPS, tắt tự cập nhật từ web server cũ, xóa tên đăng nhập cũ đã lưu.
3. Mở game bằng `Run.cmd`. **Không chạy `fixgame.cmd`.**

## Đã dọn gì so với bản public

- **Script**: tắt NPC phát 300.000 Điểm Tặng vô hạn, lô đề số trúng viết cứng (x70 KNB), toàn bộ Gift Code (~2.000 mã VIP đã lộ), đổi thẻ cào (thu vàng không trả gì), các handler ẩn cho vàng/KNB/tiềm năng, các quyền gắn cứng theo GUID nhân vật của server cũ. Bỏ giới hạn 3 người cùng IP ở Thủy Lao. File gốc được giữ bên cạnh với đuôi `.goc`.
- **Dữ liệu**: xóa account, nhân vật, bang, thư, bảng xếp hạng, điểm danh, log IP thật của người chơi cũ. GUID nhân vật mới bắt đầu từ `1010100000` để không trùng GUID cũ nào còn sót trong script.
- **Bảo mật**: MySQL và billing chỉ nghe `127.0.0.1`, mật khẩu mới ngẫu nhiên, xóa các user MySQL mở cho dải `192.168.1.%`, GM list để trống.

## Chưa đảm bảo được

- Không rà soát tay hết 5.800 file script. Lỗi còn sót thường chỉ gọi được bằng cách sửa gói tin gửi từ client, nên chỉ nên chơi với người quen.
- `Login`, `World`, `Server`, `ShareMemory` là binary của người share, không có source, không kiểm tra được bên trong. Chúng chạy trong chroot, và tường lửa chỉ mở 2 cổng game.
- Quà Tân Thủ (lên thẳng cấp 99) vẫn giữ. Muốn tắt thì báo Claude.
