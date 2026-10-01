# Mở server chính thức NetCo4 — tổng kết và quy trình

Viết 01/10/2026. **Chưa chạy.** Server vẫn chạy chế độ test. Ngày mở thì làm đúng mục 3, theo thứ tự.

Nguồn đối chiếu: 199 commit repo game (`tlbbnetco4`) và 45 commit repo bot (`bialk`) từ 28/09. Tab Drop Boss mới sửa trên VPS 3 lần (29/09), cả 3 đã đồng bộ về repo. `cap-nhat.sh` báo server giống repo.

---

## 1. Đã làm, GIỮ cho server chính

### 1.1 Boss và rơi đồ
| Việc | Chi tiết | Commit |
|---|---|---|
| **Máu boss −35%** | 4.247 dòng boss (`MonsterAttrExTable` cột 14 = 1): HP cột 19 và MaxHP cột 59 nhân 0,65. Công và thủ giữ nguyên. Áp cho mọi bậc phó bản. | `da6cce6` |
| Boss rơi Nguyên Bảo Phiếu 1000 | 139 boss phó bản và thế giới, hộp phiếu BV = Mv, khoảng 2 phiếu mỗi boss. 13 boss Mv 60 dùng `90001`. | `c817818` `86466a5` `e3137fb` `9cfa850` |
| Sinh Tử Lôi Đài | 12 boss Sát Tinh (cấp 120) rơi phiếu. | `17ea78b` `9a38401` |
| Dọn hộp rơi boss | Gỡ 54 hộp rác. 14 hộp nguyên liệu riêng cho boss (`90002`–`90015`): Hàn Băng Tinh Tiết, Chí Tôn Cường Hóa, Long Hồn Ngọc, Chú Văn, Long Văn +1, Miên Bố/Bí Ngân 8, Thần Binh Phù, Huyền Hạo Ngọc, Chuế Long Thạch, Hồn Ngọc… | `d17a313` |
| Gói rơi chuẩn | 89 boss trước chỉ có phiếu: thêm 8 hộp. Nâng Mv < 60 lên 60 (Mộ Dung Phục, Cửu Ma Trí, PMF, Nhạn Môn, Thủy Hử…). | `3efdf91` |
| Chống lạm phát | Thuốc giải (`90029`) và nguyên liệu cấp 8 (`90030`): 1 món mỗi người, ở 92 boss. | `acb9cd8` |
| Sửa lỗi gốc | Bảng rơi sai thứ tự ID (engine tìm nhị phân) làm **boss PMF và Nhạn Môn chưa bao giờ rơi**: đã sắp lại. Dọn 1.603 tham chiếu tới hộp không tồn tại. Tab Drop Boss chặn BoxValue < 4. | `c38856e` `7d968d2` `a2aa44d` |
| Yến Tử Ổ cấp 100+ | 46 dòng rơi mới. Trước đó nhân vật 110+ không rơi gì. Đoàn Diên Khánh chắc chắn rơi phiếu và thuốc giải Bi Tô Thanh Phong. Cửu Ma Trí và Mộ Dung Phục rơi phiếu. | `09fb6d0` `72a1335` `ec8a42f` |
| Drop Boss qua web | Lý Thu Thủy (9546) dùng hộp `90002`; sửa hộp `308`. | `9a6b9de` `1d6cacc` |
| Rơi theo map (`NetCo4/roimap.lua`) | Hạn Huyết Lĩnh: **Kim Tàm Ti 20310166 30%**. Hậu Hoa Viên: **Chí Tôn Cường Hóa 38000571 30%**. Mỗi người roll riêng. | `d7678c8` |
| Q Tô Châu, Q Lâu Lan | Mọi quái phó bản rơi **Cửu Thiên Ngọc Toái 20800034 40%**. Q Lâu Lan: mở lại, Việt hóa 51 câu. | `0e04927` `253c796` |
| Võ Ý | Mọi quái thường ở Vô Lượng Sơn (320 spawn) cộng Võ Ý, nội tức x4. | `f04343f` `8b0c532` `a4b5469` |

