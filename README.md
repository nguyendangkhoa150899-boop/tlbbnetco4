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
| **Panel admin (mini game + tab 🛠️ GM Thiên Long)** | **https://admin.netco4.click** | `PANEL_SUPER_PASSWORD` trong `/opt/minigame/BotDoMin/.env` |
| Panel admin THƯỜNG (bạn bè đặt giá shop) | **https://mod.netco4.click** | `PANEL_PASSWORD` trong `.env` (29/09 chủ server đặt mật khẩu ngắn — đổi trước khi mở rộng) |
| Panel GM cũ | https://gm.netco4.click (hoặc https://103.216.118.123:8443) | `PANEL_PASS` trong `/opt/tlbb-deploy/secrets.env` — chức năng đã có trong tab GM ở admin.netco4.click, giữ tạm |
| SSH VPS | `ssh -p 24700 root@103.216.118.123` | chỉ bằng key (cổng **24700**, không phải 22) |
| Trang quản lý VPS | OneDash / iNET (Terminal, Console, nâng cấp) | tài khoản iNET của Khoa |

Mật khẩu không có trong repo (repo public). Tài khoản game `admin`: đổi bằng panel hoặc `./tao-account.sh --doi admin <mk>`.

## Panel admin

- Xem ai đang online. Tạo, đổi mật khẩu, xóa tài khoản.
- Phát **vật phẩm (theo ID) / KNB / vàng / Điểm Tặng / cấp VIP** cho 1 hoặc **tất cả** nhân vật. Nhân vật nhận khi **đăng nhập** (đang online thì thoát ra vào lại).
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

## Đã làm chiều 29/09 — CẦN TEST khi về (chưa restart game, mọi thứ có hiệu lực sau `./tlbb.sh restart`)

Chi tiết từng mục ở `docs/TRANG-THAI.md` → "Cập nhật 29/09 chiều". Tóm tắt và checklist test:

**Server game (repo này, đã deploy file lên VPS, chờ restart):**
- [ ] **Boss rớt Nguyên Bảo Phiếu 2000** (hộp `90001`, 139 boss phó bản + boss thế giới hồi sinh ≥ 30 phút). Test: đánh 1 boss Yến Tử Ổ (Cáp Đại Bá) và 1 boss thế giới (Bạch Đế / Tần Hoàng Chi Phách) → phải rớt đúng **1 tờ** phiếu 2000, không còn phiếu 1000 kèm theo. Chuột phải tờ phiếu → +2.000 KNB.
- [ ] **Sinh Tử Lôi Đài (Sát Tinh):** chỉ **Võ Tòng** (NPC số 12) rớt phiếu 2000; 11 boss kia không. 12 NPC gọi boss độc lập, không cần đánh theo thứ tự. Test: gọi Võ Tòng → rớt phiếu; gọi Tống Giang → không rớt (và con xuất hiện thật ra là Ngô Vĩnh — lỗi script có sẵn, chưa sửa).
- [ ] **Dọn đồ rác boss:** gỡ 54 hộp trang bị cấp thấp / công thức nấu ăn / đá Thiểm Lượng khỏi 17 boss thế giới cấp thấp (Đạo Mộ Tiểu Tặc, Hộ Bảo Thần Thú, Vương Trực, Tần Bá Chiêu, Tát Lạp Phu, Tiêu Thiên Ngũ, Mộc Dũng Bá, nhóm Xé Phong Ma…). Quái thường vẫn rớt như cũ. Test: đánh Đạo Mộ Tiểu Tặc (Bảo Tàng 1) → không còn rớt vũ khí/giáp cấp 20–30.
- [ ] **Đồ nguyên liệu rớt dễ gấp đôi:** 14 hộp đồ muốn (Chuế Long Thạch, Chú Văn ×3, Hàn Băng Tinh Tiết, Chí Tôn Cường Hóa Tinh Hoa, Long Hồn Ngọc, Long Văn +1, Miên Bố/Bí Ngân 8, Nữ Oa/Tụ Linh/Huyền Binh, Huyền Hạo Ngọc, Mệnh/Địa/Thiên Hồn Ngọc, Long Văn Thanh Từ Bình) được sao thành hộp `90002`–`90015` với BoxValue = ½, chỉ gắn cho boss. Test: đánh 5–10 lần Tang Thổ Công / Tiêu Dật Phong, đếm số lần rớt Hàn Băng Tinh Tiết, Chú Văn. **Chưa biết công thức rớt của server**, con số này là để so trước/sau.
- [ ] **Giảm 35% máu toàn bộ 4.247 boss** (`MonsterAttrExTable.txt` cột HP + MaxHP, công/thủ giữ nguyên). Test: so máu Cáp Đại Bá / Tiêu Dật Phong trước–sau (Tiêu Dật Phong 120 phải ~3,05 triệu thay vì 4,7 triệu). Nếu vẫn trâu, nói hệ số mới (vd 50%) — chạy lại từ file gốc, không giảm chồng.
- [ ] **Tắt tin hệ thống rác:** 4 tin đăng nhập (`NotifyOnline.txt`), quảng cáo Hồi Ức Thiên Long / nạp thẻ Zing / mẹo cấp 30–45 (`yannan.lua`), tin lỗi font khu ZBS, Hoa Sơn, Tống Liêu, Kính Hồ, bảo vệ bang, thi Hương (42 lệnh, gắn `--[don-dep]`). Giữ: lần đăng nhập trước + IP, chúc sinh nhật, thông báo boss xuất hiện, "chúc mừng người chơi X". Test: vào game 30 phút, không còn tin quảng cáo ở phút 15/19/25…; sự kiện vẫn chạy nhưng không báo.
- [ ] **Chat Thế Giới vẫn bị chờ 3 phút:** đó là **client** (`Bin/OgreMain.dll` mã hóa), server đã để 0 giây. Không sửa được từ server. Giải pháp: kênh Loa, bang chung, Discord.

