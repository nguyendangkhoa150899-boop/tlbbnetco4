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
- [ ] **Chưa quyết (phát hiện tối 29/09):** dòng chửi "SB" trong `scene.lua` (dòng 832) chửi nhầm người tạo nhân vật mới khi đang bật cấp tối thiểu 119 — nạn nhân đầu: EmVinh (bị về cấp 0 rồi lên lại 119, mất túi tân thủ). Tắt dòng chửi? Phát bù túi tân thủ cho EmVinh? NPC "Thẻ Tài Phú" (Đại Lý, phát KNB miễn phí theo mốc cấp): giữ hay tắt?

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
