# Trạng thái và việc tiếp theo

Cập nhật: 28/09/2026 (kết thúc phiên dựng server). Claude ở nhà: đọc file này cùng `CLAUDE.md` rồi tiếp tục từ "Việc tiếp theo".

## ⚠ SERVER ĐANG Ở CHẾ ĐỘ TEST (từ 28/09 tối)

Đang bật cho test, **phải hoàn tác trước khi chơi thật** (mọi người bắt đầu lại từ cấp 1):
- **Cấp tối thiểu toàn server = 119** (panel, file `Server/txt/NetCo4Qua/_capmin.txt`): mọi nhân vật tự lên 119 khi đăng nhập/đổi bản đồ, kể cả nhân vật mới (từ lần restart sau 28/09 21:40 thì không cần vào phái; trước đó phải vào phái).
- **Cấp khởi đầu nhân vật mới = 99** (`Server/Config/DefaultChar.ini` dòng 9 `level=99`, có sẵn từ server cũ, không phải do test). Muốn chơi thật từ cấp 1: đổi thành `level=1` (sửa byte, file có chú thích GBK). **Không bao giờ đặt ≥ 100**: `scene.lua` `x888888_OnScenePlayerFirstLogin` coi nhân vật mới cấp ≥ 100 (hoặc HP ≥ 20 triệu, KNB ≥ 500) là hack và `SetLevel 0`.
- Đã phát cho mọi nhân vật test: 10 triệu KNB, 10 triệu Điểm Tặng, 5.000 vàng, cấp 119. GM cho nhân vật test.
- **Chat Thế giới không chờ (chỉ test):** `Public/Config/ChatConfig.txt` dòng kênh `2` (`世界频道`), cột 4 (khoảng cách gửi): 180000 → 0 ms (commit `9b51d06`). Hoàn tác: sửa lại cột đó thành `180000` (sửa byte, file GBK). **Đừng `git revert 9b51d06`**: commit đó cũng sửa bùa Hồi Thành, và dòng này đã được sửa tiếp nên revert sẽ xung đột.

Trước khi chơi thật: trả chat Thế giới về `180000` (ở trên), đổi `DefaultChar.ini` về `level=1`, rồi `./tlbb.sh stop && ./reset-choi-that.sh && ./tlbb.sh start`. Script này xóa nhân vật, đồ, KNB, GM list và **xóa `_capmin.txt` (tắt cấp 119)**. Sau đó mở panel kiểm tra ô "Cap toi thieu toan server" phải là **0**, rồi tạo 1 nhân vật thử xem có bắt đầu từ cấp 1 không.

**Giữ cho server chính** (không hoàn tác, người dùng chốt 28/09 22:25):
- **Trùng Lâu Liên/Giới/Ngọc luôn ra đúng 15 dòng** (người dùng chốt 28/09 23:55; `EquipBase.txt` 9 ID `10553100`–`10553105`, `10553112`–`10553114`): Giới hạn SL, Băng/Hỏa/Huyền/Độc công, Nội công, Chính xác, Hội công, Nội Lực, Thể lực, Trí lực, Thân pháp, Tất cả thuộc tính, Bỏ qua kháng Băng/Huyền; số dòng 15–15. Bản thường yếu hơn bản Chân (đoạn giá trị 100 so với 4321). Món đã có không đổi, phải phát món mới.
- **Về thành hồi chiêu 5 giây, vẫn niệm như gốc**: `SkillData_V1.txt` dòng 22 (`回城`, nút "Trở Về Thành"): hồi chiêu 5 phút → 5 giây, niệm 5 giây giữ nguyên. Dòng 36 (`回城符`, bùa Hồi Thành): hồi chiêu 2 phút → 5 giây, niệm 10 giây giữ nguyên. Tooltip client vẫn ghi "5 phút" (chữ nằm trong client, không sửa được). Commit `b8592cc` (trả lại thời gian niệm) có hiệu lực từ restart 23:21.
- **Chế đồ niệm 0,5 giây**: `ItemCompound.txt` cột 27 (`操作时间`) của 1.305 công thức (1,5–30 giây) → 500 ms (commit `2bf5688`). Người dùng đã thử: chạy.

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
- **Cấu hình SSH cần rà soát lại** (chi tiết không ghi trong repo vì repo public, hỏi Khoa).