### 1.2 Pet
| Việc | Chi tiết | Commit |
|---|---|---|
| 180 pet Huyễn Hóa (12 skin boss) | **Admin** 72 con (cấp mang 85/95, 12000 đều). **V2** 72 con (85/95, dòng chính 8000, còn lại 4000). **Tân Thủ** 36 con (cấp mang 5, 4000/2000). Dòng chính theo kiểu: Ngoại = Cường lực, Nội = Nội lực, Cân bằng = Thể lực. Danh sách: `docs/pet-skin.tsv`, `docs/pet-huyen-hoa.md`. | `fd9e548` `fbf83c3` |
| Tư chất cố định | Ruler 2 (SuperRMB) mọi hệ số 1.000, trưởng thành luôn bậc 5. Quà admin dùng ruler 2 cho 180 ID. Hoàn Đồng 4834/4907/4908 từ chối pet Huyễn Hóa. | `5edd361` |
| Không có đường mua | Đã quét shop web, ShopTable, script, 22.994 spawn: chỉ admin phát hoặc thẻ Chọn Pet Boss. | — |
| Cộng Sinh 7033/7034 | Chủ nhân nhận 200% / 400% máu pet mất. | `170d45c` |

### 1.3 Vật phẩm, trang bị, kỹ năng
- Điêu Văn: sửa tên ngược Cường Lực ↔ Nội Lực (30110021–40, 30120002/03) (`2aa70ef`).
- Trùng Lâu Đới 10553106: dòng Phá Quân 15 giây → 5 giây (`9649d6b`).
- Thanh Tâm Phổ Thiện Chú chỉ admin phát (`d4a9591`). Trả 422 = Thanh Tâm, 424 = Xuân Hoa cho khớp client (`20eef59`).
- Tạo Hóa 10303447: hiệu ứng làm chậm (`98c63e7`).
- Chồng 250: Nhuận Hồn Thạch (36 bản), Hợp Thành Phù (`82384c3`).
- Chế đồ niệm 0,5 giây (`2bf5688`). Về thành và bùa Hồi Thành hồi chiêu 5 giây, niệm giữ như gốc (`b8592cc`).
- Shop 150 bán ngọc cấp 5 bằng Điểm Tặng, giá gốc (`fc8516f` `d8c682d`).
- Việt hóa 15.661 tên trang bị, 6 hộp quà trân thú, sửa chữ "ấ/ợ" (`11251be` `aeff4e2` `0c4a307`). Đổi "Trọng Lâu" → "Trùng Lâu" (`5768f95`).

### 1.4 NPC, nhiệm vụ, tính năng
- **NPC NetCo4 (990010):** 2.000 vàng và vàng khóa mỗi ngày (`2b40dcb` `170d45c`). 80.000 Điểm Tặng (`acfbbfa`) **sẽ TẮT khi mở**. Mục Tổng Bí Tịch (`8b5b597`).
- NPC tân thủ 8886: hộp Tân Thủ Trang Bị, hiện 1 lần/ngày, **khi mở đổi thành 1 lần duy nhất** (`170d45c`).
- Yến Tử Ổ: 3 lượt/ngày, chỉ đánh 2 đợt cuối (`93c15e2` `8c9bd58`).
- Hậu Hoa Viên: giờ mở chỉnh được, **khi mở đặt 19:00–23:59** (`5d20e69`).
- Mở lại: Lò Ly Hoa ở Tinh Thông (`29cca96`), Võ Hồn nâng cấp qua menu (`63176d9`), Bí Tịch xếp vào tông (`e156587` `0a7cf71`), Điểm danh 070053, vòng quay viết lại (`399492f`).
- **NPC Ví Web (999999):** chuyển KNB giữa game và web. Web vào game tối đa 30.000/ngày, nhận được cả vàng không khóa (`92a147b`, bot `e879fac`).
- Dọn: tắt tin hệ thống rác và quảng cáo server cũ (`65441b8` `e8ff862`), thông báo boss Võ Di (`62ca47b`), tab Quà Nạp Thẻ (`f5df91d`), cửa sổ Nạp lần đầu (`5356575`). Việt hóa 21 tin boss chuỗi nhiệm vụ (`7b59bd9`).
- Bảo mật: vá XieziQuickly 9997/9998 (`399492f`). Bỏ nhánh "chống hack" lúc đăng nhập đầu (chửi, về cấp 0, mất túi tân thủ) (`70c3d76`).

