# NetCo4: server Thiên Long Bát Bộ 3D

Server riêng cho nhóm bạn (~10 người), **chỉ cày, không nạp**. Dựng ngày 28/09/2026 từ bản public đã được rà soát và dọn dẹp.

> **Claude Code:** đọc [CLAUDE.md](CLAUDE.md) (quy tắc bắt buộc) và [docs/TRANG-THAI.md](docs/TRANG-THAI.md) (tiến độ, việc tiếp theo) trước khi làm gì.

## Bắt đầu ở máy mới (làm 1 lần)

```bash
git clone https://github.com/nguyendangkhoa150899-boop/tlbbnetco4.git
cd tlbbnetco4
git config core.autocrlf false        # BẮT BUỘC: không để git đổi xuống dòng của file game
```

Cho máy này vào được VPS:
1. `ssh-keygen -t ed25519` (Enter hết).
2. Vào **OneDash (iNET) → Terminal** của VPS, dán:
   `echo "<nội dung file ~/.ssh/id_ed25519.pub>" >> ~/.ssh/authorized_keys`
3. Thử: `ssh -p 24700 root@103.216.118.123 /opt/tlbb-deploy/tlbb.sh status`

Mở Claude Code trong thư mục repo rồi nhắn, ví dụ: *"đọc CLAUDE.md và docs/TRANG-THAI.md rồi làm tiếp"*.

## Truy cập

| | Địa chỉ | Đăng nhập |
|---|---|---|
| Game | `103.216.118.123:7384` (client đã trỏ sẵn) | tài khoản do admin tạo |
| **Panel admin** | **https://103.216.118.123:8443** | mật khẩu `PANEL_PASS` trong `/opt/tlbb-deploy/secrets.env` |
| SSH VPS | `ssh -p 24700 root@103.216.118.123` | chỉ bằng key (cổng **24700**, không phải 22) |
| Trang quản lý VPS | OneDash / iNET (Terminal, Console, nâng cấp) | tài khoản iNET của Khoa |

Mật khẩu không có trong repo (repo public). Tài khoản game `admin`: đổi bằng panel hoặc `./tao-account.sh --doi admin <mk>`.

## Panel admin

- Xem ai đang online. Tạo, đổi mật khẩu, xóa tài khoản.
- Phát **vật phẩm (theo ID) / KNB / vàng** cho 1 hoặc **tất cả** nhân vật. Nhân vật nhận khi **đăng nhập** (đang online thì thoát ra vào lại).
- Bật/tắt GM (cần restart), tìm ID vật phẩm, **Gỡ kẹt đăng nhập** (khi bị disconnect không vào lại được: chỉ khởi động lại Login, người đang chơi không bị văng), Restart server.
- Mọi thao tác ghi vào `/opt/tlbb-backup/panel.log`.

## Phát triển và deploy

```
sửa server/...  →  git commit + push  →  VPS: cd /opt/tlbb-deploy && ./cap-nhat.sh
```

- `server/`: bản sao **đúng từng byte** của các file sửa được trên server: script Lua (`Public/Data/Script`), bảng dữ liệu (`Public/Config`), cấu hình (`Server/Config`), NPC trên bản đồ (`Public/Scene/*_monster.ini`).
- `./cap-nhat.sh`: kéo code về, cho xem trước danh sách file, cảnh báo file sai bảng mã, sao lưu bản cũ, rồi **hỏi** trước khi restart. Script và cấu hình chỉ có hiệu lực sau restart.
- **Bạn bè không phải tải lại game** khi cập nhật: mọi thứ chạy phía server.
- Làm event, NPC, rơi đồ, tra ID vật phẩm: [docs/PHAT-TRIEN.md](docs/PHAT-TRIEN.md). ID vật phẩm có trong [docs/vat-pham/](docs/vat-pham/) (có Trùng Lâu, ngọc...).
- Lệnh GM trong game: [docs/lenh-gm.txt](docs/lenh-gm.txt) (ví dụ `!!createitem =ID =1`, `!!addyuanbao =99999`).

## 5 quy tắc không được phá (chi tiết ở CLAUDE.md)

