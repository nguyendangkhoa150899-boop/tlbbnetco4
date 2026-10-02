# Vòng Quay May Mắn trên web (02/10, cập nhật 15:00: bỏ VIP, 40 lần/vòng)

Thay vòng quay trong game. Vòng quay game (script 890097 `CJHDs.lua`) vẫn còn, nhưng giao diện client hiện ô ngẫu nhiên, không khớp món thật nên khó dùng.

## Cách chơi (giống "Vòng Quay Bảo Thạch" trong game)
1. **Mở / Làm mới vòng**: trả **8.000 KNB** (admin đặt). Server bốc **24 món** từ bộ quà theo trọng số, không trùng. **Không còn VIP** (bỏ 02/10): món nào cũng quay được, hiếm hay không chỉ do trọng số.
2. **Rút thăm**: tốn **1 lượt quay**. Server bốc 1 trong 24 ô theo trọng số. Đèn chạy quanh vòng rồi dừng ở ô trúng. Vòng giữ nguyên sau khi quay; muốn đổi món thì Làm mới. **Mỗi vòng tối đa 40 lần quay** (admin chỉnh), đủ thì phải Làm mới (trả KNB) mới quay tiếp; trang hiện "vòng này còn X/40". Có ô Tự động quay (dừng khi hết lượt, hết 40 lần, hoặc rương đầy).
3. Quà vào **Rương vòng quay** trên web (không hết hạn, tối đa 100 dòng, trúng món đã có thì cộng dồn; người chơi tự xóa được). Bấm **Nhận** hoặc **Nhận tất cả**: món vào hàng đợi quà game (đổi bản đồ là có). Lỗi giữa chừng thì món còn lại vẫn nằm trong rương.

**Lượt quay** có từ **🎒 Túi đồ boss**: mỗi túi thay **Hạnh Vận Quả ×2** bằng **2 lượt quay web** (Lâu Lan Tầm Bảo 1). Admin cấp thêm được. Lúc deploy đã chuyển 11 cấu hình túi đã sửa và 48 túi chưa nhận (cờ `_vqMigHVQ`).

## Admin (web admin, cổng SUPER → tab 🎁 Quà tặng → 🍀 Vòng quay may mắn)
- Bật/tắt, giá mở/làm mới, số lần quay / vòng (mặc định 40).
- Bộ quà: icon, SL, **trọng số** (càng nhỏ càng hiếm), bật/tắt từng món, ~% trúng mỗi lượt (ước tính khi món có trên vòng).
- Tìm vật phẩm trong game (tên không dấu hoặc ID) để thêm. Nút "Bộ quà mặc định" = 377 món của vòng quay gốc server: hiếm nhất (trọng số 1) gồm 65 tọa kỵ/cánh/kỵ thừa, 7 thời trang, ngọc cấp 7, Trùng Lâu Chi Lệ/Mang/Thương/Dương, 3 trứng trân thú quý, phiếu 10.000, Tàn Khuyết Thần Tiết 7, Truyện Quốc Ngọc Tỉ; hiếm (20): ngọc 6, phiếu 5.000, Long Văn +5/+6, Võ Hồn; còn lại thường (100).
- Cấp lượt quay cho ví (số âm = trừ), xem ai còn lượt/rương, lịch sử quay. Túi boss: ô "🍀 Lượt quay web" trong tab 🎒 Túi Boss.

## Icon vật phẩm game
- `tools/icon-vat-pham/lam.js <client> <ra>`: tên icon từ `CommonItem` cột 5, `GemInfo` cột 5, `EquipBase` cột 21 (`图标`); tấm ảnh `Icons/<bộ>.jpg|png` trong client `Data/Material.axp` (AXPK: bảng block + "(list)" ở block cuối, khớp theo kích thước; cột crc không phải CRC32). Lưới ô 64px, số đánh từ 1 theo hàng. 23.366 / 23.489 món có hình, 426 tấm, 57 MB.
- Tấm ảnh trên VPS: `/opt/minigame/itemicon/` (ngoài git). Chỉ mục: bot `BotDoMin/data/itemicons.json`. Bot phục vụ `/itemicon/<file>` ở cả cổng web lẫn admin (stream từ đĩa).
- 3 tấm trùng kích thước đã chọn tay (Medicine4, Ore, CircularTaskTool45). Thiếu 2 bộ (`Ride1`, `TWzhuandanzhuanyong`) không có trong client.

## Dữ liệu
- `dbCache._vqCfg` = `{ on, gia, max, pool: [{ id, sl, w, off }] }` (trường `vip` cũ còn trong DB prod nhưng code bỏ qua) (không có `pool` = bộ mặc định `data/vongquay-macdinh.json`).
- Người chơi: `userData.vq = { luot, board, boardN (số lần đã quay vòng này), ruong, lich }`. Nhật ký: `dbCache._vqLog` (400 dòng).
- Ngày mở: reset ví bot xóa luôn `vq` của người chơi; giữ `_vqCfg`, xóa `_vqLog`.
- Rollback: `/opt/minigame/backup-vongquay-0210/` (4 file js + `database.json` trước khi chuyển đổi túi boss).
