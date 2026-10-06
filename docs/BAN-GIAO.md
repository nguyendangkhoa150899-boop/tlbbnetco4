# Bàn giao cho phiên Claude tiếp theo (06/10/2026 09:20)

Đọc `CLAUDE.md` trước, rồi file này. Nhật ký chi tiết từng việc: `docs/TRANG-THAI.md` (đọc từ cuối lên, các mục 05/10–06/10).

## 1. Trạng thái lúc bàn giao

- **Game:** chạy từ 06/10 09:11, đủ 6 tiến trình trong `tlbb.service`. Server khóa cấp **89**, exp **×5**. Cả 2 số do panel giữ trong `NetCo4Cfg/capmax.txt` và `expparam.txt`; `cap-nhat.sh` tự áp lại 2 số này lên `ConfigInfo.ini`.
- **Repo game:** `main` = `02a4a31`. **VPS đã deploy `2d9eca5`.** Bản `02a4a31` (sửa `tlbb.sh`) **chưa lên VPS**.
- **Repo bot `bialk`:** `9996f0c`, đã chép lên `/opt/minigame/BotDoMin`. VPS đã cài thêm `@resvg/resvg-js` 2.6.2.
- **netco4.click:** dựng lần cuối 05/10 khuya, đã có Sát Tinh 25% và thưởng cuối ở Lộ Quân Dật.

## 2. Quyền và cách deploy (quan trọng)

- **Claude KHÔNG chạy được `cap-nhat.sh`.** Classifier đã chặn 2 lần ("Blind Apply"), kể cả khi chủ server đồng ý. Đừng lách. Đưa lệnh cho chủ server tự chạy: `cd /opt/tlbb-deploy && ./cap-nhat.sh`.
- **Claude được chạy `systemctl restart tlbb`** khi chủ server yêu cầu. Trước khi chạy, đếm người online ở cả cổng 3731 và 7384. Sau khi chạy, kiểm cgroup.
- **Câu "Restart server ngay?" trong `cap-nhat.sh`:**
  - Lần cap-nhat kế tiếp: vẫn dặn trả lời **N**, rồi `systemctl restart tlbb`.
  - Từ lần sau nữa (khi `grep -c TLBB_TRUC_TIEP /opt/tlbb-deploy/tlbb.sh` ≥ 1): trả lời `y` cũng an toàn, vì `tlbb.sh` gọi tay sẽ tự chuyển sang `systemctl`.
- **Sự cố 06/10 01:31:** restart từ Terminal OneDash bị ngắt giữa chừng, game sập 7,5 tiếng. Có người khác (hoặc chủ server lúc khuya) deploy qua OneDash ngay sau mỗi lần Claude push. **Không biết là ai.** Mỗi lần push, coi như code có thể lên game bất cứ lúc nào.
- **Bot:** Claude được tự deploy (scp → `/tmp` → `tr -d '\r'` → `node --check` → sao lưu → chép → `systemctl restart minigame`). Đổi cấu hình bot thì gọi API cổng SUPER, không sửa `database.json`.

## 3. Đang chờ chủ server quyết

| Việc | Ghi chú |
|---|---|
| Bù đồ **Whynot** 1010100014 (nút "Dọn tủ" ở tiệm) | Danh sách + số lượng thật ở TRANG-THAI mục "Sửa số lượng". Còn 3 Hợp Thành Phù kẹt ở quầy 10 (`stallid 9`, serial 1936972): **đừng để họ bấm "Thêm quầy"**, nhiều khả năng xóa mất. |
| Bù **28 Cao cấp Hợp Thành Phù** cho 1010100018 | Lỗi script hợp thành xóa nguyên chồng (đã vá `96c5872`). |
| Sát Tinh: ngọc 6 **25%/người/boss** | Khoảng 54 viên/ngày cho tổ 6 người, 3 lượt. Đổi số ở dòng `sattinh` trong `roithem.txt` trên VPS (có hiệu lực ngay). |
| Lộ Quân Dật (13465) quá khó | Máu nay 5,86 triệu (90%), công phép 25k. Tổ chưa qua được. Có thể hạ riêng con này (`MonsterAttrExTable`, cần restart). |
| Cảnh báo Discord khi game chết | Đã đề xuất, chưa làm. |
| Đẩy trang bị lên số tối đa (sửa số ngẫu nhiên của món trong DB) | Chưa dò cột lưu số ngẫu nhiên trong `t_iteminfo`. |
| Còn treo từ 05/10 | Kệ 31 bán 30900016 bằng vàng; ải 3 Q (`x950001_g_RoiPhoBan`) chưa đổi tỉ lệ; Thông Thiên Tháp ~20k KNB/giờ; rương Tam Thần ra phiếu; KNB trong túi boss web; nội tức Võ Ý ×12 (~10k) hay ×14 (~12k). |

## 4. Đã deploy nhưng CHƯA kiểm trong game

