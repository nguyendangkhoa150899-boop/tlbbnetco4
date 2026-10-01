# Mở server chính thức NetCo4 — tổng kết và quy trình

Viết 01/10/2026, rà lại lần 2 cùng ngày (đối chiếu từng commit, so file trên VPS với repo, đọc lại README/TRANG-THAI). **Chưa chạy.** Server vẫn chạy chế độ test. Ngày mở thì làm đúng mục 3, theo thứ tự.

Nguồn: 201 commit repo game (`tlbbnetco4`) và 45 commit repo bot (`bialk`) từ 27/09. Tab Drop Boss sửa trên VPS 3 lần (29/09, 2 lượt đồng bộ `1d6cacc` `9a6b9de`). Kiểm 01/10 17:00: file game trên VPS **giống repo cả hai chiều** (kể cả `Script/new/` không đổi), 9 file `.js` của bot trên VPS **giống git**.

---

## 1. Đã làm, GIỮ cho server chính

### 1.1 Boss và rơi đồ
| Việc | Chi tiết | Commit |
|---|---|---|
| **Máu boss −35%** (ngày mở: **−20%**, mục 2) | 4.247 dòng boss (`MonsterAttrExTable` cột 14 = 1, đếm cột từ 0): HP cột 19 và MaxHP cột 59 (2.922 dòng có giá trị) nhân 0,65. Công và thủ giữ nguyên. | `da6cce6` |
| Boss rơi Nguyên Bảo Phiếu 1000 | 139 boss phó bản và thế giới, hộp `90001` (BV 60 = Mv, 1 phiếu `39910001`) → **1 phiếu mỗi thành viên tổ đội**. 23 boss có thêm hộp `90002` (Hàn Băng Tinh Tiết + 1 phiếu) → 2 phiếu. | `c817818` `86466a5` `e3137fb` `9cfa850` |
| Sinh Tử Lôi Đài | 12 NPC gọi **11 boss** Sát Tinh cấp 120 (Tống Giang và Ngô Vĩnh cùng gọi 13456, lỗi gốc), rơi phiếu. | `17ea78b` `9a38401` |
| Dọn hộp rơi boss | Gỡ 54 hộp rác. 14 hộp nguyên liệu riêng cho boss (`90002`–`90015`): Hàn Băng Tinh Tiết, Chí Tôn Cường Hóa, Long Hồn Ngọc, Chú Văn, Long Văn +1, Miên Bố/Bí Ngân 8, Thần Binh Phù, Huyền Hạo Ngọc, Chuế Long Thạch, Hồn Ngọc… | `d17a313` |
| Gói rơi chuẩn | 89 boss trước chỉ có phiếu: thêm 8 hộp. Nâng Mv < 60 lên 60. | `3efdf91` |
| Chống lạm phát | Nguyên liệu cấp 8 (`90030`, BV 60, 92 dòng boss) và thuốc giải (`90029`, chỉ 3 dòng Đoàn Diên Khánh 39320–39322): 1 món mỗi người. | `acb9cd8` |
| Sửa lỗi gốc | Bảng rơi sai thứ tự ID làm **boss PMF và Nhạn Môn chưa bao giờ rơi**: đã sắp lại. Dọn 1.603 tham chiếu tới hộp không tồn tại. Tab Drop Boss chặn BoxValue < 4 (BV 1 làm hỏng cả lượt rơi). | `c38856e` `7d968d2` `a2aa44d` |
| Yến Tử Ổ cấp 100+ | 46 dòng rơi mới (trước đó 110+ không rơi gì). Đoàn Diên Khánh chắc chắn rơi phiếu + thuốc giải. Cửu Ma Trí, Mộ Dung Phục rơi phiếu. | `09fb6d0` `72a1335` `ec8a42f` |
| Drop Boss qua web | Lý Thu Thủy 9546 thêm hộp `90002`; sửa hộp `308`. | `9a6b9de` `1d6cacc` |
| Rơi theo map (`NetCo4/roimap.lua`) | Hạn Huyết Lĩnh: Kim Tàm Ti `20310166` **30%**. Hậu Hoa Viên: Chí Tôn Cường Hóa `38000571` 30%. Mỗi người roll riêng. | `d7678c8` |
| Q Tô Châu, Q Lâu Lan | Mọi quái phó bản rơi Cửu Thiên Ngọc Toái `20800034` **40%** + Miên Bố 6 / Bí Ngân 6 **10%** bốc 1 (01/10 tối). Q Lâu Lan vốn không khóa (chỉ ẩn khi đang cầm liên hoàn 1256–1269), Việt hóa 51 câu. | `0e04927` `253c796` |
| Võ Ý | Mọi quái thường Vô Lượng Sơn (**309** spawn) cộng Võ Ý, nội tức x4. | `f04343f` `8b0c532` `a4b5469` |

