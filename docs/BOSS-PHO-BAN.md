# Boss và phó bản: sổ tra cứu khi có lỗi

Dùng khi người chơi báo "boss / phó bản X bị lỗi". Mở mục 3 tìm phó bản → biết script nào, boss nào, đã sửa gì, còn gì chưa sửa. Mục 2 tra theo triệu chứng. Mục 4 là công cụ.

Soát toàn bộ lần đầu: **02/10/2026** (17 phó bản trong NPC truyền tống "Phụ Bản", `obj/luoyang/xiezi_fubenchuan.lua`). Mỗi lần sửa xong một phó bản: cập nhật dòng của nó ở mục 3 + ghi vào `docs/TRANG-THAI.md`.

---

## 1. Quy trình khi có báo lỗi (khoảng 15 phút)

1. **Hỏi đúng triệu chứng**: không vào được / vào không ra quái / NPC khiêu chiến không ra boss / boss không chết hoặc hồi máu / boss chết mà không qua ải / không rớt đồ / chữ rác hoặc chữ bị cụt / không nhận túi boss. Mỗi triệu chứng ứng với một dòng ở mục 2.
2. **Tìm script**: mục 3. Phó bản chưa có trong bảng: `node tools/soat-boss/cua.js` (in NPC vào cửa + script của mọi phó bản trong NPC truyền tống).
3. **Quét nhanh**: `node tools/soat-boss/soat.js <ID script> ...` (mọi script của phó bản: NPC, phó bản, boss, quái chết, rương).
4. **Đọc luồng**: `node tools/soat-boss/ham.js <ID> "OnDie|OnLeaveCombat|OnCopySceneTimer|OnEventRequest|OnDefaultEvent"`. AI của quái: số thứ 6 trong `LuaFnCreateMonster(scene, ID, x, z, baseAI, AI, script)` → `Public/Data/AIScript.dat` → `AIScript/scriptNNN.ai` (đọc bằng `gbk.js`).
5. **Kiểm trên VPS**: `ss -Htn state established '( sport = :3731 )' | wc -l` (người online); `Server/Log/luaerror.log` **không ghi tên script**, chỉ có câu lỗi → so câu lỗi với mục 2.
6. **Sửa**: `git tag truoc-<viec>-<ngay>` → sửa **theo byte** (node đọc `latin1`, kiểm nội dung dòng gốc trước khi thay, giữ `\r`) → so cân bằng khối với bản gốc → `git diff` chỉ đúng dòng cần đổi → commit, push → trên VPS kiểm bảng rơi khớp repo (tab Drop Boss sửa thẳng VPS) rồi `./cap-nhat.sh -y`.
   - **Script Lua: không cần restart, nhưng chỉ áp cho lượt gọi MỚI** (bấm NPC, phó bản mới tạo, scene mới nạp). **Phó bản đang chạy giữ code cũ**, kể cả hàm hẹn giờ của nó (kiểm chứng 02/10 23:23 ở Vương Lăng: sau deploy 2 phút, OnCopySceneTimer mới vẫn chưa chạy). Muốn gỡ người kẹt trong phó bản đang mở thì phải cho mọi người ra, đợi phó bản tự đóng (NoUserTime), hoặc restart.
   - Bảng `.txt` / `.ini`: cần restart, chỉ khi 0 người online hoặc chủ server đồng ý.
7. **Ghi lại** ở mục 3 + `docs/TRANG-THAI.md`. Ghi rõ "chưa thử trong game" nếu chưa ai đánh lại.

---

## 2. Loại lỗi đã gặp thật (tra theo triệu chứng)

