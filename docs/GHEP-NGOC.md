# 💎 Ghép Ngọc (mini game web, kiểu "Upgrade" CS:GO) - 05/10/2026

Người chơi bỏ đồ trong **🧰 Rương Ích Kỷ** vào để **luyện** ra 1 món đích: ngọc 7, nguyên liệu Trùng Lâu, phiếu KNB.
- **Thắng:** món đích vào lại Rương Ích Kỷ, người chơi bấm Nhận để đưa vào game.
- **Thua:** mất hết đồ đã bỏ vào.

Code ở repo bot `bialk` (thư mục `BotDoMin/`). Mọi thông số nằm trong cấu hình admin, không cố định trong code.

## Người chơi dùng thế nào

Web → 🎮 **MINI GAME** → **💎 Ghép Ngọc**.

1. **Bỏ đồ vào:** bấm món ở tab 🧰 Rương. Mỗi thẻ hiện giá trị 1 cái và "+x%/cái" khi đã chọn món đích.
2. **Chọn món đích:** ở tab 🎯 Món đích, hoặc bấm 1.5x / 2x / 5x / 10x / 20x để tự chọn món có giá trị gần mức đó.
3. **Tự bỏ đồ:** các nút 35% / 55% / 75% tự bỏ đồ trong rương cho đủ mức, ưu tiên đồ không phải ngọc trước.
4. **Kéo vòng** (nắm chỗ nào trên vòng cũng được) để xoay **vùng trúng** tới vị trí ưng ý. Xoay **không đổi tỉ lệ**, vì số tung trải đều cả vòng.
5. Bấm **💎 LUYỆN**. Kim quay khoảng 7,6 giây. Dừng trong cung màu là thắng.

## Luật

```
tỉ lệ (%) = tổng giá trị bỏ vào ÷ giá trị món đích × (100 − phí)
```

- **Kẹp tỉ lệ** trong [tiMin, tiMax], mặc định 1–75%.
- **Đủ tiMax thì không cho bỏ thêm.** Chỉ món cuối được làm vượt mốc. Nếu bỏ bớt món rẻ nhất mà vẫn đủ tiMax thì là "bỏ thừa", cả client lẫn server đều chặn.
- **Server tung số** `crypto.randomInt` trong khoảng 0–99,999. Thắng nếu số đó nằm trong cung [lệch, lệch + tỉ lệ) trên vòng 0–100, với "lệch" là vị trí người chơi đã xoay.
  - Đo 1 triệu lần ở mức 45% ra 45,03%, kể cả khi vùng trúng bị xoay ngẫu nhiên.
- **Phí** không trừ KNB. Nó chỉ hạ tỉ lệ thắng. Phí 10% nghĩa là trung bình người chơi nhận lại 90% giá trị đã bỏ vào.

### Giá trị đồ bỏ vào (thứ tự ưu tiên)

1. **Nhóm cấm** (`vao.cam`) được kiểm trước nhất, kể cả trước giá riêng. Mặc định cấm Yếu Quyết, vì Yếu Quyết chỉ để bán ở Rương Ích Kỷ.
2. **Giá riêng** admin đặt (`vao.rieng`). 0 nghĩa là cấm.
3. **% giá chợ**, tức shop web (`vao.shop.pct`, mặc định 90%). Chỉ tính món **đang bán**: không tắt và giá > 0.
4. **Giá bán Rương Ích Kỷ** (`vao.giaRuong`). Mặc định **tắt**, theo quyết định của chủ server: món không có giá chợ thì không hiện.

Không có giá nào thì món đó **không hiện** ở danh sách bỏ vào.

### Món đích (cấu hình 05/10, chủ server chốt)

