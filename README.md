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
- [x] **Boss rớt Nguyên Bảo Phiếu** (30/09: đã sửa và kiểm chứng qua Audit log): 149 boss (139 boss phó bản/boss thế giới + 11 boss Sinh Tử Lôi Đài) rớt **1 tờ phiếu 1000** mỗi lần giết (tỉ lệ 1.0), 23 boss trong đó có thêm tờ thứ 2 từ hộp nguyên liệu 90002. Hộp phiếu theo Mvalue: 90001 (Mv 60) và 90016–90028.
- [x] **Sinh Tử Lôi Đài (Sát Tinh):** cả 11 boss (12 NPC; Tống Giang + Ngô Vĩnh cùng gọi 1 boss) rớt phiếu 1000, đã thấy trong Audit 30/09 00:5x.
- [ ] **Dọn đồ rác boss:** gỡ 54 hộp trang bị cấp thấp / công thức nấu ăn / đá Thiểm Lượng khỏi 17 boss thế giới cấp thấp (Đạo Mộ Tiểu Tặc, Hộ Bảo Thần Thú, Vương Trực, Tần Bá Chiêu, Tát Lạp Phu, Tiêu Thiên Ngũ, Mộc Dũng Bá, nhóm Xé Phong Ma…). Quái thường vẫn rớt như cũ. Test: đánh Đạo Mộ Tiểu Tặc (Bảo Tàng 1) → không còn rớt vũ khí/giáp cấp 20–30.
- [ ] **Đồ nguyên liệu rớt dễ gấp đôi:** 14 hộp 90002–90015 (BoxValue = ½ gốc). 30/09: 4 hộp có tỉ lệ > 1 (90002/90007/90009/90014) đã nâng BV lên = Mvalue lớn nhất của boss dùng nó (chưa có bằng chứng tỉ lệ > 1 chạy được). Test: đếm Hàn Băng Tinh Tiết / Chú Văn từ Tang Thổ Công.
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

**Thêm tối 29/09 (đã restart game 18:28, mọi thứ buổi chiều ĐÃ có hiệu lực):**
- [ ] **Tab 💥 Drop Boss** ở admin.netco4.click **và mod.netco4.click** (tạm mở cho mod test chung — đóng lại: chú thích `29/09 tạm MỞ` trong `bialk/BotDoMin/panel.js`). Sửa đồ rơi 4.247 boss: bấm hộp để sửa BoxValue + món, 🧬 Tách riêng cho hộp dùng chung (⚠), + hộp / × gỡ hộp. Ghi thẳng file VPS (backup `dropui-*`), **hiệu lực sau restart**; sửa xong đợt lớn phải đồng bộ về repo (đã kéo về 21h: chưa ai đổi gì). Tìm boss gõ có dấu/không dấu đều được (sửa 21h — trước đó gõ có dấu không ra, không phải thiếu boss).
- [x] **BoxValue là gì (đã chứng minh 30/09 bằng Audit log):** **xác suất rơi ≈ Mvalue của quái ÷ BoxValue của hộp** (mọi lần rơi ghi trong log đều có tỉ lệ ≤ 1.0; phiếu 1000 gốc ở BV 2200–3000 với Mv 60 ≈ 2–3%). **BoxValue = 1 làm boss KHÔNG rơi gì cả** (hỏng cả lượt rơi, đây là lý do 29/09–30/09 boss "không rớt gì hết"); dữ liệu gốc nhỏ nhất là 4 → tab Drop Boss giờ chặn BV < 4. Muốn "chắc chắn" thì đặt BoxValue = Mvalue.
- [x] Test sau restart: Võ Tòng rớt phiếu (30/09). Tên vật phẩm server hết mất chữ "ấ" (chưa soi lại).
- [ ] **Sửa ~4.170 dòng CommonItem mất chữ "ấ"** (Nhất/Thất/chất/lấy/xuất…) + danh mục + tên 23 món shop. Client vẫn hiện tên cũ (bảng trong client, không sửa được). Còn sót: GemInfo (30 chỗ), EquipBase111 (27) — chưa sửa. **30/09:** 6 hộp quà bộ trang bị trân thú còn tên Trung (`30009851–53` cấp 85, `30009951–53` cấp 95: Phi Ưng Tường Không / Mãnh Hổ Hám Sơn / Cự Hùng Hao Lộ / Côn Bằng Dị Vũ / Hùng Sư Nghịch Lân / Huyền Quy Kỳ Huyết) đã Việt hóa tên + mô tả; đó là 6 tên Trung cuối cùng trong `CommonItem.txt`. Tìm "con bang" / "sao le hap" ở panel là ra.
- [ ] **mod.netco4.click** (cổng admin thường, mật khẩu `1234567` — chủ server đặt): sửa được SHOP + Drop Boss, bị chặn GM/ví/liên kết. Nút Lưu shop có khoá phiên bản (409 nếu bảng cũ). **Cần quyết:** đổi mật khẩu dài hơn hoặc thêm khoá 5 lần sai; đóng Drop Boss cho mod sau khi test.
- [x] **Đã sửa 30/09 (chờ restart):** `scene.lua` dòng 779–833 — bỏ kiểm tra chống hack lúc đăng nhập lần đầu (cấp<100 & HP<20tr & KNB<500). Trước đây cấp tối thiểu 119 làm người tạo nhân vật mới rơi vào nhánh phạt: bị chửi "SB" trên kênh thế giới, về cấp 0, không nhận túi tân thủ (nạn nhân: EmVinh). Giờ ai cũng nhận túi tân thủ, không còn phạt. Rollback: `git checkout truoc-tinh-thong-30-09 -- server/Public/Data/Script/scene.lua`. **Còn treo:** phát bù túi tân thủ cho EmVinh? NPC "Thẻ Tài Phú" (Đại Lý, phát KNB miễn phí theo mốc cấp): giữ hay tắt?

