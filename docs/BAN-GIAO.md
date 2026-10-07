# Bàn giao cho phiên Claude tiếp theo (cập nhật 07/10/2026 sáng; bản đầy đủ viết 06/10 17:30)

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
| **Game** | Chạy từ 07/10 **01:37**, đủ 6 tiến trình trong `tlbb.service`. Đã có: đồ chế VL8 C8 65% / C9 35%, thú cưỡi 10141214 C9, Sát Tinh −60% máu / −30% công, Lâu Lan Tầm Bảo 24/24, Tiền Trang tối đa 60 ô. Khóa cấp **89**, exp **×5**. Hai số này nằm trong `NetCo4Cfg/capmax.txt` và `expparam.txt`; `cap-nhat.sh` tự áp lại. |
| **Repo game** (`tlbbnetco4`) | VPS đã deploy **`aba2f44`** (07/10). Mọi file game khớp repo (đã kiểm 07/10). Các commit sau đó chỉ là docs. |
| **Panel GM** (`panel/panel.py`, 8443) | Restart 14:36, đã có bản sửa tên nhân vật. Tên hiện đúng: ÁnhDương / HuyềnSát / HỏaThần. |
| **Bot** (`bialk`, `/opt/minigame/BotDoMin`) | VPS = **HEAD `de571c2`** (deploy 07/10 11:15, gồm dọn Palworld đợt 2 + trang Cá nhân/header/Shop mới). `palworld.js` đã gỡ khỏi VPS. md5 (LF): `index.js` `f099b565`, `webplay.js` `bf45ad22`, `panel.js` `e2d19cb4`, `shop.client.js` `184733f0`, `vigame.client.js` `73d75a54`, `ichky.client.js` `652923a4`, `tuiboss.client.js` `28103d2c`. Sao lưu bản trước: `/opt/tlbb-backup/bot-truoc-de571c2-20261007-111511` (có cả `database.json`, `palworld.js`). |
| **netco4.click** | Dựng lần cuối 05/10 khuya. Chiều nay không đổi tỉ lệ rơi nên không cần dựng lại. |

## 2. Quyền và cách deploy (quan trọng)

- **Claude KHÔNG chạy `cap-nhat.sh`.** Classifier đã chặn nhiều lần ("Blind Apply"), đừng lách. Đưa lệnh cho chủ server: `cd /opt/tlbb-deploy && ./cap-nhat.sh`.
  - Script NPC (CDK.lua…) tự nạp lại, không cần restart game.
  - Bảng `Server/Config/*.txt` và `Public/Config/*.txt` cần restart game.
  - Panel GM chạy thẳng từ `/opt/tlbb-repo`, nên sau `cap-nhat.sh` phải chạy thêm `systemctl restart tlbb-panel` (script không tự restart panel).
- **Câu "Restart server ngay?"**: trả lời `y` giờ đã an toàn. `tlbb.sh` gọi tay sẽ tự chuyển sang `systemctl`, có chốt `TLBB_TRUC_TIEP`. Nếu có người online thì trả lời `N` rồi hẹn giờ.
- **Claude được chạy `systemctl restart tlbb` khi chủ server yêu cầu.** Trước khi chạy, đếm người online: `ss -tn state established '( sport = :3731 )'` = **người đang TRONG GAME** (tiến trình `Server`, quan trọng nhất), cổng 7384 = người đang đăng nhập. Cộng cả hai phải bằng 0 mới gọi là "không ai online" (07/10 Claude đọc 7384 = 0 rồi báo nhầm "0 người" trong khi 3731 có 3). Sau khi chạy, kiểm cgroup.
- **Bot: Claude được tự deploy.** Các bước:
  1. Lấy bản LF từ commit: `git show HEAD:BotDoMin/<file>`. Bản làm việc trên máy là CRLF.
  2. scp file lên `/tmp` của VPS, chạy `node --check`.
  3. **So md5 file trên VPS với commit trước đó.** Có thể người khác đã sửa trên VPS.
  4. `systemctl list-jobs | grep -c tlbb` phải bằng 0. Nếu game đang restart mà restart bot thì mọi web chết theo.
  5. Sao lưu file cũ vào `/opt/tlbb-backup/…`, chép file mới, `systemctl restart minigame`.
  6. Xem `journalctl -u minigame` và curl các cổng 3002 / 1234.
  - File client (`/tp.js`, `/tb.js`, `/gn.js`, `/br.js`, `/ik.js`, `/vg.js`, `/sh.js`) được đọc lại mỗi lần tải trang, chỉ cần chép file, không cần restart.
- **Đổi cấu hình bot:** gọi API cổng SUPER bằng script chạy trên VPS. Script đọc `PANEL_SUPER_PASSWORD` từ `.env` và **không in ra**. Mẫu: lần sửa túi boss 06/10. Không sửa `database.json` khi bot đang chạy. Nếu bắt buộc phải sửa: dừng bot, sao lưu, sửa, chạy lại (mẫu: lần gỡ ngọc test 06/10).
- Có người khác (hoặc chủ server lúc khuya) deploy qua OneDash ngay sau khi Claude push repo game. **Mỗi lần push repo game, coi như code có thể lên game bất cứ lúc nào.**

## 3. Bot HEAD `de571c2` ĐÃ DEPLOY 07/10 11:15 (dọn Palworld đợt 2 + trang Cá nhân / header / Shop Item mới)

