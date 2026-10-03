# NetCo4: server Thiên Long Bát Bộ 3D (private, ~10 người chơi)

Đọc hết file này trước khi sửa bất cứ thứ gì. Các quy tắc ở đây có từ những lỗi đã gặp thật.
**Tiến độ, việc tiếp theo, những gì chưa kiểm chứng: `docs/TRANG-THAI.md`.** Cập nhật file đó mỗi khi xong một việc.

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

## Quy trình phát triển

```
Máy nhà: sửa server/...  →  git commit + push  →  VPS: cd /opt/tlbb-deploy && ./cap-nhat.sh
```

- `server/` trong repo = bản sao đúng từng byte của các file sửa được trên VPS (danh sách ở `deploy/dong-bo.list`).
- `./cap-nhat.sh`: `git pull`, hiện trước danh sách file sẽ đổi, cảnh báo file lưu nhầm UTF-8, sao lưu bản cũ, chép lên server, rồi **hỏi** trước khi restart. Script Lua và cấu hình chỉ có hiệu lực sau `./tlbb.sh restart`.
- Ai đó sửa trực tiếp trên VPS thì chạy `./lay-tu-server.sh --push` để đưa thay đổi về repo, nếu không lần `cap-nhat` sau sẽ ghi đè.
- **Không tự động deploy khi push.** Restart sẽ đá người đang chơi. Trước khi restart, hỏi người dùng hoặc kiểm tra: `ss -tn state established '( sport = :3731 )'`.
- Lần đầu clone trên Windows: `git config core.autocrlf false`. `.gitattributes` đã giữ nguyên byte cho `server/**`.
- Web: https://netco4.click/ = Bảng Rơi (file tĩnh `/var/www/netco4/index.html`, dựng bằng `node tools/bang-roi/lam.js`), https://play.netco4.click/ = trang chơi (bot 3002), admin. = panel bot, gm. = panel game.
- GitHub: `https://github.com/nguyendangkhoa150899-boop/tlbbnetco4` (đang **public**). VPS kéo code qua HTTPS nên không cần key. Nếu chuyển repo sang private, VPS cần deploy key: `/root/.ssh/github_deploy.pub` (đã tạo sẵn, thêm vào repo → Settings → Deploy keys, tích write), rồi `git -C /opt/tlbb-repo remote set-url origin git@github.com:nguyendangkhoa150899-boop/tlbbnetco4.git`.
- VPS **chưa push được** lên GitHub (chưa có deploy key), nên `./lay-tu-server.sh --push` sẽ lỗi. Tạm thời: chạy `./lay-tu-server.sh` rồi commit trên VPS, sau đó trên máy nhà `git pull ssh://root@103.216.118.123:24700/opt/tlbb-repo main` và push lên GitHub.

## Quy tắc bắt buộc

### 1. Bảng mã: KHÔNG phải UTF-8
- Chữ tiếng Việt trong `.lua`, `CommonItem.txt`, `GemInfo.txt`, `*_monster.ini`... là **VISCII** (ví dụ `ạ`=0xD5, `đ`=0xF0, `ế`=0xAA). Chú thích tiếng Trung là **GBK**. Một file thường lẫn cả hai.
- **Không mở rồi lưu lại cả file bằng editor hay bằng công cụ Edit.** Công cụ sẽ đọc thành UTF-8 và làm hỏng mọi byte không phải ASCII. Chỉ sửa kiểu thay chuỗi ASCII ở mức byte (sed/python `rb`), sau đó kiểm tra `git diff` xem chỉ đúng các dòng cần đổi bị thay đổi.
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

**Boss / phó bản báo lỗi:** mở `docs/BOSS-PHO-BAN.md` trước (hồ sơ 17 phó bản, loại lỗi đã gặp, quy trình) và dùng `node tools/soat-boss/soat.js <ID script>`.

### Boss rơi Nguyên Bảo Phiếu (29/09)

Hộp rơi **90001** (`Server/Config/DropBoxContent.txt`) chứa 1 món, BoxValue = Mvalue boss (60 → X = 1 × DropParam 2 = **2 phiếu mỗi lần giết, chung cả đội**; BV = 1 làm hỏng cả lượt rơi, xem quy tắc 6), gắn cho 139 boss trong `Server/Config/MonsterDropBoxs.txt`: boss phó bản (Phiêu Miểu Phong, Yến Tử Ổ, Tứ Tuyệt Trang, Thiếu Thất Sơn, Nhạn Môn, Tam Thần) + boss thế giới hồi sinh ≥ 30 phút và ≤ 4 điểm spawn. Loại trừ quái con `JiangShi_BOSS` (triệu hồi hàng loạt) và boss gọi bằng đồ/sự kiện (bản đồ kho báu, Cửu Lê). Sinh Tử Lôi Đài (Thủy Hử, 3 lần/ngày): cả 11 DataID boss đều có 90001 (12 trận/lượt), nhưng boss cấp 120 nên người cấp 80–89 chỉ nhận ×0,2 (DropAttenuation). Phó bản 45 phút (03/10).