| Triệu chứng | Nguyên nhân đã gặp | Cách tìm | Cách sửa đã dùng |
|---|---|---|---|
| Vào phó bản **không ra quái, không ra boss** (chỉ khi cả đội cấp 119) | Bậc cấp = `PlayerMaxLevel/10` = 11.9 dùng **thẳng** làm chỉ số bảng Lua → `bang[11.9]` = nil → `return` im lặng (không có trong luaerror.log). **Không** dính nếu số đi qua `LuaFnSetCopySceneData_Param` trước: Param là số nguyên, 11.9 lưu thành 11 (kiểm binary 02/10) | `soat.js` báo `NANG` / `NANG?`, rồi xem số đó đi thẳng vào bảng hay qua Param | `floor( PlayerMaxLevel/10 ) * 10`. Lỗi thật đã sửa: Túc Cầu, Lâu Lan Tầm Bảo. Q Lâu Lan / Q Tô Châu (02/10) đi qua Param 13 nên trước đó vẫn ra quái, bản sửa chỉ nâng quái của đội 119 thêm 9 cấp |
| Đội cấp 119 bấm vào phó bản / nhiệm vụ mà **không được đưa vào** | `LuaFnSetSceneLoad_Monster(scene, "<ten>_monster_" .. iniLevel .. ".ini")` với `iniLevel = PlayerMaxLevel` = 119 → file `_119.ini` **không có** (chỉ có `_10 … _200`, bước 10) → engine không tạo được phó bản | `grep -rn '_monster_" .. iniLevel' Public/Data/Script` + `ls Public/Scene \| grep _monster_119` | `iniLevel = floor( PlayerMaxLevel/10 ) * 10` (Kỳ Cuộc 401001/401002, sư môn, Thủy Lao, nhiệm vụ thành thị…) |
| So tên quái không khớp, cơ chế "con kia chết / dọn quái" không chạy | Chuỗi tên trong Lua là **GBK** (`"萧峰"`) hoặc dịch khác bảng (`"Bất Bình Đạo Nhân"` ≠ bảng `"Bất bình nói người"`) | so byte chuỗi trong `GetName(...) == "..."` với cột 1 `MonsterAttrExTable.txt` (`soat.js` liệt kê tên bảng) | sửa chuỗi cho khớp bảng, hoặc so bằng `GetMonsterDataID` |
| Boss **hồi sinh / gọi phân thân** mà **rơi lại đủ đồ, cả phiếu** | Hồi sinh bằng `CreateBOSS` cùng DataID, phân thân có hộp phiếu 90001/90026 | xem `MonsterDropBoxs` của mọi ID quái boss tạo ra (`soat.js` in danh sách) | `LuaFnDisableMonsterDropBox` lên con hồi sinh (chỉ khi nó không có món rơi qua script), hoặc gỡ hộp phiếu khỏi ID phân thân |
| Lần sau chạy khác lần đầu (bỏ ải, đóng sớm) | **Biến toàn cục** Lua (không `local`) giữ giá trị từ lượt trước trong cùng Lua state | tìm biến gán không có `local` trong hàm boss/phó bản | lưu vào `CopySceneData_Param`, đặt 0 khi tạo phó bản |
| Phó bản này ra quái của phó bản khác | Hai file định nghĩa **trùng tên hàm** toàn cục (Thiên Long Huyễn Cảnh `oloulan_zongkabu.lua` định nghĩa `x401040_*` của Yến Tử Ổ) | `grep -o "function x<ID>_" ` ở các file khác số | đổi tiền tố về đúng số script của file |
| NPC "khiêu chiến" **không ra boss** | Cờ cho phép khiêu chiến (`LuaFnSetCopySceneData_Param`) không bao giờ được bật | đọc `OnEventRequest` của NPC + nơi đặt cờ | đặt cờ đúng chỗ (Binh Thánh: Gia Luật Diễm) |
| Boss **hồi đầy máu**, đánh mãi không chết | Server cũ thay buff gốc của boss bằng `6446` (hồi 50%) hoặc `6781` (hồi 30%) | `soat.js` báo hiệu ứng 6446/6781 | chú thích dòng gắn buff hoặc trả ID buff gốc (Thiếu Thất: Trang Tụ Hiền) |
| Boss **hồi sinh** / "chết hết" không nhận | `GetMonsterCount` đếm cả **xác chết** | `soat.js` báo `GetMonsterCount ... không kiểm LuaFnIsCharacterLiving` | thêm `LuaFnIsCharacterLiving(sceneId, id) == 1` (Binh Thánh: cặp song sinh) |
| File dừng giữa chừng, hàm không tồn tại | File leak bị **cắt cụt** | `soat.js` báo "gọi hàm không có trong file" | khôi phục đuôi file từ `/root/Ubuntu.vmdk` (`grep -abo` rồi `dd`) |
| **Chữ rác** trong hội thoại / thông báo | Chuỗi tiếng Trung (GBK) chưa dịch | `soat.js` báo `VUA chuoi tieng Trung` | viết lại tiếng Việt dạng `\ddd`: `python tools/vn.py "..."` |
| **Chữ bị cụt** giữa câu | Client **cắt mỗi chuỗi đúng 255 byte** (đo ở Tam Thần 02/10: câu 455 byte hiện tới byte 255) | `soat.js` báo `> 254 byte` | rút gọn hoặc tách thành nhiều `AddText` |
| Dấu `?` giữa chữ Việt | Ký tự Trung (vd dấu `、`) không có trong VISCII | đọc bằng `doc.js` | thay bằng dấu phẩy |
| Hàm dừng giữa chừng, log `invalid option in 'format'` | `format("... 50% ...")`: `%` theo sau không phải `d s f…` | `soat.js` báo `format() co "%"` | viết `%%` hoặc bỏ `format` |
| Log `open lua file false!,...` | `Script.dat` trỏ tới file không có (vd file thật bị đổi tên thêm `1`) | so `Script.dat` với thư mục | đổi tên file / sửa Script.dat (cần restart) |
| Giới hạn lượt/ngày **không chặn** | Điều kiện sai (Tam Thần: chỉ chặn khi ≥5 người cùng hết lượt) | đọc `CheckCanEnter` / `CheckAccept` | sửa điều kiện |
| Mở được nhiều lần / reset cờ khác | Dùng **chung ô MissionData** với hệ thống khác (Tam Thần dùng `VIP_SHENMI_SHOP` 426, trùng đoạn "reset vip" trong `scene.lua`) | `grep` tên MD trên toàn bộ script | dùng ô của chính hoạt động (vd cộng 50 vào ô đếm lượt) |
| Phó bản báo "**tạm đóng**" | Server cũ chú thích dòng `AddNumText` nút vào | đọc `OnEnumerate` của NPC | bỏ chú thích (sau khi kiểm map client, xem Phụng Minh Vương Lăng) |
| Không rớt đồ / rớt sai | BoxValue = 1 hộp phiếu, DID = -1 cố ý, `LuaFnDisableMonsterDropBox`, chênh cấp | `README.md` mục "Bẫy dễ dính" | xem README |
| Không nhận túi boss / nhận 2 túi | Thiếu / trùng `TB_Ghi`, boss trong danh sách không phải boss cuối | `NetCo4/roimap.lua` `x950001_TB_Them` + bot `BotDoMin/tuiboss.js` `gan(...)` | sửa **cả hai** nơi (`docs/TUI-BOSS.md`) |
| Loa "X rơi [đồ hiếm]" mà không ai có đồ | Dòng rơi bị chú thích nhưng dòng loa còn bật | đọc `OnDie` của boss | tắt loa (Tam Thần: Trùng Lâu) |

---

## 3. Bảng phó bản

Cột "Đã sửa" ghi ngày + tag rollback. "Chưa thử" = chưa ai đánh lại sau khi sửa.