**Cân bằng KNB cần theo dõi tuần đầu:** 158 boss rơi phiếu chắc chắn cho **từng** thành viên, nhiều boss hồi 30 phút → có thể hàng chục nghìn KNB/ngày. Các cặp BV < Mv gốc giữ nguyên: Kính Hồ ×5, Túc Cầu ×4, Đế Thích Thiên 15445 ngọc 5 ×10.

### 1.2 Pet
| Việc | Chi tiết | Commit |
|---|---|---|
| 180 pet Huyễn Hóa (12 skin boss) | **Admin** 72 (cấp mang 85/95, 12000 đều). **V2** 72 (85/95, dòng chính 8000, còn lại 4000). **Tân Thủ** 36 (cấp mang 5, 4000/2000). Dòng chính: Ngoại = Cường lực, Nội = Nội lực, Cân bằng = Thể lực. `docs/pet-skin.tsv`, `docs/pet-huyen-hoa.md`. | `fd9e548` `fbf83c3` |
| Tư chất cố định | Ruler 2 (SuperRMB) hệ số 1.000, trưởng thành bậc 5. Quà admin dùng ruler 2 cho 180 ID. Hoàn Đồng 4834/4907/4908 từ chối pet Huyễn Hóa. | `5edd361` |
| Không có đường mua | Quét shop web, ShopTable, script, 22.994 spawn: chỉ admin phát hoặc thẻ Chọn Pet Boss. | — |
| Panel đọc skin + tư chất | `/api/pets` trả `skins` cho thẻ Chọn Pet Boss; ô chọn pet hiện kiểu tấn công. | `f0b1cd4` `7d59964` |
| Cộng Sinh 7033/7034 | Chủ nhân nhận 200% / 400% máu pet mất. | `170d45c` |
| **Rác còn lại** | 54 pet V2 cũ `31001–31582` (bản 30/09, không còn trong panel) vẫn nằm trong `PetAttrTable`; 18 ID trùng ID quái phó bản. Không hại nếu không ai phát, nên **xóa ngày mở** (cần restart, cùng lần restart mở). | `2030dd6` |

### 1.3 Vật phẩm, trang bị, kỹ năng
- Điêu Văn: sửa tên ngược Cường Lực ↔ Nội Lực (30110021–40, 30120002/03) (`2aa70ef`).
- Trùng Lâu Đới 10553106: dòng Phá Quân 15 giây → 5 giây (`9649d6b`).
- Thanh Tâm Phổ Thiện Chú chỉ admin phát (`d4a9591`). 422 = Thanh Tâm, 424 = Xuân Hoa khớp client (`20eef59`).
- Tạo Hóa 10303447: hiệu ứng làm chậm (`98c63e7`).
- Chồng 250: Nhuận Hồn Thạch (36 bản), Hợp Thành Phù (`82384c3`).
- Chế đồ niệm 0,5 giây (`2bf5688`). Về thành và bùa Hồi Thành hồi chiêu 5 giây, niệm như gốc (`b8592cc`).
- Shop 150 bán ngọc cấp 5 bằng Điểm Tặng, giá gốc (`fc8516f` `d8c682d`).
- Việt hóa 15.661 tên trang bị, 6 hộp quà trân thú, sửa chữ "ấ/ợ" trong CommonItem (`11251be` `aeff4e2` `0c4a307`); "Trọng Lâu" → "Trùng Lâu" (`5768f95`). Chữ "ấ" trong `GemInfo` (30 dòng) và `EquipBase111` (27 dòng) **chưa sửa**.
- **Sót từ test:** `GemInfo.txt` dòng `50412007` cột 6 vẫn = **6** (360 ngọc khác = 1), do `957307e` chỉ revert `23c8b11`. **Trả về 1 ngày mở.**