Trước khi deploy đã kiểm: mọi dòng vá tay trên VPS (bản trộn `8a7d86a` + vòng quay + `/ik.js`) đều có trong git; `node --check` trên VPS; bot thử với data thật của bialk (`BotDoMin/thu/bot-gia/`) bấm qua mọi tab ở PC + điện thoại: 0 lỗi JS. Sau deploy: log 0 lỗi, `play` / `admin` / `mod` trả 200, `/vg.js` `/sh.js` `/ik.js` `/tb.js` đều 200.

**Còn cần chủ server bấm thử trên prod** (chưa ai kiểm bằng tài khoản thật):
- panel SUPER: tab **🐉 Thiên Long & KNB** (id mới `tlbb`), lưu liên kết nhân vật (route mới `/api/tlbb/lienket`);
- Shop Item mới: mua thử 1 món vào rương, 1 món vào game, 1 món nhóm **🔥 Hàng giới hạn** (hạn mỗi ngày phải còn chạy);
- Ví: rút KNB / đổi vàng 1 lần nhỏ; popup 🔑 Mật khẩu.

Rollback: tag bialk `truoc-vigame-07-10` (= `b670996`, trước trang mới) hoặc `truoc-don-palworld-dot2-06-10`; nhanh nhất là chép lại thư mục sao lưu `/opt/tlbb-backup/bot-truoc-de571c2-20261007-111511` (kể cả `palworld.js.go-khoi-vps` → `palworld.js`) rồi `systemctl restart minigame`.

## 4. Việc đã làm ngày 06/10 (chi tiết trong TRANG-THAI)

| Việc | Ở đâu |
|---|---|
| 🏪 **Thương Phố**: kho đồ web theo nhân vật. NPC Ví Web chuyển túi Đạo cụ / Nguyên liệu ra, web rút về đúng nhân vật, đồ cố định giữ khóa. Kèm lịch sử, gộp ngọc, hộp xác nhận `gConfirm`, tắt khẩn cấp bằng file `thuongpho-tat`. | `docs/THUONG-PHO.md`; bot `thuongpho.js`, `thuongpho.client.js`; `CDK.lua` |
| Đồ chế: vật liệu 8 từ C9 100% còn C9 2% (bậc thang VL6/7/8 = 6,03 / 6,51 / 6,69); sửa cột Nhẫn trỏ nhầm mã. **Chủ server đã kiểm trong game, OK.** | `ItemSegAffect.txt`, `ItemSegQuality.txt`; TRANG-THAI 14:14 |
| Túi đồ boss: cả 16 hoạt động cho Miên Bố / Bí Ngân 8 ×2–3 | cấu hình bot (API SUPER) |
| Rương Ích Kỷ: bỏ Bán (ép đi Ghép Ngọc); phiếu KNB chỉ còn nút Sử dụng (cộng thẳng KNB web) | bot `707b520` |
| Tên nhân vật bị MySQL mã hóa 2 lần (VISCII → UTF-8): sửa giải mã ở panel GM và bot, bot tự đồng bộ tên theo GUID | `panel.py viscii()`, `tlbb.js viscii()` |
| Bỏ mọi `confirm()` của trình duyệt trên trang người chơi; dùng `gConfirm` | bot `01eb3f8` |
| Dọn Palworld: đợt 1 (−2.900 dòng) và đợt 2, **cả hai đã deploy** (đợt 2 lên cùng `de571c2` ngày 07/10) | bot `8a7d86a`, `a5a109c` |

## 5. Đang chờ chủ server quyết

| Việc | Ghi chú |
|---|---|
| Mua vào Rương Ích Kỷ giờ **không giới hạn/ngày** (07/10) | Người chơi có thể gom hàng nghìn món theo giá hiện tại trước khi tăng giá shop. Muốn chặn lại: đặt `ICHKY_DAY_MAX` trong `index.js` về một số. |
| Báo số túi boss chờ nhận trên nút 🪪 Cá nhân | Tab 🎒 Túi boss đã bỏ (gộp vào Cá nhân), người đang ở trang khác không thấy có túi mới; túi hết hạn sau 7 ngày. Chưa làm. |
| Khi đang nợ có cấm rút đồ / KNB vào game không? | Hiện **không cấm**. Muốn cấm thì thêm 1 dòng `debtBlock` vào `ichKyClaim` / `webRutGame`. |
| Mã cổ phiếu "DOG" trên web | Tên cũ từ thời Dogcoin, đổi được nếu muốn. |
| Bù đồ **Whynot** 1010100014 | Còn 3 Hợp Thành Phù kẹt ở quầy 10. **Đừng để họ bấm "Thêm quầy".** |
| Bù 28 Cao cấp Hợp Thành Phù cho 1010100018 | Lỗi hợp thành xóa nguyên chồng (đã vá `96c5872`) |
| Sát Tinh ngọc 6 25%; Lộ Quân Dật quá khó; cảnh báo Discord khi game chết; đẩy trang bị lên số tối đa | Treo từ 05/10 |
| Còn treo từ 05/10 | Kệ 31; ải 3 Q; Thông Thiên Tháp; rương Tam Thần; nội tức Võ Ý ×12 hay ×14 |

## 6. Đã deploy nhưng CHƯA kiểm trong game

- **Đội bot "người giả"** (07/10 khuya, cần restart): 6 bot mọc quanh (176, 172) Vô Lượng Sơn scene 6/73/74 (thử; định cuối là Hậu Hoa Viên), đánh người tới gần, Nga My hồi máu đồng đội, hồi sinh 3 phút. Kiểm 6 điểm ở TRANG-THAI mục đó; chỉ số là ước lượng, chỉnh `tools/botdoi-07-10.js` + `!!RELOADMONSTERATTR`.

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
