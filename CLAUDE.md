# NetCo4: server Thiên Long Bát Bộ 3D (private, ~10 người chơi)

Đọc hết file này trước khi sửa bất cứ thứ gì. Các quy tắc ở đây có từ những lỗi đã gặp thật.
**Tiến độ, việc tiếp theo, những gì chưa kiểm chứng: `docs/TRANG-THAI.md`.** Cập nhật file đó mỗi khi xong một việc.
**Bàn giao gần nhất (06/10): `docs/BAN-GIAO.md`** — trạng thái deploy, việc chờ chủ server quyết, thứ chưa kiểm trong game, quyền của Claude (KHÔNG chạy được `cap-nhat.sh`; được `systemctl restart tlbb` khi chủ server bảo).

## Hệ thống (dựng 28/09/2026)

| | |
|---|---|
| VPS | `103.216.118.123`, iNET, Ubuntu 22.04, 6,9GB RAM (`free -m`) + 2GB swap |
| SSH | `ssh -p 24700 root@103.216.118.123`. **Cổng 24700, không phải 22.** Chỉ đăng nhập bằng key |
| Server game | Ubuntu 10.04 32-bit (lấy nguyên từ máy ảo gốc) chạy **chroot** tại `/opt/tlbb-root` |
| Thư mục game | `/opt/tlbb-root/home/tlbb` (`Public/` = dữ liệu + script, `Server/` = binary + cấu hình) |
| Repo trên VPS | `/opt/tlbb-repo` (git clone của repo này). `/opt/tlbb-deploy` → symlink tới `/opt/tlbb-repo/deploy` |
| Sao lưu | `/opt/tlbb-backup` (DB gốc, DB hằng ngày lúc 4h, bản trước mỗi lần cập nhật) |
| Cổng mở | `24700` SSH, `7384` Login, `3731` Game, `80`/`443` web. `8443` (panel game) **chỉ IP admin** `14.169.52.21`, `123.21.72.218` (03/10, sau 4 lần bị dò/SYN flood); IP nhà đổi thì `ufw allow from <IP> to any port 8443 proto tcp comment 'panel - IP admin'`. Bot gọi panel qua `127.0.0.1:8443` nên không bị chặn. Còn lại ufw chặn. MySQL và billing chỉ nghe `127.0.0.1` |
| Tiến trình | `mysqld` (5.0.45), `billing` (liuguangw/billing_go, `/home/config.json`), `ShareMemory`, `Login`, `World`, `Server` |
| Client | phiên bản `1005`. `Patch/LoginServer.txt` trỏ `103.216.118.123:7384`, tên server `NetCo4` |

Binary `Login`/`World`/`Server`/`ShareMemory` **không có source** (bản leak). Chỉ sửa được script Lua và bảng dữ liệu.
**Ngoại lệ (03/10 16:45):** `Server/Server` trên VPS là **bản giải nén UPX đã vá** (md5 `e6eceef9…`, script `deploy/va-server/va-tu-di-theo.py`): đội trưởng bấm đi theo → mọi đồng đội trong `AvailableFollowDist` tự đồng ý. Bản gốc nén: `Server/Server.upx-goc` (md5 `18b76cd8…`). Trả lại: `cp -p Server.upx-goc Server.goc2 && mv -f Server.goc2 Server && systemctl restart tlbb` (không `cp` đè thẳng file đang chạy: "Text file busy").

## Quy trình phát triển

```
Máy nhà: sửa server/...  →  git commit + push  →  VPS: cd /opt/tlbb-deploy && ./cap-nhat.sh
```

- `server/` trong repo = bản sao đúng từng byte của các file sửa được trên VPS (danh sách ở `deploy/dong-bo.list`).
- `./cap-nhat.sh`: `git pull`, hiện trước danh sách file sẽ đổi, cảnh báo file lưu nhầm UTF-8, sao lưu bản cũ, chép lên server, rồi **hỏi** trước khi restart. Script Lua và cấu hình chỉ có hiệu lực sau `./tlbb.sh restart`.
- Ai đó sửa trực tiếp trên VPS thì chạy `./lay-tu-server.sh --push` để đưa thay đổi về repo, nếu không lần `cap-nhat` sau sẽ ghi đè.
- **Server LOCAL để test (07/10):** WSL2 trên máy nhà, code nhánh `local` (git worktree `D:\tlbb-local\code`), client `G:\NetCo4-Local`. Việc mới: làm + thử trên local trước, ổn mới gộp vào `main` rồi lên VPS. Lệnh: `wsl -d Ubuntu-22.04 -u root -- bash /mnt/d/tlbb-local/local.sh start|stop|restart|status|dongbo`, xem `D:\tlbb-local\HUONG-DAN.txt`.
- **Không tự động deploy khi push.** Restart sẽ đá người đang chơi. Trước khi restart, hỏi người dùng hoặc kiểm tra: `ss -tn state established '( sport = :3731 )'`.
- Lần đầu clone trên Windows: `git config core.autocrlf false`. `.gitattributes` đã giữ nguyên byte cho `server/**`.
- Web: https://netco4.click/ = Bảng Rơi (file tĩnh `/var/www/netco4/index.html`, dựng bằng `node tools/bang-roi/lam.js`), https://play.netco4.click/ = trang chơi (bot 3002), admin. = panel bot, gm. = panel game.
- GitHub: `https://github.com/nguyendangkhoa150899-boop/tlbbnetco4` (đang **public**). VPS kéo code qua HTTPS nên không cần key. Nếu chuyển repo sang private, VPS cần deploy key: `/root/.ssh/github_deploy.pub` (đã tạo sẵn, thêm vào repo → Settings → Deploy keys, tích write), rồi `git -C /opt/tlbb-repo remote set-url origin git@github.com:nguyendangkhoa150899-boop/tlbbnetco4.git`.
- VPS **chưa push được** lên GitHub (chưa có deploy key), nên `./lay-tu-server.sh --push` sẽ lỗi. Tạm thời: chạy `./lay-tu-server.sh` rồi commit trên VPS, sau đó trên máy nhà `git pull ssh://root@103.216.118.123:24700/opt/tlbb-repo main` và push lên GitHub.