### 1.4 NPC, nhiệm vụ, tính năng
- **NPC NetCo4 (990010):** 2.000 vàng không khóa + **8.000 vàng khóa** mỗi ngày (`2b40dcb` `170d45c`). 80.000 Điểm Tặng (`acfbbfa`) **TẮT khi mở**. Mục Tổng Bí Tịch (`8b5b597`).
- NPC tân thủ 8886: hộp Tân Thủ Trang Bị 1 lần/ngày → **1 lần duy nhất** khi mở (`170d45c`).
- Yến Tử Ổ: 3 lượt/ngày, chỉ 2 đợt cuối (`93c15e2` `8c9bd58`). Hệ quả: **mất boss Diêu Bá Đương và Tư Mã Lâm** cùng đồ rơi của họ.
- Hậu Hoa Viên: giờ mở là biến, **khi mở đặt 19:00–23:59** (`5d20e69`).
- Mở lại: Lò Ly Hoa (`29cca96`), Võ Hồn nâng cấp qua menu NetCo4 chạy song song hợp thành gốc, tối đa cấp 8 (`63176d9`), Bí Tịch xếp tông (`e156587` `0a7cf71`), Điểm danh 070053, vòng quay server chọn món (`399492f`).
- **NPC Ví Web (999999):** KNB game ↔ web, web → game tối đa 30.000/ngày, nhận được vàng không khóa (`92a147b`, bot `e879fac`).
- Dọn: tin hệ thống rác, quảng cáo server cũ (`65441b8` `e8ff862`), tin boss Võ Di (`62ca47b`), tab Quà Nạp Thẻ (`f5df91d`), cửa sổ Nạp lần đầu (`5356575`), Việt hóa 21 tin boss (`7b59bd9`).
- Bảo mật: vá XieziQuickly 9997/9998 (`399492f`); bỏ nhánh "chống hack" đăng nhập đầu (`70c3d76`).
- Phân giải trang bị vẫn tắt.

### 1.5 Hạ tầng, công cụ admin
- VPS: chroot múi giờ **Asia/Ho_Chi_Minh** (đổi 30/09, mọi lịch theo giờ VN). `tlbb.service` tự bật, tắt an toàn. Sao lưu MySQL **4h sáng mỗi ngày** (`/etc/cron.d/tlbb-sao-luu` → `/opt/tlbb-backup/hang-ngay/`, đã kiểm có bản 29/09–01/10). **`database.json` của bot chưa có sao lưu định kỳ.**
- **Panel GM** (`gm.netco4.click`, `panel/panel.py`, HTTPS :8443 **mở ra internet**, bắt đăng nhập): tài khoản, online, phát quà (vật phẩm, KNB tới 10 triệu, vàng, Điểm Tặng, cấp, VIP, popup, pet theo nhóm, xóa vật phẩm, nâng ngọc), GM, restart, gỡ kẹt, cấp tối thiểu, **khóa cấp tối đa** (`capmax`, `8b1316e` `9a1a36b`).
- **Web admin** (`admin.netco4.click`, cổng SUPER): tab GM nhúng mọi chức năng trên, Drop Boss (nhật ký + Rollback), Shop web, Chọn Pet Boss, công tắc chức năng.
- **mod.netco4.click** (admin thường, mật khẩu `1234567`): sửa được shop (giá/nhóm/hạn/hình, khóa phiên bản 409) và **đang tạm mở Drop Boss** (`29/09 tạm MỞ` trong `panel.js`).
- `cap-nhat.sh`: rsync `--checksum` từ repo lên server, sao lưu file bị thay, áp lại `capmax.txt`.
- Client: gói `NetCo4.zip` (cửa sổ 1280×720, `chan-link-la.ps1` chặn tên miền server cũ, `NetCo4-Fix`). Defender gắn cờ `CElistTl.dll`, `fmod12288.dll`, `RSSParser.dll` → người chơi mới cần loại trừ.

