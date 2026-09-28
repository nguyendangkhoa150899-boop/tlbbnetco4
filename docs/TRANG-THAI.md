# Trạng thái và việc tiếp theo

Cập nhật: 28/09/2026 (kết thúc phiên dựng server). Claude ở nhà: đọc file này cùng `CLAUDE.md` rồi tiếp tục từ "Việc tiếp theo".

## ⚠ SERVER ĐANG Ở CHẾ ĐỘ TEST (từ 28/09 tối)

Đang bật cho test, **phải hoàn tác trước khi chơi thật** (mọi người bắt đầu lại từ cấp 1):
- **Cấp tối thiểu toàn server = 119** (panel, file `Server/txt/NetCo4Qua/_capmin.txt`): mọi nhân vật đã vào phái tự lên 119, kể cả nhân vật mới.
- Đã phát cho mọi nhân vật test: 10 triệu KNB, 10 triệu Điểm Tặng, 5.000 vàng, cấp 119. GM cho nhân vật test.

Trước khi chơi thật: `./tlbb.sh stop && ./reset-choi-that.sh && ./tlbb.sh start`. Script này xóa nhân vật, đồ, KNB, GM list và **xóa `_capmin.txt` (tắt cấp 119)**. Sau đó mở panel kiểm tra ô "Cap toi thieu toan server" phải là **0**, rồi tạo 1 nhân vật thử xem có bắt đầu từ cấp 1 không.

## Đã xong

