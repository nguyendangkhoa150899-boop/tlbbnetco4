# Custom Trùng Lâu (trang admin, 08/10)

Trang **🐉 Custom Trùng Lâu** ở admin.netco4.click → tab 🛠️ GM (chỉ cổng SUPER thao tác). Chỉnh được **Trùng Lâu dòng mới 10553100–10553114** và **2 mã cũ giao dịch được hẳn**: Giới **10422016**, Ngọc **10423024** (thêm 08/10, chủ server cần bản trade; dòng mới mã nào cũng khóa / khóa khi mặc).
- Mã cũ: cùng cơ chế (cấp 9 cố định, đoạn 100, không rand điểm), bật 20 loại dòng, bốc 7–16 dòng. Đoạn riêng 4516 (10422016), 4517 (10423024).
- Hiệu ứng mã cũ **dùng chung với bản khóa**: 5952 = 10422016 + 10422018, 5953 = 10423024 + 10423026. Trang liệt kê mọi mã dùng chung (tính trên toàn EquipBase).
- Các mã cũ còn lại (10422018, 10423026, Chân cũ 10423025) không có trên trang.

Bảng số liệu từng món (tỉ lệ, thời gian, bộ, đường nâng): `docs/CAN-BANG.md` mục 4.

## Admin chỉnh được gì

| Thứ | Ở đâu | Áp cho ai | Khi nào có hiệu lực |
|---|---|---|---|
| **Tỉ lệ dính** (a) | `StandardImpact` hiệu ứng thần khí, tham số 伤害目标时的激发几率 | mọi người cầm mã đó, **kể cả món đang có** | sau restart game |
| **Thời gian hiệu ứng** (b) | `StandardImpact` hiệu ứng con, cột 21 (ms) | như trên | sau restart |
| Vai: miễn % · Giáp: phản %, trần phản | `StandardImpact` 7517–7520 | như trên | sau restart |
| **Dòng thuộc tính** (dòng nào, bao nhiêu dòng, tối đa 16) | `EquipBase` cờ cột 33–90 + số dòng cột 93/94 | **chỉ món tạo mới** (phát, rơi, nâng Chân) và **Chân Trùng Lâu đem tẩy** | sau restart |
| **Điểm từng dòng** | đoạn giá trị riêng `ItemSegValue` 4501–4515 (cột 92 EquipBase trỏ sang) | **mọi món mã đó, kể cả món đang có**, ở những dòng món đó có | sau restart |

- **Mỗi mã một đoạn riêng** (10553100 → 4501 … 10553114 → 4515). Đoạn gốc 100 dùng chung 352 trang bị khác, đoạn 4321 chung 6 món Chân, nên không sửa thẳng vào đó.
- **Hiệu ứng có thể dùng chung giữa 2 mã.** Ví dụ Liên 10553100 và 10553112 cùng hiệu ứng 7513 → 7514: đổi là đổi cả hai. Trang ghi rõ mã nào dùng chung.

## Cơ chế (đã kiểm, khớp tooltip)

- **Lúc tạo món**, engine bốc dòng theo cờ `EquipBase` (thuộc tính k = cột k+33, `-1` = tắt). Số dòng = rand[cột 93, cột 94]. Món lưu dòng nào bật + cấp phẩm chất + 1 số rand.
- **Mỗi lần nhân vật vào game**, server tính lại điểm:
  - công thức: `ceil(V × Rate[cấp][k] / 100)`;
  - V lấy từ `ItemSegValue[cột 92]`, Rate lấy từ `Server/Config/ItemSegRate`;
  - Trùng Lâu dùng quy tắc phẩm chất 9 = cấp 9 cố định, cột 101 (T) = -1, nên **không có ngẫu nhiên**. Ai cầm cùng mã cũng có cùng điểm.
  - Kiểm 08/10 với Trùng Lâu Ngọc: HP 12520 × 90 = 11268, Ngoại công 1106 × 180 = 1991, Chính xác 1230 × 90 = 1107, Hội công 10 × 108 = 11. Khớp ảnh trong game.