## Nhiệm vụ boss (30/09) — trạng thái và kế hoạch test khi đủ team

**Đã xong (bước 1):** bot đọc Audit log game → web (🪪 Cá nhân → 🏹 Boss đã hạ) hiện từng lượt boss của người chơi (giờ, boss, số người tổ). Không cần restart game cho bất kỳ bước test nào dưới đây — Audit game ghi sẵn, bot đọc 10 giây/lần.

**Đã chốt với chủ server:** quà = ID vật phẩm có sẵn trong game (vd `30009951` 95 Trân Thú Sáo Lễ Hạp - Côn Bằng Dị Vũ), bấm Nhận trên web → hàng đợi quà → nhận khi đổi bản đồ · số lượt/ngày theo giới hạn vào phó bản của game (admin đặt thêm trần nếu muốn) · **tính cả tổ còn ở trong phó bản lúc boss cuối chết**, bỏ giữa chừng không tính (làm bằng hook `OnDie` script boss cuối; boss ngoài bản đồ dùng Audit).

**Cần test khi đủ team (thay vì tự đăng nhập nhiều acc — 1 người đi nhiều acc thì Audit chia đồ lệch, không thấy được cách chia cho tổ):**
1. Tổ 3–6 người, **liên kết ví ↔ nhân vật** cho từng người trước (admin → 🐉 → Liên kết), ai chưa liên kết thì lượt của họ chỉ nằm trong log chưa hiện.
2. Đi lần lượt từng phó bản định làm nhiệm vụ. Với mỗi phó bản ghi lại (nhắn Discord là đủ): **tên phó bản** · **giờ vào / giờ boss cuối chết** · **tên boss cuối theo game** · **ai trong tổ** · **ai rời giữa chừng** (cố ý cho 1 người ra sớm ở 1 phó bản để kiểm tra "bỏ cuộc không tính").
3. Danh sách phó bản nên đi: Phiêu Miểu Phong (lớn + nhỏ) · Binh Thánh / bản nhỏ · Tứ Tuyệt Trang · Thiếu Thất Sơn · Huyết Chiến Nhạn Môn Quan · Tam Thần · Sinh Tử Lôi Đài (12 NPC, chọn 1 boss) · Thông Thiên Tháp · Yến Tử Ổ · và phó bản nào khác nhóm hay chơi. Tên thư mục script tương ứng: `piaomiaofeng*`, `bingshen*`, `sijuezhuang`, `shaoshishan`/`shaoshi`, `xuezhanymg`, `New/sanshen`, `obj/shengsi`, scene `tongtianta*`.
4. Đi xong nhắn "xong phó bản" → Claude đọc `/opt/tlbb-root/home/tlbb/Server/Log/Audit_*.log` + `_bossKills` của bot, đối chiếu giờ, ra bảng **phó bản → ID boss cuối (đúng bậc cấp script gọi) → ai được tính**. Bảng đó là cấu hình cho bước 2.
5. Ghi luôn số lượt/ngày game cho phép mỗi phó bản (NPC báo "hôm nay đã đủ x lần") để đặt trần.

