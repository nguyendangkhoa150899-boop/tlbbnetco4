# Bàn giao cho phiên Claude tiếp theo (06/10/2026, 17:30)

**Đọc theo thứ tự:**
1. `CLAUDE.md` (quy tắc bắt buộc của repo game).
2. File này.
3. `docs/TRANG-THAI.md`: nhật ký chi tiết, đọc từ cuối lên.
4. Bot web: README của repo bot `bialk` (`BotDoMin/README.md`).

Tài liệu riêng từng tính năng nằm trong `docs/`: `THUONG-PHO.md`, `TUI-BOSS.md`, `GHEP-NGOC.md`, `VONG-QUAY.md`, `BOSS-PHO-BAN.md`, `SHOP-TRONG-GAME.md`.

Chủ server nói tiếng Việt và muốn được trả lời bằng tiếng Việt. Khi họ chỉ **hỏi / nhờ check** thì trả lời rồi dừng, không tự sửa.

## 1. Trạng thái lúc bàn giao

| Thành phần | Trạng thái |
|---|---|
| **Game** | Chạy từ 06/10 **14:23**, đủ 6 tiến trình trong `tlbb.service`. Khóa cấp **89**, exp **×5**. Hai số này nằm trong `NetCo4Cfg/capmax.txt` và `expparam.txt`; `cap-nhat.sh` tự áp lại. |
| **Repo game** (`tlbbnetco4`) | VPS đã deploy **`1e0ee14`**. Các commit sau đó chỉ là docs. |
| **Panel GM** (`panel/panel.py`, 8443) | Restart 14:36, đã có bản sửa tên nhân vật. Tên hiện đúng: ÁnhDương / HuyềnSát / HỏaThần. |
| **Bot** (`bialk`, `/opt/minigame/BotDoMin`) | VPS chạy **`8a7d86a`** (dọn Palworld đợt 1) từ 16:54. **Commit `a5a109c` (dọn Palworld đợt 2) CHƯA deploy**, xem mục 3. |
| **netco4.click** | Dựng lần cuối 05/10 khuya. Chiều nay không đổi tỉ lệ rơi nên không cần dựng lại. |

## 2. Quyền và cách deploy (quan trọng)

- **Claude KHÔNG chạy `cap-nhat.sh`.** Classifier đã chặn nhiều lần ("Blind Apply"), đừng lách. Đưa lệnh cho chủ server: `cd /opt/tlbb-deploy && ./cap-nhat.sh`.
  - Script NPC (CDK.lua…) tự nạp lại, không cần restart game.
  - Bảng `Server/Config/*.txt` và `Public/Config/*.txt` cần restart game.
  - Panel GM chạy thẳng từ `/opt/tlbb-repo`, nên sau `cap-nhat.sh` phải chạy thêm `systemctl restart tlbb-panel` (script không tự restart panel).
- **Câu "Restart server ngay?"**: trả lời `y` giờ đã an toàn. `tlbb.sh` gọi tay sẽ tự chuyển sang `systemctl`, có chốt `TLBB_TRUC_TIEP`. Nếu có người online thì trả lời `N` rồi hẹn giờ.
- **Claude được chạy `systemctl restart tlbb` khi chủ server yêu cầu.** Trước khi chạy, đếm người online ở cổng 3731 và 7384. Sau khi chạy, kiểm cgroup.
- **Bot: Claude được tự deploy.** Các bước:
  1. Lấy bản LF từ commit: `git show HEAD:BotDoMin/<file>`. Bản làm việc trên máy là CRLF.
  2. scp file lên `/tmp` của VPS, chạy `node --check`.
  3. **So md5 file trên VPS với commit trước đó.** Có thể người khác đã sửa trên VPS.
  4. `systemctl list-jobs | grep -c tlbb` phải bằng 0. Nếu game đang restart mà restart bot thì mọi web chết theo.
  5. Sao lưu file cũ vào `/opt/tlbb-backup/…`, chép file mới, `systemctl restart minigame`.
  6. Xem `journalctl -u minigame` và curl các cổng 3002 / 1234.
  - File client (`/tp.js`, `/tb.js`, `/gn.js`, `/br.js`) được đọc lại mỗi lần tải trang, chỉ cần chép file, không cần restart.