1. **Chữ trong game là bảng mã VISCII/GBK, không phải UTF-8.** Không mở rồi lưu lại file game bằng editor. Chữ tiếng Việt mới thì tạo bằng `python tools/vn.py "..."`. File Lua mới viết toàn ASCII.
2. **Không giải nén hoặc chép `/home/tlbb` qua Windows rồi đưa ngược lên** (trùng tên hoa/thường, tên tiếng Trung). Repo đã loại sẵn các file đó.
3. **Không xóa** `t_guild_new`, `t_city_new`, `t_city_info` (ô tạo sẵn). **Không reset** bộ đếm GUID `t_var`.
4. **Không restart khi đang có người chơi** nếu không báo trước. Trước khi nâng cấp VPS trên iNET: `./tlbb.sh stop`. Nâng cấp xong: kiểm tra `ufw status` phải `active`.
5. **Không commit mật khẩu** (`secrets.env`, `config.env`, `LoginInfo.ini`, `ShareMemInfo.ini`).

## Lệnh trên VPS (`/opt/tlbb-deploy`)

| Lệnh | Việc |
|---|---|
| `./tlbb.sh start / stop / restart / status` | Bật, tắt an toàn, xem RAM. Có `tlbb.service` tự bật khi VPS khởi động |
| `./cap-nhat.sh` | Deploy từ GitHub |
| `./tao-account.sh <tên> <mk>` / `--doi` / `--xoa` / `--ds` | Tài khoản (người chơi không tự đăng ký được) |
| `./cap-gm.sh <tên nv>` / `--tat-ca` / `--ds` | GM (cần restart) |
| `./reset-choi-that.sh` | **Test xong, trước khi chơi thật:** xóa nhân vật và đồ, giữ tài khoản và event |
| `./sao-luu.sh` | Sao lưu DB (tự chạy 4h sáng, giữ 14 bản trong `/opt/tlbb-backup`) |
| `./lay-tu-server.sh` | Khi có ai sửa trực tiếp trên server: chép thay đổi về repo |

## Client cho bạn bè

- **`NetCo4.zip`** (2.42GB, trên máy của Khoa ở `D:\TeraBoxDownload\TLBBFULLTOOL\`). Giải nén ra 1 thư mục `NetCo4\`, mở game bằng `NetCo4.cmd`. Đã sửa sẵn: trỏ về server, chạy cửa sổ 1280x720, tắt tự cập nhật từ web cũ.
- Trong gói có `DOC-TRUOC-KHI-CHOI.txt` và `chan-link-la.ps1` (chặn link lạ của nút Nạp thẻ/Đăng ký, cần chạy 1 lần bằng quyền admin).
- **Windows Defender báo `Bin\RSSParser.dll` là Trojan và tự xóa file đó.** Người chơi phải tự thêm ngoại lệ cho thư mục `NetCo4\Bin`. Chưa xác minh được file này sạch.
- Ai có client cũ: dùng `deploy/client/CAI-DAT-FIX.cmd` + `sua-client.ps1` + `chan-link-la.ps1` (giải nén vào thư mục game rồi chạy).

## Việc tiếp theo

Xem [docs/TRANG-THAI.md](docs/TRANG-THAI.md). Tóm tắt:
- [ ] Xác nhận phát quà qua panel hoạt động trong game (đã xếp hàng Chân·Trùng Lâu cho `Bialk`, chưa đăng nhập lại để nhận)
- [ ] Tạo tài khoản cho bạn bè → test (`./cap-gm.sh --tat-ca`) → `./reset-choi-that.sh` trước khi chơi thật
- [ ] Làm event: bảng drop boss theo khu vực, vòng quay dạng menu NPC
- [ ] Chưa kiểm chứng: `reset-choi-that.sh`, `cap-gm.sh --tat-ca`, nút Gỡ kẹt khi có người đang chơi, gói `NetCo4.zip` trên máy sạch

## Cấu trúc repo

| Thư mục | Nội dung |
|---|---|
| `server/` | File game sửa được (bản sao từ VPS) |
| `deploy/` | Script dựng và vận hành VPS, `dong-bo.list` (file nào được đồng bộ), `tlbb.service` |
| `deploy/client/` | Script sửa client, chặn link, hướng dẫn cho người chơi |
| `panel/` | Panel admin (`panel.py`, `tlbb-panel.service`) |
| `docs/` | Trạng thái, hướng dẫn phát triển, kiểm toán bản public, danh mục vật phẩm, lệnh GM |
| `tools/vn.py` | Đổi tiếng Việt sang bảng mã VISCII cho script |