Đường dẫn script tính từ `server/Public/Data/Script/`. "Lượt" = mỗi nhân vật mỗi ngày. Trạng thái lỗi ở đây là lúc soát 02/10; sửa xong thì gạch / chuyển sang "Đã sửa".

**Đợt sửa 02/10 23:36** (deploy, tag rollback `truoc-dot-sua-02-10b`, commit `903f7bf`…`2367712`). Các mục "Còn mở" bên dưới đã được xử lý như sau:
- Kỳ Cuộc + khoảng 33 script khác (sư môn, Thủy Lao, nhiệm vụ thành thị, Tặc binh, Trung thu): đội ở trần cấp đã vào được (`floor`); tangmen chặn trần 100.
- Q Tô Châu: 11 câu GBK đã Việt hóa, chữ đã đúng. Kỳ Cuộc: dấu "、". Túc Cầu: chữ.
- PMF: chỉ còn 1 Đại Lễ Bao. Tứ Tuyệt: Bàng Xí hết lỗi `buffTbl`, dùng lại chiêu (khoảng 50k diện rộng mỗi 5 giây, cần thử), bỏ tin lặp. Yến Tử Ổ, PMF, Tứ Tuyệt: chữ.
- Lang Huyên: boss chỉ ra chiêu khi đang đánh, thoát giao tranh thì tạo lại NPC. Hư Không: biến toàn cục → Param 13–17, trừ thiếp đúng. Lâu Lan Tầm Bảo: ẩn mục 102. Thiên Long Ảo Cảnh: ĐÓNG hẳn.
- Nhạn Môn, Sát Tinh, Binh Thánh: chữ. Nhạn Môn: so tên Tiêu Phong đúng byte, NPC không còn nhân đôi.
- Binh Thánh: song sinh và phân thân Liên Thành không rơi gì (**bảng rơi, có hiệu lực SAU RESTART**). Liên Thành có thêm 1 bộ hộp của song sinh. Túi boss chuyển sang Liên Thành 15190 (cả game lẫn bot).
- Không sửa theo quyết định của chủ server: AI 242 hồi máu, Thiếu Thất 6781 (hồi 60% một lần, không bất tử), scene.lua đăng nhập, boss thế giới zhaohuan, Tiêu Phong 45410 (không đánh được).
- Phụng Minh Vương Lăng: thử mở 23:01, **đóng lại 23:23** vì nhân vật Hoang kẹt (client không có map).

### Trân Long Kỳ Cuộc (= "Cờ 12h", cấp 10)
- **Vào:** NPC Vương Tích Tân (Lạc Dương 366,228), Trương Dịch Quốc (Tô Châu 267,243), Lưu Trọng Phủ (Đại Lý 287,138). Cả ba dùng script 000090 `obj/luoyang/oluoyang_fuben_zhenlong.lua`. Từ đó đi vào 401001 `event/fuben/efuben_1_zhenlong_huodong.lua` (bản thường) và 401002 `efuben_1_zhenlong2_huodong.lua` (bản nhanh).
- **Điều kiện:** 1 lượt/ngày chung cho 2 bản (`MD_LAST_QIJU_DAY`).
  - Bản thường: mở 11:30–14:30 và 20:30–22:00, cấp ≥10, chế độ tân thủ khi trong đội chênh nhau ≥20 cấp.
  - Bản nhanh: luôn mở, ≥3 người, cấp ≥100.
- **Luồng:** 30 giây chờ, ra 200 quân cờ, rồi bước 201 ra boss Viễn Cổ Kỳ Hồn:
  - bản thường: 1850–1859 và 31850–31859;
  - tân thủ: 12040+, 12090+, 42040+, 42090+.
  - AI 123. Thoát bằng NPC Kỳ Thánh 044000.
- **Túi boss:** gọi `TB_GhiId` trong khối `objType == LastBoss[mgroup]` (60 ID trong roimap).
- **Đã sửa 02/10:** Việt hóa, giờ mở, túi boss.
- **Còn mở:**
  - **Đội toàn 119 không vào được:** script nạp `zhenlong_monster_119.ini` mà file không có (dòng 464/472 ở cả 2 file).
  - `PlayerExpList[plyLevel] > 0` gặp nil sẽ dừng đếm quân cờ, nên boss không ra (hiếm).
  - Dấu ngăn "、" kiểu Trung ở 401002:255/339/365.
  - Bản nhanh báo "đóng sau X giờ" nhưng thực ra không đóng.
  - Thoát bản nhanh về sai tọa độ (`ozhenlong_qisheng.lua:37`).
  - Quân cờ 31770–31809 và tân thủ 42000–42099 (bậc 110+) không có hộp rơi.
  - Script 231001 (bản cũ cùng tên) không vào được. Bạch Mã Tự (230000) vốn đóng từ bản gốc (NPC 000068 và 000089 bị khóa từ 2006), 03/10 đã cho luôn nhánh 230011 phòng khi mở lại.

### Túc Cầu (cấp 30)
- **Vào:** Đồng Quán (Lạc Dương 298,192), script 000004 → phó bản 402040 `event/fuben/efuben_cuju.lua`. Quả túc cầu dùng script 402045 `efuben_cuju_4.lua`. Boss Tôn Mỹ Mỹ 3720–3729 / 33720–33729, AI 216.
- **Điều kiện:** có tổ đội, cấp ≥30, 1 lượt mỗi 24 giờ (`MD_CUJU_PRE_TIME`). Không giới hạn giờ mở.
- **Luồng:** ra 149 quả nhỏ. Ở các bước 24/54/124 ra 3 quả lớn. Hết quả thì ra Tôn Mỹ Mỹ.
- **Thưởng:** mỗi quả có 30% rơi Tử Vi Linh Phách cho từng người. Không có túi boss.
- **Đã sửa 02/10:** lỗi cấp 119 (thật, chỉ số dùng thẳng), giá trị rơi 30%.
- **Còn mở (chỉ là chữ):**
  - Ghi "ít nhất 3 người" nhưng code cho 1.
  - Ghi "một tháng một lần" nhưng code là 24 giờ.
  - NPC ghi giờ mở mà code không kiểm giờ.
  - Mục menu 999 bấm không có tác dụng.
  - Bộ đếm "N/149" so sai tên.

