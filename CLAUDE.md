# NetCo4: server Thiên Long Bát Bộ 3D (private, ~10 người chơi)

Đọc hết file này trước khi sửa bất cứ thứ gì. Các quy tắc ở đây có từ những lỗi đã gặp thật.
**Tiến độ, việc tiếp theo, những gì chưa kiểm chứng: `docs/TRANG-THAI.md`.** Cập nhật file đó mỗi khi xong một việc.

## Hệ thống (dựng 28/09/2026)

| | |
|---|---|
| VPS | `103.216.118.123`, iNET, Ubuntu 22.04, 4GB RAM + 2GB swap |
| SSH | `ssh -p 24700 root@103.216.118.123`. **Cổng 24700, không phải 22.** Chỉ đăng nhập bằng key |
| Server game | Ubuntu 10.04 32-bit (lấy nguyên từ máy ảo gốc) chạy **chroot** tại `/opt/tlbb-root` |
| Thư mục game | `/opt/tlbb-root/home/tlbb` (`Public/` = dữ liệu + script, `Server/` = binary + cấu hình) |
| Repo trên VPS | `/opt/tlbb-repo` (git clone của repo này). `/opt/tlbb-deploy` → symlink tới `/opt/tlbb-repo/deploy` |
| Sao lưu | `/opt/tlbb-backup` (DB gốc, DB hằng ngày lúc 4h, bản trước mỗi lần cập nhật) |
| Cổng mở | `24700` SSH, `7384` Login, `3731` Game. Còn lại bị ufw chặn. MySQL và billing chỉ nghe `127.0.0.1` |
| Tiến trình | `mysqld` (5.0.45), `billing` (liuguangw/billing_go, `/home/config.json`), `ShareMemory`, `Login`, `World`, `Server` |
| Client | phiên bản `1005`. `Patch/LoginServer.txt` trỏ `103.216.118.123:7384`, tên server `NetCo4` |

Binary `Login`/`World`/`Server`/`ShareMemory` **không có source** (bản leak). Chỉ sửa được script Lua và bảng dữ liệu.

## Quy trình phát triển

```
Máy nhà: sửa server/...  →  git commit + push  →  VPS: cd /opt/tlbb-deploy && ./cap-nhat.sh
```

- `server/` trong repo = bản sao đúng từng byte của các file sửa được trên VPS (danh sách ở `deploy/dong-bo.list`).
- `./cap-nhat.sh`: `git pull`, hiện trước danh sách file sẽ đổi, cảnh báo file lưu nhầm UTF-8, sao lưu bản cũ, chép lên server, rồi **hỏi** trước khi restart. Script Lua và cấu hình chỉ có hiệu lực sau `./tlbb.sh restart`.
- Ai đó sửa trực tiếp trên VPS thì chạy `./lay-tu-server.sh --push` để đưa thay đổi về repo, nếu không lần `cap-nhat` sau sẽ ghi đè.
- **Không tự động deploy khi push.** Restart sẽ đá người đang chơi. Trước khi restart, hỏi người dùng hoặc kiểm tra: `ss -tn state established '( sport = :3731 )'`.
- Lần đầu clone trên Windows: `git config core.autocrlf false`. `.gitattributes` đã giữ nguyên byte cho `server/**`.
- GitHub: `https://github.com/nguyendangkhoa150899-boop/tlbbnetco4` (đang **public**). VPS kéo code qua HTTPS nên không cần key. Nếu chuyển repo sang private, VPS cần deploy key: `/root/.ssh/github_deploy.pub` (đã tạo sẵn, thêm vào repo → Settings → Deploy keys, tích write), rồi `git -C /opt/tlbb-repo remote set-url origin git@github.com:nguyendangkhoa150899-boop/tlbbnetco4.git`.
- VPS **chưa push được** lên GitHub (chưa có deploy key), nên `./lay-tu-server.sh --push` sẽ lỗi. Tạm thời: chạy `./lay-tu-server.sh` rồi commit trên VPS, sau đó trên máy nhà `git pull ssh://root@103.216.118.123:24700/opt/tlbb-repo main` và push lên GitHub.

## Quy tắc bắt buộc