| Nhóm | ID | Thắng nhận | Giá trị |
|---|---|---|---|
| 💎 Ngọc thuộc tính 7 (Tinh Thạch thuần tịnh, công 230) | 50702005–008 | 1 | 120.000 |
| 🛡️ Ngọc kháng 7 (thuần tịnh, kháng 90) | 50712005–008 | 1 | 110.000 |
| ❤️ Thể lực / né 7 | 50713004 Hồng Bảo Thạch, 50714001 Tổ Mẫu Lục | 1 | 120.000 |
| 🎯 Chính xác 7 | 50703001 Tử Ngọc | 1 | 120.000 |
| 🧩 Trùng Lâu Chi Lệ / Mang / Thương / Dương | 20310185–188 | **10** | 50.000 cả gói |
| 🎟️ Phiếu KNB | 39910001–005 (1.000 → 50.000) | 1 | bằng mệnh giá |

- **Đã loại:** 28 ngọc kép 7-x (Minh Tinh Thạch có cả công và giảm kháng) và 4 Minh Thạch giảm kháng mục tiêu.
- **Mặc định tắt:** ngọc thường không thuần tịnh (công 40, kháng 16), vì quá yếu.
- **Cách tính giá ngọc 7:** trong game 5 ngọc 6 lên 1 ngọc 7, ngọc 6 bán shop 20.000. Vậy 5 × 20.000 = 100.000, cộng thêm 10.000 (ngọc kháng) hoặc 20.000 (các nhóm còn lại).
- **Trùng Lâu có 2 bộ ID trùng tên.** Bộ đúng là **20310185–188**, cùng bộ mà vòng quay và script đổi Trùng Lâu dùng. Bộ 20310100–102 không dùng.

### Thứ tự hiện (05/10, chủ server)

Cả tab 🎯 Món đích lẫn 🧰 Rương xếp: phiếu KNB nhỏ → lớn → nguyên liệu Trùng Lâu (Lệ, Mang, Thương, Dương) → ngọc công Băng / Hỏa / Huyền / Độc → ngọc kháng Băng / Hỏa / Huyền / Độc → Thể lực (Hồng Bảo Thạch) → Né tránh (Tổ Mẫu Lục) → Chính xác (Tử Ngọc) → còn lại (theo giá). Ngọc so theo 5 số cuối ID nên ngọc 6 đứng ngay sau ngọc 7 cùng loại. Hệ lấy từ `GemInfo.txt`: Băng = Lam Tinh Thạch / Hạo Thạch, Hỏa = Hồng Tinh Thạch / Dạ Quang Thạch, Huyền = Hoàng Tinh Thạch / Hoàng Ngọc, Độc = Lục Tinh Thạch / Bích Tỷ. Code: `hang()` trong `ghepngoc.js`. Thứ tự "Tự bỏ đồ" (35/55/75%) không đổi.

### Giới hạn khác

- 30 lượt/ngày/người.
- Tối đa 50 món mỗi lần.
- Bỏ KNB web vào: chủ server đã bật, tối đa 10.000 mỗi lần.

### 📣 Thông báo Discord

- **Kênh:** #cô-4-và-những-người-bạn (ID 1538752789499347037).
- **Nội dung:** thắng thì câu chúc mừng, thua thì câu châm biếm, mỗi loại 5 câu bốc ngẫu nhiên. Có tag người chơi, nhưng `allowedMentions` chỉ ping đúng người đó.
- **Đăng sau `tre` giây** (mặc định 8), để kim trên web dừng trước. Đăng ngay thì kênh lộ kết quả trước cả người chơi.
- **Lọc theo giá:** `minGia` = chỉ báo món đích từ mức giá đó trở lên.
- **📸 Ảnh kết quả (05/10, bialk `9996f0c`, mặc định BẬT `anh`):** thay câu chữ bằng ảnh màn hình kết quả do **server vẽ** (`BotDoMin/ghepngoc.anh.js`): cột Bỏ vào (icon + giá/cái + ×SL, KNB web, tổng), vòng tỉ lệ đúng hình học client (vùng trúng = cung `tiLe` bắt đầu ở `lech`, kim ở `roll`), khung THẤT BẠI / CHÚC MỪNG, món muốn luyện ra.
  - Không nhận ảnh chụp từ máy người chơi: ảnh client sửa được là kết quả giả do bot đăng.
  - SVG → PNG bằng `@resvg/resvg-js` 2.6.2 (bản dựng sẵn, `npm install` trên VPS), font DejaVu Sans của VPS (`GN_ANH_FONT` để đổi). Icon cắt từ tấm ảnh `itemicon.js` (`/opt/minigame/itemicon`), nhúng base64. ~250 ms, ~260 KB/ảnh, khổ 1650×840.
  - Tin chỉ có ảnh (+ tag nếu bật). `anhChu` = kèm câu chúc mừng/châm biếm. Thiếu thư viện hoặc vẽ lỗi → tự gửi câu chữ như cũ, ghi log ADMIN.
  - Thử ở local: chép module vào scratchpad cạnh `node_modules/@resvg/resvg-js`, `GN_ANH_FONT=C:/Windows/Fonts/arial.ttf,...` (require từ thư mục bot không thấy `node_modules` của scratchpad, NODE_PATH không ăn).