- Tâm pháp 8 lên **119** khi đăng nhập (`player_login.lua`, cấp ≥ 80). Chưa biết `LuaFnSetXinFaLevel` có cập nhật chỉ số ngay không.
- Tên quái `name=` trong `wuliang_monster.ini` có thật sự hiện "Lê Vũ Minh Hân" trên đầu quái không.
- Kiều Phục Thịnh ở 210,330. Bản đồ nhỏ phía client có thể vẫn chỉ chỗ cũ.
- Hợp thành: đặt chồng > 1 vào một ô phải bị chặn và hiện câu báo.
- Sát Tinh: Lộ Quân Dật ra 5 phiếu/người + túi web, Ngô Dụng / Tống Giang (13456) ra 0 phiếu. Đo bằng Audit log ở lượt tới.
- Ghép Ngọc gửi **ảnh** lên Discord: chưa thấy ảnh thật, chờ lượt luyện đầu hoặc nút 🧪 Gửi thử.

## 5. Bẫy mới học trong phiên 05–06/10

- **Giảm rơi theo chênh cấp không có tác dụng ở cả 2 chiều.** Boss cao hơn người 31 cấp vẫn ra đủ. `ky-vong.js` mặc định `--att khong`.
- **13456 dùng chung cho Ngô Dụng (log ghi "Ngô vĩnh") và Tống Giang.** Gắn phiếu vào DataID dùng chung là trả thưởng 2 lần. Trước khi gắn thưởng, grep `CreateId` / `LuaFnCreateMonster` xem ai gọi DataID đó.
- **`LuaFnEraseItem(ô)` xóa NGUYÊN Ô túi**, cả chồng. Muốn đọc số lượng chồng: `LuaFnGetItemCountInBagPos(sceneId, selfId, ô)` (đã dịch ngược). `LuaFnDelAvailableItem(ID, n)` trừ ở ô bất kỳ nên có thể bị lợi dụng để rửa đồ khóa. `LuaFnEraseItemTimes` đụng `ItemParam`, không phải số lượng.
- **Tiệm người chơi:** `CGPlayerShopSizeHandler nOpt=0` = Thêm quầy, `nOpt=1` = Dọn tủ (bỏ quầy cuối kèm đồ đang bày). Chủ tiệm ghi bằng GUID hex (1010100014 = `3C34E72E`).
- **item log:** cột số lượng chỉ đúng ở op 50/232/233. Số thật lấy trong DB `(p7>>24)&255`. Op 110 = gom/sắp xếp chồng (tạo serial mới), 220 = tách, 414 = xóa/dùng.
- **Trang bị:** số mỗi dòng = cấp phẩm chất × **1 số ngẫu nhiên 0–99 dùng chung cho cả 9 dòng**, tính lại mỗi lần đăng nhập từ `EquipBase` cột 91/100. Tư chất (cột 94–95) không ảnh hưởng các dòng.
- **2 công cụ luật cũ** (`tools/phieu-boss/luat-05-10.js`, `tools/ngoc6/luat-05-10.js`) chạy `--ghi` lại sẽ viết lại 150–350 dòng. Đã thêm chốt `--toi-biet`. Sửa tiếp bằng công cụ nhỏ có kiểm (kiểu `tools/sattinh-cuoi-05-10.js`).
- **Dịch ngược Server:** có `objdump` trên VPS. Tìm chuỗi tên hàm → bảng đăng ký `{tên, hàm}` → disassemble (`-C`) xem đọc mấy tham số và gọi hàm engine nào (mẫu ở TRANG-THAI mục hợp thành).
- **Git Bash nuốt dấu `\`** (regex `/\s+/` thành `/s+/`): viết file `.js` bằng Write, hoặc sửa bằng Edit.

## 6. Công cụ mới trong phiên

| Công cụ | Việc |
|---|---|
| `tools/tim-nguon.js <item> [cấp]` | Mọi hộp/quái rơi 1 món + kỳ vọng mỗi người |
| `tools/mau-boss.js <mới> <đang áp>` | Máu boss = hệ số × gốc (hiện 0,9) |
| `tools/doiten-vls.js <DataID,..> "<tên>"` | Đổi tên quái Võ Ý ở Vô Lượng Sơn (`name=` trong ini) |
| `tools/doi-cho-npc.js <ini> <guid> <x> <z>` | Dời NPC; nhớ sửa thêm `MissionNPC_HashTable.txt` nếu NPC có trong đó |
| `tools/sattinh-ngoc6-05-10.js`, `sattinh-cuoi-05-10.js` | Sát Tinh ngọc 25% (RoiCfg) + đổi chỗ thưởng cuối |
| `tools/hopthanh-tru1-06-10.js` | Chặn hợp thành khi 1 ô có > 1 cái |
| `tools/tamphap8-05-10.js`, `voy-x3-05-10.js`, `vls-hoisinh-05-10.js` | Tâm pháp 119, nội tức ×3, Vô Lượng Sơn hồi sinh 2 giây |
| bot `BotDoMin/ghepngoc.anh.js` | Vẽ ảnh kết quả Ghép Ngọc (SVG → PNG) |