- **Đổi cấu hình bot:** gọi API cổng SUPER bằng script chạy trên VPS. Script đọc `PANEL_SUPER_PASSWORD` từ `.env` và **không in ra**. Mẫu: lần sửa túi boss 06/10. Không sửa `database.json` khi bot đang chạy. Nếu bắt buộc phải sửa: dừng bot, sao lưu, sửa, chạy lại (mẫu: lần gỡ ngọc test 06/10).
- Có người khác (hoặc chủ server lúc khuya) deploy qua OneDash ngay sau khi Claude push repo game. **Mỗi lần push repo game, coi như code có thể lên game bất cứ lúc nào.**

## 3. VIỆC ĐẦU TIÊN: deploy bot `a5a109c` (dọn Palworld đợt 2)

Đã kiểm kỹ trên máy:
- `node --check` và eslint `no-undef` không lỗi;
- mọi `ctx.X` của web / panel đều còn trong `index.js`;
- chạy bot với `discord.js` giả (repo bot `BotDoMin/thu/bot-gia/`): 0 lỗi;
- database mới chạy 2 lần thì shop vẫn rỗng;
- test repo khớp bản gốc.

Chưa deploy vì chủ server vắng nhà. Các bước:
1. Hỏi chủ server có muốn deploy không.
2. Deploy 3 file `index.js`, `webplay.js`, `panel.js` theo mục 2. Trên VPS **xóa thêm `BotDoMin/palworld.js`** (đợt 2 không còn `require` nó, file trên VPS vẫn còn).
3. md5 trên VPS phải khớp `git show 8a7d86a:BotDoMin/<file>`:
   - `index.js` = `070c981b2f29`
   - `webplay.js` = `a44133d07474`
   - `panel.js` = `6a02834c7e10`
4. Sau deploy, kiểm:
   - panel SUPER: tab **🐉 Thiên Long & KNB** (id mới `tlbb`), lưu liên kết nhân vật (route mới `/api/tlbb/lienket`);
   - trang Chuyển/Rút của người chơi: không còn thẻ nạp;
   - thẻ nợ ghi đúng luật;
   - shop mua thử 1 món bình thường và 1 món nhóm **🔥 Hàng giới hạn** (hạn mỗi ngày phải còn chạy).

Rollback: tag `truoc-don-palworld-dot2-06-10`, hoặc thư mục sao lưu tạo lúc deploy.

## 4. Việc đã làm ngày 06/10 (chi tiết trong TRANG-THAI)

| Việc | Ở đâu |
|---|---|
| 🏪 **Thương Phố**: kho đồ web theo nhân vật. NPC Ví Web chuyển túi Đạo cụ / Nguyên liệu ra, web rút về đúng nhân vật, đồ cố định giữ khóa. Kèm lịch sử, gộp ngọc, hộp xác nhận `gConfirm`, tắt khẩn cấp bằng file `thuongpho-tat`. | `docs/THUONG-PHO.md`; bot `thuongpho.js`, `thuongpho.client.js`; `CDK.lua` |
| Đồ chế: vật liệu 8 từ C9 100% còn C9 2% (bậc thang VL6/7/8 = 6,03 / 6,51 / 6,69); sửa cột Nhẫn trỏ nhầm mã. **Chủ server đã kiểm trong game, OK.** | `ItemSegAffect.txt`, `ItemSegQuality.txt`; TRANG-THAI 14:14 |
| Túi đồ boss: cả 16 hoạt động cho Miên Bố / Bí Ngân 8 ×2–3 | cấu hình bot (API SUPER) |
| Rương Ích Kỷ: bỏ Bán (ép đi Ghép Ngọc); phiếu KNB chỉ còn nút Sử dụng (cộng thẳng KNB web) | bot `707b520` |
| Tên nhân vật bị MySQL mã hóa 2 lần (VISCII → UTF-8): sửa giải mã ở panel GM và bot, bot tự đồng bộ tên theo GUID | `panel.py viscii()`, `tlbb.js viscii()` |
| Bỏ mọi `confirm()` của trình duyệt trên trang người chơi; dùng `gConfirm` | bot `01eb3f8` |
| Dọn Palworld: đợt 1 (−2.900 dòng, **đã deploy**), đợt 2 (**chưa deploy**) | bot `8a7d86a`, `a5a109c` |