### Q Tô Châu (Liên hoàn 3 trong 1, cấp 30)
- **Vào:** Tiền Hoành Vũ (Tô Châu 134,260), script 001065 → 050100 `event/xunhuan/boundary_between_song_and_liao.lua`, map `sancaixiagu`. Quái chết gọi 1130 `sancaixiagunpc_die.lua`; quái ải 3 dùng 950001.
- **Điều kiện:** 5 lần nhận nhiệm vụ mỗi ngày, có tổ đội, mọi người phải đã nhận nhiệm vụ.
- **Luồng:** 3 ải, mỗi ải 30 phút.
  - Ải 1: 50 Ngụy quân, Phó Đô Thống, 10 phạm nhân, Đô Thống, rồi Dư Độc.
  - Ải 2: 80 Dã Hùng rồi Hồng Hùng Vương (chạy hết đường thì hồi máu, đây là thiết kế gốc).
  - Ải 3: 50 quái rồi Sơn Trại Đại Vương 4130–4139 / 34130–34139.
- **Túi boss:** có, ở Sơn Trại Đại Vương.
- **Đã sửa:** 02/10 đổi `floor` ở dòng 471. Đây không phải lỗi thật vì giá trị đi qua Param 13; bản sửa chỉ nâng quái thêm +9 cấp cho đội 119.
- **Còn mở:**
  - 11 chuỗi GBK trong 1130: chỉ đường sang ải 2/3, "Đã giết n/m", danh hiệu boss (dòng 223 là "菜鸡熊王", tức "gà mờ").
  - Quái ải 3 luôn cấp 100 vì dùng ID cố định 4149/4159/4169, nên đội cấp thấp không qua được.
  - Lệnh bài 40004315 không bị thu khi trả nhiệm vụ.
  - Chữ ghi "3 người", "Hoa Kiếm Ảnh" (nhiệm vụ đã đóng), tọa độ NPC sai.

### Q Lâu Lan (Liên hoàn, Viêm Ma Sơn, cấp 75)
- **Vào:** Hà Duyệt (Lâu Lan 295,68), script 050110 → 050220 `event/xunhuan/xinsanhuan_1.lua`. Quái chết gọi 1129 `yamoshannpc_die.lua`; quái ải 3 dùng 950001. AI boss 262–269 (chỉ có chiêu đánh).
- **Luồng:** 5 lượt/ngày, mỗi ải 30 phút.
  - Ải 1: 60 thổ phỉ, Ngưu Khúc, Ngưu Kỳ, rồi Vương Diêm.
  - Ải 2: 5 đợt (mỗi đợt 15 quái và 1 boss), rồi Hồng Kích Yêu Vương.
  - Ải 3: 25 quái và Hỏa Diễm Yêu Ma 13260–13269.
- **Đã sửa 02/10** (tag `truoc-fix-lltb-119-02-10`):
  - Việt hóa 10 thông báo trong 1129.
  - Túi boss chuyển sang Hỏa Diễm Yêu Ma (cả roimap lẫn bot).
  - Câu "chưa đủ 30" sửa thành 75.
  - `floor` cấp 119: không phải lỗi thật (đi qua Param 13), chỉ nâng quái +9 cấp.
- **Còn mở:** quái thấp hơn người chơi khoảng 15 cấp (bảng quái bước 5 cấp, script chia bước 10). Đây là thiết kế gốc. Chưa thử trong game.

### Lâu Lan Tầm Bảo (cấp 75)
- **Vào:** Kim Cửu Linh (Lâu Lan 163,79), script 001168 → 808039 `event/huodong/seek_treasure.lua`. File này vừa là phó bản vừa là script quái chết.
- **Điều kiện:** ≥3 người, 1 lượt/ngày (MD 240). Mở 11:30–14:30 và 19:30–22:00.
- **Luồng:** 50 đợt × 4 rương = 200 con (sau 90 giây rương biến thành Đồng Tử). Giết đủ thì ra boss Trấn Bảo Long Vương 12138–12146 (AI 271).
- **Túi boss:** có.
- **Đã sửa:** lỗi cấp 119 (thật).
- **Còn mở:**
  - Mục đổi đồ 102 trong `oloulan_jinjiuling.lua:70-82`, dành cho môn phái số >9 (Cô Tô, Đường Môn, Quỷ Cốc): trừ 20 sách nhưng trả vật phẩm 10124199 không tồn tại.
  - `num < 19` phải là `< 20`.
  - NPC rời phó bản có tên GBK.

### Thiên Long Ảo Cảnh / Huyễn Cảnh (cấp 80 theo code) — coi như ĐÓNG
- **Vào:** NPC "Thiên Long Huyền Cảnh" (Lâu Lan 178,117), script 001155 → 001151 `obj/loulangucheng/oloulan_zongkabu.lua`. Toàn bộ phó bản nằm trong file này. Bản `event/xunhuan/TianlongHuanjing.lua` (050000) không ai gọi.
- **Luồng:** cần 1 Thí Luyện Lệnh Bài 20310193, 5 lượt/ngày. Linh Thước Tiên Tử mở 8 đợt × 22 quái, rồi ra boss Đế Thích Thiên 15605 (AI 242).
- **Còn mở:**
  - Lệnh bài gần như không kiếm được: chỉ rơi ở hộp 50008 với BV 999999. NPC còn hiện "chưa mở".
  - Boss và quái không có hộp rơi.
  - **Trùng 8 hàm `x401040_*` với Yến Tử Ổ.**
  - 30 chuỗi GBK.
  - Bấm lại "Bắt Đầu Khiêu Chiến" làm các đợt chạy lại từ đầu.
  - `targetId` nil.
  - Muốn mở thì phải làm lại gần hết.