### 1.6 Web người chơi (bot `bialk`)
- Chuyển từ Palworld sang Thiên Long: Dogcoin → KNB 1:1, gỡ dữ liệu Palworld, tắt "Nghiện" (KNB miễn phí mỗi giờ) (`f7df575` `869693c` `ec6e285`).
- Đăng nhập bằng tài khoản game, đổi mật khẩu game (`c3295e6` `b7d4bfc`).
- Shop Item giao vào game qua hàng đợi (`5ed5283`): **257 món**, hạn ngày 99/server. Đang bật: Điêu Văn 12 món cấp 1 giá 50.000, Yếu Quyết 60k/120k. Đang tắt: Li Hỏa `20700063`, Tinh Kim Thạch `20700055`, 33 ngọc cấp 6 (giá tạm 99.999).
- Rương Ích Kỷ. Quà mỗi ngày. Thẻ Đổi KNB → vàng, hạn riêng 30.000/ngày (`bd9b180`).
- **Chọn Pet Boss** (`2d369b9`): thẻ trong nhóm ⭐. Mỗi ví 1 con. **Đã cấu hình xong hình 12 skin, đang tắt.**
- Tài Xỉu 4 cửa, Đỏ Mìn RTP (`f6e494c`), Roulette không phí (`d608638`), "Boss đã hạ" từ Audit log (`f6ca30f`).

### 1.7 Đã thử rồi TRẢ VỀ gốc
Mẫu tạm 11–15 dòng: Tạo Hóa, Trùng Lâu Liên/Giới/Ngọc, quạt Phù Sinh, Phệ Lân Quan/Lý/Huyền Thủ + Huyền Vũ Thánh Oản, bộ Huyễn Thế, Thần Khí; ám khí; Công Lực Đan +100.000; Chân Trùng Lâu Ngọc tỉ lệ 6; Mvalue liên hoàn Tô Châu; đổi ngoại hình pet Tần Vương; bản pet Tân Thủ lần 1. Ngọc chồng được: trả về **trừ 1 dòng sót** (mục 1.3). Đồ đã phát cho bia1 lúc test giữ nguyên dòng.

---

## 2. Quyết định đã chốt cho ngày mở

| Mục | Chốt |
|---|---|
| Giữ lại | **Duy nhất** tài khoản `bialk1` + nhân vật **1010100008 (bia1)**, giữ nguyên tất cả: cấp 119, KNB, đồ, GM. |
| Xóa | Mọi tài khoản/nhân vật khác (hiện 9 GM test trong `GMList.ini`), bang, thành, thư, xếp hạng, điểm danh, hàng đợi quà. |
| Ví web bot | Xóa 4 ví kia (HoangFour, silycnzx1, Anh Vinh Q, Hân Z, mỗi ví ~50 triệu KNB test) bằng nút Xóa ví trên panel (`deletePlayer`), **giữ ví BiaLK** `456136500011335698`. Giữ nguyên mọi khóa cấu hình `_*` (shop 257 món, công tắc, Pet Boss…); xóa `_bossKills`, `_dogDay`, `_webSessions`. |
| Cấp khởi đầu | **1**. `DefaultChar.ini` dòng 9 `level=99` → `1`. Xóa `_capmin.txt`. |
| Khóa cấp | **89** (tab GM web, Lưu + Restart). Admin mở dần. |
| Exp | **x10**: `ConfigInfo.ini` `ExpParam=14.0` → `10.0`. |
| Máu boss | **80% máu gốc** (giảm 20%). Gốc = `git show da6cce6^:…MonsterAttrExTable.txt`. **Chỉ vá cột 19 và 59 (đếm từ 0) của file HIỆN TẠI**, không chép lại cả file (sau `da6cce6` còn 176 dòng pet skin đã sửa). Đã đối chiếu: 4.247 dòng boss hiện = gốc × 0,65. |
| 80.000 Điểm Tặng | **Tắt hẳn.** |
| 2.000 vàng + 8.000 vàng khóa/ngày | **Giữ.** |
| Hộp Tân Thủ Trang Bị | **1 lần duy nhất** mỗi nhân vật. |
| Yến Tử Ổ | Giữ 2 đợt cuối, 3 lượt/ngày. |
| Kim Tàm Ti | Giữ 30%. |
| Hậu Hoa Viên | **19:00–23:59** (`jiarumenpai.lua` `x990010_g_HHV_Mo = 19`, `Dong = 24`). |
| Chat Thế giới | **180000 ms** (`ChatConfig.txt` kênh 2, cột 4). |
| Thẻ Chọn Pet Boss | **Bật**, bản Tân Thủ, miễn phí. |
| Dọn sót test | `GemInfo` 50412007 cột 6 → 1. Xóa 54 pet `31001–31582`. |
| Điểm môn phái âm | Người dùng: lỗi cũ tự hết, bỏ qua. (Nguồn chưa tìm ra; nếu âm mà vẫn mua được thì là lỗ hổng.) |