## 5. Đang chờ chủ server quyết

| Việc | Ghi chú |
|---|---|
| Deploy bot đợt 2 | Mục 3 |
| Khi đang nợ có cấm rút đồ / KNB vào game không? | Hiện **không cấm**. Muốn cấm thì thêm 1 dòng `debtBlock` vào `ichKyClaim` / `webRutGame`. |
| Mã cổ phiếu "DOG" trên web | Tên cũ từ thời Dogcoin, đổi được nếu muốn. |
| Bù đồ **Whynot** 1010100014 | Còn 3 Hợp Thành Phù kẹt ở quầy 10. **Đừng để họ bấm "Thêm quầy".** |
| Bù 28 Cao cấp Hợp Thành Phù cho 1010100018 | Lỗi hợp thành xóa nguyên chồng (đã vá `96c5872`) |
| Sát Tinh ngọc 6 25%; Lộ Quân Dật quá khó; cảnh báo Discord khi game chết; đẩy trang bị lên số tối đa | Treo từ 05/10 |
| Còn treo từ 05/10 | Kệ 31; ải 3 Q; Thông Thiên Tháp; rương Tam Thần; nội tức Võ Ý ×12 hay ×14 |

## 6. Đã deploy nhưng CHƯA kiểm trong game

- **Thương Phố:**
  - rút 1 món 🔒 về: trong game còn "cố định" không;
  - `GetBagItemParam` của đồ thường có bằng 0 không (nếu NPC báo "có thuộc tính riêng" cho đồ thường thì kiểm này quá chặt);
  - đồ có hạn dùng có bị giữ lại không.
- Từ 05/10: tâm pháp 8 lên 119; tên quái "Lê Vũ Minh Hân"; chỗ mới của Kiều Phục Thịnh; chặn hợp thành chồng > 1; phiếu Sát Tinh; ảnh Ghép Ngọc gửi Discord.

## 7. Công tắc khẩn cấp

| Tắt | Lệnh |
|---|---|
| Thương Phố (NPC không nhận đồ, web khóa rút; đồ trong kho giữ nguyên) | `touch /opt/tlbb-root/home/tlbb/Server/txt/NetCo4Web/thuongpho-tat`; xóa file là mở lại |
| Một chức năng web của người chơi | Panel SUPER → Mở/Đóng chức năng (`_featOff`) |
| Mẫu đồ chế 8x/9x đang áp | Panel GM → Trả mẫu → restart game |

## 8. Bẫy mới học (06/10)