**Bước 2 sẽ làm sau khi có bảng trên:** hook `OnDie` boss cuối ghi file cả tổ → bot; admin đặt nhiệm vụ (phó bản, số lượt/ngày, ID quà); web nút Nhận quà; log ai nhận gì.

**Tinh Thông trang bị (30/09 trưa):** hệ custom `MyLua/jingtong/` (NPC Sào Nguyên / Mộ Bạch ở 3 thành) đang BẬT và có tác dụng thật (`ShuaXinClient.lua` đọc chuỗi `&JT` → buff 10675–10770). Nguyên liệu bị nghẽn vì server cũ tắt "Lò Ly Hỏa" → đã **mở lại** (bỏ comment `jingtongnpc.lua:34`; 5 lần chuyển vận → Ly Hỏa + 5 lần lấy đá → Toái Phiến mỗi ngày; hiệu lực sau restart) và **thêm Li Hỏa `20700063` + Tinh Kim Thạch `20700055` vào shop web** (đang TẮT, giá tạm 99.999 — đặt giá rồi tick Bán). "Phân giải trang bị" vẫn tắt. **Rollback:** tag `truoc-tinh-thong-30-09` (`git checkout truoc-tinh-thong-30-09 -- server/Public/Data/Script/MyLua/jingtong/jingtongnpc.lua` → cap-nhat → restart) hoặc `cp /opt/tlbb-backup/truoc-tinh-thong-*/jingtong/* …/MyLua/jingtong/`; snapshot toàn bộ Script: `Script-full.tgz` cùng thư mục. Chưa kiểm trong game: giao diện Lò Ly Hỏa (UI 890174) của client có mở không.

**Điểm Tặng + vàng miễn phí (30/09 chiều):** ĐT không còn nguồn nào cho người chơi và chỉ mua vật liệu ở Hồ Ca → NPC **Gia Nhập Môn Phái-Dịch** có mục "Nhận 80.000 Điểm Tặng" (không giới hạn); cùng NPC đó có mục "Nhận 2.000 vàng hôm nay" (1 lần/nhân vật/ngày, file `NetCo4Web/<GUID>.vang`). Lua có hiệu lực ngay không cần restart (kiểm chứng 30/09). Rollback: tag `truoc-diem-tang-30-09`. Chi tiết docs/TRANG-THAI.md.

**Quyết định còn treo (cần chủ server chốt):** giá 33 viên ngọc 6; hạn đổi vàng/ngày; có gắn Miên Bố/Bí Ngân cấp 6 cho Ác tặc/Ác bá/nhiệm vụ Tô Châu–Lâu Lan không (hiện chỉ boss Binh Thánh rớt); thời gian dự kiến để lên đồ cuối game (quyết số lượng nguyên liệu và giá shop); có mở ám khí (Mai Hoa Tiêu / Băng Phách Thần Châm — chưa có trong danh mục) không.

## Đã làm đêm 29–30/09 (đã restart 00:54 và ~01:30, đã kiểm chứng phần rơi đồ)