- **Đặt điểm X** thì lưu V = số cho `ceil(V × R / 100)` gần X nhất.
  - Dòng hệ số R > 100 (4 hệ công, ngoại / nội công: R = 180) **chỉ ra được một số giá trị**. Ví dụ muốn 100 thì ra 101, muốn 2500 thì ra 2501.
  - Trang hiện cột **"sẽ ra"** kèm ⚠ trước khi lưu.
- **Nhiều cờ hơn số dòng thì bốc ngẫu nhiên.** Bản gốc Trùng Lâu Ngọc bật 15 cờ nhưng ra 13 dòng. Lưu trên trang thì số dòng = số dòng đã tick, nên món ra **đúng** các dòng đó.

## Dòng được chọn (08/10, chủ server: "giữ những gì game có thôi")

- **Trang mặc định chỉ hiện dòng món tự ra** (Liên / Giới / Ngọc 15, Chân 19, Đai / Vai / Giáp 11, Chân 15).
- Ô **"Hiện thêm dòng game có số"** mở thêm các dòng có số gốc > 0 trong đoạn giá trị (26 dòng với Ngọc).
- **17 dòng không có số gốc** (Giảm thời gian băng / hỏa / huyền / độc, Hồi sinh lực, Tốc đánh, Hồi chiêu…) bị ẩn, và **server chặn** (`_dong_co` trong `kiem_mon`).

## Ai đang giữ

Nút **👥 Ai đang giữ Trùng Lâu** đọc `t_iteminfo` + `t_char`:
- nhân vật, tài khoản, mã, món;
- vị trí: túi (pos < 100), **đang mặc** (100–118 = 100 + vị trí trang bị), kho (≥ 119).

DB trễ vài phút so với trong game vì ShareMemory lưu định kỳ. Ví dụ 08/10: bialk đã nâng Đai lên Chân nhưng DB vẫn ghi 10553106.

## Cách ghi (an toàn)

- **Code:**
  - panel game: `panel/trunglau.py`;
  - API trong `panel/panel.py`: `GET /api/trunglau`, `GET /api/trunglau/giu`, `POST /api/trunglau`, với `op` = `mon` / `xoa` / `hu` / `tra` / `restart`;
  - bot: `bialk/BotDoMin/trunglau.panel.js` phục vụ ở `/tl.js`; `panel.js` route `/api/gm/trunglau`, thao tác ghi chặn ở cổng SUPER.
- **Mỗi lần lưu áp lại TOÀN BỘ từ bản repo** (idempotent): 15 dòng EquipBase, các dòng hiệu ứng Trùng Lâu, đoạn 4501–4515 (xóa rồi thêm lại ở cuối, giữ thứ tự ID tăng dần). Các dòng khác của 3 file game giữ nguyên (mẫu đồ chế, Drop Boss…).
- **Cấu hình:** lưu `Server/txt/NetCo4Cfg/trunglau.json` (ngoài repo).
- **Sao lưu:** 3 file game trước mỗi lần ghi, ở `/opt/tlbb-backup/trunglau-<thời gian>/`. Nhật ký: audit panel game + log ADMIN của bot (cổng + IP).
- **Deploy:**
  - `cap-nhat.sh` gọi `trunglau.py --ap-lai` sau rsync (rsync ghi đè 3 file bằng bản repo).
  - `lay-tu-server.sh` gọi `--go-khoi-repo` để cấu hình admin **không lọt vào repo**.
- **Đã thử** trên bản sao bảng prod (08/10):
  - áp, áp lại, trả về gốc: trả về thì giống hệt từng byte;
  - kéo về repo rồi gỡ: còn 0 file khác;
  - chặn mã cũ, chặn quá 16 dòng, chặn hiệu ứng lạ.
- **Trả về gốc:** nút ♻️ Trả tất cả về gốc trên trang (rồi restart), hoặc `python3 panel/trunglau.py` với cấu hình rỗng.

## Chưa kiểm trong game

- Món tạo sau khi lưu ra đúng dòng, đúng điểm. Món cũ đổi điểm sau restart.
- Dòng **ngoài bộ gốc** (ví dụ Phòng ngoại trên Ngọc): engine có cho, client hiện đúng tên. Thử 1 món trước khi phát hàng loạt.
- Tỉ lệ / thời gian mới đúng như đặt (đánh thử, đếm giây).