## Admin

**Cổng SUPER → tab 💎 Ghép Ngọc:**
- **Cấu hình:** bật/tắt, phí, tỉ lệ, lượt, KNB, % giá chợ, nhóm cấm, giá riêng, nhóm món đích (giá, số lượng nhận, danh sách ID), thông báo Discord và nút 🧪 Gửi thử.
- **Bảng giá đang tính** và **cảnh báo kinh tế:** giá bán rương lớn hơn giá đích, giá bỏ vào lớn hơn giá shop, KNB cộng phiếu lách giới hạn rút.
- **Nhật ký có hình:** đồ bỏ vào ×SL → món đích, tỉ lệ, số tung, kết quả.
  - Nút **↩ Hoàn đồ** trả lại đúng đồ và KNB của lượt đó vào Rương Ích Kỷ. Món đã thắng giữ nguyên. Mỗi lượt chỉ hoàn 1 lần.

**Cổng mod → tab 💎 Ghép Ngọc (chỉ xem):** chỉ có nhật ký. Không thấy uid, cấu hình, hay nút hoàn.

**Bỏ đồ tay vào Rương Ích Kỷ bất kỳ:** tab **📦 Kho đồ** (SUPER) → chọn người nhận → nút 🧰 Rương. Tab này mở lại ngày 05/10; trước đó bị lớp `pwOff` ẩn nhầm.

## Kỹ thuật

| File (repo bialk) | Vai trò |
|---|---|
| `BotDoMin/ghepngoc.js` | Server: `cfg / state / quay / adminState / saveCfg / tim / guiThu / hoan / logXem`. Nhận phụ thuộc qua tham số `d`. |
| `BotDoMin/ghepngoc.client.js` | Giao diện người chơi, phục vụ ở `/gn.js`. Đọc file mỗi lần tải nên sửa xong **không cần restart**. |
| `BotDoMin/ghepngoc.admin.js` | Giao diện admin, phục vụ ở `/gn-admin.js`. |
| `BotDoMin/index.js` | `const GN = require('./ghepngoc')({...})`: nối Rương Ích Kỷ, shop, icon, Discord. Có thêm `ichKyBanGiaTho`. |
| `BotDoMin/webplay.js` | Route `/gn.js`, `/api/gn/state`, `/api/gn/quay`; nút `navGn`, trang `pageGn`, class `gnWide` (rộng 1180px trên PC). |
| `BotDoMin/panel.js` | Route `/gn-admin.js`. Các route `/api/gn/cfg|save|tim|thu|hoan` chỉ cho SUPER. `/api/gn/xem` cho cả mod, đặt **trước** chốt chặn mod. Hai tab `gn` (SUPER) và `gnx` (mod). |
| `BotDoMin/thu/ghepngoc-local.js` | Chạy thử ở local: `node thu/ghepngoc-local.js` → http://localhost:3999. |

**Dữ liệu lưu:**
- Cấu hình: `dbCache._gnCfg`.
- Người chơi: `userData.gn = { day, luot, lich[] }`.
- Nhật ký chung: `dbCache._gnLog`, 400 dòng, khóa mỗi dòng = `t + '_' + uid`.