### 2b. Chốt thêm 01/10 tối (14 điểm từ README)

| # | Điểm | Chốt |
|---|---|---|
| 1 | Bảo mật | **Bỏ cổng mod** (mod.netco4.click, mật khẩu `1234567`): tắt cổng admin thường, Drop Boss cho mod theo đó cũng đóng. **Giữ SUPER** (admin.netco4.click). Vẫn đổi `PANEL_PASS`, `PANEL_SUPER_PASSWORD`, mật khẩu `admin` ngày mở. |
| 2 | NPC Thẻ Tài Phú (`odali_youxituiguang.lua` 002084) | KNB theo mốc cấp, mỗi mốc 1 lần/nhân vật: 10 → 100, 30 → 500, 50 → **6.000** (thông báo ghi 1.000, lỗi gốc), 70 → 5.000, 90 → 10.000, 100 → 50.000, 110 → 100.000, 149 → 400.000 (không tới được). Tổng gốc tới 110 = 171.600 KNB/nhân vật. **Chốt: giữ tới mốc 90, bỏ mốc 100 và 110** (và 149) → còn 21.600 KNB/nhân vật. Sửa trong `odali_youxituiguang.lua`: bỏ NewCard6/7/8 khỏi menu. |
| 3 | Túc Cầu | Giữ nguyên. |
| 4 | Hạn KNB web → game, đổi vàng | Giữ như đã đặt (30.000/ngày). |
| 5 | Rương Ích Kỷ | **Tắt** (công tắc chức năng trên web admin). |
| 6 | Shop 150 ngọc cấp 5 | **Giữ**: nhóm chơi dưới 2 tháng, cần lên đồ nhanh. |
| 7 | 33 ngọc cấp 6 web | Chủ server tự chỉnh giá trên web admin. |
| 8 | Miên Bố / Bí Ngân cấp 6 | **Rơi 10%** (đổi từ 40%, 01/10 tối) ở quái phó bản **Q Tô Châu + Q Lâu Lan** (`roimap.lua`, cùng chỗ Cửu Thiên Ngọc Toái). ID: Miên Bố 6 `20501006`, Bí Ngân 6 `20502006`. **ĐÃ LÀM 01/10 tối trên main** (hiệu lực ngay, Lua): roll 10% rồi bốc 1 trong 2, mỗi quái tối đa 1 món, chỉ quái phó bản 50100/50220 (`roimap.lua` RoiBoc nhóm 1 + RoiPhoBan2; 1130/1129 gọi thêm). Rollback tag `truoc-mienbo6-01-10`. |
| 9 | Ám khí | Để sau. |
| 10 | 98 câu tiếng Trung | Dịch dần sau khi mở. |
| 11 | Tin 3 nhóm boss (810000/810001/810003) | **Tắt.** |
| 12 | Trứng pet 20.000 KNB (kệ 132/218/219 Hồ Ca) | Giữ trong game; giá web chủ server tự chỉnh. |
| 13 | Ngưng Tức Hoàn `38002067`/`38002068` | Viên cộng **+500 lượt** vào bộ đếm "giết quái x2 nội tức" (Võ Ý). Không bán ở đâu. **Chốt: lên shop web**, giá chủ server tự đặt (thêm món `38002067` vào shop web qua web admin, không cần restart). |
| 14 | Pet V2 (85/95) | **Chỉ admin tặng**, không bán. |

---

## 3. Quy trình ngày mở

> **Bẫy phải tránh:** `cap-nhat.sh` rsync theo checksum, file nào trên server khác repo là bị ghi đè. Vì vậy mọi sửa cấu hình ngày mở **phải là commit trong repo**, không sửa tay trên VPS. Nhưng commit sớm thì lần deploy kế tiếp đẩy lên server đang test. → Làm trong **nhánh `mo-server`** từ máy nhà (VPS không push được), ngày mở merge vào `main` rồi `cap-nhat.sh`.

