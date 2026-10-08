# Custom Trùng Lâu (trang admin, 08/10)

Trang **🐉 Custom Trùng Lâu** ở admin.netco4.click → tab 🛠️ GM (chỉ cổng SUPER thao tác). Chỉnh được **Trùng Lâu dòng mới 10553100–10553114** và **2 mã cũ giao dịch được hẳn**: Giới **10422016**, Ngọc **10423024** (thêm 08/10, chủ server cần bản trade; dòng mới mã nào cũng khóa / khóa khi mặc).
- Mã cũ: cùng cơ chế (cấp 9 cố định, đoạn 100, không rand điểm), bật 20 loại dòng, bốc 7–16 dòng. Đoạn riêng 4516 (10422016), 4517 (10423024).
- Hiệu ứng mã cũ **dùng chung với bản khóa**: 5952 = 10422016 + 10422018, 5953 = 10423024 + 10423026. Trang liệt kê mọi mã dùng chung (tính trên toàn EquipBase).
- Các mã cũ còn lại (10422018, 10423026, Chân cũ 10423025) không có trên trang.

Bảng số liệu từng món (tỉ lệ, thời gian, bộ, đường nâng): `docs/CAN-BANG.md` mục 4.

## Long Văn (thêm 09/10)

- **09/10 tách riêng:** mục **🐲 Custom Long Văn** trong khu 🧰 Công cụ (chỉ cổng SUPER), ngay dưới Custom Trùng Lâu (bialk `8c20a13`, `trunglau.panel.js` tự chèn khối, không sửa panel.js). Hai mục dùng chung backend `panel/trunglau.py` + 1 file cấu hình; mỗi mục có "Ai đang giữ" và "Trả tất cả về gốc" riêng (trả = lệnh `xoa` từng mã của mục, Trùng Lâu thêm `hu` rỗng) → không đụng cấu hình mục kia.
- Mục Long Văn chỉnh được cả **Long Văn +1 → +9** (10157001–10157009): dòng thuộc tính + điểm. Không có hiệu ứng thần khí.
- Long Văn +N: cấp phẩm chất cố định = N, đoạn gốc 4244 (**dùng chung ~430 món**: thú cưỡi, nhiều mã 10553200–615) → mỗi mã có đoạn riêng **4518–4526**. Bật 11 loại dòng (SL, 4 hệ công, chính xác, cường lực, nội lực, thể lực, trí lực, thân pháp); số dòng +1 = 2 … +5 = 6, +9 bốc 6–16.
- Mẫu dòng áp cho Long Văn **tạo mới**: rơi, nâng cấp +N ở NPC Long Văn (`MyLua/longwennew/LongWenExt.lua` 892003 `LevelUp` tạo mã lw+1), **trọng tẩy** (`ResetProperty` tạo lại cùng mã) → người chơi đem tẩy ra đúng mẫu. Điểm áp cả Long Văn đang có.
- **Không đụng** phần "Mở rộng thuộc tính" (Huyết / Thuộc tính / Làm giảm kháng) - hệ khác, lưu trong chuỗi người chế như Võ Hồn.

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

DB trễ tới **~15 phút** so với trong game: ShareMemory ghi từng nhân vật xuống DB ~15 phút/lần (log "普通存盘成功 Player Guid=...", đo 07/10: 01:38:40 → 01:53:41 → 02:08:42) và khi thoát game. Ví dụ 08/10: bialk đã nâng Đai lên Chân nhưng DB vẫn ghi 10553106.

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

## Hướng "tẩy may rủi" (nghiên cứu 08/10, chủ server chọn KHÔNG làm, giữ ép điểm cố định)

- Điểm không lưu trên món. Thứ duy nhất khác nhau giữa từng món là **cấp phẩm chất** (lưu lúc tạo), cộng số rand trong cấp nếu cột 101 (T) > 0.
- Muốn tẩy ra điểm khác nhau:
  - đổi cột 91 (quy tắc phẩm chất) từ 9 cố định sang một quy tắc có tỉ lệ nhiều cấp (`ItemSegQuality` dòng quy tắc → mã `ItemSegAffect` → trọng số C1..C9);
  - mỗi lần tẩy (`TryRecieveItem`) bốc lại cấp, mọi dòng lên xuống cùng nhau. Ví dụ Băng công V = 167: 34 · 37 · 51 · 74 · 91 · 121 · 164 · 219 · 301 (C1..C9).
- **Vướng:**
  1. Món đang có lưu cấp 9 = mức tối đa, nên sau restart nhảy lên max.
  2. Thêm dòng quy tắc / mã tỉ lệ mới chưa rõ engine có chịu không (ghi chép 06/10). Phải thử trên server test.
  3. Chỉ Chân Trùng Lâu có đường tẩy (tepp 23); bản thường phải thêm mục NPC.

## 📋 Chép dòng sang Chân (08/10)

Nâng Chân ở NPC Tuyết Phi Phi (`wuyazi85o.lua` nhánh 36) **tạo món mới** bằng `TryRecieveItem` → engine bốc dòng theo cấu hình **mã Chân**; script chỉ chép lỗ / bảo thạch / cường hóa / khóa / ràng buộc / chữ người chế. Engine **không có hàm Lua đọc / ghi dòng** của 1 món → không chép được dòng riêng của từng món. Cách làm: cho mã Chân dùng đúng bộ dòng của mã Thường.

- Nút trên trang mã Thường (có bảng xem trước Thường → Chân, bấm 2 lần mới chép; mã đang sửa chưa lưu thì chặn): Chân = **đúng bộ dòng đang có hiệu lực** của mã Thường, số dòng = số dòng đó (Thường 15 dòng → Chân 15 dòng; admin mở thêm ở trang Chân sau khi chép - chép lại sẽ đè).
- Điểm Chân tính từ **điểm admin đặt cho mã Thường** (chủ server chốt, không so với Chân gốc): **Băng / Hỏa / Huyền / Độc công +50** (engine không ra đúng thì +51), **mọi dòng khác ×1,3** (làm tròn). Ví dụ 10423024 công thuộc tính 301 → Chân 351 (Chân gốc 360), Ngoại công 1.991 → 2.589 (Chân gốc 2.711), Sinh lực 20.000 → 26.000.
- Bảng Thường → Chân (`trunglau.py` `CHAN`, khớp script NPC): Liên 10553100 / 10553112 → 10553103; Giới 10553101 / 10553113 / 10422016 → 10553104; Ngọc 10553102 / 10553114 / 10423024 → 10553105; Đai 10553106 → 10553107; Vai 10553108 → 10553109; Giáp 10553110 → 10553111. Nhóm dùng chung không tách: chép mã nào thì Chân theo mã đó.
- Món đang có: **điểm** tự đổi theo mã (sau restart); **dòng** chỉ đổi khi tạo lại món - Chân: Tẩy Chân-Trùng Lâu (1 Ma Huyết Thạch 30505813 + 100 vàng, ra đúng bộ dòng 1 lần); Thường: không có đường tẩy.
- Code: `panel/trunglau.py` `chep_sang_chan` / `diem_chan`, API `POST /api/trunglau` `op: chep`; bot `trunglau.panel.js` (`tlChep`), `panel.js` cho phép op `chep` (chỉ cổng SUPER). Đã thử trên bản sao 3 bảng game ở `/tmp` VPS (đã xóa).