### Thảo Phạt Yến Tử Ổ (cấp 60 theo code)
- **Vào:** Lý Cương (Thái Hồ 69,120), script 004002 → 401040 `event/yanziwu/yanziwu_1.lua`. Quái chết gọi `obj/yanziwu/*.lua` (402240–402262). Boss cuối Mộ Dung Phục `murongfu.lua` 402254, AI 244.
- **Điều kiện:** 3 lượt/ngày (MD 195).
- **Luồng:** Nhạc Lão Tam → Diệp Nhị Nương + Vân Trung Hạc → Đoàn Diên Khánh → các đợt tấn công (`g_SoDotCuoi = 2`, có Cưu Ma Trí) → 4 Môn Thần → Mộ Dung Phục.
- **Túi boss:** có, ID 9430–9439 và 39430–39432.
- **Còn mở:**
  - Câu báo hoàn thành ở `murongfu.lua:46` là chữ GBK.
  - 2 tháp nỏ so tên sai nên không có nút sửa và không bắn.
  - Trang đinh so tên sai.
  - Chữ ghi "3 người".

### Phiêu Miểu Phong (cấp 75)
- **Vào:** Trình Thanh Sương (Lâu Lan 189,218), script 001159 → bản nhỏ 402276 `event/piaomiaofengsmall/epiaomiaofeng_small.lua` (quái cấp 75) và bản lớn 402263 `event/piaomiaofeng/epiaomiaofeng.lua` (quái cấp 95).
- **Điều kiện:** ≥3 người. Mỗi bản 2 lượt/ngày, bộ đếm riêng (MD 232 và 234).
- **Luồng:** Cáp Đại Bá → Tang Thổ Công → Ô Lão Đại → Phù Mẫn Nghi mở song sinh Trác Bất Phàm + Bất Bình → Đại Lễ Bao → Lý Thu Thủy 9546 (bản lớn) / 9666 (bản nhỏ).
- **Túi boss:** có, ở 9546 và 9666.
- **Còn mở:**
  - **`ai_zhuobufan(_small).lua:52`: `BrotherName = "Bất Bình Đạo Nhân"` nhưng bảng ghi "Bất bình nói người".** Hậu quả: ra 2 Đại Lễ Bao (hộp phiếu ×2), Bất Bình không cuồng bạo.
  - Bất Bình bản lớn dùng AI 270 (khó hơn), bản nhỏ dùng 261.
  - Lý Thu Thủy bản lớn không có hộp phiếu 90001 (cần chủ server xác nhận).
  - Chữ ghi "chưa đủ 50" (code là 75), thiếu dấu cách; `oloulan_shisao.lua:17` có ký tự `?` lẫn vào chữ.

### Tứ Tuyệt Trang (cấp 70 theo code)
- **Vào:** Phan Thanh Thanh (Tô Châu 195,214), script 001090 → 893063 `event/sijuezhuang/esijuezhuang.lua`.
- **Điều kiện:** 3 lượt/ngày (MD 222).
- **Luồng:** gõ chuông → Mẫn Mặc 14106 → Đào Thanh 14132 → Tần Vận 14125 → Lý Phàm → Bàng Xí 14145 (893069). Tất cả cấp 120.
- **Thưởng:** ngọc cấp 6 cho mọi người, cộng 2 món theo tỉ lệ.
- **Túi boss:** có, ở Bàng Xí.
- **Còn mở:**
  - **Bàng Xí: `ai_liqiushui.lua:401/559` dùng `buffTbl` = nil**, báo lỗi Lua mỗi giây (67 dòng trong log), boss mất chiêu A/C/D và không cuồng bạo.
  - Tin "trảm Mẫn Mặc" phát lại toàn server 3 lần, vì `AddGlobalCountNews(str)` dùng biến `str` cũ.
  - Long Trụ không bao giờ ra (khóa trong code là `"Mu_Boss"`, bảng là `"Mu_BOSS"`). Khi sửa cẩn thận: `Huo_BOSS = 14140` là Bàng Xí cấp 70 có hộp phiếu.
  - `x893066_x893066_SkillID_G` gõ nhầm, chiêu đó không ra. Nếu sửa thì chiêu gây khoảng 102 nghìn sát thương mỗi 10 giây.
  - Script 890039 `"DROPTTT"` không tồn tại, nên phần rơi thêm của 3 boss đầu bị mất.
  - Chữ ghi "dưới 50" (code là 70).
  - Các buff cơ chế đều trỏ vào impact giữ chỗ, nên không có tác dụng. Đây là độ khó thấp hơn gốc, không phải cài lén.

### Thiếu Thất Sơn (cấp 75)
- **Vào:** Chu Đan Thần (Đại Lý 70,59), script 002096 → 890063 `event/shaoshishan/epiaomiaofeng.lua`. Thư mục `event/shaoshi/` là bản chép không đăng ký.
- **Luồng:** Cưu Ma Trí 14249 → Trang Tụ Hiền 14244 → Mộ Dung Phục 14239 → Diêu Bá Đương 14224 + Tư Mã Lâm 14229 → Đinh Xuân Thu 14234.
- **Đã sửa 02/10** (tag `truoc-fix-trangtuhien-03-10`): Trang Tụ Hiền hồi đầy máu vì server cũ thay buff gốc bằng 6446.
- **Còn mở:** khi một trong hai Diêu Bá Đương / Tư Mã Lâm chết, con còn lại cuồng bạo và nhận `6781` (hồi 30% × 2) thay cho buff gốc 10253/10254. Chờ chủ server quyết.