**Trước ngày mở (không ảnh hưởng server đang chạy):**
1. **XONG 01/10 (nhánh `mo-server`, commit `efdd84f`, đã push, CHƯA merge):** `DefaultChar.ini` level 1 · `ConfigInfo.ini` ExpParam 10.0 · `ChatConfig.txt` kênh 2 = 180000 · máu boss 80% gốc (7.169 ô / 4.247 dòng, 0 ô bỏ qua, công cụ `tools/mau-boss.js 0.8`) · `GemInfo` 50412007 = 1 · tắt tin 810000/810001/810003 (12 dòng, cột 14–16 = -1 như 810002) · xóa 54 pet 31001–31582 khỏi `PetAttrTable` (không ai đang giữ; 500 dòng 31xxx của `MonsterAttrExTable` là quái gốc, giữ) · `jiarumenpai.lua` HHV 19 · menu 80.000 Điểm Tặng tắt (comment + handler -919) · hộp tân thủ 8886 1 lần duy nhất · Thẻ Tài Phú `x002084_g_MocToiDa = 90` (ẩn + chặn mốc 100/110/149). **Không nằm trong repo này, làm ngày mở trên web admin / repo bialk:** tắt cổng mod, tắt Rương Ích Kỷ, thêm Ngưng Tức Hoàn `38002067` vào shop web. **Ngày mở:** `git checkout main && git merge mo-server`; nếu xung đột ở `MonsterAttrExTable.txt` (main sửa pet skin sau 01/10) thì `git checkout --theirs`… lấy bản main rồi chạy `node tools/mau-boss.js 0.8`. Bản gốc mục 1: Nhánh `mo-server` chứa: `DefaultChar.ini` level 1; `ConfigInfo.ini` ExpParam 10.0; `ChatConfig.txt` kênh 2 = 180000; `jiarumenpai.lua` HHV 19/24, tắt menu 80.000 Điểm Tặng; NPC 8886 hộp 1 lần duy nhất; `MonsterAttrExTable` máu boss 80%; `GemInfo` 50412007 = 1; xóa 54 pet 31xxx khỏi `PetAttrTable` (+ dòng tương ứng trong `MonsterAttrExTable` nếu là pet thuần); tắt cổng mod (admin thường) của bot; tắt công tắc Rương Ích Kỷ; tắt tin boss 810000/810001/810003 (`ActivityNotice.txt`); `odali_youxituiguang.lua` bỏ mốc 100/110/149; shop web thêm Ngưng Tức Hoàn `38002067`. Mỗi file kiểm bằng script byte-safe như các lần trước.
2. **XONG 01/10** `deploy/mo-server.sh` (commit `15b2bb1`): giữ `charguid = 1010100008` ở mọi bảng có cột `charguid` (trừ `t_guild_user`, `t_relation` xóa hết), thư chỉ giữ thư gửi bia1, bia1 `guldid = -1` + `leagueid = -1`, trả ô bang/thành về trống như `reset-choi-that.sh`, `web.account` chỉ còn `bialk1` + `admin`. File: xóa `NetCo4Qua/*` (cả `_capmin.txt`) và `NetCo4Web/*` **trừ của 1010100008**, QianDao, DBShopData, NetCo4Popup, HQYZ…, làm rỗng Paiming/MingRenTang/YbMarket/JuDian/ShiJianTx/LoDe/IP, `GMList.ini` chỉ còn 1010100008. Chạy thật hỏi gõ `MOSERVER`, tự sao lưu `truoc-moserver-*.sql.gz`.
3. **XONG 01/10** `sao-luu.sh` sao lưu thêm `/opt/minigame/BotDoMin/database.json` → `hang-ngay/bot-*.json.gz`, giữ 14 bản (cron 4h sáng có sẵn).
4. **XONG 01/10 18:5x** `./mo-server.sh --thu` (bản sao `tlbbdb_thu`/`web_thu`, game vẫn chạy, 1,5 giây, tự xóa bản sao): trước 10 nhân vật / 725 dòng item / 12 tài khoản → sau `t_char` 1 (bia1 cấp 119, guldid -1), item bia1 còn hiệu lực 38, `t_pet` 3, `t_skill` 69, `t_xinfa` 8, `t_mail` 6, guild/relation/city 0, ô bang đang dùng 0, `maxcharguid` 1010100010 giữ nguyên, tài khoản `admin,bialk1`. DB thật còn đủ 10 nhân vật sau khi chạy. **Chưa thử phần xóa file** (chỉ chạy ở chế độ thật).
5. Ghi mật khẩu mới (panel GM, SUPER, admin, mod) sẵn.