## Cập nhật 28/09 21:10 - deploy + restart

- Restart game 21:09 bằng `systemctl restart tlbb` (0 người online), 6 tiến trình đúng unit, không có lỗi Lua mới. Server khớp repo `20eef59`.
- Có hiệu lực từ lần restart này: panel phát **Điểm Tặng**, **Lên cấp**, **cấp tối thiểu toàn server** (đang 119, xem mục CHẾ ĐỘ TEST), GM của `cuocdoibuon`.
- Panel: KNB tới 10 triệu/lần (tự chia dòng 99.999), ô Vàng nhập theo **vàng** (trước đây là đồng: gõ 5000 chỉ được 50 bạc).
- **Sửa Thanh Tâm Phổ Thiện Chú hiện thành Xuân Hoa Thu Nguyệt:** server cũ tráo ID 422/424 trong `SkillTemplate_V1.txt` (còn để dòng gốc bị `#`), client vẫn dùng bản gốc. Đã bật lại dòng gốc (422 = Thanh Tâm, 424 = Xuân Hoa) và đổi `skillbook.lua` (sách `30307219` → 422, `30307230` → 424). Ai đã học 424 bằng sách Thanh Tâm (Bialklk, nhân vật Nga Mi) giờ có Xuân Hoa, học lại sách Thanh Tâm để có cả 2. **Chưa thử trong game.**
- **Thanh Tâm Phổ Thiện Chú (`30307219`) chỉ admin phát được** (giữ lâu dài, commit `d4a9591`): đã gỡ khỏi hộp rơi 70007 (quái 9110–9119) và 80001, cửa hàng KNB 146 (1000 KNB/cuốn), đổi Trùng Lâu (`doitrunglau2.lua` mục 7100). Phát bằng panel hoặc `!!createitem`. Có hiệu lực từ restart **21:42** (cùng commit chỉ-test `9b51d06` và cấp tối thiểu không cần vào phái). Restart 21:42: không có lỗi Lua mới.
- Đã xếp hàng cho 4 nhân vật (Bialk, Bialklk, cuocdoibuon, Hoang): 10 triệu KNB, 10 triệu Điểm Tặng, 5.000 vàng. **Đã kiểm chứng 21:30 qua database** (`t_char`): Bialklk 17.199 + 10 triệu = 10.017.199 KNB, Điểm Tặng 9.990.000 + 10 triệu = 19.990.000, vàng 5.003, cấp 119 (còn 159 điểm tiềm năng chưa cộng). cuocdoibuon, Hoang cũng đã nhận và lên 119. Bialk (1010100001) chưa đăng nhập lại, quà còn chờ. Tức là KNB (`YuanBao`), Điểm Tặng (`ZengDian`), vàng và cấp tối thiểu (`SetLevel`) đều chạy.

## Cập nhật 28/09 23:22 - Tạo Hóa riêng cho Bialklk

- Tạm sửa mẫu `EquipBase.txt` dòng `10303447` (Tạo Hóa, Song Đoản) chỉ ra 11 dòng người dùng chọn (Giới hạn SL%, Băng công, Huyền công, Nội công, Chính xác, Nội lực, Thể lực, Thân pháp, Tất cả thuộc tính, Bỏ qua kháng Băng/Huyền), tư chất 250 (commit `683a53b`), restart 23:21, xếp hàng 1 cây cho Bialklk (1010100002).
- Đã trả file về mặc định (`9192d0d`) nhưng **không restart** (người dùng chọn). Tới lần restart sau, server vẫn dùng mẫu tạm trong bộ nhớ: **mọi cây Tạo Hóa `10303447` tạo ra trước lần restart đó đều ra 11 dòng này, tư chất 250**.
- Chỉ số lưu riêng từng món (`t_iteminfo` cột `p1`–`p17`), nên đổi mẫu không ảnh hưởng món đã có. **Chưa kiểm chứng** cây mới ra đúng dòng và vẫn giữ dòng sau restart.