### Huyết Chiến Nhạn Môn Quan (cấp 108 theo code)
- **Vào:** Tiêu Phong (Lạc Dương 295,224), script 391201 `event/xuezhanymg/oxiao.lua` → 391200 `exiao.lua`. NPC trong phó bản dùng 391211 `bs1.lua`. Hồng Cơ dùng 391212 `bs2.lua`. Quái chết gọi `bs3`–`bs6`.
- **Điều kiện:** 5 lượt/ngày (MD 267).
- **Luồng:** ải 0 (25 quái) → Gia Luật Tân 45414 → Gia Luật Uyển 45415 → Gia Luật Nguyên 45416 → Gia Luật Hồng Cơ 45417 (17 triệu HP).
- **Túi boss:** không có.
- **Còn mở:**
  - Toàn bộ thoại và nút của NPC trong phó bản (`bs1.lua`) là chữ GBK.
  - **So tên `"萧峰"` (GBK) nên Tiêu Phong chiến đấu 45410 không bị dọn, mỗi ải thêm 1 con. Con này thù địch và có hộp phiếu 90026.** Ở ải 0 bấm lại nút không giới hạn, nghi là nguồn farm phiếu.
  - `CheckHaveBOSS` đếm cả xác, nên nút ải sau bị chặn tới khi xác biến mất.
  - Cơ chế bẫy hỏng (SpecialObj 750–753 không tồn tại, tên GBK, impact giữ chỗ), làm boss dễ hơn.
  - Biến toàn cục `times` không reset.
  - Chữ ghi "120 cấp", "3 người", "đống".

### Sát Tinh / Sinh Tử Lôi Đài (cấp 80)
- **Vào:** Khô Vinh Đại Sư (Đại Lý 131,77), script 892009 `obj/shengsi/shengsileitai.lua`. 12 NPC (892010–892021) gọi boss; boss chết đi qua `x892009_OnDie` rồi 501000 `petdropper.lua`.
- **Điều kiện:** 3 lượt/ngày (MD 198). Phó bản đóng cứng sau 18 phút.
- **Luồng:** 12 boss cấp 120, không theo thứ tự.
- **Túi boss:** chỉ tính Ngô Vĩnh 13456 của NPC Ngô Vĩnh (`x950001_TB_SatTinhDuoc`), 1 túi/lượt.
- **Lưu ý thưởng:** **hộp phiếu 90001 có ở cả 11 DataID** (13447…13537), tức 12 phiếu/người/lượt. CLAUDE.md đang ghi "chỉ Võ Tòng", cần chủ server chốt.
- **Còn mở:**
  - Chỉ cần giết đúng Ngô Vĩnh là có túi.
  - AI 254 (Quan Thịnh 13483, Tần Minh 13519) hồi 50% máu 1 lần khi dưới 50%.
  - NPC hiện "Phụ Bản Tạm Đóng để fix lỗi" dù đang mở.
  - `x892009_g_MissionId` nil khi hết giờ.
  - `songjiang.lua` còn handler ẩn 210.

### Hư Không Huyền Cảnh (1 người)
- **Vào:** Hoàng Vân Thiện (Lạc Dương 217,242), Kim Ức Phong, Độc Cô Hối, đều script 900048 `MyLua/MiJI/xukonghuanjing.lua`. Từ đó đi qua giao diện client → 890059 `MiJI/3.lua` → phó bản 890057 `MiJI/1.lua`. Boss dùng 890058 `MiJI/2.lua`.
- **Luồng:** mỗi lượt đánh 5 trong 25 boss (16303–16327, cấp 95).
- **Còn mở:**
  - **`killmosternum` và các biến hẹn giờ là biến toàn cục, không reset.** Lượt bị bỏ dở làm lượt sau bắt đầu giữa chừng.
  - `3.lua:55-96` đếm Ngũ Hành Pháp Thiếp 2 lần cùng ID 38000527, nên trừ thất bại và mất thiếp.
  - `AddThiep` chưa khai báo.
  - Hết giờ lại báo "hoàn thành".
  - Còn dòng debug WJMISS.
  - HP boss 16325, 16309, 16311 lệch bất thường.
  - NPC thứ 2 ở Đại Lý bị comment mất tọa độ.

### Lang Huyên Phúc Địa (cấp 100 theo code)
- **Vào:** Lý Thanh La (Đại Lý 293,91) và Vu Tình Vũ, script 002099 `obj/dali/odali_liqingluo.lua` → 002052 `odali_lanlan.lua` (bản thường, boss cấp 90) và 002047 `odali_yahuan.lua` (bản khó, cấp 110).
- **Điều kiện:** 3 lượt/ngày chung cho 2 bản (MD 214).
- **Boss:** 4 boss mỗi bản (43970/71/73/75 và 43982/83/85/86), AI 242.
- **Còn mở:**
  - **Chốt "đang chiến đấu" ở OnHeartBeat bị comment.** Kết quả: từ lúc sinh ra, mỗi boss cứ 5 giây gắn Huyết Độc Chú 6060 cho toàn phó bản và khoảng 60 giây làm choáng 1 người.
  - Boss thoát chiến đấu là bị xóa luôn (dòng tạo lại bị comment).
  - Chữ ghi "6 người, 1 lần/ngày", code là 1 người và 3 lượt.
  - Không có NPC rời phó bản.

