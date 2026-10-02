# Vòng Quay May Mắn trên web (02/10)

Thay vòng quay trong game. Vòng quay game (script 890097 `CJHDs.lua`) vẫn còn, nhưng giao diện client hiện ô ngẫu nhiên, không khớp món thật nên khó dùng.

## Cách chơi (giống "Vòng Quay Bảo Thạch" trong game)
1. **Mở / Làm mới vòng**: trả **8.000 KNB** (admin đặt). Server bốc **24 món** từ bộ quà: **2 ô VIP** (admin đặt) + 22 món thường, theo trọng số, không trùng.
2. **Rút thăm**: tốn **1 lượt quay**. Server bốc 1 trong 24 ô theo trọng số. Đèn chạy quanh vòng rồi dừng ở ô trúng. Vòng giữ nguyên sau khi quay; muốn đổi món thì Làm mới.
3. Quà vào **Rương vòng quay** trên web (không hết hạn, tối đa 300 món). Bấm **Nhận** hoặc **Nhận tất cả**: món vào hàng đợi quà game (đổi bản đồ là có). Lỗi giữa chừng thì món còn lại vẫn nằm trong rương.

**Lượt quay** có từ **🎒 Túi đồ boss**: mỗi túi thay **Hạnh Vận Quả ×2** bằng **2 lượt quay web** (Lâu Lan Tầm Bảo 1). Admin cấp thêm được. Lúc deploy đã chuyển 11 cấu hình túi đã sửa và 48 túi chưa nhận (cờ `_vqMigHVQ`).

## Admin (web admin, cổng SUPER → tab 🎁 Quà tặng → 🍀 Vòng quay may mắn)
- Bật/tắt, giá mở/làm mới, số ô VIP.
- Bộ quà: icon, SL, **trọng số** (càng nhỏ càng hiếm), VIP, bật/tắt từng món, ~% trúng mỗi lượt (ước tính khi món có trên vòng).
- Tìm vật phẩm trong game (tên không dấu hoặc ID) để thêm. Nút "Bộ quà mặc định" = 377 món của vòng quay gốc server: VIP (trọng số 1) gồm 65 tọa kỵ/cánh/kỵ thừa, 7 thời trang, ngọc cấp 7, Trùng Lâu Chi Lệ/Mang/Thương/Dương, 3 trứng trân thú quý, phiếu 10.000, Tàn Khuyết Thần Tiết 7, Truyện Quốc Ngọc Tỉ; hiếm (20): ngọc 6, phiếu 5.000, Long Văn +5/+6, Võ Hồn; còn lại thường (100). Đo thử: 2 ô VIP → trúng VIP ~0,13–0,17%/lượt.
- Cấp lượt quay cho ví (số âm = trừ), xem ai còn lượt/rương, lịch sử quay. Túi boss: ô "🍀 Lượt quay web" trong tab 🎒 Túi Boss.

## Icon vật phẩm game
- `tools/icon-vat-pham/lam.js <client> <ra>`: tên icon từ `CommonItem` cột 5, `GemInfo` cột 5, `EquipBase` cột 21 (`图标`); tấm ảnh `Icons/<bộ>.jpg|png` trong client `Data/Material.axp` (AXPK: bảng block + "(list)" ở block cuối, khớp theo kích thước; cột crc không phải CRC32). Lưới ô 64px, số đánh từ 1 theo hàng. 23.366 / 23.489 món có hình, 426 tấm, 57 MB.
- Tấm ảnh trên VPS: `/opt/minigame/itemicon/` (ngoài git). Chỉ mục: bot `BotDoMin/data/itemicons.json`. Bot phục vụ `/itemicon/<file>` ở cả cổng web lẫn admin (stream từ đĩa).
- 3 tấm trùng kích thước đã chọn tay (Medicine4, Ore, CircularTaskTool45). Thiếu 2 bộ (`Ride1`, `TWzhuandanzhuanyong`) không có trong client.

## Dữ liệu
- `dbCache._vqCfg` = `{ on, gia, vip, pool: [{ id, sl, w, vip, off }] }` (không có `pool` = bộ mặc định `data/vongquay-macdinh.json`).
- Người chơi: `userData.vq = { luot, board, ruong, lich }`. Nhật ký: `dbCache._vqLog` (400 dòng).
- Ngày mở: reset ví bot xóa luôn `vq` của người chơi; giữ `_vqCfg`, xóa `_vqLog`.
- Rollback: `/opt/minigame/backup-vongquay-0210/` (4 file js + `database.json` trước khi chuyển đổi túi boss).