- [x] **Sửa "boss không rớt gì hết"**: nguyên nhân hộp phiếu BoxValue=1 (xem mục BoxValue ở trên). Bằng chứng: `Server/Log/Audit_*.log` dòng `ITEM_CREATED,...,Dropped by "<quái>",<ID>` — Sát Tinh rơi đều tới lúc gắn 90001, sau đó 0; 139 boss gắn 90001 từ 29/09 chưa từng rơi.
- [x] Dọn 1.603 tham chiếu hộp rơi không tồn tại (821 quái, lỗi có sẵn từ bản gốc, gây 2.160 dòng `Search DropBoxs ... Get Errors`/giờ). Không phải nguyên nhân mất rơi (quái vẫn rơi khi có lỗi này) nhưng sạch log.
- [x] **Không đụng Liên hoàn nhiệm vụ Tô Châu** (quái 1880–1899 Mvalue 0 từ gốc = không rơi theo bảng; chủ server thấy vẫn có rơi nên giữ nguyên).
- [x] Shop Tiệm Bảo Thạch (nút "Ngọc Cấp 3", shop 150): 25 ngọc cấp 4 → cấp 5, giá Điểm Tặng gốc. Panel GM: "Nâng ngọc trong túi lên cấp N", "XOA vật phẩm"; Trùng Lâu/quạt Phù Sinh/Tạo Hóa riêng cho nhân vật test (mẫu đã trả về mặc định).
- [x] Tab 💥 Drop Boss: nhật ký không mất (`/opt/tlbb-backup/dropboss-audit.jsonl`, chattr +a), nút ↩ Rollback, mục 💥 trong tab 📜 Log, chặn BoxValue < 4.
- [x] Đồ riêng cho nhân vật test (mẫu tạm → restart → phát/chế → trả mẫu về gốc): Tạo Hóa/quạt Phù Sinh 11 dòng, Chân-Trùng Lâu 15 dòng, bộ Huyễn Thế nội 9 dòng + hộ uyển 8 dòng (tư chất 250). Tẩy ám khí ép 3 dòng rồi trả về. **02:18 30/09: mọi mẫu đã về gốc**, chỉ giữ Tạo Hóa `10303447` làm chậm. Cách làm + bảng tên dòng: `docs/TRANG-THAI.md`.
- [x] Ám khí: 3 ô mở ở cấp ám khí 40/70/90, dòng và tỉ lệ ở `Server/Config/DarkSkillStudy.txt` (trọng số) + `DarkSkillList.txt` (31 loại × 16 mức), hiệu ứng `StandardImpact` 32000–32406.
- [ ] Ngọc không chồng được (engine), Võ Hồn tối đa cấp 8 theo ID (cấp 9 không làm được) — xem `docs/TRANG-THAI.md`.
- [ ] **Cân bằng KNB:** 149 boss rớt chắc phiếu 1000, boss hồi sinh 30 phút → cày boss có thể ra vài chục nghìn KNB/ngày. Nếu muốn KNB khó kiếm: đặt BoxValue = 2×Mvalue (50%) hoặc chỉ giữ cho boss phó bản.

## Ngày mở server — runbook (kiểm tra lại 30/09 12:20, trạng thái thật trên VPS)

**Đang là chế độ TEST:** cấp tối thiểu 119 · nhân vật mới cấp 99 · chat Thế Giới 0 ms · GMList 9 dòng · 10 tài khoản, 8 nhân vật (max 119) · ví mini game 5 người, **tổng ~5.000 tỉ KNB test**, 5 đã liên kết · shop 245 món đang bán · 8 file quà chờ + 3 lệnh KNB web→game chưa nhận.

**Sẽ CÓ khi mở (giữ nguyên, đã chạy):** cầu KNB game↔web qua NPC Ví Web (đã test 8 case) · đổi KNB→vàng · shop web (ngọc 6, Yếu Quyết, Tiến giai, Bí tịch…) giao qua hàng đợi quà · quà mỗi ngày · boss rớt Nguyên Bảo Phiếu 1000 (149 boss, BV = Mvalue) · dọn đồ rác boss, nguyên liệu dễ hơn · máu boss −35% · tin rác đã tắt · về thành 5 giây, chế đồ 0,5 giây · shop 150 ngọc cấp 5 giá Điểm Tặng gốc · tab GM + Drop Boss trong admin · mod.netco4.click cho bạn bè đặt giá · 🏹 Boss đã hạ trên web (nhiệm vụ boss bước 2 chưa có).