### Binh Thánh Kỳ Trận (cấp 100 theo code)
- **Vào:** Cao Dương (Lâu Lan 205,175), script 894062 `obj/bingshen/bingshen.lua` → 894063 `event/bingshen/ebingshen.lua`.
- **Điều kiện:** 3 lượt/ngày (MD 225).
- **Luồng:** Tiêu Dật Phong 15110 → song sinh Tiêu Như Quân 15130 + Tiêu Như Úy 15135 → Gia Luật Diễm 15175 → (Lý Phạn) Gia Luật Liên Thành 15190, boss cuối thật.
- **Đã sửa 02/10:** Gia Luật Diễm không ra boss; song sinh hồi sinh khi cả hai đã chết.
- **Còn mở:**
  - **Song sinh: giữ 1 con sống, con kia hồi sinh sau 30 giây với cùng DataID nên rơi lại đủ, kể cả phiếu → farm vô hạn.**
  - **Phân thân Liên Thành 15185 (hộp 90001) và 15200 (hộp 90026): mỗi 60 giây ra 1 cặp khi boss ≤60% máu → khoảng 2 phiếu/người/phút, kéo dài được tới 3 giờ.**
  - Túi boss gắn ở Diễm (ải 3) thay vì Liên Thành.
  - Kỹ năng K kiểm phân thân bằng ID sai (15085/15100), tên "石堆" và "地府牛妖" là GBK.
  - Script 894101 không đăng ký.
  - "Type=0 mỗi 12–15 giây" là bẫy SpecialObj 188 do kỹ năng G của song sinh tạo, vô hại.

### Phụng Minh Vương Lăng (cấp 85) — MỞ THỬ 02/10 23:01 (tag `truoc-mo-vuonglang-02-10`), chờ thử bằng bia1
- **Vào:** Tiêu Lăng (Phượng Minh Trấn 288,67), script 900069 → 900070 `MyNew/CSWL/efuben_wangling.lua`. Rương dùng 900071 `wanglingbox.lua`.
- **Luồng:** 9 Long Trụ → 3 long mạch → boss Thủ Lăng Giám 15344–15347 → 8 Kim Bảo Rương (nguyên liệu Long Văn).
- **Đóng ở đâu:** nút vào bị comment ở `efuben_wangling.lua:107`.
- **Rủi ro khi mở:** client không có map `chengshiwangling` (chỉ có `fengmingwangling_new`).
- **Đã sửa 02/10** (commit `d2477aa`):
  - Rương: số ngẫu nhiên 401–700 (**30%** số lần mở) ra món nil, mất chìa. Nay gom món đã bốc rồi mới bỏ vào rương.
  - Loa "đã mang đội tiến vào" chỉ phát khi vào được.
  - Chữ "3 người" / "d?i ngu", `targetId` nil, Paopao truyền tên boss nil.
- **Chờ thử:** map client, đi tới tế đàn (48,48), 9 Long Trụ có ra không. Hỏng thì chú thích lại dòng 107.

### Tam Thần Ảo Cảnh (cấp 80 theo code)
- **Vào:** Thương Lăng Tử (Phượng Minh Trấn 286,81), script 044801 `obj/fengmingzhen/ofenming_canglingzi.lua`. NPC này bán Côn Ngô Tiên Thược 38001514 (100.000 KNB) và Côn Ngô Bí Thược 38001515 (50.000 KNB), rồi đưa vào 894000 `New/sanshen/efuben_sanshen.lua`.
- **Luồng:** 3 Thương Lăng Tử bên trong (894001–894003) gọi 3 boss:
  - Nứt Hải Ma Long 42967 (894004);
  - Diệt Thế Hỏa Phượng 42969 (894005);
  - Phệ Hồn Hoa Yêu 42975 (894006).
  - Hoa Yêu chết thì ra 3 rương Thiên/Địa/Nhân (894007 `yehuo.lua`).
- **Đã sửa 02/10** (tag `truoc-fix-tamthan-02-10`):
  - Rương Nhân miễn phí (đúng chữ của chính rương).
  - Cờ "đã mở rương hôm nay" chuyển sang ô 294 (+50), không dùng ô 426 nữa.
  - Giới hạn 5 lượt/ngày giờ chặn thật.
  - KickOut đọc đúng tọa độ.
  - Bảng chặn gọi 2 boss cùng lúc.
  - Tắt loa rơi Trùng Lâu giả.
  - Viết lại chữ dưới 255 byte.
- **Còn mở:**
  - Boss dùng AI 242: dưới 10% máu thì 80% khả năng hồi 50% (6446) 1 lần.
  - Mỗi boss rơi Tọa Kỵ 35%/người.
  - Chưa thử trong game.

### Ác Bá đánh lén môn phái (không có trong NPC Phụ Bản)
- Script tạo NPC 808015 `event/huodong/eTouximenpai_Generate.lua` (Activity, lịch ở `Public/Config/ActivityNotice.txt`: 00, 04, 10, 12, 16, 20, 22 giờ) → NPC quái 486 script 808017 `obj/huodong/oTouximenpai_NPC.lua` → `event/huodong/eTouximenpai_NPC_<phái>.lua` (808016–808044, phó bản `<map>_1.nav`). Chỉ đệ tử đúng phái, cấp ≥20, có tổ đội.
- **Đã sửa 02/10** (tag `truoc-fix-acba-02-10`): đội cấp trần nạp `<map>_monster_119.ini` không có → không vào được (assert log 22:30:22). Thiếu Lâm chặn trần 100.
- **Đã sửa 03/10** (tag `truoc-fix-acba-boss-03-10`): (1) người giết Lâu La thứ 30 cấp ≥ 110 và ≥ cấp tối đa → `monsterLevel = 9` = quái số 9 **Đoàn Chính Minh** (NPC) thay cho Ác Bá → nay dùng công thức nhánh 110+ (33670 + cấp/10 - 11); (2) boss 33670+ tên "Ác bá" (b thường) còn script so "Ác Bá" → giết không tính, nay nhận cả 2; (3) **Đường Môn** so tên bằng GBK (喽啰/恶霸) trong khi bảng quái tên VISCII → giết Lâu La không đếm, boss không bao giờ ra → đổi sang VISCII. Ngày mở (trần 89) chỉ nhân vật ≥ 110 (GM) dính (1).
- **Còn mở:** bấm hỏng (vd hết ô phó bản) vẫn xóa NPC Ác Bá; chữ "chí ít 3 người" nhưng code cho 1 (trừ Đường Môn 3).