### 1.5 Công cụ admin
- **Panel GM** (`gm.netco4.click`, `panel/panel.py`): tài khoản, online, phát quà (vật phẩm, KNB tới 10 triệu, vàng, Điểm Tặng, cấp, VIP, popup, pet theo nhóm, xóa vật phẩm, nâng ngọc lên cấp N), GM, restart, gỡ kẹt, cấp tối thiểu, **khóa cấp tối đa** (`capmax`, `8b1316e` `9a1a36b`).
- **Web admin** (`admin.netco4.click`): tab GM nhúng mọi chức năng trên. Tab Drop Boss có nhật ký và Rollback. Shop web. Thẻ Chọn Pet Boss. Công tắc chức năng.
- Sao lưu tự động 4 giờ sáng. `cap-nhat.sh` sao lưu file trước khi thay.

### 1.6 Web người chơi (bot `bialk`)
- Đăng nhập bằng tài khoản game, đổi mật khẩu game trên web (`c3295e6` `b7d4bfc`).
- Shop Item giao đồ vào game qua hàng đợi (`5ed5283`). Rương Ích Kỷ. Quà mỗi ngày. Đổi KNB → vàng.
- **Chọn Pet Boss** (`2d369b9`): thẻ trong nhóm ⭐ Quan trọng. Mỗi ví 1 con: chọn skin, chọn kiểu, Nhận. Đang tắt sẵn.
- Tài Xỉu 4 cửa, Đỏ Mìn có cấu hình RTP (`f6e494c`). Thẻ "Boss đã hạ" đọc từ Audit log (`f6ca30f`).

### 1.7 Đã thử rồi TRẢ VỀ gốc (không cần làm gì)
Các mẫu tạm 11–15 dòng (Tạo Hóa, Trùng Lâu, quạt Phù Sinh, bộ Huyền Thể, Thần Khí), ám khí, Công Lực Đan +100.000, ngọc chồng được, Chân Trùng Lâu Ngọc tỉ lệ 6, Mvalue liên hoàn Tô Châu, đổi ngoại hình pet Tần Vương, bản pet Tân Thủ lần 1. Đồ đã phát cho bia1 lúc test vẫn giữ nguyên dòng.

---

## 2. Quyết định đã chốt cho ngày mở

| Mục | Chốt |
|---|---|
| Giữ lại | **Duy nhất** tài khoản `bialk1` và nhân vật **1010100008 (bia1)**, giữ nguyên tất cả: cấp 119, KNB, đồ, GM. |
| Xóa | Mọi tài khoản và nhân vật khác, bang hội, thành thị, thư, xếp hạng, điểm danh, hàng đợi quà. |
| Ví web bot | Reset hết, **chỉ giữ ví của bialk1**. |
| Cấp khởi đầu | **1**. `DefaultChar.ini` dòng 9 `level=99` → `1`. Xóa `_capmin.txt`. |
| Khóa cấp | **89**. Tab GM web: ô "Cấp tối đa (khóa cấp)", Lưu + Restart. Admin mở dần sau. |
| Exp | **x10**. `ConfigInfo.ini` `ExpParam=14.0` → `10.0`. |
| 80.000 Điểm Tặng miễn phí | **Tắt hẳn.** |
| 2.000 vàng + vàng khóa/ngày | **Giữ.** |
| Hộp Tân Thủ Trang Bị | **1 lần duy nhất** mỗi nhân vật. |
| Yến Tử Ổ | Giữ 2 đợt cuối, 3 lượt/ngày. |
| Kim Tàm Ti | Giữ 30%. |
| Hậu Hoa Viên | **19:00–23:59** (`MyNew/jiarumenpai.lua` `x990010_g_HHV_Mo = 19`, `Dong = 24`). |
| Chat Thế giới | Trả về **180000 ms** (`ChatConfig.txt` kênh 2, cột 4). |
| Thẻ Chọn Pet Boss | **Bật**, bản **Tân Thủ**, miễn phí. |
| Điểm môn phái âm | Bỏ qua (người dùng: lỗi cũ tự hết). |