**Mini game / admin (repo `bialk`, đã chạy trên VPS):**
- [ ] Tab **🛠️ GM Thiên Long** trong admin.netco4.click (không cần đăng nhập gm.netco4.click nữa). Test: tạo tài khoản, phát 1 món, cấp/tắt GM.
- [ ] **Shop Item** mở lại, giao qua hàng đợi quà (không cần online): 33 ngọc cấp 6 (đang **TẮT**, giá tạm 99.999 → phải đặt giá rồi tick Bán), 60 Yếu Quyết môn phái (đang bán: thường 60.000, tiến cấp 120.000). Nhóm 🔥 Hàng giới hạn / 💎 Ngọc 6 có hạn riêng mỗi người/ngày. Test: mua 1 món → đổi bản đồ → vào túi; mua lần 2 vượt hạn → bị chặn.
- [ ] **Quà mỗi ngày** (tab 🎁 Quà tặng) mở lại. Test: thêm 1 quà, nhận trên web, đổi bản đồ.
- [ ] **Đổi KNB → Vàng không khóa** (thẻ riêng trên web, 1:1, hạn riêng đặt ở panel, tạm 30.000/ngày). Test: đổi 1.000 → đổi bản đồ → nhận đúng **1.000 vàng** (không phải 1.000 đồng hay 10 triệu). Chiều vàng → web CHƯA làm.
- [ ] 30 icon ngọc `assets/itemimage/ngoc_<hàng>_<cột>.png` (cắt từ ảnh bảng ngọc), chưa gắn vào món nào — không biết viên nào là ngọc gì.
- [ ] Cầu KNB game ↔ web: **đã test 8 case OK** (29/09). Thẻ "Chuyển KNB từ game ra web" trên web đã ẩn, chỉ dùng NPC Ví Web.

**Quyết định còn treo (cần chủ server chốt):** giá 33 viên ngọc 6; hạn đổi vàng/ngày; có gắn Miên Bố/Bí Ngân cấp 6 cho Ác tặc/Ác bá/nhiệm vụ Tô Châu–Lâu Lan không (hiện chỉ boss Binh Thánh rớt); thời gian dự kiến để lên đồ cuối game (quyết số lượng nguyên liệu và giá shop); có mở ám khí (Mai Hoa Tiêu / Băng Phách Thần Châm — chưa có trong danh mục) không.

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