### AI dùng chung có hồi máu (ảnh hưởng nhiều phó bản)
- **AI 242** (`AIScript/script242.ai` dòng `4:`): chiêu 604 → SkillData 14157–14168 → **6446 hồi 50%**. Boss dưới 10% máu, 80% khả năng, 1 lần/trận. Chú thích trong file ghi "5%" nhưng code là 10%.
  - Dùng cho: Tam Thần, Lang Huyên (8 boss), Đế Thích Thiên, Bao Bất Đồng ở Yến Tử Ổ…
  - Sửa: xóa dòng `4:`. File `.ai` cần restart.
- **AI 254:** chiêu 589 → 6446, khi dưới 50% máu, 1 lần. Dùng cho Quan Thịnh và Tần Minh (Sát Tinh) và quái `xinsanhuan_monster.ini`. Có thể là thiết kế gốc.

---

## 4. Công cụ (`tools/soat-boss/`, chạy bằng node trên máy nhà)

| Lệnh | Việc |
|---|---|
| `node tools/soat-boss/cua.js` | Mọi phó bản trong NPC truyền tống → NPC vào cửa (tên, tọa độ) → script |
| `node tools/soat-boss/soat.js <ID>...` | Quét theo các loại lỗi ở mục 2 + liệt kê quái/boss (dấu `*` = không có hộp rơi). Chỉ là gợi ý, phải mở code xem lại |
| `node tools/soat-boss/ham.js <ID> "<regex>"` | In riêng các hàm cần đọc, đã giải VISCII + `\ddd` |
| `node tools/soat-boss/doc.js <ID> [từ] [đến]` | In file, giải VISCII |
| `node tools/soat-boss/gbk.js <ID> "<regex>" [ngữ cảnh]` | Đọc chú thích / chuỗi tiếng Trung, file `.ai` |
| `node tools/soat-boss/tim.js "chữ tiếng Việt"` | Tìm chữ trong game (VISCII thường lẫn `\ddd`) → file:dòng |

`<ID>` là số trong `Public/Data/Script.dat` (vd `894000`) hoặc đường dẫn tính từ `Public/Data/Script`. Git Bash trên máy nhà chặn `awk`, `iconv`, `find`, `xargs`: dùng các công cụ này thay thế. Viết script node bằng file, không dùng `node -e` (heredoc làm mất dấu `\`).

---

## 5. Ghi chú engine đã kiểm chứng

- **255 byte / chuỗi** hiển thị (AddText, AddNumText, tip, loa). Tiếng Việt VISCII 1 byte/chữ, `\ddd` trong file chỉ tính 1 byte lúc chạy.
- `luaerror.log` không có tên script, thời gian. Muốn biết lỗi của ai: lấy câu lỗi, tìm mẫu tương ứng bằng `soat.js` hoặc `grep`.
- `GetMonsterCount` / `GetMonsterObjID` gồm cả xác chết còn trên đất.
- Nhiều script so **tên quái** (`GetName(...) == "..."`) để biết mình là boss nào. Đổi tên quái trong `MonsterAttrExTable.txt` là làm hỏng script (Tam Thần: boss1–3, rương Thiên/Địa/Nhân).
- Phó bản cần map ở **cả hai phía**: server `Public/Scene/<ten>.nav/.scn` + client `Data/Scene.axp` có `<ten>.Scene/.Terrain/.GridInfo`. Kiểm client: `grep -a -o "<ten>[A-Za-z0-9_.]*" Data/Scene.axp | sort -u`.
- **Nhân vật kẹt trong phó bản** (vd client không có map): mỗi lần đăng nhập, server đưa nhân vật về lại scene phó bản nếu nó còn mở. Khi phó bản đã đóng, server dùng vị trí dự phòng `t_char.bkscene / bkxpos / bkzpos` (là chỗ đứng trước khi vào). Cách gỡ: mọi người ra khỏi phó bản, đợi hết `NoUserTime` (thường 300 giây), rồi mới đăng nhập lại. GUID trong log server viết dạng hex (1010100004 = `3C34E724`).
- `LuaFnSetCopySceneData_Param` (0–31): 0 = loại phó bản (`FUBEN_*`), 1 = script phó bản, 3 = scene vào, thường 4/5 = tọa độ vào. Các ô khác mỗi phó bản tự dùng, đọc đầu file.
- MissionData không còn ô trống an toàn (389 ô có tên trong `ScriptGlobal.lua` + 15 tên khai báo nơi khác, ô "trống" thấp thường là của engine). Cần cờ mới thì ghép vào ô của chính hoạt động.
- `scene.lua` `x888888_OnScenePlayerLogin`: đoạn "reset vip" của server cũ `return` sớm khi ô 426 == 1 → **phần sau của hàm đăng nhập gần như không bao giờ chạy** (xem `docs/TRANG-THAI.md` 02/10). Đừng dùng ô 426 cho việc khác.