**Chạy thử ở local:**
- Bản thử dùng ảnh chụp server thật: `thu/du-lieu-mau.json` gồm danh mục, shop, bảng giá rương, rương và ví từng người. File này có dữ liệu người chơi nên **gitignore**, không commit.
- Có ô đóng vai từng người chơi, và nút 🔄 trả rương về như ảnh chụp.

**Rollback:** các tag trong repo bialk, xếp theo thứ tự thời gian:
`truoc-gan-ghepngoc-05-10` → `truoc-gn-tab` → `truoc-gn-css` → `truoc-gn-thongbao` → `truoc-gn-log` → `truoc-gn-modxem` → `truoc-gn-tre` → `truoc-gn-giu-kq`, tất cả có hậu tố `-05-10`.

**05/10 tối: giữ nguyên kết quả** (bialk `1e09340`, chỉ `ghepngoc.client.js`, không restart):
- Quay xong, `GN.kq` giữ ảnh chụp lượt đó: `p`, `tong`, `knb`, `vao[]` và `dich` lấy ở client lúc bấm LUYỆN.
  - Vòng vẽ theo `kq.p`. Ô BỎ VÀO hiện đồ "đã dùng". Khung `.gnKq` hiện 🎉 CHÚC MỪNG / 💥 THẤT BẠI.
  - Không kéo vòng được (`ganKeo` thoát sớm khi đang có `kq.vao`).
  - Kết quả chỉ xóa khi người chơi chọn món đích khác, bỏ đồ vào, hoặc bấm 35/55/75% / 1.5x… Các hàm đó đặt `GN.kq = null`.
- **Bẫy:** `/api/gn/quay` trả `dich: {...}` nhưng sau đó trải `...state(uid)`, nên `dich` bị **đè thành danh sách món đích**. Đừng đọc `j.dich` ở client. Toast cũ ghi "Nhận undefined" vì lỗi này.
- Kiểm bằng Edge headless điều khiển qua CDP (WebSocket có sẵn trong Node 22) trên `thu/ghepngoc-local.js` cổng 3998: quay tới khi trúng, chụp ảnh, kiểm kéo vòng / bỏ đồ.

**Cấu hình món đích trên prod 05/10** (chỉ ở `dbCache._gnCfg`, không có trong code):
- 22 ngọc 7 không kép ở "Món đích riêng": thường 120.000, Minh Thạch 7 320.000.
- Luật **Thuần tịnh đắt hơn bản thường 5.000**: nhóm `thuocTinh` 125.000, `khang` 115.000, Hoàng Ngọc / Hạo / Nguyệt Quang / Bích Tỷ 7 thường 110.000.
- Tổng 42 món đích. Bản sao lưu: `/root/gn-truoc-ngoc7-0510.json`, `/root/gn-truoc-thuantinh-0510.json`.
- **`/api/gn/save` không có khóa phiên bản.** Admin lưu từ tab mở từ trước sẽ xóa mất cấu hình mới mà không báo. Luôn F5 trước khi Lưu. Đổi bằng script thì đọc `/api/gn/cfg` ngay trước khi lưu.
Bản sao file cũ nằm trong `/opt/tlbb-backup/bot-truoc-*`.

## Kinh tế: đã biết, chủ server chấp nhận

- **Phiếu KNB làm món đích:** đồ rác túi boss (người chơi được miễn phí) tính theo 90% giá shop, rồi qua tỉ lệ thắng sau phí 90%. Kết quả là khoảng **81% giá trị rác** thành KNB trong game.
  - Ảnh chụp 05/10: BiaLK có khoảng 735.000 giá trị bỏ vào được.
  - Muốn chặn: đặt giá các phiếu về 0 ở tab admin.
- **Bỏ 1 món lớn cho món đích nhỏ:** luật hiện tại vẫn cho phép. Ví dụ 1 ngọc 6 (18.000) đổi lấy phiếu 1.000 ở mức 75%, người chơi mất khoảng 96%. HoangFour đã bấm nhầm như vậy lúc 12:28 ngày 05/10.
  - **Chưa sửa.** Cách sửa đã đề xuất: chặn khi tỉ lệ thô vượt quá 1,5 lần tiMax, hoặc hiện cảnh báo đỏ.