### 1. Bảng mã: KHÔNG phải UTF-8
- Chữ tiếng Việt trong `.lua`, `CommonItem.txt`, `GemInfo.txt`, `*_monster.ini`... là **VISCII** (ví dụ `ạ`=0xD5, `đ`=0xF0, `ế`=0xAA). Chú thích tiếng Trung là **GBK**. Một file thường lẫn cả hai.
- **Không mở rồi lưu lại cả file bằng editor hay bằng công cụ Edit.** Công cụ sẽ đọc thành UTF-8 và làm hỏng mọi byte không phải ASCII. Chỉ sửa kiểu thay chuỗi ASCII ở mức byte (sed/python `rb`), sau đó kiểm tra `git diff` xem chỉ đúng các dòng cần đổi bị thay đổi.
- **Chữ tiếng Việt mới: dùng `python tools/vn.py "Chào mừng"`.** Công cụ trả về chuỗi Lua toàn ASCII kiểu `"Ch\224o m\215ng"` (escape thập phân, Lua 4 hỗ trợ). File Lua mới nên viết **100% ASCII**.
- Đọc chữ trong game: `python tools/vn.py --giai "<chuỗi>"`, hoặc trên VPS dùng `iconv -f VISCII -t UTF-8`.
- `cap-nhat.sh` cảnh báo khi thấy file có BOM hoặc có dấu hiệu UTF-8.

### 2. Tên file
Windows không phân biệt hoa/thường. Trên server có `Script/new` và `Script/New`, `ZhenYuaneventOpen.lua` và `ZhenYuaneventOPEN.lua`, cùng các file tên tiếng Trung. Những file đó **cố ý không có trong repo** (xem `dong-bo.list`). Không tạo file hay thư mục mới trùng tên khác hoa/thường với cái đã có. Không giải nén hoặc copy cây `/home/tlbb` qua Windows rồi đưa ngược lên (đã làm hỏng 36 file).

### 3. Database
- `t_guild_new` (1024 ô), `t_city_new` và `t_city_info` (255 ô) là **ô tạo sẵn**. **Không bao giờ `DELETE`**, chỉ trả ô đã dùng về trạng thái trống (xem `reset-choi-that.sh`).
- GUID nhân vật lấy từ `t_var.maxcharguid` (procedure `fetch_guid`). Hiện bắt đầu từ `1010100000`, cố ý cao hơn mọi GUID của server cũ. **Không reset bộ đếm này.**
- Mật khẩu MySQL: `deploy/secrets.env` trên VPS (không có trong git). Truy vấn: `. deploy/common.sh; mysql_root "tlbbdb -e 'SELECT ...'"`.
- ShareMemory giữ dữ liệu nhân vật trong RAM. **Luôn `./tlbb.sh stop` trước khi sửa DB, reboot hay tắt VPS.**

### 4. Bí mật
Repo có thể là public. Không commit `secrets.env`, `config.env`, `LoginInfo.ini`, `ShareMemInfo.ini` (chứa mật khẩu MySQL), mật khẩu tài khoản game, private key. Kiểm tra trước khi push.

## Script chạy trên VPS (`/opt/tlbb-deploy`)

| Lệnh | Việc |
|---|---|
| `./tlbb.sh start / stop / restart / status` | Bật, tắt an toàn, xem RAM |
| `./cap-nhat.sh` | Deploy từ GitHub |
| `./lay-tu-server.sh [--push]` | Đưa thay đổi trên server về repo |
| `./tao-account.sh <tên> <mk>` / `--doi` / `--xoa` / `--ds` | Tài khoản (người chơi không tự đăng ký được, `auto_reg=false`) |
| `./cap-gm.sh <tên nv>` / `--tat-ca` / `--ds` | GM (ghi `GMList.ini`, cần restart) |
| `./reset-choi-that.sh [--ca-tai-khoan]` | Xóa sạch dữ liệu chơi thử, bắt đầu chơi thật |
| `./sao-luu.sh` | Sao lưu DB (cron 4h sáng, giữ 14 bản) |
| Panel web | https://103.216.118.123:8443 (mật khẩu `PANEL_PASS` trong secrets.env): tài khoản, online, phát quà, GM, restart |
| `./04-doi-ten.sh` | Đổi tên server cũ thành `SERVER_NAME` |
| `00`..`03-*.sh` | Dựng từ đầu từ `Ubuntu.vmdk` (đã chạy xong, xem `deploy/HUONG-DAN-VPS.md`) |

## Làm nội dung mới (event, drop, NPC)

Xem `docs/PHAT-TRIEN.md`: cách đăng ký script, đặt NPC, bảng rơi đồ, tra ID vật phẩm (`docs/vat-pham/`), dialect Lua 4, và những gì **không làm được** (giao diện, vật phẩm mới hoàn toàn).

## Đã vá so với bản public (đừng hoàn tác)

Xem `docs/KIEM-TOAN.md`. Tóm tắt: tắt NPC phát Điểm Tặng/vàng/KNB vô hạn, lô đề số trúng viết cứng, Gift Code (mã VIP đã lộ), đổi thẻ cào, các handler ẩn, quyền gắn cứng theo GUID của server cũ, giới hạn cùng IP ở Thủy Lao. Dòng vá có chú thích `-- [don-dep]`.