- [x] Rà soát và dọn bản public: vá script phát quà, lô đề, gift code, handler ẩn, GUID cứng (chi tiết ở `KIEM-TOAN.md`)
- [x] Dựng VPS `103.216.118.123`: chroot Ubuntu 10.04, tường lửa, swap, sao lưu tự động 4h sáng
- [x] RAM nâng lên 6.9GB (server dùng ~3.1GB lúc trống)
- [x] Dịch vụ systemd `tlbb.service`: tự bật server khi VPS khởi động, tự tắt an toàn (lưu nhân vật) khi VPS tắt/reboot
- [x] Client mặc định chạy cửa sổ 1280x720 (`Accounts/System.cfg`: `View_FullScreen=0`, `View_Resoution`)
- [x] Database sạch: 0 nhân vật, chỉ còn tài khoản `admin`, GUID mới bắt đầu từ `1010100000`
- [x] Đổi tên server cũ "Tân Thần Long" thành **NetCo4** (17 file script, danh sách server trong client)
- [x] Gói client `NetCo4.zip` (2.42GB, nằm trên máy của Khoa ở `D:\TeraBoxDownload\TLBBFULLTOOL\`): thư mục `NetCo4\`, mở bằng `NetCo4.cmd`, đã trỏ sẵn về server
- [x] Repo GitHub và quy trình deploy `cap-nhat.sh` (đã thử commit → push → VPS pull)
- [x] Danh mục vật phẩm `docs/vat-pham/`, công cụ tiếng Việt `tools/vn.py`

## Việc tiếp theo

1. **Máy nhà vào được VPS**: `ssh-keygen -t ed25519`, rồi dán nội dung `~/.ssh/id_ed25519.pub` vào `/root/.ssh/authorized_keys` trên VPS qua Terminal của iNET (OneDash). Kiểm tra: `ssh -p 24700 root@103.216.118.123 /opt/tlbb-deploy/tlbb.sh status`.
2. **Tạo tài khoản cho bạn bè**: `./tao-account.sh <ten> <matkhau>`. Mật khẩu admin (không ghi ở đây vì repo public): hỏi Khoa, hoặc đặt lại `./tao-account.sh --doi admin <moi>`.
3. **Giai đoạn test**: bạn bè tạo nhân vật → `./cap-gm.sh --tat-ca` → `./tlbb.sh restart`.
4. **Làm event**: xem `PHAT-TRIEN.md`. Ý tưởng đang có: bảng drop boss theo khu vực (Kính Hồ, Thương Sơn, Võ Duy, Thảo Nguyên...) và vòng quay dạng menu NPC. Vật phẩm không có trong game thì thay bằng vật phẩm có sẵn.
5. **Trước khi chơi thật**: `./tlbb.sh stop && ./reset-choi-that.sh && ./tlbb.sh start` (giữ tài khoản và event, xóa nhân vật và đồ tạo lúc test).

## Chưa kiểm chứng (chạy thử trước khi tin)

- `reset-choi-that.sh` và `cap-gm.sh --tat-ca`: viết xong, **chưa chạy lần nào**. `cap-gm.sh` dùng cột `t_char.isvalid`, cột này đã được xác nhận là có.
- Giải nén `NetCo4.zip` rồi mở game trên một máy sạch: chưa thử. `NetCo4.cmd` thì đã chạy được trên client gốc.
- Chưa ai tạo nhân vật hay vào trong game trên server mới (mới chỉ tới màn hình đăng nhập, và bị gõ nhầm tên tài khoản).
- Bảng rơi đồ `MonsterDropBoxs.txt` / `DropBoxContent.txt`: chưa xác minh ý nghĩa cột tỉ lệ (`Mvalue`, `BoxValue`).
- 2 lỗi `invalid option in format` trong `luaerror.log` có từ trước khi đổi tên, chưa rõ script nào gây ra.

## Vấn đề mở

- **Nâng cấp VPS trên iNET (RAM/CPU) sẽ reboot máy.** Có `tlbb.service` nên server tự lưu và tắt nếu iNET tắt máy nhẹ nhàng (ACPI). Nếu iNET tắt cứng thì vẫn mất dữ liệu chưa lưu. An toàn nhất: `./tlbb.sh stop` trước khi bấm nâng cấp. Lần nâng RAM 28/09 còn làm dịch vụ ufw bị tắt khởi động cùng máy (đã sửa bằng `systemctl enable ufw`). Sau mỗi lần nâng cấp, kiểm tra `ufw status`.

- **RAM**: đã nâng lên 6.9GB. Theo dõi bằng `./tlbb.sh status` khi đông người.
- **Client có file bị Defender báo Trojan**: `Bin/RSSParser.dll` (bắt buộc để chạy game, người chơi phải thêm ngoại lệ cho thư mục `NetCo4\Bin`). Chưa có kết quả VirusTotal (SHA256 `1b19cdb793f4b6a840e080b1bdcb660f0ce7274b835d9b68db0f190cc5d0577c`). Muốn bỏ rủi ro này thì phải tìm client khác cùng phiên bản `1005`.
- **VPS chưa push được lên GitHub** (chưa thêm deploy key `/root/.ssh/github_deploy.pub`). Hiện chỉ GitHub → VPS. Xem `CLAUDE.md`.
- **Repo public**: không có mật khẩu, nhưng cấu trúc server và danh sách những gì đã vá thì ai cũng đọc được. Chuyển sang private thì phải thêm deploy key (xem trên).
- Nút Đăng ký/Nạp thẻ không xóa được (giao diện bị nhúng trong `OgreMain.dll`). Chúng mở `hoatientu.tk` (tên miền .tk đã hết hạn, có thể bị người khác đăng ký lại). **Đã chặn** bằng `deploy/client/chan-link-la.ps1` (ghi file hosts, trỏ `hoatientu.tk`, `hoiucthienlong.com`, `tanthanlong.com` về 127.0.0.1; có trong gói zip). Thấy link lạ khác thì thêm bằng `-Them tenmien`.
- 5 NPC dịch chuyển trong `MyNew/zhaohuan/` bị hỏng từ bản gốc: `Script.dat` trỏ tới `linhaixigu.lua`... nhưng file thật tên là `linhaixigu1.lua`.

## Vị trí đồ trên máy của Khoa (không có trong repo)

| | Đường dẫn |
|---|---|
| Client đang chạy (đã có ngoại lệ Defender) | `D:\TeraBoxDownload\TLBBFULLTOOL\netco4\Thien Long 3D\Thien Long Gate` |
| Gói client gửi bạn bè | `D:\TeraBoxDownload\TLBBFULLTOOL\NetCo4.zip` |
| Ổ đĩa máy ảo gốc | `D:\TeraBoxDownload\TLBBFULLTOOL\netco4\ServerTLBB3D\ServerTLBB\Ubuntu.vmdk` (đã có bản trên VPS: `/root/Ubuntu.vmdk`) |
| Bản đọc tham khảo của `/home` gốc | `netco4\vm_home\` (**chỉ để đọc**, đã bị hỏng tên 36 file khi giải nén trên Windows) |
| Tài liệu lệnh GM gốc | `netco4\tlbb code\` |

## Panel admin (thêm 28/09)

- Mở: **https://103.216.118.123:8443** (hoặc `panel/mo-panel.cmd`). Chứng chỉ tự ký (`/etc/tlbb-panel/`), nên lần đầu trình duyệt cảnh báo, bấm Nâng cao rồi Tiếp tục.
- Mật khẩu panel: `PANEL_PASS` trong `/opt/tlbb-deploy/secrets.env` (không có trong repo). Sai 5 lần thì khóa IP 15 phút. Phiên đăng nhập 12 giờ, lưu trong RAM (restart panel là phải đăng nhập lại).
- Chạy trên VPS bằng `tlbb-panel.service` (`/opt/tlbb-repo/panel/panel.py`), **mở ra internet** ở cổng 8443 (ufw đã mở). Có HTTPS, bắt buộc đăng nhập, cookie Secure/HttpOnly/SameSite, token chống CSRF, kiểm tra Host. Ai có mật khẩu panel là toàn quyền admin: đổi mật khẩu bằng cách sửa `PANEL_PASS` rồi `systemctl restart tlbb-panel`.
- Làm được: tạo/đổi mật khẩu/xóa tài khoản, xem ai online (`web.account.is_online` do billing ghi), bật/tắt GM (cần restart), tìm ID vật phẩm, gửi vật phẩm/KNB/vàng cho 1 hoặc tất cả nhân vật, restart server.
- Gửi quà = ghi hàng đợi `Server/txt/NetCo4Qua/<GUID>.txt`. Script `950000` (`NetCo4/quatang.lua`) phát khi nhân vật **đăng nhập**, gọi từ dòng đầu `x888888_OnScenePlayerLogin` trong `scene.lua` (đặt trước các lệnh `return` sớm của hàm đó).
- Nhật ký thao tác: `/opt/tlbb-backup/panel.log`.
- Hàng đợi hiểu các lệnh: `item <ID> <SL>`, `knb <n>`, `vang <n>`, `vip <0-10>`. Riêng "Quà popup" ghi `Server/txt/NetCo4Popup/<GUID>.txt` (1 dòng ID), hiện cửa sổ quà khi vào game (chưa thử).
- **Chưa kiểm chứng:** việc phát quà trong game. Script 950000 cần restart để có hiệu lực, và chưa thử nhận quà thật. Sau lần restart đầu, gửi thử 1 vật phẩm rồi xem `Server/Log/luaerror.log`.

## Ghi chú kỹ thuật mới

- `Script.dat` đăng ký nhiều script trong `Script/new/` (chữ thường, ví dụ `895099=\new\event\wuhun\wutong.lua`). Thư mục này **không có trong repo** vì trùng tên với `Script/New/` trên Windows. Muốn sửa các script đó thì phải sửa trên VPS rồi `./lay-tu-server.sh`, hoặc đổi luật trong `dong-bo.list`.

## Cập nhật 28/09 (buổi chiều)

- Nhận quà từ panel: đăng nhập **hoặc đổi bản đồ** (thêm lệnh gọi ở đầu `x888888_OnScenePlayerEnter` trong `scene.lua`). Lần nhận đầu tiên đã chạy được: hàng đợi của Bialk bị đọc lúc đăng nhập. Chưa được người chơi xác nhận món đã vào túi.
- Đã sửa lỗ hổng XieziQuickly 9997/9998, viết lại vòng quay (server chọn món), bật Điểm danh 070053, thêm cấp VIP qua panel. Chi tiết và danh sách event cũ: `docs/EVENT-CU.md`.

## Cập nhật 28/09 (cuối ngày) - trạng thái kiểm chứng

Đã xác nhận chạy: panel (tài khoản, online, restart), phát quà qua hàng đợi (hàng đợi được đọc và xóa khi đăng nhập; người chơi chưa báo lại món có vào túi), restart sau deploy không sinh lỗi Lua mới.
Chưa thử trong game: vòng quay mới, Điểm danh 070053, cấp VIP qua panel, nhận quà khi đổi bản đồ, `reset-choi-that.sh`, `cap-gm.sh --tat-ca`, nút Gỡ kẹt khi có người chơi, lệnh GM `!!createitem`/`!!createpet`.
Chỉ tra cứu, chưa sửa: chỉnh % chiêu (`docs/PHAT-TRIEN.md` mục "Chỉnh sức mạnh kỹ năng"), pet.
Tài khoản: `admin` (nhân vật `Bialk`, GUID 1010100001, GM), `hoang`. Mật khẩu hỏi Khoa.
- **Sự cố 17:40 28/09:** game bị tắt sạch (cả MySQL) vì restart panel khi game do panel spawn. Đã bật lại bằng `systemctl restart tlbb`; panel sửa để restart qua systemd, Login gỡ kẹt qua `systemd-run`, `tlbb-panel.service` thêm `KillMode=process`. Dữ liệu nhân vật có thể mất tối đa 15 phút (chu kỳ tự lưu `DATAInterval=900000`); ShareMemory nhận SIGTERM, chưa rõ có lưu kịp không. Kiểm tra lại đồ/cấp của Bialk và nhân vật của `hoang`.
- **Panel: "không gửi được KNB"** (28/09 tối). Không phải lỗi phát quà: với KNB/vàng/VIP, con số phải nhập vào ô thứ nhất (`gt`), còn ô `SL` chỉ dùng cho vật phẩm. Người dùng nhập 166 vào `SL` nên trình duyệt chặn vì ô `gt` bắt buộc. Đã sửa: placeholder ô `gt` đổi theo loại quà, ô `SL` ẩn khi không phải vật phẩm; server chặn vàng > 1.000.000.000/lần (AddMoney nhận int32). Đã deploy 19:46 (`260d3ad`, restart `tlbb-panel`, game không bị ảnh hưởng). **Vẫn chưa ai thấy KNB vào túi thật** (`YuanBao(sceneId, selfId, -1, 1, n)` trong `quatang.lua`, cùng cách gọi với 316 chỗ khác).
- **Máy nhà (`DESKTOP-1O9AVQ5`) đã vào được VPS** (28/09 19:45, key `khoa-nha-DESKTOP-1O9AVQ5`). Dấu vân tay host key VPS: `ED25519 SHA256:FCKxIgt+RkMsp8ACU4+I2xmIxRPv4rd4NZWA2SzHiuM`. Máy này chưa có Python (cần cho `tools/vn.py`) và chưa đặt `git config user.name/email`.
- **GM của `cuocdoibuon` (1010100003) chưa có hiệu lực**: cấp lúc 19:36, game chạy từ 18:04, cần restart.
- **Cấu hình SSH cần rà soát lại** (chi tiết không ghi trong repo vì repo public, hỏi Khoa).