## Cập nhật 28/09 23:35 - chồng vật phẩm (chờ restart)

- `CommonItem.txt` cột 13 (`叠放数量`) 1 → 250: Nhuận Hồn Thạch `20310122`–`20310157` (36 bản) và Bảo Thạch Hợp Thành Phù Sơ cấp `30900015` / Cao cấp `30900016`. Quy tắc của chúng (4) vốn cho chồng, chỉ số chồng tối đa bị đặt 1. Client có bảng riêng (khóa), nên phải thử trong game: nhận vài cái xem có gộp, tách/bán/giao dịch có lỗi không.
- **Thử** chồng ngọc: `GemInfo.txt` `50412007` (Thuần tịnh dạ quang thạch cấp 4) quy tắc 1 → 6 (6 = 1 + cờ `重叠`). Ngọc không có cột số chồng tối đa, nhiều khả năng không có tác dụng.
- Đã xếp thêm 2 cây Tạo Hóa `10303447` cho Bialklk để thử mẫu tạm (cây đầu ra Hỏa công thay vì Nội Lực dù cột 42 `火攻击` đã tắt và cột 76 `灵气` bật). **Phải nhận trước khi restart**, restart là mất mẫu tạm trong bộ nhớ.

## 28/09 23:45 - ĐANG CHỜ RESTART (người dùng sẽ ra lệnh)

- Đã lên server, **chưa restart**: chồng 250 (`82384c3`), tất cả 361 ngọc quy tắc 1 → 6 (`23c8b11`, chưa chắc có tác dụng), lệnh panel **XOA vật phẩm** (`c19df59`, gửi trước restart thì bị bỏ qua).
- **Tạo Hóa: xong.** 2 cây nhận 23:34 (server chạy từ 23:20 với mẫu tạm lần 1 `683a53b`) ra đúng 11 dòng. Kết luận: **Nội Lực = `灵气` (cột 76)**; cây đầu dính Hỏa công là do game tung ngẫu nhiên (thỉnh thoảng thay 1 dòng). Mẫu lần 2 (`05f5caf`, dùng `定力`) là đoán sai, đã revert (`510c1c8`) trước khi có hiệu lực. File `EquipBase.txt` đã về mặc định; tới lần restart sau server vẫn giữ mẫu tạm lần 1 trong bộ nhớ.
- Không dùng lệnh XOA cho Tạo Hóa: cây đúng và cây sai cùng ID `10303447`, xóa theo ID có thể xóa nhầm cây đúng. Tạo Hóa quy tắc 3 vứt/bán được, người chơi tự bỏ cây sai.
- **Bảng tên dòng (đã đối chiếu tooltip):** cột 33 Giới hạn SL (điểm), 34 Giới hạn SL (%), 39/42/45/48 Băng/Hỏa/Huyền/Độc công, 52 Ngoại công, 59 Nội công, 68 Chính xác, 69 Né tránh, 70 Hội công, 75 Cường lực, 76 Nội Lực (`灵气`), 77 Thể lực, 78 Trí lực (`定力`), 79 Thân pháp, 81 Tất cả thuộc tính, 87–90 Bỏ qua kháng Băng/Hỏa/Huyền/Độc. Cột 27–32 là chỉ số gốc, không phải cờ.
- **Tắt dòng phải ghi `-1`, không phải `0`** (dữ liệu gốc dùng `-1`). Lần Tạo Hóa đầu tắt bằng `0` nên Hỏa công vẫn lọt vào.
- Cách làm món có dòng chọn sẵn (đã kiểm chứng): sửa cờ cột 29–90 + tư chất cột 95–96 của dòng `EquipBase.txt`, restart, phát (có thể phải phát vài cây vì ngẫu nhiên), `git revert`, `./cap-nhat.sh` (restart lại khi tiện).