## Quy tắc bắt buộc

### 1. Bảng mã: KHÔNG phải UTF-8
- Chữ tiếng Việt trong `.lua`, `CommonItem.txt`, `GemInfo.txt`, `*_monster.ini`... là **VISCII** (ví dụ `ạ`=0xD5, `đ`=0xF0, `ế`=0xAA). Chú thích tiếng Trung là **GBK**. Một file thường lẫn cả hai.
- **Không mở rồi lưu lại cả file bằng editor hay bằng công cụ Edit.** Công cụ sẽ đọc thành UTF-8 và làm hỏng mọi byte không phải ASCII. Chỉ sửa kiểu thay chuỗi ASCII ở mức byte (sed/python `rb`), sau đó kiểm tra `git diff` xem chỉ đúng các dòng cần đổi bị thay đổi.
  - **05/10 đã dính:** 1 lần Edit vào `event/bingshensmall/ai_liqiushui.lua` biến mọi byte có dấu thành `EF BF BD`. Cách làm đúng:
    1. Sửa bằng Node `readFileSync(p,'latin1')` / `writeFileSync(p,t,'latin1')`, giữ CR/LF của từng dòng (nhiều file trộn CRLF và LF).
    2. **Trước commit:** đếm byte > 0x7f so với `git show HEAD:<file>` (phải bằng nhau nếu chỉ thêm ASCII), và grep `\xef\xbf\xbd`.
  - **Kiểm cú pháp Lua:** máy nhà và VPS không có `lua`/`luac`. Dùng npm `luaparse` (ngữ pháp 5.1) trong scratchpad, so với HEAD. Một số file gốc đã báo "unfinished string" ở byte lạ; engine vẫn chạy chúng, chỉ cần không có lỗi MỚI.
  - Sửa sai bằng `sed` trong bash: `\d`, `\1`, `\172` bị shell/sed hiểu sai. Viết script `.js` bằng công cụ Write rồi chạy, đừng dùng `node -e` hay heredoc có dấu `\`.
- **Chữ tiếng Việt mới: dùng `python tools/vn.py "Chào mừng"`.** Công cụ trả về chuỗi Lua toàn ASCII kiểu `"Ch\224o m\215ng"` (escape thập phân, Lua 4 hỗ trợ). File Lua mới nên viết **100% ASCII**.
- Đọc chữ trong game: `python tools/vn.py --giai "<chuỗi>"`, hoặc trên VPS dùng `iconv -f VISCII -t UTF-8`.
- `cap-nhat.sh` cảnh báo khi thấy file có BOM hoặc có dấu hiệu UTF-8.

### 2. Tên file
Windows không phân biệt hoa/thường. Trên server có `Script/new` và `Script/New`, `ZhenYuaneventOpen.lua` và `ZhenYuaneventOPEN.lua`, cùng các file tên tiếng Trung. Những file đó **cố ý không có trong repo** (xem `dong-bo.list`). Không tạo file hay thư mục mới trùng tên khác hoa/thường với cái đã có. Không giải nén hoặc copy cây `/home/tlbb` qua Windows rồi đưa ngược lên (đã làm hỏng 36 file).

### 3. Database
- `t_guild_new` (1024 ô), `t_city_new` và `t_city_info` (255 ô) là **ô tạo sẵn**. **Không bao giờ `DELETE`**, chỉ trả ô đã dùng về trạng thái trống (xem `reset-choi-that.sh`).
- GUID nhân vật lấy từ `t_var.maxcharguid` (procedure `fetch_guid`). Hiện bắt đầu từ `1010100000`, cố ý cao hơn mọi GUID của server cũ. **Không reset bộ đếm này.**
- Mật khẩu MySQL: `deploy/secrets.env` trên VPS (không có trong git). Truy vấn: `. deploy/common.sh; mysql_root "tlbbdb -e 'SELECT ...'"`.
- ShareMemory giữ dữ liệu nhân vật trong RAM. **Luôn `./tlbb.sh stop` trước khi sửa DB, reboot hay tắt VPS.**
- Cấu hình MySQL: `/opt/tlbb-root/etc/my.cnf` (không có trong repo). 03/10 đã nâng từ mẫu "máy nhỏ": `key_buffer 16M`, `table_cache 256` (cũ 4), `innodb_buffer_pool_size 128M` (cũ 8M; DB ~9MB InnoDB). Bản cũ: `/opt/tlbb-backup/my.cnf-truoc-20261003-1535`. **Không đổi `innodb_log_file_size`** (MySQL 5.0 không khởi động nếu khác file log). Sửa xong kiểm bằng `chroot /opt/tlbb-root /usr/local/mysql5.0.45/libexec/mysqld --verbose --help | grep <biến>` rồi `systemctl restart tlbb`.

### 4. Bí mật
Repo có thể là public. Không commit `secrets.env`, `config.env`, `LoginInfo.ini`, `ShareMemInfo.ini` (chứa mật khẩu MySQL), mật khẩu tài khoản game, private key. Kiểm tra trước khi push.

## Script chạy trên VPS (`/opt/tlbb-deploy`)

| Lệnh | Việc |
|---|---|
| `./tlbb.sh start / stop / restart / status` | Bật, tắt an toàn, xem RAM |
| `./cap-nhat.sh` | Deploy từ GitHub |
| `./lay-tu-server.sh [--push]` | Đưa thay đổi trên server về repo |
| `./tao-account.sh <tên> <mk>` / `--doi` / `--xoa` / `--ds` | Tài khoản (người chơi không tự đăng ký được, `auto_reg=false`) |
| `./cap-gm.sh <tên nv>` / `--tat-ca` / `--ds` | GM (ghi `GMList.ini`, cần restart) |
| `./reset-choi-that.sh [--ca-tai-khoan]` | Xóa sạch dữ liệu chơi thử, bắt đầu chơi thật |
| `./sao-luu.sh` | Sao lưu DB (cron 4h sáng, giữ 14 bản) |
| Panel web | https://103.216.118.123:8443 (mật khẩu `PANEL_PASS` trong secrets.env; chỉ IP admin, xem "Cổng mở"): tài khoản, online, phát quà, GM, restart. Ngoài IP admin thì dùng tab GM ở admin./gm.netco4.click |
| `./04-doi-ten.sh` | Đổi tên server cũ thành `SERVER_NAME` |
| `00`..`03-*.sh` | Dựng từ đầu từ `Ubuntu.vmdk` (đã chạy xong, xem `deploy/HUONG-DAN-VPS.md`) |

## Làm nội dung mới (event, drop, NPC)

Xem `docs/PHAT-TRIEN.md`: cách đăng ký script, đặt NPC, bảng rơi đồ, tra ID vật phẩm (`docs/vat-pham/`), dialect Lua 4, và những gì **không làm được** (giao diện, vật phẩm mới hoàn toàn).

**Đội bot "người giả" (07/10, đang thử ở Vô Lượng Sơn (176,172)):** 6 quái đội tên người (64601–64606, `NetCo4/botdoi.lua`, `.ai` 346–349, `wuliang_monster.ini`; dời đội = đổi `INI`/`GOC` trong tool), sinh bằng `tools/botdoi-07-10.js`; chỉ số chỉnh trong tool rồi `!!RELOADMONSTERATTR`. Chi tiết TRANG-THAI mục 07/10 khuya.

**Boss / phó bản báo lỗi:** mở `docs/BOSS-PHO-BAN.md` trước (hồ sơ 17 phó bản, loại lỗi đã gặp, quy trình) và dùng `node tools/soat-boss/soat.js <ID script>`.

### Boss rơi Nguyên Bảo Phiếu (29/09, luật hiện hành 05/10)

**Luật 05/10 (chủ server chốt, MỖI NGƯỜI / lần hạ — boss rơi theo từng thành viên, xem quy tắc 6):** boss cấp < 100 = **1 tờ 1000**; cấp ≥ 100 = **2 tờ 1000**; boss cuối Q Tô Châu / Q Lâu Lan: bậc < 100 = 3 tờ, bậc ≥ 100 = 6 tờ; Sát Tinh dồn **5 tờ vào Lộ Quân Dật 13465** (05/10 khuya chuyển từ Ngô Vĩnh 13456 vì Lộ Quân Dật khó nhất: máu 5,2 triệu, công phép 25k; `tools/sattinh-cuoi-05-10.js` đổi chỗ hộp 90088 + 90047), 10 boss Sát Tinh khác 0. **Giữ 2 tờ:** boss thế giới cấp 80–99 (11313, 1403, 43316, Thông Thiên Tháp 15433/15436). Bỏ 1850 (`_pingpan_55` đặt 13 con). 34130 (Q Tô Châu bậc 113) cũng là boss `BossHHL.lua` 891024 (chưa ai gọi) → nếu bật sẽ ra 6 tờ. Hộp phiếu ở DID1 (túi tối đa 10 món/người). Áp bằng `node tools/phieu-boss/luat-05-10.js` (tập dòng + luật trong đầu file), xem tổng theo mốc cấp `theo-cap.js`, so trước/sau tại cấp X `ky-vong.js X <ID> --ref <commit>`. Tag: `truoc-phieu-phoban-04-10`, `truoc-pmf-nho-05-10`, `truoc-luat-phieu-05-10`.
**05/10 sau soát 5 agent (tag `truoc-sua-sau-soat-05-10`, `tools/phieu-boss/sua-05-10b.js`):** Q boss cuối X đúng 3,0 / 6,0 (90046 BV 40, 90018 BV 20); **Ngô Vĩnh 90047 BV 24** (X = 5 khi không bị trừ cấp, ×0,2 → 1 tờ; chưa ai hạ ở cấp 89 nên chưa biết có bị trừ không - xem item log lượt Sát Tinh đầu tiên); gói boss 01/10 trên 119 dòng → bản sao BV×2 90050–90057; Kỳ Cuộc/Túc Cầu 1710 → 90068 (Tân Mãng Thần Phù 6: 8 → 1); Yến Tử Ổ: Đoàn Diên Khánh thuốc giải 3–6 (90069 chắc 3 + 90070 ×3 50%), nguyên liệu cấp 8 boss ải 25% (90071), 3 boss chính 50% (90072); Hồng Cức bỏ 50001; Đế Thích Thiên phiếu riêng 90067; dạng NPC PMF bỏ phiếu. Script 2 Q: Cửu Thiên 30 → 5%, MB/BN 6 10 → 2% (ải 3 dùng tỉ lệ trong `roimap.lua`, CHƯA đổi).
**⚠ ĐÃ ĐO 05/10 23:41: boss cao hơn người KHÔNG bị trừ** → hộp 90047 (nay ở Lộ Quân Dật 13465) ra **5 tờ/người** ở mọi cấp (không phải 1 tờ như dự tính ×0,2). Các dòng khác đặt theo chênh cấp 0 nên người cấp cao hơn boss không ra nhiều hơn; người thấp hơn boss > 10 cấp ra ít hơn (×0,9 / 0,5 / 0,2). Công thức X = Mv/BV × 2 × DropAttenuation.

Hộp rơi **90001** (`Server/Config/DropBoxContent.txt`) chứa 1 món, BoxValue = Mvalue boss (60 → X = 1 × DropParam 2 = **2 phiếu mỗi lần giết, chung cả đội**; BV = 1 làm hỏng cả lượt rơi, xem quy tắc 6), gắn cho 139 boss trong `Server/Config/MonsterDropBoxs.txt`: boss phó bản (Phiêu Miểu Phong, Yến Tử Ổ, Tứ Tuyệt Trang, Thiếu Thất Sơn, Nhạn Môn, Tam Thần) + boss thế giới hồi sinh ≥ 30 phút và ≤ 4 điểm spawn. Loại trừ quái con `JiangShi_BOSS` (triệu hồi hàng loạt) và boss gọi bằng đồ/sự kiện (bản đồ kho báu, Cửu Lê). Sinh Tử Lôi Đài (Thủy Hử, 3 lần/ngày): từ 05/10 chỉ Lộ Quân Dật 13465 có phiếu (5 tờ/người, không bị giảm cấp); 12 boss đều 25% ngọc 6 qua script (`roithem.txt` dòng `sattinh`). 13456 dùng chung cho Ngô Dụng + Tống Giang → đừng gắn thưởng vào đó. Phó bản 45 phút (03/10).

Cùng 139 boss đó (29/09 chiều): đã gỡ hộp phiếu 1000 cũ và 54 hộp rác khỏi dòng boss (hộp gốc còn cho quái thường), và 14 hộp nguyên liệu được **sao riêng cho boss** thành `90002`–`90015` với BoxValue = ½ gốc (bảng đối chiếu ở `docs/TRANG-THAI.md` mục 0). Muốn chỉnh tỉ lệ nguyên liệu boss: sửa BoxValue dòng `9000x`, không đụng hộp gốc.

### Ngọc cấp 6 (luật 05/10, chủ server chốt)

Toàn bộ ngọc 6 trong bảng rơi do **`tools/ngoc6/luat-05-10.js`** quản lý. Bảng `LUAT` nằm trong file: ID → xác suất p mỗi người / lần hạ + túi A hoặc B.

- **Hai túi:**
  - A = thuộc tính / thể lực / né / chính xác, 11 loại.
  - B = 18 loại còn lại.
  - "A+B" là 1 hộp trộn trọng số 5:7, khoảng 30% ra túi A.
  - Minh Thạch và ngọc kép không đụng.
- **Mức theo nhóm:**
  - boss cuối và boss bản đồ: 1 viên chắc chắn hoặc 50%;
  - boss giữa ải: chỉ PMF và Bình Thánh có 50%;
  - Yến Vương / Tần Hoàng / Thông Thiên Tháp: 30% túi B;
  - Ác Bá / Đầu Mục 8%, Lâu La 4% túi B;
  - quái thường 0.
- **Song sinh không rơi gì:** 1 bộ hộp của song sinh dồn sang boss cuối. Lý do: hồi sinh chéo cho nhau là farm vô tận.
- **Cách sửa:** đổi `LUAT`, chạy không tham số để xem báo cáo, `--ghi` để ghi, rồi kiểm bằng script so HEAD. Danh sách đầy đủ và các ngoại lệ: `docs/TRANG-THAI.md` mục "LUẬT NGỌC CẤP 6".
- **Rơi qua script:** quân cờ Kỳ Cuộc = `roithem.txt` trên VPS (`kycuoc_co 2 @ngoc6b`); Sát Tinh mỗi boss = `sattinh 25 @ngoc6a,@ngoc6b` (gọi từ `x892009_OnDie`); Bàng Xí = `sijuezhuang/ai_liqiushui.lua` (`x893069_Ngoc6`, 50%).
- **`tools/ngoc6/luat-05-10.js` và `tools/phieu-boss/luat-05-10.js` ĐÃ CŨ:** chạy `--ghi` lại sẽ viết lại 150–350 dòng (bảng đã sửa tiếp sau đó). Có chốt `--toi-biet`. Chỉ dùng xem báo cáo; sửa mới bằng công cụ nhỏ có kiểm.

**MỌI lần đổi tỉ lệ rơi** (bảng, `roimap.lua`, `roithem.txt`) đều **phải dựng lại https://netco4.click/**:
1. `node tools/bang-roi/lam.js`;
2. sao lưu `/var/www/netco4/index.html` vào `/opt/tlbb-backup/`;
3. `scp` **cả** `tools/bang-roi/web/index.html` **và** `web/data.json` lên `/var/www/netco4/`. File `data.json` dùng cho tab 📊 Bảng rơi của portal admin/mod (bot đọc ở `/br-data.json`, tự nạp lại khi file đổi);
4. phần rơi qua script ghi tay ở `build.js` + `khung.html`.
- Portal admin/mod (bot bialk): giao diện riêng `BotDoMin/bangroi.panel.js` ở `/br.js` (đọc lại mỗi lần, không cần restart), gồm 🎯 Muốn farm gì? / 🔎 Tra vật phẩm / 👹 Tra quái. Thuật toán giống `khung.html`: phó bản chỉ tính **bậc cấp gần cấp nhân vật nhất**. Sửa thuật toán thì sửa **cả hai** file.

Đo rơi thật sau khi đổi: xem quy tắc 6, mục "Đo bằng log".

**⚠ Tab 💥 Drop Boss (admin/mod.netco4.click, từ 29/09 tối)** sửa `MonsterDropBoxs.txt` + `DropBoxContent.txt` **trực tiếp trên VPS**, không qua repo (backup tự động ở `/opt/tlbb-backup/dropui-*`). Vì vậy **trước mỗi lần `cap-nhat.sh` phải chạy `./lay-tu-server.sh --push`** (hoặc kéo 2 file đó về repo) — quên là cap-nhat ghi đè mất chỉnh sửa của admin. Đóng tab cho mod: xem chú thích `29/09 tạm MỞ` trong `bialk/BotDoMin/panel.js`. **04/10: cổng mod mở lại nhưng CHỈ xem 📒 Nhật ký + 🎒 Túi đồ boss (chỉ đọc, `/api/tuiboss/xem`)** (bialk `7594f47` + `bd0ff50`): `panel.js` chặn mọi `/api/*` ở cổng mod ngay sau `isAuthed` (kể cả `/api/state`), trừ `/api/whoami`, `/api/nhatky`, `/api/tuiboss/xem`; cổng mod che 2 số cuối IP và ẩn dòng kín (điểm nổ Phi Thuyền lúc cất cánh, ép kết quả, RTP, may mắn). Route mới cho mod phải đặt TRƯỚC dòng chặn đó.

**📜 Nhật ký Drop Boss (29/09):** mọi lần lưu ở tab Drop Boss ghi 1 dòng JSON vào `/opt/tlbb-backup/dropboss-audit.jsonl` (ai: cổng + IP, lúc nào, trước → sau, nguyên dòng file để khôi phục), xem ở nút 📜 Lịch sử sửa (chỉ cổng SUPER). File gắn `chattr +a`: chỉ ghi thêm, **không được `chattr -a` / xóa / cắt**. Cuối mỗi dòng có nút **↩ Rollback** (chỉ SUPER): trả đúng các dòng file lần sửa đó đụng về như trước; đã có lần sửa sau thì báo XUNG ĐỘT và hỏi lại; bản thân rollback cũng ghi nhật ký. Hiệu lực sau restart game. Code ở repo `bialk` (`BotDoMin/dropboss.js`).

**Đổi mệnh giá:** chỉ sửa cột thứ 5 của dòng `90001` thành ID phiếu khác: 1.000 = `39910001` (hiện tại, mọi hộp phiếu 900xx), 2.000 = `39910002`, 5.000 = `39910003`, 10.000 = `39910004`, 50.000 = `39910005`, 100.000 = `39910006`. Sau đó `./cap-nhat.sh` và restart. Phiếu chuột phải ra KNB (script 100001 `New/item/YuanBaoPiao.lua`), KNB đó chuyển ra web qua NPC Ví Web không giới hạn.

## Đã vá so với bản public (đừng hoàn tác)

Xem `docs/KIEM-TOAN.md`. Tóm tắt: tắt NPC phát Điểm Tặng/vàng/KNB vô hạn, lô đề số trúng viết cứng, Gift Code (mã VIP đã lộ), đổi thẻ cào, các handler ẩn, quyền gắn cứng theo GUID của server cũ, giới hạn cùng IP ở Thủy Lao. Dòng vá có chú thích `-- [don-dep]`.

### 6. Bảng .txt và rơi đồ (01/10)
- Mọi bảng `.txt` dạng DBC (`MonsterDropBoxs`, `DropBoxContent`, `PetAttrTable`, `StandardImpact`, `EquipBase`, `CommonItem`…) **phải sắp ID tăng dần**: engine tìm nhị phân, dòng sai thứ tự = không tồn tại, không báo lỗi. Thêm dòng = chèn đúng chỗ, kiểm bằng node trước khi commit.
- **Boss: MỖI THÀNH VIÊN tự roll cả bảng, túi riêng tối đa 10 món/người** (sửa 05/10 theo Audit 04/10 23:4x: tổ 6 người, Cáp Đại Bá 9660 / Hỏa Diễm 13261 / Ô Lão Đại 9663 → mỗi GUID 9–11 món, 2–3 phiếu; mô hình `tools/phieu-boss/ky-vong.js` khớp log). Ghi chú 03/10 "1 túi chung cả đội" là SAI cho boss. Mỗi hộp X = Mvalue ÷ BoxValue × **DropParam (2.0, có nhân)** × giảm rơi theo chênh cấp; ra **floor(X) món + 1 món với xác suất phần lẻ** (05/10, đo bằng serial item log: hộp X = 1,2 ra 1 món cho 6/6 người, 3/17 lượt ra 2; KHÔNG phải ⌈X⌉) → muốn đúng n món thì X phải **đúng bằng n** (BV = 2·Mv/n). Hộp phiếu Mv = BV → **2 phiếu mỗi người**. **Trần 10 món/người tính theo số lượng, cắt theo THỨ TỰ DID** (DID đầu được giữ; món rơi qua script không tính). **Giảm rơi:** người cao hơn quái KHÔNG bị trừ: chênh 14 cấp (PMF nhỏ, 24/24), và 05/10 cả chênh 72 cấp (tổ 89 hạ quái 880 cấp 17 vẫn ra đủ). **Boss cao hơn người cũng KHÔNG bị trừ** (05/10 23:41: Ngô Vĩnh 13456 cấp 120, tổ 6 người cấp 89, ra 30 phiếu = 5/người, đúng X = 5; boss Sát Tinh khác ~20 món/lượt hạ cho 6 người) → coi như DropAttenuation không có tác dụng, `ky-vong.js` mặc định `--att khong`. Đồ rơi ra **túi trên đất, 60 giây không nhặt là mất** (04/10 mất 6 phiếu ở Hỏa Diễm), và chỉ thành viên đứng gần mới được roll. Công cụ: `node tools/phieu-boss/ky-vong.js <cấp> <ID…> [--ref <commit>] [--att tren|khong|bang] [-v]` (mô phỏng đúng các luật trên). **Quái thường cũng roll theo từng người** (05/10: Lâu La Ác Bá 3667, 4 GUID nhận 4 món khác nhau cùng T1 9862.1920 với tỉ lệ ~8,5%/lần; ghi chú 03/10 "1 người ngẫu nhiên" sai) → mọi tỉ lệ "cho cả tổ" phải chia cho số người tổ. Mọi tỉ lệ thiết kế trước 03/10 (gói boss chuẩn 01/10…) chưa tính ×2 → thực tế gấp đôi. BV = 1 làm hỏng cả lượt rơi.
- **Rơi qua script** (`NetCo4/roimap.lua` `x950001_Chia`: Cửu Thiên, MB/BN 6, Tử Vi, bản đồ farm, Kỳ Cuộc RoiCfg) thì **tung riêng cho từng thành viên** đứng gần, không giảm theo cấp.
- **Đo bằng log (05/10):** dùng `Server/Log/Audit_*.log`, với `LC_ALL=C` + `grep -a`.
  - Dòng `ITEM_CREATED,<GUID>,n,<itemId>,<tên>,Dropped by "<quái>",<DataID>` cho biết món nào rơi từ quái nào.
  - Dòng `MONSTER_KILLED,<GUID>,<DataID>,<tên>` là số lần hạ. Nhiều file không ghi dòng này.
  - Gom theo DataID + giây T0 thì ra số người nhận mỗi lần hạ.
  - Tên là VISCII. **Script tạo boss hay dùng lại DataID với tên khác**, nên tin tên trong Audit chứ không tin `MonsterAttrExTable`.
  - `item_*.log` cột 8 là mã thao tác (10 tạo, 30 nhặt), **không phải bản đồ**. Mã khác: 213 lên quầy tiệm, 214 lấy từ quầy, 220 tách chồng, 232/233 gửi/rút ngân hàng, 234/235 giao dịch.
  - **Cột số lượng (cột 5) chỉ đúng ở 50 / 232 / 233.** Ở 213 và 234/235 nó luôn ghi 1, và nhặt gộp chồng thì serial nhặt biến mất. Số thật đọc trong DB: `(p7>>24)&255` (`t_iteminfo.p7`, `t_pshop_stall_itm.Itm_p7`; `p3` không phải số lượng). Đồ đã mất thì dựng lại từ bản sao lưu `/opt/tlbb-backup/hang-ngay/` cộng các lần nhặt gộp sau đó.
- **Game restart lúc nào:** `ps -o lstart= -C Server`, hoặc file `Config_<ngày>.*.log` mới nhất. **Đừng** tin `systemctl show tlbb -p ActiveEnterTimestamp`: 05/10 nó ghi 00:58, nhưng game đã chạy lại lúc 01:45.
- **Script NPC (hội thoại) tự nạp lại** sau `cap-nhat.sh -y`, không cần restart. Bảng `.txt` thì cần restart.
- **`tools/bang-roi/data.json`:** `mons` là mảng `[id, tên, cấp, Mv, hộp[], spawn[], boss]`, phải tra theo `m[0]`. Tra theo chỉ số mảng thì gắn nhầm tên.
- Danh sách bẫy đầy đủ: README mục "Bẫy dễ dính".

### 5. Tiến trình game và systemd (sự cố 28/09 17:40)
**06/10 01:31 game sập 7,5 tiếng** vì restart từ Terminal OneDash (cap-nhat bấm `y`) bị ngắt giữa chừng. Từ `02a4a31`, `tlbb.sh start/stop/restart` gọi tay (không có `INVOCATION_ID`) tự chuyển `systemctl <lệnh> tlbb`; ép chạy thẳng: `TLBB_TRUC_TIEP=1`. Báo "server sập": xem `pgrep` 6 tiến trình + `journalctl -u tlbb`, log ShareMemory cuối phải có "Exit ShareMemory Program", rồi `systemctl restart tlbb`.
Game chạy trong `tlbb.service`. **Không bao giờ** khởi động game từ tiến trình khác (panel, script tay qua SSH) rồi restart/stop tiến trình đó: systemd tắt cả nhóm con, kể cả MySQL và ShareMemory → mất dữ liệu nhân vật chưa lưu. Khởi động/restart game chỉ bằng `systemctl restart tlbb` (panel đã sửa để làm vậy). Nếu buộc phải chạy tay: `./tlbb.sh start` từ SSH thì trước khi đóng SSH hoặc restart panel, kiểm tra `systemctl status tlbb` xem game có nằm đúng unit không.

## Bot mini game (repo `bialk`, `/opt/minigame/BotDoMin`): kinh nghiệm đã trả giá (05/10)

Bot là một repo khác (`nguyendangkhoa150899-boop/bialk`). Trên VPS nó **không phải git**. Tài liệu các tính năng nằm trong `docs/` của repo này: `VONG-QUAY.md`, `TUI-BOSS.md`, `GHEP-NGOC.md`, `THUONG-PHO.md` (06/10, kho đồ theo nhân vật, tắt khẩn cấp bằng file `thuongpho-tat`).

**06/10:**
- Kiến trúc bot, bản đồ file, khóa dữ liệu, cách deploy, quy tắc code: xem `BotDoMin/README.md` của repo bot. Bản viết lại 06/10 sau khi dọn sạch Palworld.
- Palworld đã gỡ hẳn: `palworld.js` đã xóa. Các khóa `dog*` là cầu KNB **đang chạy**, chỉ mang tên cũ từ thời Dogcoin.
- Công cụ kiểm của bot:
  - `BotDoMin/thu/check_page.js`, `check_panel.js`: kiểm JS phía client;
  - `BotDoMin/thu/bot-gia/`: chạy bot với `discord.js` giả để thử khởi động và API.
- Việc dở dang: `docs/BAN-GIAO.md`.

**Deploy bot:**
- Trước khi chép đè, so md5 file trên VPS với `git show HEAD:...` (bỏ `\r` trước khi so). Phiên khác có thể đã sửa thẳng trên VPS.
- Chép lên `/tmp`, rồi `tr -d '\r'`, `node --check`, chép bản cũ vào `/opt/tlbb-backup/...`, sau đó mới `systemctl restart minigame`.
- **Không restart bot khi game đang restart.** `minigame.service` có `After=tlbb.service`, nên bot sẽ chờ game lên xong, và mọi trang web chết 2–3 phút (đã xảy ra 05/10 14:49). Kiểm `systemctl list-jobs | grep tlbb` phải bằng 0.
- File script tĩnh bot đọc lại mỗi lần tải (`/gn.js`, `/gn-admin.js`) thì sửa xong **không cần restart**. Mọi thứ trong `index.js`, `webplay.js`, `panel.js` thì cần restart.

**Đổi cấu hình bot trên prod:**
- Gọi API cổng SUPER (`127.0.0.1:1508`, đăng nhập bằng `PANEL_SUPER_PASSWORD` đọc từ `.env`, **không in ra**). **Không sửa `database.json`**: bot giữ DB trong RAM và ghi đè lại.
- Sao lưu cấu hình cũ vào `/opt/tlbb-backup` trước khi lưu.
- **Trang admin mở từ trước** mà bấm Lưu sẽ ghi đè cấu hình vừa đổi. Báo người dùng F5.

**Viết giao diện:**
- `panel.js` là một **template literal**: trong phần trang không được có backtick, dấu gạch ngược, `${`.
- `webplay.js` là **mảng chuỗi `'...'`**: thoát `\\"` dễ sai.
- Tính năng mới nên để client vào **file riêng** rồi phục vụ bằng route: ít lỗi thoát ký tự, và sửa không cần restart.
- **Trang chơi rộng 520px** (`body{max-width:520px}`). Trang cần rộng thì bật class trên `body`, như `ikWide`/`gnWide` → 1180px trên PC.
- **CSS chung** `button{color:#fff;padding:12px}` và `input{width:100%}` sẽ đè lên mọi thứ. Đặt phạm vi bằng `#id button` / `#id input`.
- Bố cục theo bề rộng khung thì dùng **container query**, không dùng media query, vì khung hẹp ngay cả trên màn PC.
- **F5 khôi phục trang cuối** (`play_page`) **trước** khi script ngoài tải xong. Script ngoài phải tự kiểm trang của nó đang mở thì tự tải dữ liệu.
- **Vẽ lại bằng `innerHTML`** làm điện thoại nhảy về đầu. Phải giữ `scrollY`, `scrollTop` của khung cuộn con, và chiều cao khung trong lúc thay.
- **Hiệu ứng client** (kim quay 7,6 giây) thì thông báo Discord phải **chờ** cho hết, không thì lộ kết quả.

**Quyền 2 cổng:**
- Cổng SUPER = `epOk(req)`. Cổng mod chỉ xem.
- API chỉ-đọc cho mod (`/api/vq/xem`, `/api/gn/xem`, `/api/tuiboss/xem`) phải đặt **trước** chốt chặn mod. Tab mod bật trong `modApp()` → `DUOC=[...]`.
- **Lớp `pwOff`** = ẩn thứ thuộc Palworld (đã tắt). Tab 📦 Kho đồ (đồ Thiên Long) bị ẩn nhầm suốt 29/09–05/10. Thấy "không có chức năng" thì **grep trước**: có thể chỉ đang bị ẩn.

**Logic tiền và game:**
- Tài Xỉu có 2 chế độ. **Bàn đơn giản** (`txSimple()`, đang chạy) thắng theo **tổng điểm kể cả bão**, 1 ăn 1, không hoàn bão. Mọi tính toán phải chép đúng `txPlanPayout`, không tự suy luật.
- **Kiểm kinh tế mỗi khi cho đổi đồ:**
  - Giá vào có lệch giá ra không, ví dụ mua shop đem bỏ vào có lời không.
  - Đồ miễn phí (túi boss) có biến được thành KNB không.
  - Một món lớn đổi món nhỏ có làm người chơi mất trắng không.
  - Viết hàm mô phỏng theo dữ liệu prod thật trước khi chốt giá.
- **ID trùng tên:** Trùng Lâu Chi Lệ/Mang/Thương/Dương có 2 bộ. Bộ đúng là `20310185–188`. Xem script đang dùng ID nào trước khi chọn.
- **Ngọc 7:** loại "Minh Tinh Thạch (Cấp 7-x)" là ngọc **kép** (công + giảm kháng). Thuần tịnh mạnh gấp nhiều lần bản thường, nên đừng để cùng giá.

**Thử ở local** (máy Windows, không có Python, không chạy được cả bot vì cần token Discord):
- Tách tính năng thành module nhận phụ thuộc qua tham số, rồi dựng `thu/<ten>-local.js` dùng **ảnh chụp prod**. File ảnh chụp có dữ liệu người chơi nên **gitignore**.
- Dừng server thử thì dừng **đúng PID** đang giữ cổng (`netstat -ano | grep :3999`). **Không** `taskkill /IM node.exe` (giết hết Node trên máy).
- Script sửa file: dùng `Write` ra file `.js` rồi `node file.js`. Heredoc hoặc `node -e` với backtick và `\` sẽ bị bash phá. Đã làm mất code span trong tài liệu một lần.
- Kiểm cú pháp client: `scratchpad/check_page.js` (webplay) và `check_panel.js` (panel). Cả hai đánh giá phần trang rồi `new Function` từng `<script>`.