- **Edit tool làm hỏng byte VISCII/GBK** trong file Lua của game. Chỉ sửa bằng Node đọc/ghi `latin1`, rồi đếm byte > 0x7F so với HEAD. File toàn ASCII (như `CDK.lua`, `quatang.lua`) thì dùng Edit được. Chữ Việt viết bằng escape `\ddd`, đổi bằng `tools/viscii-map.json`.
- **Bot repo dùng `core.autocrlf=true`**: bản làm việc là CRLF. Script sửa file phải tách dòng bằng `\r\n` rồi ghép lại; deploy thì lấy bản LF bằng `git show`.
- **Git Bash heredoc nuốt dấu `\`.** Script nào có `\` thì viết bằng Write, đừng dùng `cat <<EOF`.
- **Không có Lua 4 để chạy thử.** Mô phỏng bằng fengari (Lua trong Node) + shim `openfile/read/write/getn/tinsert` + API game giả. Mẫu: `tools/thuongpho-mophong/mophong.js` (Thương Phố, 39 ca; `npm i fengari`). Kiểm cú pháp bằng npm `luaparse`. Script game dùng `for k,v in t do` (Lua 4), muốn chạy được cả 2 bản thì dùng mảng + `for` số.
- **`TryRecieveItem` có thể chồng món mới vào chồng có sẵn.** `LuaFnItemBind(ô)` sau đó sẽ khóa cả chồng của người chơi. Cách đúng: phát hết rồi mới khóa, và chỉ khóa ô mới (Thương Phố `NhanTP`).
- **Hàng đợi quà `NetCo4Qua`** (`quatang.lua`) phát đồ trước rồi ghi đè file sau: nếu panel nối thêm dòng đúng lúc đó thì dòng mới bị mất. Đường nhiều giao dịch phải dùng kiểu `.in/.done` (đánh dấu trước khi phát), như KNB và Thương Phố.
- **Cột 18 "最大持有数量" của `CommonItem.txt` không phải giới hạn sở hữu thật** với đồ thường (Yến Huyền Ngọc ghi 1 mà chồng được 30).
- **Ngọc không chồng** (ItemRule 1 có cột "chồng" = 0), mỗi viên 1 ô túi.
- **`ItemSegQuality` có cột Nhẫn (vị trí 06) lệch:** 3 ô đầu trỏ mã của vật liệu cao hơn. Đã sửa ở quy tắc 10–19. Mã `ItemSegAffect` không liên tục (ID lớn nhất 495), nên sửa thẳng mã cũ, đừng thêm mã mới.
- **Tên nhân vật / tài khoản trong MySQL bị mã hóa 2 lần.** Trong game vẫn đúng. Công cụ đọc DB phải bóc lớp UTF-8 rồi mới giải VISCII.
- **Đừng tin mô tả "khớp Palworld".** Nhóm shop `implant` thật ra đang là "🔥 Hàng giới hạn" của Thiên Long. Grep `ITEM_CAT_DEF` trước khi xóa.
- **Agent làm song song:** mỗi agent 1 file, không commit. Chốt trước "hợp đồng" giữa các file (ctx key, route), kiểm chéo sau khi xong. Khi giao việc, ghi rõ những gì phải GIỮ.

## 9. Công cụ

| Công cụ | Việc |
|---|---|
| `tools/tim-nguon.js <item> [cấp]` | Mọi hộp / quái rơi 1 món + kỳ vọng mỗi người |
| `tools/mau-boss.js`, `tools/doiten-vls.js`, `tools/doi-cho-npc.js` | Máu boss, tên quái Vô Lượng Sơn, dời NPC |
| `tools/bang-roi/` → netco4.click | Dựng lại trang tỉ lệ rơi. Bắt buộc mỗi lần đổi tỉ lệ rơi: chép `index.html` + `data.json` lên `/var/www/netco4/`. |
| `panel/maudoche.py` | Mẫu đồ chế 8x/9x (áp → restart → chế → trả mẫu → restart) |
| `tools/tile-che.js` | Bảng tỉ lệ cấp phẩm chất đồ chế 80–99 theo cấp vật liệu (`ItemSegQuality` → `ItemSegAffect`) |
| `tools/thuongpho-mophong/mophong.js <BotDoMin>` | Mô phỏng Thương Phố: `CDK.lua` thật trên fengari + `thuongpho.js` thật, 39 ca |
| bot `BotDoMin/thu/check_page.js`, `check_panel.js` | Kiểm JS phía client của trang người chơi / panel |
| bot `BotDoMin/thu/bot-gia/thu.js <bản sao BotDoMin>` | Chạy thử bot với Discord giả: khởi động, gọi trang + API |