**Thứ tự làm (khoảng 30 phút, cần mình theo dõi vì `reset-choi-that.sh` chưa từng chạy thật):**
1. Báo mọi người thoát game. `./tlbb.sh stop`.
2. **Backup** (script tự dump `tlbbdb` + `web` trước khi xóa; kiểm file .sql.gz có kích thước > 0).
3. Sửa cấu hình test → thật: `MyNew/jiarumenpai.lua` `x990010_g_HHV_Mo = 19`, `x990010_g_HHV_Dong = 24` (Hậu Hoa Viên 19:00–23:59; đang 0/24 để test) · `DefaultChar.ini` `level=99` → `level=1` (không bao giờ ≥100) · `ChatConfig.txt` kênh 2: 0 → 180000 (client vẫn chờ 3 phút, sửa cho đồng bộ) · xóa `Server/txt/NetCo4Qua/*.txt` (kể cả `_capmin.txt` → cấp tối thiểu về 0) và `NetCo4Web/*.in`, `*.done`, `*.vang`, `*.vangkhoa`, `*.tanthu` (cờ nhận/ngày; 3 loại sau script reset đã xóa), `out/*` · Yến Tử Ổ: `x401040_g_SoDotCuoi` 2 → 0 nếu muốn 25 đợt gốc.
4. `./reset-choi-that.sh` (gõ RESET): xóa nhân vật, đồ, pet, bang, thành, GM list, điểm danh; **giữ tài khoản** (thêm `--ca-tai-khoan` nếu muốn xóa cả tài khoản trừ admin). KEEP: t_var, t_global, t_guild_new/t_city_* (slot), t_itemkey, t_crc32.
5. **Ví mini game:** reset toàn bộ ví về 0 (panel SUPER → 👥 → reset all), xóa `_bossKills`, `_dogDay`, giữ liên kết GUID nếu nhân vật giữ GUID (reset xóa nhân vật → GUID mới → **phải liên kết lại từ đầu**).
6. `./tlbb.sh start` → tạo 1 nhân vật thử: phải cấp 1, không bị tin "SB", không nhận quà cũ. Panel: ô cấp tối thiểu = 0.
7. Bảo mật: đổi `PANEL_PASS` (GM), `PANEL_SUPER_PASSWORD`, mật khẩu tài khoản `admin`; đổi/khóa `PANEL_PASSWORD` (mod, hiện `1234567`); **đóng Drop Boss cho mod**; tắt `tlbb-panel` (gm.netco4.click) nếu không dùng.
8. Sau khi mở: theo dõi `./tlbb.sh status` (RAM) và log `[PANEL SHOP ITEM]`, `[DROP BOSS]`, `[RÚT WEB]` tuần đầu.

**Phải quyết trước ngày mở:** dòng chửi "SB" `scene.lua:832` (tắt?) · NPC Thẻ Tài Phú (KNB miễn phí theo mốc cấp) · Túc Cầu tổ ≥3 (hạ?) + gắn phiếu Túc Cầu/Kính Hồ (40 boss chưa có) · hạn rút KNB / đổi vàng mỗi ngày · Rương Ích Kỷ trên web (tắt?) · shop 150 ngọc cấp 5 giữ hay bỏ · reset-choi-that chạy thử 1 lần trên bản sao DB trước ngày mở.

## Đã làm 30/09 (chiều–tối) — tất cả đã deploy, game đã restart 3 lần (cuối 18:xx), chi tiết từng mục ở docs/TRANG-THAI.md

**Quy tắc mới phát hiện:** file `.lua` trong `Public/Data/Script/` **có hiệu lực ngay** khi `cap-nhat.sh` (engine nạp lại theo mtime), chỉ file `.txt/.ini` cấu hình mới cần `./tlbb.sh restart`. Múi giờ chroot đã đổi sang Việt Nam (trước là +08), giờ game = giờ VN.