**Ngày mở:**
1. Báo mọi người thoát. `ss -Htn state established '( sport = :3731 )'` = 0.
2. Merge `mo-server` → `main`, push. Trên VPS `cap-nhat.sh -y` (chưa restart).
3. `tlbb.sh stop`, đợi ShareMemory tắt hẳn.
4. `mo-server.sh` (tự sao lưu `truoc-reset-*.sql.gz` trước khi xóa).
5. Bot: `systemctl stop minigame`; sao lưu `database.json`; xóa 4 ví + `_bossKills`, `_dogDay`, `_webSessions`; đổi mật khẩu SUPER/mod trong `.env`; bật lại.
6. Đổi `PANEL_PASS` trong `secrets.env`, restart `tlbb-panel`; đổi mật khẩu `admin` (`tao-account.sh --doi admin …`).
7. `tlbb.sh start`. Panel GM: ô Cấp tối thiểu = **0**; đặt **Cấp tối đa = 89**, Lưu + Restart.
8. Web admin: bật thẻ Chọn Pet Boss (Tân Thủ, giá 0).
9. Kiểm bằng 1 tài khoản mới: cấp **1**; không nhận được 80.000 Điểm Tặng; hộp tân thủ 1 lần; nhận pet Tân Thủ trên web và bấm **Chiến** được ở cấp thấp; exp có tích khi chạm 89 không; bia1 còn đủ đồ + GM; cổng mod không còn vào được.
10. Theo dõi tuần đầu: RAM, `luaerror.log`, lượng phiếu rơi (Audit `ITEM_CREATED … 39910001`).
11. Rollback: `truoc-reset-*.sql.gz`, bản sao `database.json`, `git revert` merge.

---

## 4. Còn mở, chưa chặn ngày mở
- Pet Tân Thủ: client hiện "Cấp 85 Mang Theo" (bảng client trong `ccore.dat`). Chưa thử nhân vật cấp thấp xuất chiến.
- Khóa cấp: chưa thử exp có tích tiếp khi đứng ở mức khóa. Lệnh Lên cấp và cấp tối thiểu (SetLevel) **vượt được** khóa.
- 12 Sơ cấp Hoàn Đồng Đan 30309150–161 trỏ ID pet không tồn tại và xóa pet trước khi tạo. Chỉ có trong túi quay trứng 30504xxx (không bán). Đừng mở túi đó khi chưa sửa.
- Dòng sai thứ tự gốc: `StandardImpact.txt` 5724 (sau 5919); `DropBoxContent.txt` 1776 → 1775. `MonsterDropBoxs.txt` 5 dòng lệch cột gốc (9546 Lý Thu Thủy, 11468, 12039, 42372, 42376) — 9546 có trong danh sách boss rơi `90002`, cần xem dòng đó engine đọc được không.
- 15 ID quái không có trong `MonsterAttrExTable`; 5 NPC truyền tống hỏng trong `MyNew/zhaohuan/`.
- Bàn Cổ Chi Linh: client không có model, không làm được nếu không sửa client.
- Repo GitHub public (không commit secret). VPS không push được.
- **Chưa test trong game** (code đã chạy, chưa ai bấm): Cộng Sinh 200/400; hộp tân thủ 8886; 8.000 vàng khóa; Bí Tịch xếp tông; gói rơi 89 boss; Trùng Lâu Đới 5 giây; Thanh Tâm/Xuân Hoa 422/424; Nhuận Hồn Thạch chồng (tách/bán/giao dịch); lệnh XOA; Tạo Hóa làm chậm; bùa Hồi Thành; vòng quay; Điểm danh 070053; VIP; quà popup; gỡ kẹt khi có người online; Lò Ly Hoa UI 890174; `cap-gm --tat-ca`; `NetCo4.zip` trên máy sạch; 2 lỗi `invalid option in format` trong `luaerror.log` (có từ trước).