Cùng 139 boss đó (29/09 chiều): đã gỡ hộp phiếu 1000 cũ và 54 hộp rác khỏi dòng boss (hộp gốc còn cho quái thường), và 14 hộp nguyên liệu được **sao riêng cho boss** thành `90002`–`90015` với BoxValue = ½ gốc (bảng đối chiếu ở `docs/TRANG-THAI.md` mục 0). Muốn chỉnh tỉ lệ nguyên liệu boss: sửa BoxValue dòng `9000x`, không đụng hộp gốc.

**⚠ Tab 💥 Drop Boss (admin/mod.netco4.click, từ 29/09 tối)** sửa `MonsterDropBoxs.txt` + `DropBoxContent.txt` **trực tiếp trên VPS**, không qua repo (backup tự động ở `/opt/tlbb-backup/dropui-*`). Vì vậy **trước mỗi lần `cap-nhat.sh` phải chạy `./lay-tu-server.sh --push`** (hoặc kéo 2 file đó về repo) — quên là cap-nhat ghi đè mất chỉnh sửa của admin. Đóng tab cho mod: xem chú thích `29/09 tạm MỞ` trong `bialk/BotDoMin/panel.js`.

**📜 Nhật ký Drop Boss (29/09):** mọi lần lưu ở tab Drop Boss ghi 1 dòng JSON vào `/opt/tlbb-backup/dropboss-audit.jsonl` (ai: cổng + IP, lúc nào, trước → sau, nguyên dòng file để khôi phục), xem ở nút 📜 Lịch sử sửa (chỉ cổng SUPER). File gắn `chattr +a`: chỉ ghi thêm, **không được `chattr -a` / xóa / cắt**. Cuối mỗi dòng có nút **↩ Rollback** (chỉ SUPER): trả đúng các dòng file lần sửa đó đụng về như trước; đã có lần sửa sau thì báo XUNG ĐỘT và hỏi lại; bản thân rollback cũng ghi nhật ký. Hiệu lực sau restart game. Code ở repo `bialk` (`BotDoMin/dropboss.js`).

**Đổi mệnh giá:** chỉ sửa cột thứ 5 của dòng `90001` thành ID phiếu khác: 1.000 = `39910001` (hiện tại, mọi hộp phiếu 900xx), 2.000 = `39910002`, 5.000 = `39910003`, 10.000 = `39910004`, 50.000 = `39910005`, 100.000 = `39910006`. Sau đó `./cap-nhat.sh` và restart. Phiếu chuột phải ra KNB (script 100001 `New/item/YuanBaoPiao.lua`), KNB đó chuyển ra web qua NPC Ví Web không giới hạn.

## Đã vá so với bản public (đừng hoàn tác)

Xem `docs/KIEM-TOAN.md`. Tóm tắt: tắt NPC phát Điểm Tặng/vàng/KNB vô hạn, lô đề số trúng viết cứng, Gift Code (mã VIP đã lộ), đổi thẻ cào, các handler ẩn, quyền gắn cứng theo GUID của server cũ, giới hạn cùng IP ở Thủy Lao. Dòng vá có chú thích `-- [don-dep]`.

### 6. Bảng .txt và rơi đồ (01/10)
- Mọi bảng `.txt` dạng DBC (`MonsterDropBoxs`, `DropBoxContent`, `PetAttrTable`, `StandardImpact`, `EquipBase`, `CommonItem`…) **phải sắp ID tăng dần**: engine tìm nhị phân, dòng sai thứ tự = không tồn tại, không báo lỗi. Thêm dòng = chèn đúng chỗ, kiểm bằng node trước khi commit.
- **Bảng rơi tính 1 lần cho mỗi con, CHUNG cả đội** (sửa 03/10, dịch ngược `MonsterDropRuler::CaculateCommDropRuler` / `CaculateBossDropRuler` + đếm log vật phẩm): mỗi hộp X = Mvalue ÷ BoxValue × **DropParam (2.0, có nhân)** × giảm rơi theo chênh cấp; X < 1 là tỉ lệ ra 1 món, X ≥ 1 ra ⌈X⌉ món. Quái thường giao cả túi cho **1 người ngẫu nhiên** trong đội; boss rơi **1 túi chung, tối đa 10 món**. Hộp phiếu Mv = BV → **2 phiếu mỗi lần giết cho cả đội** (không phải 1 phiếu/người). BV = 1 làm hỏng cả lượt rơi.
- **Rơi qua script** (`NetCo4/roimap.lua` `x950001_Chia`: Cửu Thiên, MB/BN 6, Tử Vi, bản đồ farm, Kỳ Cuộc RoiCfg) thì **tung riêng cho từng thành viên** đứng gần, không giảm theo cấp.
- Danh sách bẫy đầy đủ: README mục "Bẫy dễ dính".

### 5. Tiến trình game và systemd (sự cố 28/09 17:40)
Game chạy trong `tlbb.service`. **Không bao giờ** khởi động game từ tiến trình khác (panel, script tay qua SSH) rồi restart/stop tiến trình đó: systemd tắt cả nhóm con, kể cả MySQL và ShareMemory → mất dữ liệu nhân vật chưa lưu. Khởi động/restart game chỉ bằng `systemctl restart tlbb` (panel đã sửa để làm vậy). Nếu buộc phải chạy tay: `./tlbb.sh start` từ SSH thì trước khi đóng SSH hoặc restart panel, kiểm tra `systemctl status tlbb` xem game có nằm đúng unit không.