| Việc | Trạng thái | Rollback |
|---|---|---|
| Tinh Thông: mở lại "Lò Ly Hỏa" (`jingtongnpc.lua:34`), thêm Li Hỏa 20700063 + Tinh Kim Thạch 20700055 vào shop web (đang TẮT, giá tạm) | xong, chủ server test OK | tag `truoc-tinh-thong-30-09` |
| scene.lua: bỏ nhánh phạt chống hack lúc đăng nhập đầu (chửi "SB", về cấp 0, mất túi tân thủ) | xong | cùng tag trên |
| Điểm Tặng: NPC **Gia Nhập Môn Phái-Dịch** (Đại Lý 160,142 · Lạc Dương 199,320) "Nhận 80.000 ĐT" không giới hạn; "Nhận 2.000 vàng hôm nay" 1 lần/nhân vật/ngày (file `NetCo4Web/<GUID>.vang`); **01/10 thêm "Nhận 8.000 vàng khóa hôm nay"** (`AddMoneyJZ`, file `.vangkhoa`, giữ cho server thật) | xong, test OK (AddMoney tính bằng đồng ×10000); vàng khóa chưa test | tag `truoc-diem-tang-30-09` |
| Hậu Hoa Viên: giờ mở/đóng thành biến `x990010_g_HHV_Mo/Dong` (đang 0/24 test; **ngày open đặt 19/24**) | xong | như trên |
| Tin boss Võ Di "dẫn theo 9 thủ hạ": tắt 4 dòng ActivityNotice (810002). 3 nhóm boss khác (Thảo Nguyên, Kim Cương, Độc Cáp) vẫn báo | xong | git |
| Tin "[Giúp] Lâu Lan (219,228) Trình Giảo Thiết…": **client-side** (ccore.dat), server không tắt được | không làm được | – |
| 21 câu thông báo giết boss tiếng Trung (Viêm Ma Sơn / Tam Tài Hạp Cốc) → Việt hóa. Còn **98 câu / 32 file** tiếng Trung khác (gia nhập môn phái 12, đổi phái 9, Binh Thánh 5…) chưa dịch | một phần | git |
| Web: đăng nhập bằng **tài khoản + mật khẩu game** (panel.py act `kiem_mk`), bỏ hẳn Discord ID + PIN; đổi mật khẩu trên web = đổi cho game; admin tạo tài khoản kèm Discord ID; nút 🌐 hiện tài khoản | xong (repo bialk) | git bialk |
| Võ Hồn: Võ Hồn nâng bằng menu NetCo4 thiếu chuỗi `&WH` → vá tự ghi `&WH<số cuối ID>` (`odali_wuyazi.lua`) → đục lỗ / hợp thành chạy | xong, test OK | tag `truoc-vo-hon-30-09` |
| Võ Ý: chuyển chỗ cày sang **toàn bộ quái thường Vô Lượng Sơn** (309 spawn gắn `guaiwu_die` 999998), 3.000 con/ngày, nội tức **×4** từ 30/09 tối = (770+10×cấp)×4 (`guaiwu_die.lua`, hiệu lực ngay). Ngưng Tức Hoàn 38002067/8 (gấp đôi) không bán ở đâu | xong, test OK | tag `truoc-vo-y-30-09` |
| Pet: hàng đợi quà loại **pet** (`quatang.lua`, panel.py, tab GM 🐾 Pet) → admin phát 48 pet Huyễn Hóa ngoại hình boss (ID 25351–25582, `docs/pet-huyen-hoa.md`); 48 con này tư chất chuẩn **12000** cả 5 dòng, pet khác nguyên bản | xong, chờ chủ server test | tag `truoc-pet-5000-30-09` |
| Danh sách toàn bộ pet: `docs/pet-danh-sach.tsv` (6.320 ID) + `.md` (1.039 họ) | xong | – |

**Phát hiện cần biết:** trứng pet event **có bán trong game** 20.000 KNB (Hồ Ca → Mua Thương Phẩm → tab Trân thú, kệ 132/218/219); Võ Hồn cấp 0 + Phá Thiên Tiễn bán ở kệ 216 cùng bảng. Pet 24602 (Tuyền Linh Nhân Ngẫu, trưởng thành 1896) là pet gian của server cũ — không phát. Một lượt Phiêu Miểu Phong lúc phiếu 2.000 = 34.000 KNB (log Audit 30/09 của cuocdoibuon).

**Chưa chốt (hỏi chủ server):** dịch/tắt 98 câu tiếng Trung; tắt tin 3 nhóm boss còn lại; giá trứng pet 20.000; bán Ngưng Tức Hoàn (web hay kệ game); hệ số Võ Ý (khỉ lv1–10 → cấp 20 mất 3,4 ngày/cấp, cấp 50 mất 14 ngày/cấp); bù túi tân thủ EmVinh; mật khẩu mod `1234567` (đã lộ, chủ server nói đóng portal khi open); menu "Thăng cấp võ hồn" NetCo4 song song với hợp thành gốc.

## Đã làm 01/10 (đêm) — tất cả đã deploy, game đã restart 02:05, chi tiết từng mục ở docs/TRANG-THAI.md