---

## 3. Quy trình ngày mở

> Trạng thái: cần viết `deploy/mo-server.sh` gom mọi bước dưới đây thành 1 lệnh và chạy thử trên **bản sao database** trước. `reset-choi-that.sh` hiện có **chưa chạy lần nào** và chưa biết giữ 1 nhân vật / 1 tài khoản.

**Trước ngày mở (chuẩn bị, không ảnh hưởng server đang chạy):**
1. Viết `mo-server.sh`, dựa trên `reset-choi-that.sh`:
   - Giữ `bialk1` và mọi dòng có `charguid = 1010100008` ở mọi bảng `tlbbdb`.
   - Gỡ bia1 khỏi bang (vì bang bị reset).
   - Giữ dòng bia1 trong `GMList.ini`.
2. Các sửa cấu hình của mục 2 (DefaultChar, ExpParam, chat, Hậu Hoa Viên, 80.000 Điểm Tặng, hộp tân thủ) **không commit vào `server/`** trước ngày mở, vì `cap-nhat.sh` sẽ đẩy lên ngay. Để trong `mo-server.sh` hoặc một nhánh riêng.
3. Script reset ví bot: giữ ví có `gameAcc = bialk1` hoặc `tlbbGuid = 1010100008`, xóa mọi ví khác trong `database.json` (sao lưu trước).
4. Chạy thử toàn bộ trên bản sao database và bản sao `database.json`. Đối chiếu số dòng còn lại.

**Ngày mở:**
1. Báo mọi người thoát game. Kiểm `ss -Htn state established '( sport = :3731 )'` = 0.
2. `/opt/tlbb-deploy/tlbb.sh stop` và đợi ShareMemory tắt hẳn.
3. Chạy `mo-server.sh`: tự sao lưu database, reset, áp cấu hình mục 2.
4. Dừng bot (`systemctl stop minigame`), sao lưu `database.json`, reset ví (giữ bialk1), rồi bật lại.
5. `/opt/tlbb-deploy/tlbb.sh start`.
6. Panel GM, kiểm:
   - Ô "Cấp tối thiểu" = **0**.
   - Đặt "Cấp tối đa" = **89**, Lưu + Restart.
7. Web admin: bật thẻ Chọn Pet Boss (bản Tân Thủ, giá 0), up hình 12 skin.
8. Kiểm bằng 1 tài khoản mới:
   - Nhân vật mới **cấp 1**.
   - Không nhận được 80.000 Điểm Tặng.
   - Hộp tân thủ chỉ nhận được 1 lần.
   - Nhận pet Tân Thủ trên web, bấm **Chiến** được ở cấp thấp. Nếu client chặn vì hiện "Cấp 85", báo Claude.
   - bia1 vẫn còn đủ đồ và GM.
9. Rollback nếu hỏng: file `.sql.gz` trong `/opt/tlbb-backup/` (tên `truoc-reset-*`) và bản sao `database.json`.

---

## 4. Còn mở, chưa chặn ngày mở
- Pet Tân Thủ: client vẫn hiện "Cấp 85 Mang Theo" (bảng client trong `ccore.dat`). Chưa thử nhân vật cấp thấp xuất chiến.
- Khóa cấp: chưa thử exp có tích tiếp khi đứng ở mức khóa không. Lệnh Lên cấp và cấp tối thiểu (SetLevel) **vượt được** khóa cấp.
- 12 Sơ cấp Hoàn Đồng Đan 30309150–161 trỏ ID pet không tồn tại và xóa pet trước khi tạo. Hiện không ai lấy được. Đừng mở túi quay trứng 30504xxx khi chưa sửa.
- `StandardImpact.txt` dòng 5724 nằm sai thứ tự (sau 5919) nên engine coi như không có.
- Bàn Cổ Chi Linh: client không có model, không làm được nếu không sửa client.