| Việc | Trạng thái | Rollback |
|---|---|---|
| **Bảng rơi đồ sắp lại theo ID tăng dần** (engine tìm nhị phân): 41 boss gốc nằm cuối file (Cưu Ma Trí, Mộ Dung Phục, Tụ Hiền Trang ở PMF; Tiêu Dật Phong, Gia Luật Liên Thành ở Nhạn Môn; Tiêu Phong) **chưa bao giờ rớt gì** trên server này → giờ rớt. Cùng lỗi ở `PetAttrTable.txt` (6 pet V2) | xong, log Audit xác nhận | git `c38856e` |
| Yến Tử Ổ cấp 100+: 46 dòng rơi (bản +30000/+30001/+30002), Đoàn Diên Khánh rớt thuốc giải Bi Tô Thanh Phong + phiếu, Cưu Ma Trí + Mộ Dung Phục rớt phiếu; **rút còn 2 đợt cuối** (`x401040_g_SoDotCuoi`, 0 = gốc 25 đợt); **3 lượt/ngày** (`x401040_g_LuotNgay`, gốc 8) | xong, đã đi test | tag `truoc-yzw-5dot-30-09` |
| Gói rơi chuẩn 8 hộp cho 89 boss "chỉ có phiếu" (PMF, Nhạn Môn, Thủy Hử, Mộ Dung Phục…), boss Mv < 60 nâng lên 60; **hộp phiếu BV = Mv đúng bằng** (mỗi người 1 phiếu); hộp 90029 thuốc giải / 90030 nguyên liệu cấp 8 BV 60 chống rớt ×6 | xong | git `9cfa850`, `acb9cd8` |
| Cộng Sinh: chủ nhận 200% (thường) / 400% (cao cấp) máu pet mất (`StandardImpact` 7033/7034 cột 32, binary không có trần) | xong, chưa test | git `170d45c` |
| NPC Hồi Ức Thiên Long / Hỗ Trợ Tân Thủ: mục 8886 phát lại hộp Tân Thủ Trang Bị [10 cấp] (set 12 món + Thanh Đồng Đao, khóa), 1 lần/ngày | xong, chưa test | git |
| NPC NetCo4: "Nhận 8.000 vàng khóa hôm nay" (921), "Tông Bí Tịch xem/xếp/đổi" (922) | xong | git |
| Võ Lâm Bí Tịch: hệ thống server cũ còn nguyên (`MyLua/MiJI/`, NPC Kim Ức Phong), **mở lại menu chọn tông** (server cũ chặn bằng `if GetNumText() then return end`), nút ▲ ở tab Bí tịch khi chưa có tông cũng mở hộp chọn | xong, chưa test | tag `truoc-mo-tong-01-10` |
| Tắt tab **Quà Nạp Thẻ** (mốc N chỉ cần VIP ≥ N mà VIP do admin cấp) | xong | tag `truoc-tat-qua-nap-30-09` |
| Võ Ý: nội tức ×4 (`guaiwu_die.lua`) | xong | git |
| Sửa exp âm của bia1 (`!!addexp` tràn int32): stop game → sửa DB → start | xong | – |
| Tạm thời rồi đã hoàn: template Thần Ẩn 11 dòng (đã tẩy xong), Công Lực Đan +100.000, Trùng Lâu Ngọc 6% (chủ server giữ gốc 4/2) | đã về gốc | – |
| Docs: công thức tẩy phẩm chất ám khí (max 2199, Thiên Thối bậc 4 = 0,5%), số lượt phó bản/ngày, lịch Phượng Hoàng Cổ Thành (T4 + T7 20:00–21:15) | xong | – |

**01/10 chiều:** bộ **144 pet skin Huyễn Hóa** (12 skin × Ngoại/Nội/Cân bằng × cấp 85/95 × bản Admin 12000 / V2 tư chất gốc) — ghép pet nền vào ID Huyễn Hóa có sẵn, panel GM chọn theo nhãn "Skin cấp Kiểu". Kiểu Nội/Ngoại = `MonsterAttrExTable` cột 62 của dòng quái cùng ID pet. Chi tiết `docs/pet-huyen-hoa.md` + TRANG-THAI 01/10. Rollback tag `truoc-ghep-skin-all-01-10`.

## Bẫy dễ dính khi phát triển (đúc kết 28/09–01/10, đọc trước khi sửa file game)

1. **Bảng `.txt` dạng DBC phải sắp ID tăng dần.** Engine tra bằng tìm kiếm nhị phân (`DBCFile::Search_Posistion`): dòng nào nằm sai thứ tự là **không bao giờ được tìm thấy**, không báo lỗi (`MonsterDropBoxs`, `DropBoxContent`, `PetAttrTable`, `StandardImpact`, `EquipBase`, `CommonItem`…). Thêm dòng = chèn đúng vị trí, không append cuối file. Kiểm nhanh: node đọc file, so ID dòng sau với dòng trước. Tab Drop Boss trên web thêm hộp mới cũng phải theo quy tắc này.
2. **Rơi đồ: số món mỗi người ≈ Mvalue(quái) ÷ BoxValue(hộp).** Tỉ lệ 1 = chắc chắn 1 món; tỉ lệ 3 = 3–6 món **cho mỗi thành viên tổ đội** (mỗi người roll riêng). BoxValue = 1 làm hỏng cả lượt rơi. Nâng Mvalue của boss thì phải đổi hộp phiếu sang hộp BV = Mv tương ứng (90001 = 60, 90016–90028 = 10…3000).
3. **Lua có hiệu lực ngay khi `cap-nhat.sh`, `.txt/.ini` cần restart.** Restart chỉ bằng `systemctl restart tlbb`, kiểm `ss -Htn state established '( sport = :3731 )'` trước.
4. **Mission data (`t_char.mdata`)** là chuỗi hex, ô N = 8 ký tự ở vị trí N×8+1, int32 little-endian. Đọc: `SELECT SUBSTRING(mdata, N*8+1, 8)`. Chỉ đọc khi cần xác minh; sửa phải stop game (ShareMemory giữ RAM).
5. **`!!addexp` / mọi tham số GM là int32** (tối đa 2.147.483.647, gõ dính liền `!!createitem=…` không nhận, phải `!!createitem =ID =1 =1`). Exp tổng vượt int32 → âm → client hiện 0. Cấp tối đa = `HumanMaxDefaultLevel=119` trong `Server/Config/ConfigInfo.ini`.
6. **Chuỗi VISCII trong node**: viết escape bằng `String.raw` hoặc `String.fromCharCode(92)+"n"`; `"\244"` và `"\n"` trong heredoc đều đã ghi sai byte một lần. Luôn kiểm `git diff` + đếm byte >127 và CR trước/sau. Máy nhà không có Python: dùng `tools/viscii-map.json` từ node.
7. **Menu NPC bị "chặn ngầm"** kiểu `if GetNumText() then return end` là cách server cũ tắt tính năng — bỏ comment menu chưa đủ, phải xóa cả chốt. Biến `local` khai báo trong nhánh này không thấy được ở nhánh khác (Lua 4).
8. **Tooltip / giao diện client không sửa được** (`.axp` mã hóa): tỉ lệ 6% Trùng Lâu Ngọc, mô tả 12% Thanh Tâm, tên vật phẩm… Chỉ đổi được số thật phía server (`StandardImpact.txt` cột 29/32).
9. **Số lượt phó bản** đếm ở `OnPlayerEnter` (mỗi lần vào +1, lưu mission data); thông báo trong game có thể ghi số khác với số thật trong code (Yến Tử Ổ báo 3, code 8). Xem bảng trong docs/TRANG-THAI.md 01/10 03:10.
10. **Script phó bản tạo quái theo cấp người chơi** (`CreateNpc`: cấp 100–109 +30000, 110–119 +30001, 120+ +30002): mọi bảng theo ID quái (rơi đồ, thuộc tính) phải có đủ các bậc này, không thì cấp 119 vào không rớt gì.
11. **Binary `Server` nén UPX nhưng còn debug symbol.** Bản giải nén để tra cứu: `/root/re/Server.elf` trên VPS (`objdump -d -C`), `str.txt` trong scratchpad. Tra được hàm Lua nào tồn tại (vd `LuaFnSetDarkQualityGrade`, `LuaFnAddMoneyJZ`), công thức (tẩy ám khí, Cộng Sinh), key ini.
12. **Hàng đợi quà** (`Server/txt/NetCo4Qua/<GUID>.txt`) và cờ ngày (`NetCo4Web/*.vang|.vangkhoa|.tanthu`) là file thường: reset ngày mở phải xóa (đã đưa vào `reset-choi-that.sh`).

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
