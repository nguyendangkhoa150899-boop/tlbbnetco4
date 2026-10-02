# Trạng thái và việc tiếp theo

Cập nhật: 02/10/2026 15:55 — **đọc mục cuối "02/10 trưa–chiều — TỔNG KẾT PHIÊN" trước**. (Bản đầu: 28/09/2026, kết thúc phiên dựng server.) Claude ở nhà: đọc file này cùng `CLAUDE.md` rồi tiếp tục từ "Việc tiếp theo".

> **01/10: mọi thứ đã làm + quyết định chốt + quy trình ngày mở nằm ở [MO-SERVER.md](MO-SERVER.md). Đọc file đó trước.**

## TỔNG HỢP THAY ĐỔI 28–29/09 (đọc mục này trước)

**Kế hoạch (29/09):** còn test thêm 2–3 ngày, chủ yếu **phó bản**, rồi mới chơi thật (dự kiến khoảng 01–02/10). Chưa chạy các bước ở mục 2.

Chi tiết từng việc ở các mục "Cập nhật ..." bên dưới. Mọi sửa file game đều ở mức byte (GBK/VISCII giữ nguyên).

### 0. Cập nhật 29/09 chiều (chưa restart — hiệu lực sau `./tlbb.sh restart`)

Checklist test ở `README.md` → "Đã làm chiều 29/09". Chi tiết kỹ thuật:

- **Boss rớt Nguyên Bảo Phiếu 2000** (`c817818`): hộp `90001` (`DropBoxContent.txt`, 1 món `39910002`, BoxValue 1) gắn cho 139 boss trong `MonsterDropBoxs.txt`. Danh sách boss = script `CreateMonster`/`DataID=` trong `event/bingshen*`, `piaomiaofeng*`, `sijuezhuang`, `shaoshishan`, `shaoshi`, `xuezhanymg`, `New/sanshen` + boss scene có cờ boss (`MonsterAttrExTable` cột 14 = 1), `respawn_time ≥ 1.800.000 ms`, ≤ 4 điểm spawn. Loại `JiangShi_BOSS` (14138, 14287, 14292, 9542, 9662 — quái con Tang Thổ Công triệu hồi) và boss gọi bằng đồ/sự kiện. **Đổi mệnh giá**: sửa cột 5 dòng `90001` (1.000 = `39910001`, 5.000 = `39910003`, 10.000 = `39910004`).
- **Sinh Tử Lôi Đài (Thập Nhị Sát Tinh)** (`obj/shengsi/`): cấp ≥ 80, 3 lần/ngày/người, 12 NPC mỗi NPC gọi 1 boss **cấp 120 cố định** (CreateId 13447 Lý Khôi, 13456 Ngô Vĩnh *(songjiang.lua cũng dùng 13456 — lỗi có sẵn: NPC Tống Giang gọi ra Ngô Vĩnh)*, 13465, 13474, 13483, 13492, 13501, 13510, 13519, 13528, 13537 Võ Tòng). **Không có ràng buộc thứ tự** giữa 12 boss. Chủ server chọn: chỉ **Võ Tòng 13537** (NPC số 12, script 892021) nhận hộp `90001` → thực tế 1 boss rớt/lượt, tối đa 3 lượt/ngày. Muốn cả 12: thêm `90001` vào 11 dòng còn lại.
- **Dọn hộp rơi của 139 boss** (commit này): gỡ tham chiếu 54 hộp rác (trang bị cấp 16–60 và 81–88 nhóm Xé Phong Ma, công thức nấu ăn/may vá 661–663/668, đá Thiểm Lượng 20/63) khỏi dòng boss; gỡ 3 hộp phiếu 1000 cũ (50004/50002/50001) khỏi dòng boss; 14 hộp đồ muốn sao thành `90002`–`90015` với BoxValue = ceil(½) và dòng boss trỏ sang bản sao. **Hộp gốc không xóa** (48/54 hộp rác và mọi hộp đồ muốn dùng chung với quái thường). Mộc Dũng Bá (868) có slot trống → nhận `90001`. Bảng đối chiếu: 50006→90002 Hàn Băng Tinh Tiết BV75 · 50010→90003 Chí Tôn Cường Hóa Tinh Hoa BV75 · 85020→90004 Long Hồn Ngọc BV600 · 51006→90005 Chú Văn Tinh Ngọc BV100 · 50011→90006 Long Văn +1 BV120 · 50023→90007 Miên Bố/Bí Ngân 8 BV50 · 85007→90008 Nữ Oa/Tụ Linh/Huyền Binh/Thần Binh Phù BV150 · 3025→90009 Huyền Hạo Ngọc BV25 · 51004→90010 Chuế Long Thạch ×3 BV100 · 51005→90011 Chú Văn Huyết Ngọc BV75 · 51007→90012 Chú Văn Long Ngọc BV125 · 85009→90013 Mệnh/Địa/Thiên Hồn Ngọc BV150 · 623→90014 Long Văn Thanh Từ Bình BV20 · 16000→90015 Huyền Hạo Ngọc BV75. Muốn tăng nữa: hạ BoxValue của dòng 9000x (1 = chắc chắn). Script tạo: scratchpad `boss_don.js` (không trong repo). 5 dòng lệch cột (9546, 11468, 12039, 42372, 42376) có sẵn từ file gốc.
- **Giảm 35% máu toàn bộ boss**: `Public/Config/MonsterAttrExTable.txt`, mọi dòng có cột 14 (`Boss kí hiệu`) = 1 (4.247 dòng): cột 19 (HP tối đa) × 0,65; cột 59 (MaxHP khi boss tự lên cấp theo người chơi, 2.922 dòng có giá trị) × 0,65. Không script nào đặt máu boss riêng, phó bản chọn dòng theo cấp đội nên mọi bậc đều giảm. Ví dụ Tang Thổ Công 75: 327.144 → 212.643; Tiêu Dật Phong 120: 4.695.680 → 3.052.192. Muốn đổi mức: chạy lại từ bản gốc (`git show <commit trước>:…`) với hệ số khác; file `1111MonsterAttrExTable.txt` / `MonsterAttrExTable1.txt` là bản cũ 2018 không được server đọc. Công/thủ boss giữ nguyên.
- **Tin hệ thống**: `NotifyOnline.txt` index 0, 4, 6, 9 cột isShow → 0 (`65441b8`); 42 lệnh `BroadMsgByChatPipe`/`AddGlobalCountNews` gắn `--[don-dep]` trong `MyNew/zhaohuan/yannan.lua`, `event/ZBS_GameArea/ZBS_GameAreaHZNPC.lua`, `event/huashan/ehuashan_1.lua`, `New/Songliao/Songliao_WarEven.lua`, `event/huodong/eJingHu_LingYao.lua`, `event/city/protect_guild_generate.lua`, `event/xunhuan/imperial_examinations.lua` (`e8ff862`). Quét đầy đủ: 1.353 lệnh phát tin, 65 theo giờ; chưa tắt nhóm "chúc mừng người chơi" (~550) và thông báo boss xuất hiện theo ý chủ server.
- **Chat Thế Giới 3 phút là client**: `ChatConfig.txt` server kênh 2 = 0 ms đang chạy; câu báo lỗi không có trong server; bảng chat client nằm trong `Bin/OgreMain.dll` mã hóa (thử tìm chữ thường, zlib 4.229 điểm, chữ ký AXP/ZIP: đều không ra). Không sửa.
- **Panel GM API nội bộ** (`/api/state`, `/api/items?q=` hoặc `?all=1`, `POST /api/act`, chỉ từ 127.0.0.1 + header `X-NetCo4-Key` = `PANEL_PASS`) phục vụ tab GM trong admin mini game (`29d9170`).
- **Miên Bố / Bí Ngân** (chỉ đọc): cấp 1–3 không quái nào rớt (chỉ túi quà); cấp 5–6 từ 3 boss Binh Thánh nhỏ (`bingshensmall/ai_hadaba/wulaoda/xiaoruwei.lua`, mỗi người 1 món/boss, bốc trong 7) và Mã Tràng Thủ Vệ; cấp 8 từ hộp 50023 (4 boss Thông Thiên Tháp…). Ác tặc/Ác bá/nhiệm vụ Tô Châu–Lâu Lan **không** rớt cấp 6 như kế hoạch nhóm bạn.

### 1. Giữ lâu dài (dùng luôn cho server chính)

- **Shop 150 bán ngọc cấp 5** (29/09, `fc8516f` + `d8c682d`): Tiệm Nguyên Bảo → Tiệm Bảo Thạch → nút "Ngọc Cấp 3" (= shop 150, Điểm Tặng) đổi 25 ngọc cấp 4 → cấp 5 (ID +100000), **giữ giá Điểm Tặng gốc** 1200/400 (người dùng đổi ý, không để 0). Không giới hạn số lượng.
- **Panel "Nâng ngọc trong túi lên cấp N" (2–7)** (`d8c682d`): panel tạo lệnh `doi <ID cũ> <ID mới>` cho mọi ngọc dưới cấp N có bản cấp N (cấp 7 = 270 loại; 30 loại đặc biệt `5031xxxx`–`5033xxxx` chỉ có cấp 4). `quatang.lua` đếm trong túi → xóa đúng số → phát lại ID mới trong 1 lượt. Ngọc khảm trên trang bị / trong kho không đổi. Cấp 7 là cao nhất của game.
- **Panel** (`panel/panel.py`) + **`NetCo4/quatang.lua`** (hàng đợi `Server/txt/NetCo4Qua/<GUID>.txt`): phát vật phẩm, KNB (tới 10 triệu/lần, tự chia dòng 99.999), vàng (nhập theo **vàng**), Điểm Tặng, Lên cấp, VIP, Quà popup, **XOA vật phẩm** (xóa theo ID, không chọn được món cụ thể), ô **Cấp tối thiểu toàn server**. Tìm vật phẩm không dấu, tên Hán-Việt cho 15.661 trang bị (`docs/vat-pham/ten-viet.tsv`, `tat-ca-vat-pham.csv`, tạo bằng `tools/viet-hoa-trang-bi.js`).
- **Thanh Tâm / Xuân Hoa (Nga Mi):** trả lại 422 = Thanh Tâm, 424 = Xuân Hoa cho khớp client (`20eef59`).
- **Thanh Tâm Phổ Thiện Chú `30307219` chỉ admin phát:** gỡ khỏi boss rơi, cửa hàng KNB 146, đổi Trùng Lâu (`d4a9591`).
- **Về thành hồi chiêu 5 giây, vẫn niệm như gốc**: `SkillData_V1.txt` dòng 22 (`回城`, nút "Trở Về Thành"): hồi chiêu 5 phút → 5 giây, niệm 5 giây giữ nguyên. Dòng 36 (`回城符`, bùa Hồi Thành): hồi chiêu 2 phút → 5 giây, niệm 10 giây giữ nguyên. Tooltip client vẫn ghi "5 phút" (chữ nằm trong client, không sửa được). Commit `b8592cc` (trả lại thời gian niệm) có hiệu lực từ restart 23:21.
- **Chế đồ niệm 0,5 giây**: `ItemCompound.txt` cột 27 (`操作时间`) của 1.305 công thức (1,5–30 giây) → 500 ms (commit `2bf5688`). Người dùng đã thử: chạy.
- **Chồng tối đa 250:** Nhuận Hồn Thạch `20310122`–`20310157` (36 bản), Bảo Thạch Hợp Thành Phù `30900015`/`30900016` (`82384c3`).
- **Tạo Hóa `10303447` hiệu ứng làm chậm:** cột 20 hút MP 9213 → 9150 (`大隋凝霜`, đánh trúng 30% → chậm 40% trong 15 giây) (`98c63e7`). Tooltip client vẫn ghi "Suy Nhược". **Đừng revert** nếu muốn giữ làm chậm (hiệu ứng đọc từ mẫu).

### 2. Chỉ test: phải hoàn tác trước khi chơi thật (mọi người bắt đầu lại từ cấp 1)

- **Cấp tối thiểu toàn server = 119** (panel, file `Server/txt/NetCo4Qua/_capmin.txt`): mọi nhân vật tự lên 119 khi đăng nhập/đổi bản đồ, kể cả nhân vật mới (từ lần restart sau 28/09 21:40 thì không cần vào phái; trước đó phải vào phái).
- **Cấp khởi đầu nhân vật mới = 99** (`Server/Config/DefaultChar.ini` dòng 9 `level=99`, có sẵn từ server cũ, không phải do test). Muốn chơi thật từ cấp 1: đổi thành `level=1` (sửa byte, file có chú thích GBK). **Không bao giờ đặt ≥ 100**: `scene.lua` `x888888_OnScenePlayerFirstLogin` coi nhân vật mới cấp ≥ 100 (hoặc HP ≥ 20 triệu, KNB ≥ 500) là hack và `SetLevel 0`.
- Đã phát cho mọi nhân vật test: 10 triệu KNB, 10 triệu Điểm Tặng, 5.000 vàng, cấp 119. GM cho nhân vật test.
- **Chat Thế giới không chờ (chỉ test):** `Public/Config/ChatConfig.txt` dòng kênh `2` (`世界频道`), cột 4 (khoảng cách gửi): 180000 → 0 ms (commit `9b51d06`). Hoàn tác: sửa lại cột đó thành `180000` (sửa byte, file GBK). **Đừng `git revert 9b51d06`**: commit đó cũng sửa bùa Hồi Thành, và dòng này đã được sửa tiếp nên revert sẽ xung đột.

- **Khóa cấp (01/10):** tab GM web admin / panel GM có ô **Cấp tối đa (khóa cấp)** + nút Lưu + Restart (act `capmax`, 10–119; ini 120 an toàn vì engine chỉ assert khi > 255). Ghi `ConfigInfo.ini` `HumanMaxDefaultLevel` = cấp + 1 (engine trừ 1 lúc nạp, `Config::LoadConfigInfo_ReLoad`; `CGReqLevelUpHandler` chỉ cho lên khi cấp < giá trị). Giá trị lưu ngoài repo ở `Server/txt/NetCo4Cfg/capmax.txt`, `cap-nhat.sh` áp lại sau rsync, `reset-choi-that.sh` không xóa. SetLevel của script (panel Lên cấp, cấp tối thiểu) KHÔNG bị chặn. Ngày mở: đặt **89**.

Trước khi chơi thật: trả chat Thế giới về `180000` (ở trên), đổi `DefaultChar.ini` về `level=1`, rồi `./tlbb.sh stop && ./reset-choi-that.sh && ./tlbb.sh start`. Script này xóa nhân vật, đồ, KNB, GM list và **xóa `_capmin.txt` (tắt cấp 119)**. Sau đó mở panel kiểm tra ô "Cap toi thieu toan server" phải là **0**, rồi tạo 1 nhân vật thử xem có bắt đầu từ cấp 1 không.

### 3. Tạm thời, đã trả về (file đã mặc định, không cần làm gì)

- Mẫu Tạo Hóa 11 dòng: `683a53b` → trả về `9192d0d`; lần 2 đoán sai `05f5caf` → trả về `510c1c8`. Bialklk giữ 2 cây đúng dòng.
- **Ngọc KHÔNG chồng được** (đã thử 29/09): đổi quy tắc 1 → 6 (`23c8b11`) không tác dụng vì `GemInfo.txt` không có cột số chồng tối đa, binary coi ngọc 1 viên/ô. Đã trả về (`957307e`).
- Mẫu Trùng Lâu Liên/Giới/Ngọc 15 dòng: `181e86c` → trả về `b1194aa` (29/09, không restart). Món đã nhận giữ nguyên 15 dòng. Đã có hiệu lực từ restart 29/09 01:37.

### 4. Chưa kiểm chứng / vấn đề mở

- **Điểm môn phái âm:** Bialklk `t_char.menpaipoint` = **-2000** (túi ghi "KM: -2000"), trước đó 0. Có chỗ trừ điểm môn phái không kiểm tra số dư. Đã loại: đổi điểm môn phái ↔ KNB (`odali_jinwuye.lua` 002059, có kiểm tra), đổi đồ bằng điểm môn phái (`event_exchangeitembymenpaipoint.lua` 229009, có kiểm tra), nâng tâm pháp (chỉ tốn tiền + kinh nghiệm). Đã loại thêm: Kim Ngũ Gia đổi điểm môn phái ra vàng/Điểm Tặng (có kiểm tra). 29/09 01:34 vẫn -2000. Chưa rõ nguồn. Nếu âm rồi vẫn mua/đổi được thì là lỗ hổng, phải vá trước khi chơi thật. `reset-choi-that.sh` xóa nhân vật nên server test không cần sửa tay.

- Hợp Thành Phù chồng được (người dùng xác nhận 29/09); Nhuận Hồn Thạch chưa thử; tách/bán/giao dịch khi đã chồng; lệnh XOA; làm chậm của Tạo Hóa; bùa Hồi Thành (kỹ năng 36) niệm 10 giây + hồi chiêu 5 giây; lệnh GM `!!createitem` (số lượng nằm ở tham số nào).

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

## 28/09 23:45 - thay đổi đã có hiệu lực từ restart 29/09 00:38

- Đã lên server, **chưa restart**: chồng 250 (`82384c3`), tất cả 361 ngọc quy tắc 1 → 6 (`23c8b11`, chưa chắc có tác dụng), lệnh panel **XOA vật phẩm** (`c19df59`, gửi trước restart thì bị bỏ qua).
- **Tạo Hóa: xong.** 2 cây nhận 23:34 (server chạy từ 23:20 với mẫu tạm lần 1 `683a53b`) ra đúng 11 dòng. Kết luận: **Nội Lực = `灵气` (cột 76)**; cây đầu dính Hỏa công là do game tung ngẫu nhiên (thỉnh thoảng thay 1 dòng). Mẫu lần 2 (`05f5caf`, dùng `定力`) là đoán sai, đã revert (`510c1c8`) trước khi có hiệu lực. File `EquipBase.txt` đã về mặc định; tới lần restart sau server vẫn giữ mẫu tạm lần 1 trong bộ nhớ.
- Không dùng lệnh XOA cho Tạo Hóa: cây đúng và cây sai cùng ID `10303447`, xóa theo ID có thể xóa nhầm cây đúng. Tạo Hóa quy tắc 3 vứt/bán được, người chơi tự bỏ cây sai.
- **Bảng tên dòng (đã đối chiếu tooltip):** cột 33 Giới hạn SL (điểm), 34 Giới hạn SL (%), 39/42/45/48 Băng/Hỏa/Huyền/Độc công, 52 Ngoại công, 59 Nội công, 68 Chính xác, 69 Né tránh, 70 Hội công, 75 Cường lực, 76 Nội Lực (`灵气`), 77 Thể lực, 78 Trí lực (`定力`), 79 Thân pháp, 81 Tất cả thuộc tính, 87–90 Bỏ qua kháng Băng/Hỏa/Huyền/Độc. Cột 27–32 là chỉ số gốc, không phải cờ.
- **Tắt dòng phải ghi `-1`, không phải `0`** (dữ liệu gốc dùng `-1`). Lần Tạo Hóa đầu tắt bằng `0` nên Hỏa công vẫn lọt vào.
- Cách làm món có dòng chọn sẵn (đã kiểm chứng): sửa cờ cột 29–90 + tư chất cột 95–96 của dòng `EquipBase.txt`, restart, phát (có thể phải phát vài cây vì ngẫu nhiên), `git revert`, `./cap-nhat.sh` (restart lại khi tiện).

## 29/09 00:38 - restart

- Có hiệu lực: chồng 250 (Hợp Thành Phù, Nhuận Hồn Thạch), 361 ngọc quy tắc 6 (chưa thử), lệnh XOA, Trùng Lâu Liên/Giới/Ngọc 15 dòng cố định, Tạo Hóa `10303447` hiệu ứng làm chậm (`98c63e7`: cột 20 9213 hút MP → 9150 `大隋凝霜`, đánh trúng 30% → chậm 40% trong 15 giây). Không có lỗi Lua mới.
- Tooltip Tạo Hóa vẫn ghi "Suy Nhược" (chữ phía client). Server trước đó cho `10303447` hút MP (9213), không phải Suy Nhược; 9 bản Tạo Hóa chia 3 hiệu ứng: `440/443/446` hút máu 9212, `441/444/447` hút MP 9213, `442/445/448` Suy Nhược 9214.
- **Chưa kiểm chứng trong game:** làm chậm khi đánh, chồng ngọc, chồng Nhuận Hồn Thạch/Hợp Thành Phù, XOA, Trùng Lâu 15 dòng (cần phát món mới).

## 29/09 01:37 - restart

- Có hiệu lực: mẫu Trùng Lâu Liên/Giới/Ngọc về mặc định, quy tắc ngọc về 1. 6 tiến trình đúng unit, không lỗi Lua mới. Server khớp repo.
- Ý tưởng tiếp theo (người dùng): mini game web (Tài Xỉu, Dò mìn) + điểm danh, chuyển KNB game ↔ web, web bán Cao cấp Hợp Thành Phù và ngọc. Thiết kế đề xuất: NPC "Ví Web" (script 950001) trừ KNB và ghi phiếu (1 file/giao dịch, ghi tạm rồi đổi tên); web → game qua hộp thư riêng + file xác nhận (mỗi bên chỉ ghi file của mình, không mất/không trùng); web đăng nhập bằng tài khoản game, kết quả tính ở server, sổ giao dịch, giới hạn/ngày. Chờ người dùng gửi code web.

## 29/09 - Cầu KNB với web mini game (BotDoMin)

- Bot mini game (repo `bialk`, thư mục `BotDoMin` + TaiXiu/SieuTaiXiu/Roulette/Poker/TienLen) chuyển sang chạy **trên VPS game**, tiền web đổi tên Dogcoin → **KNB**, tỉ giá 1:1, dữ liệu mới (không mang số dư cũ), tính năng Palworld tắt.
- **NPC "Ví Web"** = NPC Gift Code cũ (script `999999`, `CDK/CDK.lua` viết lại), Lạc Dương (203,323) + Đại Lý (154,170), title đổi thành "Ví Web NetCo4". Chọn 1.000 / 10.000 / 50.000 / 100.000 / 500.000 / 1.000.000 / Toàn bộ → trừ KNB trong game → phiếu `Server/txt/NetCo4Web/out/<GUID>_<giờ>_<số>.txt` ("GUID số END") → bot cộng ví web, chuyển phiếu sang `out/xong/`. **Không giới hạn.**
- **Web → game:** bot ghi `Server/txt/NetCo4Web/<GUID>.in` (dòng "mã số ok", ghi tạm rồi đổi tên). `x999999_NhanWeb` (gọi từ `quatang.lua` lúc đăng nhập/đổi bản đồ) phát dòng chưa có trong `<GUID>.done`, ghi mã vào `.done` TRƯỚC khi phát. **Tối đa 30.000 KNB/người/ngày.**
- Liên kết ví web ↔ nhân vật: admin nhập tên nhân vật (hoặc GUID) ở panel bot, bot tra `tlbbdb.t_char`, lưu `tlbbGuid`. 1 nhân vật chỉ gắn 1 ví.
- **Chưa thử trong game.** Cần restart game để nạp CDK.lua/quatang.lua/title NPC mới.
- **29/09 12:00 - tên miền `netco4.click` (iNET, hết hạn 29/09/2027), HTTPS Let's Encrypt (tự gia hạn), nginx `/etc/nginx/sites-available/netco4`:** `netco4.click` + `play.` → web mini game (127.0.0.1:3002), `admin.` → panel mini game SUPER (127.0.0.1:1508), `gm.` → panel Thiên Long (https 127.0.0.1:8443). ufw mở thêm 80/443. Bot mini game chạy `minigame.service` trong `/opt/minigame` (repo `bialk`), đã bật. Game đã restart 11:50: NPC Ví Web có hiệu lực. **Chưa thử chuyển KNB thật.**

## 29/09 19:11 - nhật ký Drop Boss

- Repo `bialk` `0455c77` + `5aeffb8`: `/opt/tlbb-backup/dropboss-audit.jsonl` (JSON mỗi dòng, `chattr +a`), ghi trước khi sửa file game + fsync, ghi nhật ký lỗi thì không lưu; nút 📜 Lịch sử sửa (chỉ SUPER, API `/api/drop/log`). Lý do không dùng `log_admin.txt`: `writeLog` chỉ giữ 1.000 dòng cuối, Phi Thuyền ghi vài giây một lần nên dòng Drop Boss trôi mất sau vài giờ.
- Deploy: chép 2 file từ git (LF, đối chiếu hash, `node --check`) lên `/opt/minigame/BotDoMin`, bản cũ ở `/opt/tlbb-backup/minigame-20260929-191112`, `systemctl restart minigame`. Game không ảnh hưởng. `/opt/minigame` không phải git repo: deploy = chép file.
- 19:16 (`bialk` `ac7a243`): lịch sử cũng có ở tab 📜 Log → mục 💥 Drop Boss (chỉ SUPER).
- 19:40 (`bialk` `427da21` + `ec9699d`): nút **↩ Rollback** cuối mỗi dòng lịch sử (chỉ SUPER, `/api/drop/rollback`). Nhật ký lưu `changes` (nguyên dòng file trước/sau); xung đột → hỏi lại mới ghi đè; rollback ghi nhật ký nên rollback lại được; rollback tách hộp giữ hộp nếu còn quái khác dùng. Đã test 10 tình huống trên bản sao (file về gốc từng byte). Dòng định dạng cũ (19:11–19:39, có `raw`) được quy đổi khi đọc.
- Dòng nhật ký thật đầu tiên: 19:21 SUPER sửa hộp 308 (có tên món) - rollback được.

## 29/09 20:38 - đồ riêng cho nhân vật test bia1 (1010100008)

- Mẫu tạm `a060a51` → restart 20:37 → xếp hàng cho bia1: quạt Phù Sinh `10304435` ×1 (11 dòng: Giới hạn SL%, Hỏa công, Độc công, Nội công, Chính xác, Nội Lực, Thể lực, Thân pháp, Tất cả thuộc tính, Bỏ qua kháng Hỏa/Độc; tư chất 250; tắt bằng `-1`), Chân-Trùng Lâu Liên `10553103` ×1, Giới `10553104` ×2, Ngọc `10553105` ×2 (15 dòng như 28/09). File mẫu đã trả về mặc định (`2623fc1`), không restart: tới lần restart sau server vẫn dùng mẫu tạm.
- Restart 20:37 cũng kích hoạt: shop 150 ngọc cấp 5 giá Điểm Tặng gốc, lệnh `doi` / panel "Nâng ngọc lên cấp N".
- 20:47: bia1 build lại Hỏa/Độc → mẫu tạm `51469b8` (Chân-Trùng Lâu Liên/Giới/Ngọc 15 dòng, Bỏ qua kháng **Hỏa + Độc** cột 88/90 thay Băng/Huyền 87/89), restart 20:46, xếp hàng bia1 Liên ×1, Giới ×2, Ngọc ×2, file trả về mặc định (`d6aedc9`). Bộ Băng/Huyền nhận lúc 20:37 người dùng tự vứt.

## 29/09 22:30 - nghiên cứu Võ Hồn (chưa sửa gì)

- Script: `new/event/wuhun/wutong.lua` (895099) + `wuyazi.lua` (895100) (thư mục `Script/new/` không có trong repo, đọc trên VPS), `MyLua/wuhunxt/odali_wuyazi.lua` (892101).
- 2 Võ Hồn: Ngự Dao Bàn `10156100`–`10156108`, Lưu Ly Diễm `10156200`–`10156208`. **Số cuối ID = cấp hợp thành 0–8.** "Võ Hồn hợp thành" chặn khi `mod(ID,10) == 8` → dữ liệu + script đã có tới cấp 8. **Cấp 9 không làm được**: không có ID `…109`/`…209`, thêm ID mới thì client (khóa) không biết món đó.
- Kỹ năng Võ Hồn tối đa cấp 6 (`WuhunSkillUp`, `>= 6`). Cấp Võ Hồn ≥ 5 mở ô kỹ năng 2, ≥ 7 mở ô 3. "Võ Hồn chứng minh" (`38001101`–`38001108`, nâng cảnh giới tới 8) hỏng từ bản gốc: 2 ID đầu không tồn tại, 6 ID sau đã thành "Cường Hóa Quyển Trục".
- Chưa rõ "cấp 7 tối đa" người dùng thấy là ở màn hình nào → cần ảnh tooltip Võ Hồn + thông báo khi nâng tiếp.
- 22:18 người dùng sửa Drop Boss (boss 9546 Lý Thu Thủy, hộp 90002), đã kéo về repo (`9a6b9de`). 22:30: 6 người online, chưa restart (mẫu Trùng Lâu tạm vẫn trong bộ nhớ).

## 30/09 00:20 - Sát Tinh + "khiêu chiến PMF 95 không rớt gì"

- **Sinh Tử Lôi Đài:** gắn hộp phiếu 90001 cho cả 11 boss (`9a38401`; Tống Giang + Ngô Vĩnh cùng gọi 13456). Chờ restart.
- **Điều tra "không rớt gì":** (1) Cách hiểu BoxValue hôm qua ĐÚNG (quái cấp thấp: hộp thuốc rác BV 33–77, hộp hiếm 500.000, hộp trống 99.999.999). (2) Cột 3 MonsterDropBoxs = 1 cho gần hết boss / 0 cho quái thường → loại rơi, không phải cờ tắt. (3) Boss PMF 95 (9540–9552) và PMF nhỏ (9660–9672) đều có hộp hợp lệ + 90001. (4) Debug log KHÔNG ghi lần rơi nào, nên không xác minh qua log được. (5) `ConfigInfo.ini` không có khóa chênh lệch cấp; giả thuyết "cấp 119 đánh quái 75–95 thì không rơi" chưa chứng minh.
- **Lỗi có sẵn từ bản gốc:** 821/3.478 quái trỏ tới 113 hộp KHÔNG tồn tại (1.603 tham chiếu; 37 quái mất hết hộp). Debug log 30/09 ghi 2.160 dòng `Search DropBoxs DropBoxId:N Get Errors` trong 1 giờ (quái 114xx ở Hàn Tà Lĩnh / Tháp Lý Mộc, người đánh chủ yếu Hoang/EmVinh). Đã dọn: bỏ tham chiếu chết, giữ nguyên hộp thật (`MonsterDropBoxs.txt`, chỉ đổi cột hộp của 821 dòng). Nếu engine bỏ cả lượt rơi khi gặp lỗi tra hộp thì đây là nguyên nhân; nếu không thì vô hại.
- **Cách kiểm chứng sau restart** (bia1 cấp 119): giết Võ Tòng (120) → có phiếu? / giết boss PMF 95 → có gì? / giết quái Hàn Tà Lĩnh (114xx, cấp 100) → có đồ? Kết quả 3 câu này phân biệt được: chênh lệch cấp / lỗi hộp / lỗi phó bản.

## 30/09 01:10 - NGUYÊN NHÂN boss không rơi: hộp phiếu 90001 BoxValue=1

- Audit log (`Server/Log/Audit_*.log`, dòng `ITEM_CREATED,...,Dropped by "<quái>",<ID>`) ghi mọi lần rơi. Sát Tinh rơi đều tới 00:09 (trước khi gắn 90001), sau restart 00:37 (đã gắn) = 0. 139 boss gắn 90001 từ 29/09 17:28: không boss nào có dòng rơi. Phiếu 1000 (`39910001`) từng rơi từ hộp BV 650–3000 → vật phẩm phiếu không phải vấn đề. Dữ liệu gốc BoxValue nhỏ nhất = 4, và mọi lần rơi trong log có Mv/BV ≤ 1.0 → **BoxValue 1 (chưa từng có) làm hỏng cả lượt rơi của quái gắn nó**; chênh lệch cấp (`DropAttenuation.txt`: −24 → 0.5, +1 → 1.0) và lỗi tra hộp (đã dọn) đều không phải nguyên nhân.
- Sửa: hộp phiếu theo Mvalue, **BoxValue = Mvalue** (tỉ lệ 1.0, giống ca 874/778 trong log): 90001 BV 60 (41 boss Mv 60), 90016–90028 cho Mv 10/20/22/26/27/32/41/52/70/90/100/200/3000; 149 boss gắn lại đúng hộp. 4 hộp nhân bản có tỉ lệ >1 đưa về ≤1: 90002 75→100, 90007 50→200, 90009 25→41, 90014 20→32 (chưa có bằng chứng tỉ lệ >1 chạy được).
- Ý nghĩa tỉ lệ: **xác suất rơi ≈ Mvalue ÷ BoxValue** (phiếu 1000 cũ ở BV 2200–3000 với Mv 60 ≈ 2–3%). Tab Drop Boss trên web nên cảnh báo BV < 4 hoặc BV < Mv.
- Chưa kiểm chứng sau restart: giết 1 boss Sát Tinh → Audit phải có `Dropped by ...,39910002`.

## 30/09 01:30 - kiểm tra toàn diện trước restart

- Bảng rơi: 2.048 hộp (0 trùng, 0 hộp có món với BV<4), 3.478 quái (0 tham chiếu hộp thiếu, 149 boss phiếu BV==Mv, 0 hộp 900xx tỉ lệ >1). So bản gốc: +41 dòng quái (thêm 29/09), CRLF giữ nguyên, byte GBK giữ nguyên; 5 dòng lệch cột (9546, 11468, 12039, 42372, 42376) có sẵn từ gốc. Máy nhà = GitHub = VPS repo = file game. Liên hoàn Tô Châu đã hoàn tác về gốc (`bb55247`). Web Drop Boss (`bialk`): chặn BoxValue < 4.

## 30/09 01:56 - tẩy ám khí tạm + 4 món nội công cho bia1

- Ám khí: `DarkSkillStudy.txt` = trọng số dòng theo cấp ám khí 40/70/90, `DarkSkillList.txt` = 31 loại dòng × 16 mức, tên/hiệu ứng ở `StandardImpact` 32000–32406 (bảng đầy đủ + % đã gửi người dùng). Tạm ép 3 dòng (`3c2fa0c`), restart 01:46, người dùng tẩy xong, trả về gốc (`cd295e0`).
- 4 món cho bia1 (mẫu tạm `871e77a`, restart 01:56, trả về `7f4e968`): Phệ Lân Thánh Quan `10210040`, Thánh Lý `10211040`, Huyền Thủ `10212040` (9 dòng: bể trừ Cường lực) + Huyền Vũ Thánh Oản `10214019` (8 dòng: trừ Cường lực/Ngoại công), tư chất 250. Đã xếp hàng; nhận trước lần restart sau (mẫu tạm còn trong bộ nhớ).
- 02:13 mẫu tạm (`0b57882`, đã trả về `f058729` lúc 02:18, restart ngay sau): bộ Huyễn Thế 10210020 mũ / 10211020 giày / 10212020 bao tay / 10215020 hộ kiên (9 dòng: bể trừ Cường lực) + 10214020 hộ uyển (8 dòng: trừ Cường lực/Ngoại công), tư chất 250. Người dùng tự chế; **chế xong → `git revert 0b57882` + cap-nhat + restart**. Bộ Phệ Lân/Huyền Vũ Thánh Oản đã phát trước đó là nhầm, người dùng tự bỏ.
- **02:20 trạng thái mẫu:** `EquipBase.txt` = bản gốc, chỉ khác đúng 1 dòng cố ý: Tạo Hóa `10303447` hiệu ứng làm chậm (`98c63e7`); `DarkSkillStudy.txt` = gốc. **Không còn mẫu tạm nào.** Hộ uyển nội tối đa 8 dòng (bể không có Hội tâm phòng; bật thêm cột 80 chưa thử, người dùng không muốn).

## 30/09 trưa - Tinh Thông trang bị: mở lại "Lò Ly Hỏa" (chờ restart)
- Hệ `MyLua/jingtong/` đang hoạt động thật (buff `&JT` qua `ShuaXinClient.lua`), chỉ thiếu nguyên liệu vì server cũ tắt menu "Lò Ly Hỏa".
- Đã sửa 1 dòng `jingtongnpc.lua:34` (bỏ `--`), commit 29cca96, đã `cap-nhat.sh` lên VPS → **hiệu lực sau `./tlbb.sh restart`** (lúc làm còn 2 người online nên chưa restart).
- Shop web: thêm Li Hỏa `20700063` + Tinh Kim Thạch `20700055` (đang TẮT, giá tạm 99.999). Mod/admin đặt giá rồi tick Bán.
- Rollback: tag git `truoc-tinh-thong-30-09` (= a378a15) hoặc `/opt/tlbb-backup/truoc-tinh-thong-*/` trên VPS (thư mục `jingtong/` + `Script-full.tgz`).
- Cần test sau restart: nói chuyện NPC Sào Nguyên (Lạc Dương 213,307) → có mục "Lò Ly Hỏa" → chuyển vận 5 lần/ngày ra Ly Hỏa, lấy đá 5 lần/ngày ra Toái Phiến; UI 890174 của client mở được không.

## 30/09 14:40 - Điểm Tặng + vàng miễn phí mỗi ngày (chờ restart)
- **Kết luận rà soát:** không còn nguồn Điểm Tặng nào cho người chơi (Lâu Lan 8888 đã chặn, Kim Ngũ Gia menu ĐT bị comment với tỉ lệ 700 KNB = 1 ĐT, chuyển sinh đòi cấp 120, các script 500k/3M ĐT là code chết). ĐT chỉ dùng mua vật liệu ở Hồ Ca (10 shop) nên chủ server chốt: **phát miễn phí**.
- NPC **NetCo4 / Gia Nhập Môn Phái-Dịch** (Đại Lý 160,142 · Lạc Dương 199,320), `MyNew/jiarumenpai.lua`: thêm mục "Nhận 80.000 Điểm Tặng" (key 919), không giới hạn số lần. Commit acfbbfa.
- Mục "Nhận 2.000 vàng hôm nay" (key 920) **cũng ở NPC Gia Nhập Môn Phái-Dịch** (chủ server gom về 1 NPC; bản đầu đặt ở Ví Web đã gỡ, `CDK/CDK.lua` về bản gốc). 1 lần/nhân vật/ngày, trạng thái `Server/txt/NetCo4Web/<GUID>.vang` (số ngày `yyyymmdd`, ghi TRƯỚC khi phát). Đổi số vàng: `x990010_g_VangNgay`. **Đơn vị `AddMoney` là đồng: 1 vàng = 10.000 đồng** (test 30/09: AddMoney 2000 → 20 bạc), script nhân 10000.
- **Phát hiện quan trọng:** sửa file `.lua` trong `Public/Data/Script/` có hiệu lực **ngay, không cần restart** (bia1 thấy menu mới ngay sau `cap-nhat.sh`). File cấu hình `.txt` (drop, MonsterAttrEx, ShopTable…) vẫn cần restart.
- Rollback cả hai: tag git `truoc-diem-tang-30-09` hoặc `/opt/tlbb-backup/truoc-diem-tang-20260930-1439/{jiarumenpai.lua,CDK.lua}`.
- **Runbook mở server:** xóa thêm `NetCo4Web/*.vang` cùng lúc xóa `*.in`, `*.done`.
- Đã test ngay (không cần restart): ĐT nhận OK (bia1 ĐT 472.322); vàng lần đầu ra 20 bạc → sửa ×10000, xóa mốc `.vang` của bia1 để test lại.

## 30/09 15:30 - tắt tin "BOSS dẫn theo 9 tên thủ hạ xuất hiện tại Võ Di" (chờ restart)
- Nguồn: **engine** phát theo `Public/Config/ActivityNotice.txt`, không phải Lua. Hoạt động boss Võ Di (scriptid 810002, `event/bossgroup/bg_WuYi.lua`, boss 9121 + 6 thủ hạ 9141) chạy 4 lần/ngày (00:30, 10:30, 15:30, 19:45); cột "chậm báo" = `#{XJJG_20080317_01}` là mã chuỗi, **client** dịch thành câu tiếng Việt (vì vậy tìm câu này trên server không ra).
- Đã sửa 4 dòng id 59–62: cột 13/14/15 → `-1` (như các dòng khác không báo). Boss vẫn xuất hiện, chỉ mất tin. File `.txt` → **cần restart**.
- Cùng cơ chế, còn 3 nhóm boss khác vẫn đang báo: Thảo Nguyên `#{BQM_20080317_01}` (810003), Kim Cương/Thương Sơn `#{BY_20080317_01}` (810001), Độc Cáp/Huyền Vũ `#{DHW_20080317_01}` (810000). Chưa tắt, chờ chủ server chốt.
- Tin "[Giúp] Lâu Lan (219,228) Trình Giảo Thiết… đục lỗ tối đa": **không tắt được từ server** — không có ở server (đã quét 7.263 file + binary, VISCII/GBK/UTF-8) lẫn file client chưa nén; nằm trong `Bin/ccore.dat` (gói client đã mã hóa). Người chơi tự bỏ tick kênh "Giúp" trong khung chat.

## 30/09 16:30 - tin hệ thống "rác" = tiếng Trung GBK chưa dịch (đã Việt hóa 21 câu, có hiệu lực ngay)
- Cách tra nguồn nhanh: `Server/Log/world_*.log` ghi nguyên văn mọi tin kênh hệ thống (`GWChatHandler ... ChatType=4 Contex=...`); decode GBK (`iconv -f gbk`) rồi grep chuỗi Trung trong Lua.
- Đã Việt hóa `event/xunhuan/yamoshannpc_die.lua` (9), `sancaixiagunpc_die.lua` (9), `xinsanhuan_1.lua` (3): tin giết boss chuỗi nhiệm vụ Viêm Ma Sơn / Tam Tài Hạp Cốc (Vương Diêm, Hồng Kích Yêu Vương, Hỏa Diễm Yêu Ma, Hoa Kiếm Vũ). Commit 7b59bd9. Lua → hiệu lực ngay.
- **Còn 98 dòng / 32 file** phát tin tiếng Trung trực tiếp (BroadMsg). Đáng chú ý vì người chơi chắc chắn gặp: `event/dali/edali_0287.lua` (12 câu "chúc mừng gia nhập môn phái X"), `obj/dali/odali_yuanbaoxiaofuweng.lua` (9, đổi môn phái + tâm pháp 150), `event/bingshen*/` (5, Binh Thánh), `event/ZBS_GameArea/yuanbaoshop.lua` (5), `event/xunhuan/imperial_examinations.lua` (2, Khoa cử). `odali_freshbird.lua` (27) và `scene1.lua` là code chết. Chưa làm, chờ chốt: dịch hết hay tắt.

## 30/09 17:00 - Hậu Hoa Viên: giờ mở cửa thành cấu hình (hiệu lực ngay)
- Cơ chế cũ: menu NPC NetCo4 → "Đi đến Hậu Hoa Viên" dịch chuyển thẳng vào scene 182 (`newbie_2.scn`), **không kiểm tra giờ**; `scene.lua:325` đặt timer 1 giây cho scene 62/82/182 gọi `x990010_OnSceneTimer`, hàm này đuổi về Lạc Dương (198,325) nếu `giờ < 20 hoặc > 22` → thực tế mở 20:00–22:59.
- Mới (`MyNew/jiarumenpai.lua`): 2 biến `x990010_g_HHV_Mo = 20`, `x990010_g_HHV_Dong = 23` (mở từ Mo đến trước Dong; `0`/`24` = mở cả ngày), hàm `x990010_HHV_DangMo()` dùng chung cho: chặn ngay ở menu (báo giờ mở), timer đuổi người, và câu giới thiệu trên NPC tự ghép theo giờ. Sửa 2 số → hiệu lực ngay, không restart.
- Lưu ý: giờ tính theo giờ hệ thống VPS (`date` trên VPS phải đúng múi giờ VN, kiểm bằng `timedatectl`).

## 30/09 - múi giờ chroot → Việt Nam + Hậu Hoa Viên 24/24 (test)
- **Phát hiện:** `/opt/tlbb-root/etc/localtime` là China Standard Time (+08) → log game và mọi lịch (Hậu Hoa Viên, boss ActivityNotice, mốc ngày quà vàng) lệch **+1 giờ** so với giờ VN. Đã thay bằng `Asia/Ho_Chi_Minh` (bản cũ: `/opt/tlbb-backup/localtime-CST-<ts>`), hiệu lực sau restart 30/09.
- Hậu Hoa Viên: `x990010_g_HHV_Mo = 0`, `Dong = 24` (mở 24/24 để test). **Ngày open chính thức đặt 19 / 24** → 19:00–23:59. Đã ghi vào runbook README bước 3.
- **Rà soát đồng hồ 15:38 sau restart:** host `Asia/Ho_Chi_Minh`, NTP đồng bộ · chroot `date` +07, file localtime = Ho_Chi_Minh · Server/World/Login/mysqld/billing đều khởi động 15:30 (sau khi đổi) · log world/login/debug/Audit ghi 15:37:52 = giờ host · bot Node (+0700), panel GM Python (+07), cron sao lưu 04:00 theo host. MySQL không có client để `SELECT NOW()`, suy ra từ giờ khởi động (đọc localtime mới). Chỉ còn lệch trong dữ liệu cũ: log trước 15:30 hôm nay ghi giờ +08.

## 30/09 - đăng nhập web mini game bằng tài khoản game (panel.py act `kiem_mk`)
- `panel/panel.py`: thêm act `kiem_mk` {ten, md5} → "Da khop <id>" / "Sai mat khau" (so MD5 với `web.account`, không ghi audit). Bot BotDoMin dùng để cho người chơi đăng nhập web bằng đúng tài khoản + mật khẩu game, đổi mật khẩu trên web (act `doi_mk` sẵn có). Chi tiết ở README repo bialk.
- Panel chạy từ `/opt/tlbb-repo/panel/panel.py` → sau `cap-nhat.sh` phải `systemctl restart tlbb-panel` (không đụng game).

## 30/09 - Võ Hồn cấp 8 không đục lỗ được → sửa (hiệu lực ngay)
- **Nguyên nhân:** menu "Thăng cấp võ hồn (Cấp 2–5)" của NetCo4 (`new/event/wuhun/wuyazi.lua`, 895100) chỉ đổi ID `10156101→102…` mà **không ghi chuỗi `&WH<cấp hợp thành>`** vào vật phẩm. Hệ Võ Hồn gốc (`MyLua/wuhunxt/odali_wuyazi.lua`, 892101) đọc cấp hợp thành từ chuỗi đó: "Đục lỗ thuộc tính mở rộng" đòi có `&WH` và số khung < cấp hợp thành (tối đa 8); "Hợp thành" chặn khi ID tận 8. Võ Hồn `…108` của bia1 vì vậy hiện "Hợp thành đẳng cấp: 0" và bị chặn cả hai đường.
- **Sửa:** thêm `x892101_NetCo4_FixWH(pos)`: Võ Hồn chưa có `&WH` thì ghi `&WH<số cuối ID>` + 24 số 0 (đúng định dạng hợp thành gốc tạo ra). Gọi ở đầu `x892101_wuhunskuozhuan` (đục lỗ + 2 hàm kỹ năng), trước hợp thành UI (cả 2 Võ Hồn) và trước tăng cấp bằng Võ Hồn Đẳng Cấp Thư. Rollback: tag `truoc-vo-hon-30-09`.
- **Test:** bia1 mở lại "Đục lỗ Thuộc tính mở rộng", đặt Võ Hồn …108 + Lân Mộc Tiền `20310158` (hoặc Phá Thiên Tiền `20310159`), tốn 80 vàng/lần, tối đa 8 khung. Tooltip "Hợp thành đẳng cấp" phải thành 8 sau lần bấm đầu (client đọc lại vật phẩm).
- **Chưa đụng:** menu thăng cấp NetCo4 vẫn không ghi `&WH` (giờ được vá lúc dùng nên vô hại); cấp 9 vẫn không có ID; "Võ Hồn chứng minh" hỏng từ gốc.

## 30/09 - Võ Ý: chuyển chỗ cày sang khỉ Vô Lượng Sơn (chờ restart)
- Hệ Võ Ý (`obj/dali/odali_fanhua.lua` 2015 + `MyNew/guaiwu_die.lua` 999998 + nút UI qua `XieziQuickly` 70051 → `shenqichongxi.lua` 900033): nội tức = 770 + 10×cấp quái (+500 ở Thông Thiên Tháp), **3.000 quái/ngày**, 150 cấp, lên cấp cho tiềm linh (2/4/6/8) và mỗi 5 cấp 1 bồi nguyên. Quái cộng Võ Ý gốc: Thông Thiên Tháp 581–585, Mai Nha Đảo 708, Vân Phù 710. **Đào Hoa Nguyên không cộng** (431 quái không script).
- Chủ server chốt: cày ở **Vô Lượng Sơn** (scene 6/73/74, chung `wuliang_monster.ini`) bằng **toàn bộ quái thường** (chốt lần 2): Cao Sơn Bạch Viên, Đại Hoàng Phong, Thiểm Điện Báo, Sơn Thù, Lô Vi Thảo Nhân, Tiễn Kính Tiểu Tặc, Bố Nhĩ Thiện, Đại Thiết Võng — lv1–10, 309 điểm spawn → gắn `script_id=999998`. Công thức nội tức giữ nguyên (770 + 10×cấp). File ini scene → **cần restart**. Rollback: tag `truoc-vo-y-30-09`. Thông Thiên Tháp / Mai Nha / Vân Phù vẫn cộng như cũ.
- **Cảnh báo số học:** khỉ lv1–2 cho ~785 nội tức/con → tối đa ~2,35 triệu/ngày. Bảng cấp: cấp 8 cần 2,35M (≈1 ngày/cấp), cấp 20 cần 7,9M (3,4 ngày), cấp 50 cần 32M (14 ngày), cấp 100 cần 121M (52 ngày), cấp 150 cần 284M (121 ngày) — tổng lên 150 tính bằng chục năm. Nếu muốn 3.000 con/ngày "đủ", phải nhân hệ số nội tức trong `guaiwu_die.lua` (một dòng, hiệu lực ngay). Chưa làm, chờ chốt hệ số.

## 30/09 - Pet Huyễn Hóa (ngoại hình boss): admin phát qua tab GM, loại "Pet" (hiệu lực ngay)
- 48 pet id 25351–25582 (type 2535–2558, cấp 95, biến dị, trưởng thành 1459) là ngoại hình boss Tần Vương / Quan Thắng / Viễn Cổ Kỳ Hồn / Tống Khương / Cáp Đại Bá / Lỗ Chí Sinh khoác lên pet nền. Không có viên Huyễn Hóa Đan, không NPC ghép, không trứng → chỉ tạo bằng script.
- Hàng đợi quà `NetCo4/quatang.lua` thêm dòng `pet <ID>` → `LuaFnCreatePetToHuman(id, -1, 0)`; ô pet đầy thì giữ dòng, nhận lần đăng nhập sau. `panel/panel.py` act `qua` loại `pet`, kiểm ID theo `PetAttrTable.txt` (`PET_IDS`). Panel admin tab GM có mục "🐾 Pet". Mod (viewonly) không gọi được `/api/gm/act`. Danh sách ID: `docs/pet-huyen-hoa.md`.
- Trứng pet event thường **có bán trong game**: Hồ Ca → Mua Thương Phẩm → tab Trân thú (kệ 132/218/219), 20.000 KNB/trứng (sửa lại ghi nhận trước đó "không có nguồn"). Ngưng Tức Hoàn 38002067/8 không bán ở đâu (chỉ ShopTableTEST không nạp + NPC VIP 890096 không đặt trong map).

## 30/09 - Pet: 48 pet Huyễn Hóa (admin phát) tư chất chuẩn 5000 + danh sách toàn bộ pet (chờ restart)
- Chốt lần 2 của chủ server: **chỉ 48 pet Huyễn Hóa** (type 2535–2558, ID 25351…25582, admin phát qua tab GM) đặt tư chất chuẩn 5 dòng = **12000** (chốt cuối 30/09, pet gốc thực nhận ~4.100 và không sinh sản được) trong `Public/Config/PetAttrTable.txt`; **mọi pet khác giữ nguyên**, `PetConfigTable.ini` giữ nguyên (đã hoàn lại bản gốc sau lần sửa toàn bộ trước đó trong cùng phiên).
- Vì hệ số ngẫu nhiên của game vẫn còn (bậc ×1,000–1,404, dao động ±5%, ngộ tính cộng %), pet Huyễn Hóa thực nhận **≥ 4.750, thường 5.000–7.000**; muốn sàn đúng 5.000 thì nâng chuẩn lên 5.300. Chỉ áp cho pet tạo mới sau restart. Rollback: tag `truoc-pet-5000-30-09`.
- Danh sách toàn bộ pet: `docs/pet-danh-sach.tsv` (6.320 ID, tên Hán Việt ghép máy + tên Trung + type/cấp/biến dị/bảo bảo/trưởng thành) và `docs/pet-danh-sach.md` (1.039 họ). Tên Hán Việt để nhận diện, không phải tên client hiển thị.

## 30/09 tối - Tẩy Thái Cổ Thần Khí ra đúng dòng mong muốn (TẠM, phải trả về gốc sau khi tẩy)
- Cơ chế: NPC "Trọng Tẩy Thái Cổ Thần Khí" (`MyLua/shenqinew/shenqichongxi.lua` menu 6 → `wuyazi85o.lua` `x895111_WuhunMagicUp` nhánh `tepp == 20`) **tạo món mới cùng ID** bằng `TryRecieveItem` rồi `x895111_SHANG_BAOS` chuyển ngọc/lỗ/sao sang. Dòng do engine random từ `EquipBase.txt` → ép dòng bằng template tạm giống Tạo Hóa. Giá: 80 vàng + 1 Ma Huyết Thạch (30505813). Cả `10304435` (Phù Sinh, danh sách TaiGu) và `10305435` (Vô Tướng Tuyệt Tung, ShenBingList cột 5) đều qua kiểm tra.
- Dòng ép được: mọi cột 33–90 mà `ItemSegValue.txt` dòng 3009 (segment vũ khí 102) ≠ -1. Không ép được: hồi HP/MP, giảm thời gian băng/hỏa/huyền/độc, cột 71–74, 82–86.
- **Sửa lại 22:35 (chốt cuối):** món chủ server muốn ép là **Thần Ẩn `10305454`** (神隐, hoàn cấp 102, tự chế, ô 0 túi bia1 1010100008), không phải Phù Sinh/Vô Tướng hay Tạo Hóa → chỉ 10305454 mang template, 3 món kia về gốc. 10305454 có trong danh sách TaiGu nên tẩy được.
- Đã chốt 11 dòng: %HP, Hỏa công, Độc công, Nội công, Chính xác, Hội tâm, Thể lực, Thân pháp, Tất cả thuộc tính, Bỏ qua kháng Hỏa, Bỏ qua kháng Độc (cột 34,42,48,59,68,70,77,79,81,88,90), dòng 11-11, tư chất 250-250. Các cột khác `-1`.
- **22:45 đã tẩy xong Thần Ẩn** → EquipBase.txt trả về gốc (= f058729, chỉ còn 10303447 col20 9150 giảm tốc), đã deploy, **đã restart 30/09 23:48** → template Thần Ẩn hết hiệu lực, mọi món về random gốc.
- Yêu cầu khác cùng lúc: "tăng exp của 3000 quái Võ Ý lên 4 lần" — chưa xác định được quái nào (Võ Di chỉ có 154 quái, không có quái tên Võ Ý), đang chờ chủ server chỉ rõ.

## 30/09 tối - Võ Ý: nội tức mỗi quái ×4 (hiệu lực ngay, không cần restart)
- Chủ server yêu cầu "tăng exp của 3.000 quái Võ Ý lên gấp 4". Sửa 1 dòng `MyNew/guaiwu_die.lua` (999998): `Neixi = (770 + GuaiLev*10) * 4`. Giới hạn 3.000 quái/ngày và +500 ở Thông Thiên Tháp giữ nguyên (`odali_fanhua.lua` `x002015_WuyiExpUp` không có trần mỗi lần giết). Khỉ Vô Lượng Sơn lv1–2: ~3.140 nội tức/con → ~9,4 triệu/ngày (cấp 8 trong ~6 giờ cày, cấp 50 ≈ 3,5 ngày, cấp 150 ≈ 30 ngày).
- Tag trước khi sửa: `truoc-vo-y-30-09` vẫn là bản gốc của Vô Lượng Sơn; hệ số gốc ghi trong chú thích cùng dòng.

## 30/09 23:20 - Phẩm chất ám khí: công thức tẩy (đọc từ binary, không đổi gì)
- Binary `Server` nén UPX, còn debug symbol. Bản giải nén để tra cứu: `/root/re/Server.elf` trên VPS (ngoài thư mục game, `objdump -d -C` được). Không dùng để chạy.
- `Item::ResetDarkQuality(type)`: phẩm chất mới = **cột 102 "品阶" EquipBase** (ám khí cấp 90 = 2000, cấp 70 = 1000, cấp 50 = 600, cấp 30 = 500, cấp 10 = 200) **+ bậc×40 + rand(0..39)**. Bậc chọn theo `DarkConfigTable.ini`: type 2 = Thiên Thối Thần Ngọc 30503120 dùng `HighDark` (0/875/100/20/5 phần nghìn), type khác = Bách Thối 30503119 dùng `LowDark` (738/200/50/10/2). Phí: 1 vàng + 1 viên (`obj/item/darkitem.lua`).
- Ám khí cấp 90: bậc 0 = 2000–2039, bậc 1 = 2040–2079, bậc 2 = 2080–2119, bậc 3 = 2120–2159, bậc 4 = 2160–2199. **Max 2199.** Thiên Thối không bao giờ ra bậc 0.
- Ý nghĩa: phẩm chất/1000 = hệ số đổi thuộc tính gốc ám khí ra thuộc tính nhân vật (làm tròn lên), vd 2043 → Thể lực gốc 73 thành +150.
- Có sẵn hàm Lua `LuaFnSetDarkQualityGrade` / `LuaFnGetDarkQualityGrade` (chưa script nào dùng) nếu sau này muốn admin đặt thẳng phẩm chất.

## 30/09 23:40 - Yến Tử Ổ rút còn 2 đợt cuối (đợt 2 có Cưu Ma Trí) - hiệu lực ngay
- Phó bản đang dùng: `event/yanziwu/yanziwu_1.lua` (401040, NPC Lý Cương ở Thái Hồ `obj/taihu/otaihu_ligang.lua`). `yanziwu_2.lua`/`1yanziwu_2.lua` (401041) không NPC nào gọi.
- Bản gốc, bước 11 (giữ Tiền Hoành Vũ): 10 đợt cách 30 giây → boss Diêu Bá Đương; nghỉ 90 giây; 10 đợt cách 60 giây → boss Tư Mã Lâm; nghỉ 90 giây; 5 đợt cách 90 giây, đợt cuối kèm **Cưu Ma Trí** → bước 12: Tiền Hoành Vũ còn sống thì ra 4 Môn Thần + Mộ Dung Phục + Vương Ngữ Yên/Đoàn Dự. Tổng ~25 phút. Cưu Ma Trí chết không chặn tiến trình (`obj/yanziwu/jiumozhi.lua`).
- Sửa: biến `x401040_g_SoDotCuoi` (1–5 = số đợt cuối được đánh, 0 = bản gốc; **hiện = 2**, chốt lần 2 lúc 23:45 sau bản 5 đợt) → vào bước 11 là nhảy thẳng `nStep1 = 27 - N`: N đợt cách 90 giây, đợt 1 ra ngay, đợt cuối kèm Cưu Ma Trí (N=2: ở giây thứ 90) rồi sang Mộ Dung Phục. Thông báo đếm lại "đã trải qua 1..N, còn lại". **Mất 2 boss Diêu Bá Đương và Tư Mã Lâm** (và đồ rơi của chúng). Trả về bản gốc: đặt `x401040_g_SoDotCuoi = 0`, hoặc tag `truoc-yzw-5dot-30-09`.
- Chưa test trong game. Không có trình kiểm cú pháp Lua 4, đã viết bằng lệnh cơ bản; nếu phó bản không chạy thì xem `Server/Log/luaerror.log`.

## 30/09 23:55 - Tắt tab "Quà Nạp Thẻ" (Khu Nhận Quà Tặng)
- Tab gọi `event/prize/eprize.lua` (888899) `GetGiftsForCostYuanBao(nIndex)`: mốc N (1–6, hiển thị 500.000 → 20.000.000 KNB tích lũy) chỉ kiểm **VIP `CHONG_ZHI_CHONGSHU` ≥ N**, nhận lần lượt theo `CHONG_ZHI_YILINGQI`. Vì VIP ở server này do admin cấp, ai có VIP 6 nhận hết 24 món, gồm bộ Trùng Lâu `10553101/02/03/04/07/09/11` (mốc 4–6) và `10141210`.
- Sửa: cờ `x888899_g_TatQuaNap = 1` ở đầu hàm → báo "Server không có nạp thẻ nên Quà Nạp Thẻ đã tắt." rồi thoát. Tab vẫn hiện (giao diện client, không ẩn được). Mở lại: đặt 0. Tag `truoc-tat-qua-nap-30-09`. Đồ đã nhận trước đó không bị thu hồi.
- Mẹo cho lần sau: chuỗi VISCII escape viết bằng node thì dùng `String.raw` (chuỗi JS thường hiểu `\244` là bát phân và ghi byte thật vào file). Không có Python trên máy nhà: bảng `tools/viscii-map.json` dùng thẳng từ node được.

## 01/10 00:30 - Cộng Sinh ×2/×4, NPC tân thủ phát lại set 10, NPC NetCo4 thêm 8.000 vàng khóa/ngày (áp dụng luôn cho server chính thức)
- **Cộng Sinh** (`Server/Config/StandardImpact.txt`, **cần restart**): dòng 7033 (Cộng Sinh, sách 30402035, skill 686) cột 32 "生命转换百分率" 75 → **200**; dòng 7034 (Cao cấp Cộng Sinh, sách 30402036, skill 687) 100 → **400**. Pet vẫn mất 50% máu (cột 29). Đọc binary `StdImpact057_T::OnActive`: chủ nhận = (máu pet mất) × cột 32 / 100, **không có trần** → 200/400 hoạt động; máu chủ vẫn bị giới hạn bởi HP tối đa. Tooltip client vẫn ghi số cũ.
- **NPC Hồi Ức Thiên Long / Hỗ Trợ Tân Thủ** (Đại Lý 160,174, `obj/loulangucheng/oloulan_malan.lua` 001113, hiệu lực ngay): thêm mục 8886 "Nhận lại Tân Thủ Trang Bị [10 cấp]" → phát hộp `30008080` (khóa), 1 lần/nhân vật/ngày (`Server/txt/NetCo4Web/<GUID>.tanthu`). Hộp này là đúng món trong túi đăng nhập đầu: mở cần cấp ≥10, đã vào môn phái, 14 ô trống → 12 món set Tân Thủ (10553090–99, 2 Giới 2 Phù) + Thanh Đồng Đao 10100000, khóa, có sẵn ngọc theo môn phái (`obj/item/UBagsongtim.lua`). Kiểm tra lịch sử repo: NPC này **chưa từng** phát set đồ trong bản ta có; set chỉ nằm trong túi đăng nhập đầu (`scene.lua` FirstLogin, đã sửa 30/09 để không bị mất).
- **NPC NetCo4** (`MyNew/jiarumenpai.lua`, hiệu lực ngay): thêm mục 921 "Nhận 8.000 vàng khóa hôm nay" (`AddMoneyJZ` 80.000.000 đồng, file `<GUID>.vangkhoa`), **giữ nguyên** mục 920 2.000 vàng không khóa. Hai mục độc lập. Số vàng: `x990010_g_VangKhoaNgay`.
- `reset-choi-that.sh`: xóa thêm `NetCo4Web/*.vang|*.vangkhoa|*.tanthu` để ngày open ai cũng nhận được. Chưa test 3 mục trong game.
- Mẹo: chuỗi có `\n` viết bằng node phải ghép `String.fromCharCode(92)+"n"`, cả `"\n"` trong heredoc lẫn `-e` đều đã cho ra xuống dòng thật (đã dính 1 lần, phát hiện qua `git diff`).

## 01/10 01:00 - Yến Tử Ổ không rớt đồ: thiếu dòng rơi cho quái bản cấp 100+ (cần restart)
- Nguyên nhân: `yanziwu_1.lua` `x401040_CreateNpc` tạo quái = ID gốc + hệ số theo cấp người chơi (cấp 10–90: +0..+8; **cấp 100–109: +30000, 110–119: +30001, 120+: +30002**). `MonsterDropBoxs.txt` chỉ có dòng cho +0..+9 và đúng 2 dòng cấp 100 (39320 Đoàn Diên Khánh, 39430 Mộ Dung Phục). Người chơi 119 → quái 39xx1 không có dòng rơi → engine không rơi gì. Lỗi có từ bản gốc, không do dọn dẹp 30/09 (đã so với commit `651afc2`).
- Sửa: thêm **46 dòng** 39xx0/39xx1/39xx2 cho 16 loại quái/boss thù địch có dòng cấp 90 (`camp=110`): quái thường sao y dòng cấp 90 (Mv 10); Đoàn Diên Khánh/Mộ Dung Phục sao dòng cấp 100 có sẵn (50004 phiếu 1000 BV 3000, 50009 Công Lực Đan, 50022 Cửu Thiên Ngọc Toái); 10 boss còn lại (Diệp Nhị Nương, Nhạc Lão Tam, Vân Trung Hạc, Diêu Bá Đương, Tư Mã Lâm, Cưu Ma Trí, 4 Môn Thần) = dòng cấp 90 + 3 hộp đó, Mv 20 như 39430. Tỉ lệ phiếu ≈ 20/3000 ≈ 0,7%/boss (thiết kế gốc của server cũ), **chưa gắn hộp phiếu chắc chắn 9000x** như 139 boss khác vì Yến Tử Ổ 2 đợt chỉ ~5 phút/lượt → chờ chủ server chốt.
- Không thêm cho 9270 Thổ Phồn Lạc Ma, 9280, 9290 (tháp): bản gốc không có dòng rơi ở mọi cấp. Đã kiểm 46 dòng: ID quái có trong MonsterAttrExTable, mọi hộp có trong DropBoxContent.

## 01/10 01:20 - QUY TẮC MỚI: bảng .txt dạng DBC phải sắp ID tăng dần (engine tìm nhị phân)
- Yến Tử Ổ vẫn không rớt sau restart 00:25. Log `debug_*.log`: `Search Obj_Monster DropBox MonsterType:39341 Get Errors` dù file có dòng 39341 → engine tra `MonsterDropBoxs.txt` bằng **tìm kiếm nhị phân** (`DBC::DBCFile::Search_Posistion`), dòng nào nằm ngoài thứ tự tăng dần là **không bao giờ được tìm thấy**. 46 dòng tôi thêm nằm cuối file → chết.
- **Phát hiện kèm:** file gốc có sẵn **41 dòng ở cuối sai thứ tự** (2561, 9552, 9672, 14208 Diệp Nhị Nương, 14216 Đinh Xuân Thu, **14217 Mộ Dung Phục, 14218/14240 Tụ Hiền Trang, 14219/14348 Cưu Ma Trí** (Phiêu Miểu Phong), 15006–15200 + 42118–42121 Tiêu Dật Phong / Tiêu Như Quân / Gia Luật Liên Thành (Nhạn Môn Quan), 16834, 42204, 43316, 45410 Tiêu Phong) → **các boss này chưa bao giờ rớt gì**, kể cả hộp phiếu 9000x gắn 30/09. Đã xếp cả 87 dòng (46 + 41) vào đúng chỗ, nội dung từng dòng không đổi (kiểm bằng diff sort), 79 dòng chú thích `#` giữ nguyên.
- Cùng lỗi ở `PetAttrTable.txt`: 6 pet V2 `31001–31022` thêm sau nằm sau `31582` → đã sắp lại. Các bảng còn lại đã kiểm: `DropBoxContent` (1 chỗ lệch gốc 1776→1775, hộp 9000x ở cuối vẫn đúng thứ tự), `StandardImpact` (1 chỗ lệch gốc 5919→5724, chưa đụng), `MonsterAttrExTable`, `EquipBase`, `CommonItem` đúng thứ tự.
- **Từ nay:** thêm dòng vào bảng .txt phải chèn đúng vị trí theo ID (tab Drop Boss web cũng phải kiểm: `bialk/BotDoMin/dropboss.js` nếu thêm dòng mới cuối file thì dòng đó chết). Cách kiểm nhanh: node đọc file, so ID dòng sau với dòng trước.

## 01/10 01:35 - Đoàn Diên Khánh cấp 100+ (39320–39322) thêm hộp 3021 Bi Tô Thanh Phong Giải Dược + 3005 (chờ restart)
- Dòng 39320 gốc của server cũ (và 39321/39322 sao từ nó) chỉ có phiếu/Công Lực Đan/Cửu Thiên Ngọc Toái, thiếu hộp 3021 (thuốc giải trói Bi Tô Thanh Phong, cần để đánh Mộ Dung Phục) mà bản cấp 90 (9329) có. Đã thêm 3005 + 3021; Mv 60 / BV 10 → thuốc giải rơi chắc chắn. Sửa tại chỗ, thứ tự ID giữ nguyên.
- **01/10 01:50, chốt của chủ server:** Yến Tử Ổ cấp 100+ có **phiếu 1000 rơi chắc chắn** ở 3 boss: Đoàn Diên Khánh 39320–39322 (hộp 90001, Mv 60/BV 60), Cưu Ma Trí 39380–39382 và Mộ Dung Phục 39430–39432 (hộp 90017, Mv 20/BV 20). Tổng boss có phiếu chắc chắn: 158. Kiểm toàn file: 3.524 dòng, thứ tự ID đúng, không hộp chết; 15 ID quái không có trong MonsterAttrExTable là dòng gốc (không đụng). Boss Yến Tử Ổ bản cấp 10–40 không có dòng rơi là thiết kế gốc.

## 01/10 02:10 - Gói rơi chuẩn cho 89 boss "chỉ có phiếu" (Mộ Dung Phục, PMF, Nhạn Môn, Thủy Hử...) - chờ restart
- Rà toàn bộ 158 boss có hộp phiếu: **86 boss** không có hộp nào khác đạt ≥50% (BV ≤ 2×Mv): 41 dòng vừa cứu khỏi cuối file (14217 Mộ Dung Phục, 14219/14348 Cưu Ma Trí, 14218/14240 Tụ Hiền Trang, 14216 Đinh Xuân Thu, 15006–15200/42118–42121 Nhạn Môn Quan, 45410 Tiêu Phong...) sau dọn tham chiếu chết 30/09 chỉ còn phiếu; 13447–13537 Thủy Hử (12 NPC, hộp khác BV 200 với Mv 60); 1348–1403 Mv 90 hộp BV 300; 39430–39432 Mộ Dung Phục Yến Tử Ổ (Mv 20, hộp BV 3000+ → <1%). Log Audit 00:43–00:47 xác nhận Cưu Ma Trí/Nhạc Lão Tam/Vân Trung Hạc đã rớt sau khi sắp lại bảng; Mộ Dung Phục không rớt là do thiết kế dòng.
- Sửa (89 dòng, thêm 39380–39382 Cưu Ma Trí YTO cho đồng bộ): thêm **gói boss** = 3005 (nguyên liệu cấp 8, BV 40), 50006 Hàn Băng Tinh Tiết (150), 50030 ngọc cấp 5 (300), 50046/50047/50048 Thần Binh Phù 1/2/3 (200/250/300), 1923 Trân Thú Đản Anh Chiêu (360), 50034 Điêu Văn Đồ Dạng (400). Boss Mv < 60 nâng lên **60** (9660/9661/9663/9666 Cáp Đại Bá..., 13021/13041, 15185, 39380–39382, 39430–39432) → tỉ lệ ≈ 100% / 40% / 20% / 30% / 24% / 20% / 17% / 15%; boss Mv 90–100 cao hơn tương ứng. Phiếu vẫn chắc chắn (kiểm: không dòng nào BV phiếu > Mv). Thứ tự ID và hộp tham chiếu đã kiểm sạch.
- Chưa test trong game; hiệu lực sau restart. Rollback: commit trước `ec8a42f`.

## 01/10 01:10 - Exp âm do !!addexp quá lớn (bia1) + rollback Công Lực Đan + restart
- `!!addexp` đọc số bằng strtol 32-bit; cộng dồn vượt 2.147.483.647 → `t_char.exp` âm (bia1 = -1.026.169.005 trong DB, -25.646.705 sau khi ShareMemory lưu) → client hiện 0, không tăng. Sửa: `systemctl stop tlbb` (đợi ShareMemory lưu xong) → bật mysqld riêng → `UPDATE t_char SET exp=0 WHERE charguid=1010100008 AND exp<0` → tắt mysqld → `systemctl start tlbb`. Không nhân vật nào khác exp âm.
- Công Lực Đan đã trả về gốc (+100, trần 99.999) trước khi restart; công lực đã ăn giữ nguyên.
- Restart này áp luôn: gói rơi 89 boss, phiếu chắc chắn Yến Tử Ổ, thuốc giải Đoàn Diên Khánh, Cộng Sinh ×2/×4 đã áp từ 00:25.

## 01/10 02:30 - Chân Trùng Lâu Ngọc: tỉ lệ dính trúng thật = tooltip 6% (chờ restart)
- Tooltip client ghi 6% nhưng server dùng `StandardImpact.txt` cột 29 (tỉ lệ kích hoạt khi gây sát thương, logic 88): 7503 Chân Trùng Lâu Ngọc đỏ `10553105` (Bialklk, bia1 đeo 2 cái) = **4**, 5965 Chân Trùng Lâu Ngọc `10423025` (Bialk) = **2**. Đã đổi thành 6 rồi **hoàn lại 4/2 theo yêu cầu chủ server 02:40** (giữ nguyên gốc, chấp nhận tooltip lệch). Trùng Lâu Ngọc thường (7501 = 2, 5953 = 3) chưa ai đeo, giữ nguyên. Đeo 2 cái có cộng dồn hay không do binary quyết, chưa kiểm.
- Thanh Tâm Phổ Thiện Chú: 2838–2849 cột 29 = 2%…12% (cấp tâm pháp 11–16 = 12%) đúng như tooltip, chỉnh được nếu muốn; cột 32 = % MP (0).

## 01/10 02:30 - Võ Lâm Bí Tịch (tab "Bí tịch"): hệ thống của server cũ, đầy đủ script, chưa ai chơi
- **Cơ chế** (`MyLua/MiJI/*.lua`, NPC **Kim Ức Phong** "Hư Không Huyễn Cảnh Tiếp Dẫn Sứ" / "Bí Tịch Ngũ Tông" ở Đại Lý (2 điểm), Lạc Dương (2), Tô Châu (1), script 900048):
  1. Cấp ≥105 nhận **50 Ngũ Hành Pháp Thiếp** `38000527` mỗi ngày (vé vào).
  2. **Khiêu chiến Hư Không Huyền Cảnh** (phó bản đơn `MiJI/1.lua`–`3.lua`, FUBEN_ZHOUTIAN): mỗi tầng thắng +**Võ Học Tâm Đắc** = tầng×5+5 (mission data 442, trần UI 999.999) và boss rơi **Bí Tịch Tàn Hiệt** `38000529`; số lượt/ngày theo tầng (1/2/5/10/25 lượt ở tầng 1–5) + thêm lượt bằng vé.
  3. **Đổi Tàn Hiệt → sách**: Sơ cấp 10 (Vân Dao Thượng Thủy Kiếm, Bạch Hồng Chưởng, Đoạt Mệnh Liên Hoàn Tam Tiên Kiếm, Độc Kinh, Đạt Ma Quyền), Hy Hữu 20 (Hàn Băng Chân Khí, Hàm Cốc Bát Tuyệt, Vân Vụ Thập Tam Kiếm, Ngũ Độc Mật Truyện, Thụy Mộng La Hán Quyền), Truyền Thế 50 (Thái Ất Huyền Môn Kiếm, Cửu Dương Chân Kinh, Long Tượng Bàn Nhược Kinh), Tuyệt Thế 100 (Độc Cô Cửu Kiếm, Cửu Âm Chân Kinh, Thần Chiếu Kinh) — 16 sách `30311001`–`30311031` (lẻ), mỗi sách thuộc 1 trong 5 tông (Phật/Khí/Kiếm/Ma/Nho).
  4. **Xếp vào tông** (menu ẩn 8 → 201–205, tốn 800 tâm đắc nếu đổi tông): chỉ học được sách cùng tông. Dùng sách (`zengdian1Y.lua` 890100) → vào 1 trong 3 ô "Nhất/Nhị/Tam"; **lên cấp sách** tốn tâm đắc theo bảng `BookUpLevelOrDel.lua` (10.000 → 1.440.000 mỗi cấp, 12 cấp); kỹ năng tuyệt học 850–897, hiệu ứng `wujue.lua` 899040.
  5. **Vũ Học Tâm Đắc** `38000531` (+1.000 tâm đắc/viên): chỉ có ở quà VIP mốc 14, hộp Tam Thần (`yehuo.lua`), quà Đại Nhân (`XieziNewServer.lua`); shop 181 bán 1.200 KNB/viên nhưng **không NPC nào gắn shop 181**. Không hộp rơi nào chứa Tàn Hiệt/tâm đắc/sách.
- Kết luận: **không có "người trước để lại"** — mọi nhân vật đều 0/999999, "Chưa học", vì trên server này chưa ai đi Hư Không Huyền Cảnh. Hệ thống chạy được bằng đúng NPC Kim Ức Phong, chưa test.

## 01/10 02:50 - Bí Tịch: mở lại menu "Xếp vào tông" ở NPC Kim Ức Phong (hiệu lực ngay)
- `MyLua/MiJI/xukonghuanjing.lua`: bỏ comment menu 8; **bỏ 2 chốt `if GetNumText() then return end`** (luôn return nên menu 8 và 201–205 chết, đây là cách server cũ tắt); nhánh 201–205 thêm `local missionisdsall` (biến này chỉ tồn tại trong nhánh 8, ở nhánh 201 là nil → trước đây sẽ trừ 800 tâm đắc cả lần đầu). Lần đầu xếp tông miễn phí, đổi tông tốn 800 tâm đắc và xóa kỹ năng tuyệt học 850–897. Tag `truoc-mo-tong-01-10`. Chưa test.
- Tooltip "6%" của Trùng Lâu Ngọc nằm trong gói client `.axp` (mã hóa), server không sửa được; giữ tỉ lệ thật 4/2 theo chủ server.
- **02:55 mở tông ngay trong tab Bí tịch (cá nhân):** tab này chỉ có 2 nút gọi server (`AllowableScriptFunc.txt` 209/210 → `x890099_CheckUpLevelBook/CheckDeleteBook`), không thêm nút được (client). Vá `CheckUpLevelBook`: chưa có tông (mission 443 = 0) mà bấm ▲ ở ô Chưa học → mở hộp thoại tự thân chọn 5 tông (AddNumText script 900048 key 201–205, `DispatchEventList(sceneId,selfId,selfId)` như `event_enterarea.lua`). Chưa test: cần xác nhận bấm mục trong hộp thoại tự thân có gọi `x900048_OnEventRequest` không; nếu không thì dùng NPC Kim Ức Phong.

## 01/10 03:10 - Số lượt phó bản mỗi ngày (đọc từ script, tính theo nhân vật, reset theo ngày server)
| Phó bản | Lượt/ngày | Script |
|---|---|---|
| Phiêu Miểu Phong (lớn) | 2 | `event/piaomiaofeng/epiaomiaofeng.lua` |
| Phiêu Miểu Phong (nhỏ) | 2 | `event/piaomiaofengsmall/epiaomiaofeng_small.lua` |
| Binh Thánh Trận (lớn) | 3 | `event/bingshen/ebingshen.lua` |
| Binh Thánh Trận (nhỏ) | 3 | `event/bingshensmall/ebingshensmall.lua` |
| Tứ Tuyệt Trang | 3 | `event/sijuezhuang/esijuezhuang.lua` |
| Thiếu Thất Sơn | 3 (nhánh 2: 5) | `event/shaoshi/eshaoshishan.lua` |
| Huyết Chiến Nhạn Môn Quan | 5 | `event/xuezhanymg/exiao.lua` |
| Tam Thần Huyễn Cảnh | 5 (>20 = đá ra, coi là hack) | `New/sanshen/efuben_sanshen.lua` |
| Sinh Tử Lôi Đài (Thủy Hử) | 3 | `obj/shengsi/shengsileitai.lua` |
| Yến Tử Ổ | 8 (cả tổ đội phải còn lượt) | `event/yanziwu/yanziwu_1.lua` |
| Lang Hoàn Phúc Địa | 3 | `obj/dali/odali_lanlan.lua` |
| Thiên Long Huyễn Cảnh | 5 | `event/xunhuan/TianlongHuanjing.lua` |
| Hư Không Huyền Cảnh (Bí Tịch) | theo tầng 1/2/5/10/25 + vé Ngũ Hành Pháp Thiếp (50/ngày) | `MyLua/MiJI/xukonghuanjing.lua` |
| Kính Hồ thủy trại (Diệt phỉ) | 1, chỉ thứ 7 13:00–22:00 | `event/fuben/efuben_jiaofei.lua` |
- Chưa đọc kỹ: Lâu Lan Tầm Bảo, Tân Sinh Thú Sơn, các phó bản môn phái (shimen_0901), Bảo Tàng. Đổi số lượt: sửa số trong dòng `lastDayCount >= N` (Lua, hiệu lực ngay).

## 01/10 03:30 - Cưu Ma Trí rớt 6 phiếu: lỗi của tôi khi nâng Mv, đã sửa (chờ restart)
- Audit 01:53: Cưu Ma Trí 39381 rớt **6 phiếu cho mỗi thành viên** (2 GUID × 6), Đoàn Diên Khánh 39321 rớt 1/thành viên. Nguyên nhân: lúc gắn gói boss 02:10 tôi nâng Mv 20 → 60 cho 13 dòng nhưng giữ hộp phiếu BV 20/10 → tỉ lệ 3–6 lần. **Quy tắc rút ra: hộp phiếu phải có BV = Mv đúng bằng** (ratio 1 = mỗi người 1 phiếu; ratio >1 = nhiều phiếu, quan sát 60/20 → 6 phiếu, chưa rõ công thức làm tròn). Đã đổi 13 dòng sang 90001 (BV 60); kiểm toàn file: mọi hộp phiếu BV == Mv, không dòng nào có 2 hộp phiếu.
- **Rơi đồ tính theo từng thành viên trong đội** (mỗi người 1 lượt roll, log Audit ghi riêng từng GUID): "mỗi boss 1 phiếu" nghĩa là mỗi người 1 phiếu; đội 2 người = 2 phiếu/boss.
- **03:45 chống lạm phát (chờ restart):** quy luật xác nhận từ Audit: **số món mỗi người ≈ Mv ÷ BV** (Đoàn Diên Khánh Mv 60 / thuốc giải BV 10 → 6–7 viên/người; tinh thiết BV 40 → 1–3). Thêm 2 hộp `DropBoxContent`: **90029** = Bi Tô Thanh Phong Giải Dược BV 60, **90030** = nguyên liệu cấp 8 BV 60; thay 3021→90029 (3 dòng Đoàn Diên Khánh), 3005→90030 (92 dòng boss Mv ≥ 60 có phiếu + Yến Tử Ổ). Sau sửa: không boss Mv ≥ 60 nào còn hộp BV < 60. Các cặp BV < Mv còn lại đều là thiết kế gốc (nguyên liệu cấp thấp ×1.2–1.6, Kính Hồ ×5, Túc cầu ×4, Đế Thích Thiên 15445 Mv 3000 ngọc cấp 5 ×10) — chưa đụng.

## 01/10 04:00 - "Yến Tử Ổ không đếm lượt": đếm có chạy, giới hạn gốc là 8 (thông báo ghi 3) → hạ về 3 (hiệu lực ngay)
- Đọc `t_char.mdata` (chuỗi hex, mỗi ô 8 ký tự = int32 little-endian; ô N ở vị trí N×8+1): ô 195 (MD_YANZIWU_TIMES) hôm nay: bia1 = 6, Bialklk = 5, cuocdoibuon = 2, VÃỪKÃỐAnh = 1 → mỗi lần vào đều +1 (`x401040_OnPlayerEnter`). Kiểm tra ở NPC: `nTimes >= 8` mới chặn, còn câu báo lại ghi "đủ 3 lần" → người chơi tưởng vô hạn. Log: 5 lượt YTO hôm nay (3 lượt trong 10 phút lúc 01:47–01:57, bản 2 đợt).
- Sửa: biến `x401040_g_LuotNgay = 3` (gốc 8). Cách đọc mission data của nhân vật khác: `SELECT SUBSTRING(mdata, N*8+1, 8)` rồi đảo byte.

## 01/10 - Bộ 144 pet skin Huyễn Hóa: mỗi skin đủ Ngoại / Nội / Cân bằng, cấp 85 và 95, bản Admin + V2 (đã restart)
- Kiểu tấn công pet (chữ Ngoại/Nội trên bảng pet) = `MonsterAttrExTable.txt` cột 62 của dòng quái **cùng ID pet** (`AttackTraits.txt` 11/12/13); engine đọc bảng quái theo ID pet ở 5 chỗ (kiểu, cờ đánh NPC, triệu hồi, hoàn đồng, chi tiết chỉ số). Game gốc khóa mỗi skin vào 1 kiểu.
- Huyễn Hóa = **pet nền + skin**: skin chỉ là cột 1/44/50 (+61/65) của dòng quái; còn lại theo pet nền. Đã ghép pet nền vào 180 ID (144 + 36 Tân Thủ) Huyễn Hóa có sẵn (không tạo ID mới vì client không biết ID mới): 12 skin × 3 kiểu × cấp 85/95 × bản Admin 12000 / V2 tư chất gốc. Bảng ID: `docs/pet-huyen-hoa.md` mục đầu + `docs/pet-skin.tsv`. Panel GM 2 nhóm Huyễn Hóa đọc từ `pet-skin.tsv`, nhãn "Skin cấp Kiểu" (vd "Cáp Đại Bá 85 Nội").
- Đã thử 25601 (Cáp Đại Bá 95 Nội) trong game: đúng. Không đụng 13 ID đã phát cho bia1. Bản V2 cũ 31xxx (+6000) bỏ khỏi panel — client không biết các ID đó, 18 ID trùng quái phó bản; còn nằm trong PetAttrTable, vô hại. Rollback: tag `truoc-ghep-skin-all-01-10` (bộ 143 con) / `truoc-ghep-skin-01-10` (cả con thử).

## 01/10 - Điêu văn Cường lực / Nội lực bị dịch ngược tên (đã sửa)
- Gốc (ghi chú GBK trong `MyLua/diaowen/aHaDiaoWenSys_1.lua`): 30110021–30110030 = 灵气 → khảm cộng **Nội lực**; 30110031–30110040 = 力量 → khảm cộng **Cường lực**. Client hiển thị đúng; bản Việt hóa phía server đặt ngược tên (21–30 ghi "Cường Lực", 31–40 ghi "Nội Lực"), kèm 2 đồ dạng 30120002 (→ 30110031, Cường lực) / 30120003 (→ 30110021, Nội lực).
- Đã đổi lại tên 22 dòng ở `CommonItem.txt` + `docs/vat-pham/vat-pham-thuong.tsv` + `tat-ca-vat-pham.csv` (panel GM, tab Drop Boss, ô tìm vật phẩm) và 2 món shop web (30110030 = Nội Lực cấp 10, 30110040 = Cường Lực cấp 10, giá giữ nguyên). Lệnh đúng: Cường lực cấp 10 `!!createitem =30110040 =1 =1`, Nội lực cấp 10 `!!createitem =30110030 =1 =1`.
- Quét toàn game (ID trong Lua có ghi chú 力量/灵气/体力/身法/定力 so với tên Việt + tên so với mô tả): chỉ đúng 22 dòng này, sau sửa = 0. Script: scratchpad `quet_nguoc.js`. Rollback: tag `truoc-dieuvan-01-10`. `CommonItem.txt` chỉ có tác dụng ở log server → hiệu lực khi restart lần sau, không cần restart riêng.
- **01/10 tiếp:** shop web nhóm Điêu Văn (cat `g3`, 12 món, đang TẮT) đổi từ cấp 10 xuống **cấp 5**: ID = ID cấp 10 − 5 (Thể Lực 30110005, Nội Lực 30110025, Cường Lực 30110035, Băng/Hỏa/Huyền/Độc Công 30110045/55/65/75, Thân Pháp 30110115, Giảm Kháng Băng/Hỏa/Huyền/Độc 30110125/35/45/55). Tên + ghi chú khớp cấp 5, đã đối chiếu từng ID với mã gốc trong `aHaDiaoWenSys_1.lua`. Giá 100.000, ảnh, nhóm, trạng thái tắt giữ nguyên.
- **01/10 tiếp 2:** chủ server chốt bán **cấp 1, 50.000/viên** để người chơi tự nâng: 12 món đổi sang ID cấp 1 (30110001, 021, 031, 041, 051, 061, 071, 111, 121, 131, 141, 151), tên "Điêu Văn … cấp 1". Lúc đổi 12 món đang BẬT bán (chủ server bật trên admin). Không cần restart: tên trong game do client hiển thị, tên shop là của web.

## 01/10 - Rơi đồ theo MAP (script 950001 `NetCo4/roimap.lua`, chờ restart)
- Quái cùng ID có mặt ở nhiều map (Mã Tràng Thủ Vệ 11469: Hạn Huyết Lĩnh + Hậu Hoa Viên + Thông Thiên Tháp) → không gắn qua `MonsterDropBoxs` (sẽ rơi lan). Dùng hàm chết `x950001_OnDie` gắn vào **điểm spawn** (`script_id=950001` trong `_monster.ini`), mỗi thành viên tổ đội gần roll riêng, đồ rơi trên xác (`AddMonsterDropItem`). Bảng `x950001_g_Roi[sceneId] = {ID, %}` — sửa % hiệu lực ngay; thêm map = sửa `_monster.ini` + restart.
- Đã gắn: **Hạn Huyết Lĩnh** (scene 432, 83 spawn, NPC Đoàn Dự giữ script riêng) rơi **Kim Tàm Ti 20310166 30%** (chủ server chưa nói %, tạm 30%); **Hậu Hoa Viên** (scene 62/82/182 chung `newbie_2_monster.ini`, 72 spawn) rơi **Chí Tôn Cường Hóa Tinh Hoa 38000571 30%** — chỉ vào được trong giờ mở cửa (biến `x990010_g_HHV_Mo/Dong`, đang 0/24 để test, ngày open 19/24).
- **Liên Hoàn Q Tô Châu** (NPC Tiền Hoành Vũ Tô Châu 134,260, script 1065 → nhiệm vụ 050100 `boundary_between_song_and_liao.lua`, map phó bản `sancaixiagu`): quái 3 đợt đều tạo bằng `LuaFnCreateMonster(..., 1130)` → thêm 1 dòng đầu `x001130_OnDie` (`event/xunhuan/sancaixiagunpc_die.lua`) gọi `CallScriptFunction(950001, "RoiDo", …, 20800034, 40)` → **Cửu Thiên Ngọc Toái 40%** mỗi người. Script 1130 chỉ dùng cho phó bản này. Lua → hiệu lực khi 950001 đã nạp (cần restart vì `Script.dat` thêm dòng).
- **Liên Hoàn Q Lâu Lan** = nhiệm vụ 050220 `xinsanhuan_1.lua` (Viêm Ma Sơn, NPC Hà Duyệt Lâu Lan 295,68, script 050110), mã 1256. **Không bị khóa**: nhiệm vụ ẩn khi người chơi đang giữ nhiệm vụ khác trong dải 1256–1269 (Q Tô Châu = 1260) — game gốc chỉ cho giữ 1 liên hoàn. Đã Việt hóa 51 câu tiếng Trung (mô tả, mục tiêu, thoại boss, thông báo), tên nhiệm vụ "Hoàn Kim Chi Liên" → "Liên Hoàn Q Lâu Lan (3 trong 1)"; giữ nhãn log `LuaFnAuditQuest("炎魔山")`. Rơi **Cửu Thiên Ngọc Toái 20800034 40%**: dòng đầu `x001129_OnDie` (`yamoshannpc_die.lua`, chỉ phó bản này dùng 1129) gọi `RoiDo`.
- Quái nhỏ đợt 3 của **cả 2 phó bản** trước tạo bằng script `-1` (không có hàm chết) → đổi thành `950001`; `roimap.lua` tra bảng `x950001_g_RoiPhoBan[CopySceneData_Param 1]` (50100 Tô Châu, 50220 Lâu Lan) → cũng rơi 40%. Rollback: tag `truoc-viet-ysh-01-10`.
- Lâu Lan Tầm Bảo (NPC Kim Cửu Linh 163,75) là hoạt động khác, chưa làm.
- `Script.dat` thêm dòng `950001=\NetCo4\roimap.lua`. Rollback: tag `truoc-roimap-01-10`.

## 01/10 - Trùng Lâu Đới 10553106: Phá Quân 15 giây → 5 giây (chờ restart)
- EquipBase cột 19 = hiệu ứng **7505** "Trùng Lâu Phá Quân" (logic 88: 3% khi đánh trúng) → con **7506** (logic 64, bỏ qua phòng thủ, 1 lần kích). Thời gian thật ở `StandardImpact.txt` 7506 cột 20 = **15000 ms** (tooltip client ghi 10 giây, sai sẵn) → đổi **5000**. Tooltip vẫn ghi 10 giây (client, không sửa được). Chân Trùng Lâu Đới (7507 → 7508) giữ 30000 ms. Rollback: tag `truoc-trunglau-dai-01-10`.
- "Cố định dòng": 10553106 đã cố định sẵn đúng 11 dòng (cờ =1 ở cột 32, 54, 61, 68, 74–80; số dòng min = max = 11) — mọi món ra đúng 11 dòng như ảnh, chỉ **con số** random theo quy tắc phẩm chất 9, đoạn 100.
- Phát hiện cũ, chưa sửa: `StandardImpact.txt` dòng 5724 (Tọa kỵ Xe trượt tuyết) nằm sau 5919 → engine không tìm thấy (tìm nhị phân).

- **01/10 tiếp:** 72 pet V2 đổi tư chất chuẩn: dòng chính theo kiểu = 5000 (Ngoại: Cường lực cột 34, Nội: Nội lực cột 36, Cân bằng: Thể lực cột 35), 4 dòng còn lại 2500. Bản Admin 12000 giữ nguyên. Chỉ pet tạo mới sau restart. Rollback: tag `truoc-v2-tuchat-01-10`.

## 01/10 tối - Tắt "Càn Khôn Hồ / Kiền Khôn Bôi" tự gắn (tự nhặt đồ) - hiệu lực ngay
- Hiệu ứng tự nhặt đồ là impact **8500 干坤杯** (logic 38, 2 giờ online, client hiện tên "Càn Khôn Hồ"). Đọc `t_impact` (mỗi dòng `imdata` hex, byte 9–12 = ID hiệu ứng LE): 8/10 nhân vật đang mang 8500, kể cả nhân vật chưa từng dùng vật phẩm.
- Nguồn: `MyLua/ShuaXinClient.lua` `x892002_AHa_ShiZhuangDianZhui` (gọi từ `AHa_ReMyBuff` — chạy mỗi lần làm mới buff: Thần Đỉnh, Thần Khí, bảo giám…) có sẵn từ bản gốc dòng `LuaFnSendSpecificImpactToUnit(...,8500,0)` → gắn cho **mọi người**. Đã comment dòng đó. Vật phẩm Kiền Khôn Bôi `30008033` / Kiền Khôn Hồ `30008009` (impact 57 + 8500) vẫn dùng được bình thường.
- Buff đang có trên người sẽ tự hết sau tối đa 2 giờ online (không tính thời gian offline). Muốn xóa ngay: stop game, xóa dòng `t_impact` có `SUBSTRING(imdata,9,4)='3421'`. Rollback: tag `truoc-tat-kienkhon-01-10`.

## 01/10 tối - Tàng Kinh Các (藏经阁): có, đang chạy, chưa ai đi
- Hoạt động `event/bossgroup/bg_CangJingGe.lua` (810112, lịch `ActivityNotice.txt` id 231–234): **10:45, 16:30, 21:30, 23:00** mỗi ngày, ở **Nhạn Nam** (scene 18) rải 18 NPC "Thiếu Lâm Vân Du Võ Tăng" (13565–13573, theo cấp). Log debug xác nhận NPC ra đúng giờ 30/09 và 01/10.
- Nói chuyện với NPC → `event/huodong/FB_cangjinge_FB.lua` (807005): tổ đội, mọi thành viên ở gần và **cấp ≥ 40**; vào xong **NPC bị xóa** (mỗi NPC 1 đội). **Không giới hạn lượt/ngày** — giới hạn thật là số NPC (18 × 4 đợt).
- Bên trong 30 phút: Ngụy Quan Quân 13583+, Trộm Sách Ác Tăng 13574+ (**không có dòng rơi**), boss **Che Mặt Ác Tăng** 13592–13600 (Mv 60): phiếu 1000 (~3%), ngọc cấp 5 (~20%), Yếu Quyết (~8%), Yếu Quyết/phiếu 1000/phiếu 5000 (~3%), Điêu Văn Đồ Dạng (~15%). Bậc quái = cấp trung bình tổ / 10 (cấp 110+ dùng bản +8 = cấp 110).
- Log: chưa từng có ai vào (boss 13592–13600 chưa spawn lần nào).

## 01/10 tối - Tiệm Nguyên Bảo › Nam Bắc Kỳ Hóa › Kỳ Trân Dị Bảo: bán 2 món tự nhặt đồ (chờ restart)
- Kệ này là **shop 137** trong `Public/Config/ShopTable.txt` (đơn vị tiền cột 8 = 6 = Điểm Tặng; mỗi món 6 cột: ID, số/lần, giới hạn, giá, chiết khấu %, màu; 26 món cũ, trang 2 = món 19–26). Thêm ô 27 **Kiền Khôn Hồ** `30008009` (12 giờ online) và ô 28 **Kiền Khôn Bôi** `30008033` (2 giờ online), **1.000 Điểm Tặng**, màu `#G`. Cột 12 "Num" = 50 ở mọi shop, không phải số món. Server chỉ nạp `ShopTable.txt` (các bản `ShopTable9999/OPENCu/TEST` không dùng). Rollback: tag `truoc-shop-kienkhon-01-10`.

## 01/10 tối - Tuyết Lang Hồ rơi Phục Hi Ngọc 30% (giữ cho server chính, chờ restart)
- `NetCo4/roimap.lua` (950001) thêm `[179] = { 38002049, 30 }`; `Public/Scene/xuelanghu_monster.ini` 533 điểm spawn quái thường `script_id=-1` → `950001` (Tuyết Sơn Lang, Tuyết Sơn Mãng Cái, Trọng Giáp Mãng Cái, Ba Luân Mãng Cái, Gấu Đen Lớn cấp 100–105). 5 boss 11299–11303 giữ script riêng 325001–325005 (không rơi Phục Hi Ngọc). Mỗi thành viên tổ đội roll riêng, đồ rơi trên xác quái. Đổi % sửa Lua có hiệu lực ngay; file ini cần restart. Rollback: tag `truoc-phuchi-tuyetlang-01-10`.
- Cân nhắc: Phục Hi Ngọc dùng ở "Thượng Cổ Thần Khí Dục Linh" (`shenqichongxi.lua` FuXiCost 2 → 242 viên/cấp, tổng ~1.700 viên lên cấp 19). 538 quái cấp 100+ × 30% → cày 1 giờ ra hàng trăm viên.

## 01/10 21:00 - Túi đồ giết boss (game + web bot) — chi tiết `docs/TUI-BOSS.md`
- Game `33d048d` (Lua, hiệu lực ngay, không restart), bot bialk `9682593` (đã chép lên `/opt/minigame/BotDoMin` kiểm hash, `systemctl restart minigame`, thẻ 🎒 có trên cổng 3002, bot đọc log không lỗi). Chưa có `tuiboss.log` vì chưa ai hạ boss cuối sau 20:54. Test đề nghị: đi Yến Tử Ổ 1 lượt → web 🪪 Cá nhân › 🎒 Túi đồ boss → Nhận → đổi bản đồ.

## 01/10 21:20 - VPS báo cần reboot (kernel + libc6) → để tới ngày mở
- Ubuntu tự cài `linux-image-5.15.0-194` + `libc6` lúc 01/10 06:07; đang chạy `5.15.0-91`. Không ảnh hưởng game. Chủ server chốt: **reboot vào ngày mở**, thay cho bước `tlbb.sh start` (đã ghi `docs/MO-SERVER.md` mục 3 bước 7, kèm cách kiểm và cách cứu nếu máy không lên).

## 01/10 22:50 - Túi đồ boss: chạy thật + 2 việc
- **Đã chạy thật:** 22:36 PMF thường (9666) và 22:43 PMF khiêu chiến (9546), tổ 4 người (1010100002/4/6/8) → `tuiboss.log` 2 dòng, bot tạo 8 túi đúng người. Nút **Nhận** trên web chữ trắng nền xám (nút mặc định không có nền) → thêm class `tbBtn` xanh lá (bialk `9c2e83b`).
- **Cấu hình đã bị sửa qua cổng mod** (IP 42.115.248.156, 21:53–22:28, cả 13 hoạt động, xem 📜 Lịch sử sửa): vd PMF thêm CCHTP 1–2, PMF khiêu chiến 8.000 KNB, Yến Tử Ổ thêm Nữ Oa Thần Thạch `30505814` ×25–30 + `30505815` ×25–30, Q Tô Châu thêm Cửu Thiên Ngọc Toái ×20–35, Ác Tặc/Ác Bá bỏ CCHTP/CLD/Hồn Băng Châu/Nhuận Hồn Thạch, thêm MB/BN ×10. Chưa xác nhận người sửa là chủ server.
- **Tự vào tổ / tự đi theo không cần bảng hỏi: KHÔNG làm được.** Server `Server` chỉ chuyển lời mời sang `World` (`CGTeamInviteHandler` → `ServerManager::SendPacket`), bảng "X hy vọng các hạ cùng nhóm" do World + client hiện. `ConfigInfo.ini [Team]` chỉ có `AvailableFollowDist`, `TimeForLoseFollow`; Lua không có hàm thêm người vào tổ. Muốn đổi phải sửa binary World/client (không làm).
- Miên Bố / Bí Ngân / Tinh Thiết cấp 8 ở PMF: chủ server chốt **giữ nguyên**. Câu hỏi `DropParam=2.0` (mọi hộp ×2) vẫn chờ chốt.

## 01/10 23:10 - Tự vào tổ: công cụ chạy trên máy người chơi `deploy/client/TuDongVaoTo/`
- Server không làm được (mục trên), nên làm phía client: `CHAY.cmd` → `tu-dong-vao-to.ps1` (PowerShell 5.1 + C# biên dịch lúc chạy, không cần cài gì). Chỉ khi cửa sổ `Game.exe` đang được chọn: chụp vùng khách ~3 lần/giây, thấy bảng mời tổ thì di chuột tới "Đồng ý", bấm, trả chuột về chỗ cũ.
- Nhận bảng bằng 3 mẫu trong `mau\` (cắt từ ảnh chụp bảng mời thật, chữ game 1 điểm ảnh, không khử răng cưa → so khớp nhị phân theo ngưỡng, chịu được nền trong suốt): `nut-dong-y.png` + `nut-cu-tuyet.png` (phải nằm ngay bên phải) + `chu-1.png` = chữ "nhóm," phía trên nút. **Chỉ nút thôi là nguy hiểm:** thử trên 38 ảnh chụp trong phiên, chữ "Đồng ý" còn khớp ở 7 chỗ khác (bảng xác nhận mua Tiệm KNB, ô "Đồng ý chi ra KNB", nút cộng điểm tiềm năng) → bắt buộc đủ 3 mẫu, thiếu chữ nhận diện thì không bấm gì.
- Đã thử: bảng gốc, chữ "nhóm," rơi xuống dòng 2 (tên người mời dài), nền sáng +35, bảng không có chữ "nhóm," (không bấm), bảng đặt trong khung 1280x720 lẫn ảnh game khác (bấm đúng tọa độ). Quét 1 khung ~15 ms. Trên máy Khoa: 2 client đang chạy được nhận là game, không chạy quyền admin, vùng khách 2560x1369.
- **Chưa thử trong game thật** (không cướp focus/di chuột khi client đang mở). Test: mở 2 client, chạy `CHAY.cmd`, client A mời B, chọn cửa sổ B → phải tự vào tổ. Không bấm → Ctrl+F9 trên nút Đồng ý rồi Ctrl+F10 trên chữ "nhóm," (lấy mẫu lại). Phím Ctrl+F8/F9/F10 chưa kiểm có trùng phím tắt game không.
- Chưa đưa vào `NetCo4.zip`: chép thư mục `TuDongVaoTo` vào gói hoặc gửi riêng cho người chơi.

## 01/10 23:40 - 2 lỗi: Binh Thánh lớn kẹt ở Gia Luật Diễm + Sát Tinh 11 túi/lượt (Lua, hiệu lực ngay)
- **Binh Thánh Kỳ Trận (bản lớn 894063): bấm Khiêu chiến Gia Luật Diễm chỉ ra câu "Huynh đệ, hãy cùng ta chiến đấu."** NPC `obj/bingshen/owulaoda.lua` (894072) đòi cờ `XiaoRuJun` = 2 **và** `ShuangZi` = 2 (đã hạ đủ 2 anh em Tiêu Như Quân / Tiêu Như Úy ở Độc Kỳ Trận). Cờ `ShuangZi` do hàm chết của Tiêu Như Úy đặt, nhưng `event/bingshen/ai_xiaoruwei.lua` (894067) **bị cắt cụt từ bản leak** (198 dòng, dừng giữa dòng chú thích "死"; bản nhỏ 616 dòng): không có `OnDie`, `ResetMyAI`, 4 hàm Tick/UseSkill, `OnImpactFadeOut` → boss đánh không có skill (OnInit/OnEnterCombat gọi hàm không tồn tại), chết xong không đặt cờ → Gia Luật Diễm khóa vĩnh viễn. Bản nhỏ (895067) không lỗi.
- **Sửa:** khôi phục phần đuôi từ **đĩa máy ảo gốc** `/root/Ubuntu.vmdk` (tìm chuỗi `function x894067_OnDie`, khối dữ liệu liền 19.923 byte, đủ 16 hàm, chuỗi đã Việt hóa VISCII), so cấu trúc với bản nhỏ: khớp. Đổi số hiệu ứng 19412/19413/19414/19418 → **8812/8813/8814/8818** cho giống phần còn lại của bản lớn (server này dùng 88xx cho Binh Thánh lớn, 194xx là hiệu ứng giữ chỗ "循环玄属性"; anh em song sinh `ai_sangtugong.lua` tặng đội trưởng 8812 và chờ 8813 tắt, Tiêu Như Úy ngược lại). **Bỏ khối rơi đồ qua script** của bản gốc (bảng `LootItem_1..4` không còn trong file; có phiếu KNB 5.000/10.000 `39910003/4` 60%/người) — giống Tiêu Như Quân bản lớn hiện không rơi qua script. Hệ quả: Tiêu Như Úy giờ **dùng skill** như bản gốc (khó hơn trước). Lượt đang kẹt không cứu được, phải vào lượt mới.
- Quét toàn bộ script tìm file gọi hàm `x<id>_...` của chính nó mà không định nghĩa: 41 file, toàn hàm phụ (MsgBox, UpdateEventList, NotifyTip...), không có script boss phó bản nào. Chưa sửa.
- **Sát Tinh (Sinh Tử Lôi Đài): 1 lượt ra 11 túi** (log 22:57–23:00: 11 boss, mỗi boss 2 dòng). Mỗi boss 2 dòng là lỗi của tôi: `shengsileitai.lua` OnDie gọi TB_Ghi rồi gọi `501000` OnDie cũng gọi TB_Ghi (bot gộp dòng trùng 20 giây nên không ra 22 túi; đồ rơi 501000 không nhân đôi vì boss Sát Tinh không có trong bảng pet). Đã bỏ dòng ở `shengsileitai.lua`.
- Chủ server chốt **chỉ tính boss cuối Ngô Vĩnh**. `roimap.lua`: danh sách Sát Tinh còn `13456`; NPC Tống Giang cũng gọi ra 13456 → `x950001_TB_SatTinhDuoc` chỉ ghi khi NPC Ngô Vĩnh `13552` đã biến mất (đã bị khiêu chiến; respawn 10.000 giây nên không quay lại trong lượt) và ô dữ liệu phó bản 24 chưa = 1 (đặt 0 lúc tạo phó bản trong `MakeCopyScene`). → 1 túi/lượt, tối đa 3/ngày theo lượt vào. 11 túi Sát Tinh test đã tạo vẫn còn trên web (xóa khi mở server cùng `_tuiBoss`).
- **Chưa test trong game:** Binh Thánh lớn đi hết tới Gia Luật Diễm; Sát Tinh 1 lượt đủ 12 trận → `tuiboss.log` chỉ 1 dòng boss 13456.

## 01/10 23:55 - Quái rơi ngọc cấp 6 thay cấp 5 (bảng rơi cần restart, script boss hiệu lực ngay)
- Trước: **mọi** hộp ngọc gắn cho quái (87 hộp, 967 loại quái) đều là ngọc **cấp 5**; chỉ 1 hộp cấp 4 (`3001`, 24 quái `879`, `3800`–…); không hộp cấp 6 nào. Chủ server: ngọc 5 đã free → đổi hết sang cấp 6.
- ID ngọc = `50` + cấp + loại(2) + `0` + chỉ số(2) (`GemInfo.txt`), cấp 6 = cấp 5 **+100000**; đủ 53/53 viên cấp 5 có bản cấp 6.
- `Server/Config/DropBoxContent.txt`: 8.499 ô ngọc cấp 5 trong 178 hộp (87 hộp gắn quái + 91 hộp không ai dùng) → cấp 6. Chỉ đổi ô vật phẩm, BoxValue/số món rơi giữ nguyên. **Cần restart.**
- 9 script boss có bảng rơi qua script (`LootItem_*`, `ItemDroplisst`): Binh Thánh nhỏ (`event/bingshensmall/ai_hadaba/liqiushui/sangtugong/wulaoda/xiaoruwei`), Thiếu Thất (`event/shaoshi/ai_bingcan/liqiushui/wulaoda`), Tứ Tuyệt (`event/sijuezhuang/ai_liqiushui`): 118 ô → cấp 6 (dòng đã chú thích `--` để nguyên). Lua → hiệu lực ngay.
- **Không đổi** (không phải quái rơi): rương mở bằng vật phẩm (`obj/item/zhuandan_*`, `XieziBags`, `UniverseBag`, `siliubaoshi`), tách/khảm ngọc (`MyLua/mingjingshi/*Gem_ZuoKeFenLi`, `gem_embed`), tiệm/NPC đổi (`oqianzhuang_remai`, `oluoyang_*`), quà/sự kiện (`New/1TakeGift`, `New/lucky/action`, `New/guigu/*`, `flower4`), rương bản đồ kho báu (`gp_renwu_chengxiongdatu_baoxiang`), `boxdroplist_*.txt` (rương). Hộp ngọc cấp 4 `3001` giữ nguyên. Cấu hình túi boss trên web đã dùng ngọc cấp 6 sẵn.
- Kiểm: so từng token với HEAD, 8.617 chỗ khác đều là c5 → c6 cùng loại, 0 chỗ lạ; số byte, byte >127, CR/LF không đổi. Rollback: tag `truoc-ngoc6-01-10`.
- **01/10 23:49 kiểm trong game:** NPC Gia Luật Diễm không còn câu "Huynh đệ, hãy cùng ta chiến đấu." (đã qua 2 cờ `XiaoRuJun`/`ShuangZi` → phần khôi phục Tiêu Như Úy chạy). Hai thông báo gặp sau đó là đúng luật: "Các hạ yêu cầu giữ chức Trưởng nhóm" (chỉ đội trưởng bấm Khiêu chiến được) và "Đang cùng Tiêu Như Quân, Tiêu Như Úy tử chiến…" (`CheckHaveBOSS`: còn boss sống; 2 anh em phải hạ **cách nhau dưới 30 giây**, không thì con chết trước sống lại). Chưa thấy hạ Gia Luật Diễm.

## 02/10 00:05 - Binh Thánh lớn: 2 anh em hạ cùng lúc vẫn sống lại (lỗi lộ ra sau khi khôi phục Tiêu Như Úy) - Lua, hiệu lực ngay
- Cơ chế: con chết trước gắn cho đội trưởng hiệu ứng 30 giây (`StandardImpact` 8812 khi Tiêu Như Quân chết → hết hạn gọi `x894067_OnImpactFadeOut`; 8813 khi Tiêu Như Úy chết → `x894065_OnImpactFadeOut`). Hết 30 giây, nếu con kia còn → gọi con đã chết sống lại.
- Lỗi gốc của script: chỉ kiểm "có quái 15135 / 15130 trong danh sách" (`GetMonsterDataID`), **không kiểm còn sống**; xác vẫn nằm trong danh sách quái (vì vậy `CheckHaveBOSS` của phó bản phải lọc `LuaFnIsCharacterLiving`) → hạ cả 2 cùng lúc, 30 giây sau cả 2 đều sống lại. Trước 01/10 23:26 nhánh này không chạy vì `ai_xiaoruwei.lua` mất hàm (và Gia Luật Diễm khóa luôn).
- Sửa: thêm `and LuaFnIsCharacterLiving( sceneId, nObjId ) == 1` vào đúng 2 dòng kiểm (`ai_xiaoruwei.lua` 15135, `ai_sangtugong.lua` 15130). Luật còn lại giữ nguyên: hạ 1 con rồi để con kia sống quá 30 giây thì con đã chết vẫn sống lại.

## 02/10 00:25 - Hậu Hoa Viên: Xích Tiêu Hỏa Hồn hồi sinh 30 phút (cần restart)
- `Public/Scene/newbie_2_monster.ini` (dùng chung cho Hậu Hoa Viên 62 / 82 / 182): 5 điểm quái `1375` Xích Tiêu Hỏa Hồn cấp 75 `respawn_time` 180000 → **1800000** (3 phút → 30 phút, mỗi điểm tính riêng). 67 điểm Mã Tràng Thủ Vệ `11469` giữ 5 giây.
- Ghi chú rơi đồ Hậu Hoa Viên (kiểm 02/10): Mã Tràng Thủ Vệ ~1,6 món/người/con (Kim Điều 40%, Kỉ Niệm Đồng Tệ 40%, Chí Tôn Cường Hóa Tinh Hoa 30% từ `roimap.lua` + 3% từ hộp 86003, MB/BN 5–8 17%…). Xích Tiêu Hỏa Hồn cấp 75: nhân vật 119 bị giảm rơi 10% (`DropAttenuation`, chênh −36…−50), 126+ còn 5% → hộp gần như không rơi; chỉ script 30% Chí Tôn Cường Hóa là đều.

## 02/10 00:50 - Tuyết Lang Hồ chỉ rơi Phục Hi Ngọc 30% (bảng rơi cần restart; 5 con mạnh: Lua hiệu lực ngay)
- Chủ server: mọi đồ khác ở Tuyết Lang Hồ là rác. `MonsterDropBoxs.txt`: 15 loại quái `11154`–`11163`, `11299`–`11303` giữ dòng nhưng 20 cột hộp → `-1` (220 ô). **`11154` Gấu Đen Lớn còn 2 điểm ở `xuezhanymg_monster.ini` → chỗ đó cũng hết rơi.** Rollback: tag `truoc-tuyetlang-chi-phuchi-02-10`.
- 5 con mạnh `11299`–`11303` (hồi sinh 5 phút, script `obj/elite/xuelanghu_N_baby.lua` trước trống) → thêm `CallScriptFunction( 950001, "OnDie", ...)` → cũng rơi Phục Hi Ngọc 30%/người như quái thường.
- **Không dùng `LuaFnDisableMonsterDropBox`** (đọc binary 02/10): `Obj_Monster::OnDie` = `OnDie_Before` → `Obj_Character::OnDie` (gọi Lua OnDie) → `OnDie_After`; `OnDie_After` thấy cờ `0xeb4` = 0 thì bỏ cả `CaculateBossDropRuler`, mà hàm này mới là chỗ tạo hộp trên xác cho **cả** món `AddMonsterDropItem` của script (`CreateMonsterDropItembox` → `AddItem` món script → `CaculateItemDropFromMonster` món bảng) → tắt cờ = mất luôn Phục Hi Ngọc. Bỏ hộp trong `MonsterDropBoxs` thì món script vẫn rơi (hàm chỉ thoát sớm khi không có quái/scene/chủ sở hữu). Exp + nhiệm vụ diệt quái chạy trước điểm kiểm cờ.

## 02/10 00:45 - Túc Cầu không ra quái/boss (chỉ 4 NPC) → lỗi cấp tối đa 119, sửa 5 script (Lua, hiệu lực ngay)
- Nguyên nhân: `ConfigInfo.ini HumanMaxDefaultLevel=119` → `GetHumanMaxLevelLimit()` = 119. Script tính cấp quái `iniLevel = floor(cấp/10)` nhưng nhánh **cấp đội ≥ cấp tối đa** viết `iniLevel = PlayerMaxLevel/10` = **11,9** (bản gốc tối đa 100 → 10 tròn) → `bảng[11.9]` = nil → ID quái 0 → không gọi được quái nào. Cấp đội = Σcấp⁴/Σcấp³ nên đội toàn 119 (hoặc có người 119) dính.
- Sửa (`floor`): `event/fuben/efuben_cuju.lua` (Túc Cầu 402040), `event/fuben/efuben_jiaofei.lua` (402030), `event/olympicgames/eGodFireTransfer_fuben.lua` (có dự phòng nên vẫn ra quái cấp thấp nhất, giờ đúng cấp), `event/huodong/seek_treasure.lua` + `seek_treasure2.lua` (**Lâu Lan Tầm Bảo** 808039: nhánh thường `floor(cấp/10) - 6`, nhánh tối đa sửa thành `floor(119/10) - 6` = 5 như cấp 110–119; trước ra 11,9 → không ra quái/boss Trấn Bảo Long Vương).
- Túc Cầu ghi giờ vào (`MD_CUJU_PRE_TIME`) ngay khi vào → lượt hỏng vẫn khóa 24 giờ. Thêm `x402040_g_MocSuaLoi = 1790876753` (02/10 00:45): lần vào trước mốc không tính.
- Lượt Túc Cầu đang mở (tạo trước khi sửa) không cứu được: ra rồi vào lại.

## 02/10 01:10 - Túc Cầu: mọi quả túc cầu rơi Tử Vi Linh Phách 50% (Lua, hiệu lực ngay)
- `event/fuben/efuben_cuju_4.lua` (402045, script của quả túc cầu nhỏ / Hoa Sắc / quả lớn): đầu `OnDie` gọi `CallScriptFunction( 950001, "RoiDo", ..., 30600084, 50 )` → mỗi người trong tổ ở gần roll 50%, đồ trên xác. Bảng rơi các quả này vốn trống (log `Search Obj_Monster DropBox MonsterType:33680 Get Errors` = không có dòng, nhưng đường tạo hộp vẫn chạy nên món script vẫn rơi). Boss Tôn Mỹ Mỹ (script 402040) giữ bảng rơi gốc.
- Ghi chú: bộ đếm "Đã giết chết túc cầu N/149" trong `OnDie` so tên kiểu "Song song yến", còn quả túc cầu được đặt tên "Hoàng Sắc Túc Cầu"… nên bộ đếm không bao giờ tăng (chỉ là thông báo, không ảnh hưởng ra boss).
- **Mở:** log 02/10 00:42–00:51 Binh Thánh lớn (scene 36) gọi ra 71 con quái `Type=0` cách 12–15 giây (ID rỗng). Mọi ID quái phụ của 3 boss cuối đều có trong bảng; chưa tìm ra nguồn. Không chặn phó bản (Gia Luật Diễm, Gia Luật Liên Thành vẫn ra).

## 02/10 01:25 - Hạ rơi thêm qua script xuống tối đa 30% (Lua, hiệu lực ngay)
- Túc Cầu (mọi quả túc cầu, `efuben_cuju_4.lua`): Tử Vi Linh Phách 50% → **30%**.
- Liên Hoàn Q Tô Châu / Q Lâu Lan - Viêm Ma Sơn: Cửu Thiên Ngọc Toái 40% → **30%** (`sancaixiagunpc_die.lua`, `yamoshannpc_die.lua`, `roimap.lua` `x950001_g_RoiPhoBan` [50100]/[50220]).
- Giữ nguyên (đã ≤ 30%): Tuyết Lang Hồ Phục Hi Ngọc 30%, Hậu Hoa Viên Chí Tôn Cường Hóa Tinh Hoa 30%, Hàn Huyết Lĩnh Kim Tàm Ti 30%, Q Tô Châu / Q Lâu Lan Miên Bố–Bí Ngân 6 bốc 1 10%.

## 02/10 01:35 - CHỐT: mọi món rơi thêm qua script = 20% (Lua, hiệu lực ngay)
- Chủ server: 30% vẫn rơi rất nhiều → chốt 20% cho tất cả quái chạy cấu hình riêng: Túc Cầu Tử Vi Linh Phách, Q Tô Châu / Q Lâu Lan - Viêm Ma Sơn Cửu Thiên Ngọc Toái, Tuyết Lang Hồ Phục Hi Ngọc, Hậu Hoa Viên Chí Tôn Cường Hóa Tinh Hoa, Hàn Huyết Lĩnh Kim Tàm Ti (`roimap.lua` `x950001_g_Roi` / `x950001_g_RoiPhoBan`, `efuben_cuju_4.lua`, `sancaixiagunpc_die.lua`, `yamoshannpc_die.lua`). Miên Bố / Bí Ngân 6 bốc 1 giữ 10%.
- Tỉ lệ là cho **mỗi người** trong tổ ở gần, mỗi con.

## 02/10 01:45 - https://netco4.click/ = trang Bảng Rơi, https://play.netco4.click/ = trang chơi
- nginx `/etc/nginx/sites-available/netco4` (bản cũ: `/opt/tlbb-backup/nginx-netco4-20261002-010611`): tách khối `netco4.click play.netco4.click` thành 2. `play.` giữ nguyên proxy 3002. `netco4.click`: `location = /` (và `/index.html`) trả file tĩnh `/var/www/netco4/index.html`, **mọi đường dẫn khác vẫn proxy 3002** (tab cũ đang mở ở netco4.click, `/api/...` không hỏng). Đã kiểm: `/` 200 Bảng Rơi, `/api/state` 401 (như cũ khi chưa đăng nhập), play 200, admin 200.
- Trang: tra quái / boss / bản đồ / vật phẩm, tỉ lệ mỗi người mỗi con, ô cấp nhân vật (giảm rơi theo chênh cấp), nút "Vào trang chơi". Cũng có bản Artifact riêng tư https://claude.ai/artifact/3KCmXU8gXkLYXMazGZwzmw.
- **Cập nhật trang khi đổi bảng rơi / script rơi:**
  `node tools/bang-roi/lam.js` rồi `scp -P 24700 tools/bang-roi/web/index.html root@103.216.118.123:/var/www/netco4/index.html` (không cần reload nginx). Trang đọc file trong repo, nên dựng sau khi đã commit thay đổi game.

## 02/10 01:55 - CHỐT LẠI: mọi món rơi thêm qua script = 25% (Lua, hiệu lực ngay)
- Chủ server đổi từ 20% lên 25%, cùng 5 nhóm: Túc Cầu Tử Vi Linh Phách, Q Tô Châu / Q Lâu Lan Cửu Thiên Ngọc Toái, Tuyết Lang Hồ Phục Hi Ngọc, Hậu Hoa Viên Chí Tôn Cường Hóa Tinh Hoa, Hàn Huyết Lĩnh Kim Tàm Ti. Miên Bố / Bí Ngân 6 giữ 10%. Trang https://netco4.click/ đã dựng lại theo 25%.

## 02/10 02:05 - CHỐT LẠI: mọi món rơi thêm qua script = 30% (Lua, hiệu lực ngay)
- Chủ server đổi 25% → 30%, cùng 5 nhóm (Túc Cầu Tử Vi Linh Phách, Q Tô Châu / Q Lâu Lan Cửu Thiên Ngọc Toái, Tuyết Lang Hồ Phục Hi Ngọc, Hậu Hoa Viên Chí Tôn Cường Hóa Tinh Hoa, Hàn Huyết Lĩnh Kim Tàm Ti). Miên Bố / Bí Ngân 6 giữ 10%. Trang https://netco4.click/ dựng lại theo 30%.

## 02/10 02:20 - Võ Lâm Bí Tịch: chiêu Nhị / Tam không ra dù ghi 100% (sửa, Lua hiệu lực ngay) + "Tầng" kẹt ở 8 (trần thiết kế)
- **Nối chiêu** (`MyLua/MiJI/wujue.lua`, script 899040, gắn vào hiệu ứng `StandardImpact` logic 90 của chiêu): hiệu ứng chiêu trước tắt → rút `random(1,100) <= tỉ lệ sách` → gửi UI `2014092001` cho client đánh chiêu sau (Nhất → Nhị → Tam). Mã sách là **số lẻ 1, 3, …, 31** (vật phẩm `30311001`–`30311031`, `BookUpLevelOrDel.lua` `x890099_g_sitem`: sách b cho chiêu `850+3k`..`852+3k`, k = (b−1)/2) nhưng `wujue.lua` còn theo cách đánh số cũ 1..16: bảng `g_sum` 16 mục và tra tỉ lệ `kailu[floor((chiêu-848)/3)]` = k+1 → chỉ sách 1 khớp, mọi sách khác tỉ lệ 0 → chiêu Nhị/Tam không bao giờ ra. Sửa: `g_sum` 32 mục (như BookUpLevelOrDel) + tra `kailu[floor((chiêu-850)/3)*2+1]`. Kiểm: 32/32 chiêu Nhị/Tam ra đúng mã sách; bia1 (sách 29, 31, 27, mỗi cuốn 112.785) tỉ lệ 0 → 100%. **Chưa thử trong game**; nếu vẫn không ra thì phía client không xử lý lệnh `2014092001`.
- **"Tu Luyện Cảnh Giới: Tầng N"**: client tự quy từ tổng điểm 3 sách (`ShenDing.lua` gửi `xiuweijinjue` = ô 444 + 445 + 446) theo mốc 10.000 / 60.000 / 70.000 / 90.000 / 120.000 / 160.000 / 260.000 / **338.000 (tầng 8)** / 530.000 / 780.000 / 1.080.000 / 1.440.000. Sách cấp 99 tối đa = 112.785 điểm (sách 27–31) → 3 cuốn tối đa = 338.355 → **Tầng 8 là trần**, tầng 9 trở lên không đạt được với hệ thống hiện tại (bảng mốc `jinjueLevel` trên server không được dùng, tầng chỉ để hiển thị). Muốn lên tầng 9+ phải cho sách vượt cấp 99 (bảng tâm đắc mỗi cấp + chặn `== 99` trong `BookUpLevelOrDel.lua`) - chưa làm, chờ chủ server quyết.
- Dữ liệu bia1 (đọc DB 02/10): ô 443 = 3293127 (tông 3, sách 29/31/27), 444–446 = 112.785, 442 tâm đắc = 18.045, 440 tầng Chu Thiên = 0.

## 02/10 02:40 - Kỳ Cuộc (= "Cờ 12h"): Việt hóa, giờ đánh, túi đồ boss (Lua hiệu lực ngay; bot đã chép)
- **Là gì:** Trân Long Kỳ Cuộc. NPC `obj/luoyang/oluoyang_fuben_zhenlong.lua` (000090, ở Lạc Dương / Tô Châu / Đại Lý) chỉ đưa vào **Phòng nghỉ** (Lạc Dương 418/419, Tô Châu 518, Đại Lý 193). Bàn cờ vào qua 2 mục của cùng NPC:
  - `event/fuben/efuben_1_zhenlong_huodong.lua` (401001) **thường**: chỉ mở **11:30–14:30 và 20:30–22:00** (`x401001_g_beginTime1..endTime2`), tổ ≥ 1 người, cấp ≥ 10. Ngoài giờ NPC báo "Chưa đến thời điểm…" → đó là lý do bị đưa vào phòng nghỉ mà không đánh.
  - `event/fuben/efuben_1_zhenlong2_huodong.lua` (401002) **chế độ nhanh**: server cũ sửa `IsActivityOpen` → luôn mở; tổ ≥ 3 người, cấp ≥ 100.
  - Cả 2 dùng chung `MD_LAST_QIJU_DAY` → 1 lượt/ngày/nhân vật.
- **Việt hóa:** 11 chuỗi tiếng Trung ở NPC 000090 (menu: Giới thiệu Kỳ Cuộc, Vào Phòng nghỉ…, Về Phòng nghỉ, Làm sao nhận thêm kinh nghiệm khi đánh cờ; 2 câu lỗi tổ đội) + 31 chuỗi ở 401002 (thông báo vào/điều kiện, đếm giờ, tên boss, 6 câu thắng trận chép bản Việt hóa có sẵn của 401001; bỏ câu đùa tiếng Trung "nếu thấy dòng này là mạng lag"). Viết bằng mã thoát VISCII `\ddd`. 401001 đã Việt hóa sẵn (chữ Trung còn lại chỉ trong chú thích).
- **Túi đồ boss "Cờ 12h":** khi boss cuối Viễn Cổ Kỳ Hồn chết (khối `objType == LastBoss[mgroup]` của 401001 / 401002) → `TB_GhiId` → mọi người trong bàn cờ có túi: Vũ Học Tâm Đắc ×15, Bí Tịch Tàn Hiệt ×5, Võ Hồn cấp 2–4 ×1 (không KNB), trần 1/ngày. 60 ID boss (3 mức × 20 bậc) thêm vào `roimap.lua` (vòng `for`) và bot `tuiboss.js` hoạt động `kycuoc`. Chưa test trong game.

## 02/10 trưa–chiều — TỔNG KẾT PHIÊN (đọc mục này trước khi làm tiếp)

Trạng thái lúc 15:55: mọi việc dưới đây **đã commit, đã deploy**. Game restart lần cuối **15:51**, nên mọi thay đổi bảng .txt đều đã có hiệu lực.

### A. Web / bot (repo bialk, `/opt/minigame/BotDoMin`, không phải git trên VPS)

- **Vòng Quay May Mắn trên web** (nhóm 🪪 Cá nhân → 🍀). Chi tiết ở `docs/VONG-QUAY.md`.
  - Mở hoặc làm mới vòng: 8.000 KNB, bốc 24 món theo trọng số từ bộ quà. Mặc định là 377 món vòng quay gốc.
  - Rút thăm: tốn 1 lượt quay. Túi đồ boss cho 2 lượt, thay cho Hạnh Vận Quả ×2.
  - Quà vào rương web, tối đa 100 dòng, trúng trùng thì cộng dồn. Người chơi có nút Nhận vào game và nút Xóa.
  - **Không còn VIP.** Mỗi vòng quay tối đa **40 lần**, admin chỉnh ở ô "Số lần quay / vòng". Đủ thì phải Làm mới. Trang hiện "vòng này còn X/40".
  - Có ô Tự động quay, mỗi lượt 3 vòng chậm dần, nghỉ 1,5 giây.
  - Cấu hình nằm ở `dbCache._vqCfg = {on, gia, max, pool}`. Người chơi: `u.vq = {luot, board, boardN, ruong, lich}`.
  - Code: `vongquay.js`, `webplay.js` (trang `pageVq`), `panel.js` (tab 🎁 Quà tặng, thẻ Vòng quay).
- **Hình vật phẩm game theo ID**: `itemicon.js` cùng `data/itemicons.json` (23.366 món), ảnh nằm ở `/opt/minigame/itemicon`. Công cụ dựng: `tools/icon-vat-pham/lam.js` trong repo game.
  - Dùng cho vòng quay, shop web, quà mỗi ngày, và ô xem trước trong admin (bảng Shop Item, Quà admin tặng).
  - Ảnh tự tải lên vẫn được ưu tiên.
- Tab 🎁 Quà tặng đã mở cho cổng mod. Riêng cấp lượt quay vẫn chỉ cổng SUPER.
- **Bẫy:** `minigame.service` có `After=tlbb.service`. Restart bot trong lúc game đang restart thì bot phải chờ game lên, nên mọi trang web sập 2–3 phút. Đã xảy ra 14:49–14:51. Trước khi restart bot, kiểm `systemctl list-jobs` phải trống.

### B. Game (repo này) — sổ shop chi tiết ở `docs/SHOP-TRONG-GAME.md`

| Việc | Commit | Tag quay lại |
|---|---|---|
| Shop 150 trả về ngọc cấp 4 như gốc | bd73440 | truoc-shop150-ngoc4-02-10 |
| Ngọc cấp 6 ở boss: Đế Thích Thiên dùng hộp 90031 (ngọc loại khác 50%) và 90032 (Băng/Hỏa/Huyền/Độc/Thể lực 20%). 11 boss bỏ hộp 50032 (ngọc giảm kháng) | 7e69269 | (xem commit) |
| Hậu Hoa Viên chỉ mở 22:00–23:59, nhánh `mo-server` sửa giống | 1308190 | truoc-hhv-22h-02-10 |
| Kệ 164 Yếu Quyết 80: làm trống | ab81ad4 | truoc-xoa-yq80-02-10 |
| Kệ 181 bỏ Chưởng Quỹ Yếu Quyết 30008053 | b039dbe | truoc-xoa-30008053-02-10 |
| Kệ 180 bỏ Canh Danh Thiếp và Chuyển Tính Đan | db37f51 | truoc-xoa-ke180-02-10 |
| Thần khí 42 bản 2.000 (kệ 136): 10 dòng cố định khi mua | 4f483fd | truoc-thankhi42-02-10 |
| Sách pet kệ 102/133/134 trả KNB (50k/20k/10k/5k). Shop BaBy kệ 270 tắt | 2cde507 | truoc-sachpet-shopbaby-02-10 |

Trang Bảng Rơi https://netco4.click/ đã dựng lại sau khi đổi tỉ lệ ngọc, bằng `node tools/bang-roi/lam.js` rồi chép `web/index.html` lên `/var/www/netco4/`.

### C. Kiến thức mới (dịch ngược Server.elf, World)

- **Dòng thuộc tính trang bị xanh / thần khí** (`ItemCreateRuler::CreateBlueEquipAttrib` + `CheckBlueEquipAttr`):
  - Thuộc tính số k (0..57) dùng 3 chỗ: trọng số ở `EquipBase` cột k+32 (-1 = tắt), giá trị gốc ở `ItemSegValue` cột k+1, hệ số ở `Server/Config/ItemSegRate` cột k+1.
  - Các cột khác của `EquipBase`: 90 quy tắc phẩm chất, 91 đoạn giá trị, 92/93 số dòng min/max (trần 16), 24 có tư chất, 94/95 tư chất, 25 có random cấp phẩm chất, 100 = T.
  - Giá trị = ceil(V × (Rate[cấp] + (Rate[cấp+1] − Rate[cấp]) × rand%100 × 0,01 / T) × 0,01). Nếu T ≤ 0 thì bỏ phần rand.
  - Quy tắc 1..8 luôn cho cấp phẩm chất cố định.
  - **Muốn set cứng dòng cho món nào:** thêm một đoạn mới vào `ItemSegValue` với V = round(muốn × 100 / Rate), giữ thứ tự ID tăng dần. Ví dụ là đoạn 4400.
- **Sinh sản trân thú** (NPC Vân Phi Phi, Tô Châu): thời gian = trung bình cột 49 `宠物繁殖时间(ms)` của 2 pet trong `PetAttrTable`. Bảng gốc đã là 1 ms cho mọi pet, nên không cần sửa. World đếm lùi, xong thì gửi thư, giữ chờ nhận 48 giờ.
- **PetAttrTable:** tư chất chuẩn ở cột 35–39 (Lực/Thể/Linh/Thân/Định). Tên tiếng Việt của pet lấy ở `MonsterAttrExTable` dòng cùng ID. Ví dụ Tam Long Thái Tử = 30400–30469.
- **Sách kỹ năng pet** = `PetSkillBook.txt` (30402xxx → mã kỹ năng). Loại chiêu ở `SkillTemplate_V1` cột 27: 0 chủ bấm, 1 pet tự đánh, 2 bị động.
- **Ngọc giảm kháng** = 4 dòng Minh Thạch 50x21xxx. Quái thường đặt trên bản đồ không rơi loại này. Chỉ còn ở:
  - Dã Trư và lính trộm Phượng Hoàng: cấp 4, 0,83%.
  - Gia Luật Hồng Cơ, trùm Huyết Chiến Nhạn Môn (script 391211): cấp 6, 3,75%.
  - 9 con mang hộp 50032 nhưng không có chỗ gọi ra.

### D. Còn chờ chủ server quyết

1. **Kệ 151** (ngọc cấp 6, KNB 10.000–30.000): bỏ trống hay giữ. Đổi ID về cấp 4 thì vô nghĩa, vì kệ 150 đã bán bằng Điểm Tặng.
2. **Kệ 31** (vàng): bỏ Chưởng Quỹ Yếu Quyết 30008053 (ô thứ 7) không.
3. **Gia Luật Hồng Cơ** có bỏ hộp 50032 không. Cần kiểm trước xem phó bản Huyết Chiến Nhạn Môn có vào được không.
4. Ngày mở server: mọi quyết định đã đủ (`docs/MO-SERVER.md` mục 2b). Chờ người dùng nói "làm".

### E. Chưa kiểm trong game (nên test tối nay)

- Mua 1 cây Thần khí 42 nội và 1 cây ngoại: đủ 10 dòng, đúng số.
- Kệ sách pet: trả KNB, đúng giá. Shop BaBy trống, mở ra không lỗi.
- Đế Thích Thiên rơi ngọc cấp 6 đúng tỉ lệ. Các boss khác không còn ngọc giảm kháng cấp 6.
- Vòng quay web: đếm 40 lần, Làm mới về 40, Tự động quay dừng đúng lúc.

### F. Quy tắc làm việc người dùng đã đặt

- Không restart game khi có người online, trừ khi người dùng nói "reset". Người dùng tự bấm reset trên trang GM.
- Luôn tạo git tag rollback trước khi sửa. Repo public: không commit secret.
- Khi người dùng chỉ hỏi ("check", "gửi list rồi chốt") thì trả lời và chờ, không tự sửa.
- Shop web do chủ server tự đặt: không đụng khi sửa shop game. Mọi sửa shop game ghi thêm vào `docs/SHOP-TRONG-GAME.md`.

## 02/10 16:20 - Mẫu đồ chế 8x/9x trên admin (tab 🛠️ GM → 🧵 Mẫu đồ chế 8x/9x, chỉ cổng SUPER)

**Cập nhật 16:45:**
- Bỏ vũ khí khỏi đồ chế, vì vũ khí đi đường thần khí. Còn 62 món.
- Thêm **108 Thái Cổ Thần Khí 9 sao**, lấy từ `x895111_TaiGu_shenqi` trong `MyLua/shenqinew/wuyazi85o.lua`.
- Tẩy bằng **Ma Huyết Thạch 30505813** ở Phượng Minh Trấn (tepp 20): script gọi `TryRecieveItem` tạo món mới cùng ID rồi chuyển ngọc và tên sang. Món mới đi qua hàm sinh dòng, nên ăn mẫu y như đồ chế.
- Thái Cổ có 17 hoặc 19 loại dòng, ra 11 dòng, quy tắc 9, T = -1. Vì vậy **số ra cố định**, ví dụ Ngoại công 2225, Chính xác 1433.
- Lưu ý: trong lúc áp mẫu, mọi cách tạo ra đúng ID đó cũng ăn mẫu, kể cả tẩy, tiến giai lên Thái Cổ và quà admin.

**Cập nhật 17:00:**
- Gộp các ID có dòng EquipBase giống hệt (khác mỗi cột 0 và 4) thành 1 dòng. Áp hoặc trả mẫu sẽ làm cho cả nhóm.
- Thái Cổ: 108 ID gộp thành 37 nhóm. Mỗi nhánh nâng cấp 6–7 sao cho 1 ID riêng, nhưng lên 8–9 sao thì dữ liệu như nhau. Ví dụ U Minh - Hút máu = 10303449/452/455, đến từ Thượng Cổ 10303431/434/437.
- `maudoche.json` lưu thêm `ids` cho mỗi mẫu.
- Mục này **ẩn ở cổng mod** (lớp `epOnly`). `/api/gm/doche` nằm trong `VIEWONLY_PATHS`.

**Cách dùng:**
1. Bấm 🔄 Tải rồi chọn món. Có 78 món chế cấp 80–99 lấy từ `ItemCompound`, xếp theo vị trí.
2. Tick dòng muốn có. Chỉ hiện những dòng món đó tự ra được, và số dòng không quá mức tối đa tự nhiên.
3. Chọn cấp phẩm chất 1–9 và tư chất. Bảng hiện khoảng số của từng dòng ở cấp đã chọn.
4. Bấm **Áp mẫu** (hoặc Áp + Restart), rồi restart. Chế và giám định.
5. Bấm **Trả mẫu** (hoặc Trả + Restart), rồi restart.

**Kết quả:** đúng dòng, đúng số dòng, đúng cấp. Số mỗi dòng ngẫu nhiên trong khoảng của cấp đó, chốt lúc chế.
- Trả mẫu không làm đổi số. Lý do: mẫu không đụng cột 91 (đoạn giá trị) và cột 100 (T). Server tính lại số mỗi lần nhân vật vào game, từ `ItemSegValue[cột 91]`, cấp và số rand đã lưu trên món.
- Trong lúc mẫu đang áp, **ai chế món đó cũng ra y hệt**. Trang admin hiện khung đỏ "Đang áp N mẫu".

**Kỹ thuật:**
- Code: `panel/maudoche.py`. Có thể chạy `python3 panel/maudoche.py --xem [ID]` để xem.
- `panel.py` có act `doche_ap` / `doche_tra` và `GET /api/doche`. Bot dùng `/api/gm/doche` và tab GM trong `panel.js`.
- Mẫu đang áp lưu ở `Server/txt/NetCo4Cfg/maudoche.json`, ngoài repo.
- `cap-nhat.sh` gọi `--ap-lai` sau rsync, vì rsync ghi đè EquipBase bằng bản repo.
- Đã thử trên bản sao: áp rồi trả cho ra file giống hệt gốc từng byte.

**Chưa thử trong game.** Lần đầu nên chế 1 món xem đúng dòng không.

Rollback: tag `truoc-maudoche-02-10`.

## 02/10 21:55 - Thiếu Thất Sơn: Trang Tụ Hiền (boss 2, sau Cưu Ma Trí) hồi đầy máu mãi → sửa (Lua, hiệu lực ngay)
- Người chơi gọi là "Tứ Tuyệt Trang" nhưng phó bản có Cưu Ma Trí là **Thiếu Thất Sơn** (script `890063` = `event/shaoshishan/epiaomiaofeng.lua`; `event/shaoshi/` là bản chép không đăng ký). Thứ tự: Cưu Ma Trí 14249 → **Trang Tụ Hiền 14244** (`ai_sangtugong.lua` 890065) → Mộ Dung Phục 14239 → Diêu Bá Đương 14224 + Tư Mã Lâm 14229 → Đinh Xuân Thu 14234.
- **Nguyên nhân:** Trang Tụ Hiền mỗi lần xuống dưới 80/60/40/20% máu thì "độn thổ" và tự nhận 2 buff "Xuất thổ văn vật". Bản gốc là `10237`/`10238` + `10239`–`10242` (miễn mọi sát thương trừ 1 loại ngoại/nội công và 1 hệ). Server cũ thay **cả 6 bằng `6446` = 灵芝九转 hồi 50% máu** → mỗi lần độn thổ hồi 2 × 50% = đầy máu; phải gây ~300% máu mới chết, ra khỏi giao tranh là đặt lại từ đầu.
- **Sửa:** chú thích 2 dòng gắn buff trong `x890065_SkillLogicA_TunDun` (vẫn độn thổ + gọi Cương thi). Không khôi phục buff miễn sát thương gốc (tổ nhỏ phải đổi loại sát thương liên tục) — muốn thì đổi 2 dòng bảng `x890065_SkillC_ChutuBuff1/2` về `{10237,10238}` / `{10239,10240,10241,10242}` và bỏ chú thích. Rollback: tag `truoc-fix-trangtuhien-03-10` (tên tag và chú thích `[NetCo4 03/10]` trong code ghi nhầm ngày, thật là 02/10 21:55).
- **Đã soát cả phó bản:** 6 script AI và 7 script NPC đủ hàm (không bị cắt cụt), 6 boss đều có dòng rơi (Mv 60). Còn 1 chỗ server cũ đổi: cặp Diêu Bá Đương / Tư Mã Lâm khi vào cuồng bạo (con kia chết) bản gốc nhận `10253` +150% sát thương và `10254` +150% tốc chạy, ở đây đổi thành `6781` hồi 30% máu × 2 (hồi 60% **một lần**). Không chặn phó bản, chưa đổi, chờ chủ server quyết.
- Môi trường máy nhà (phiên 02/10 tối): `ssh`/`awk`/`iconv` trong Git Bash bị chặn (mã 127 / Permission denied); SSH dùng `C:\Windows\System32\OpenSSH\ssh.exe` qua `cmd /c "... bash -s < script.sh"`, giải mã GBK bằng node `TextDecoder('gbk')`.

## 02/10 tối - Q Lâu Lan (Viêm Ma Sơn) + Q Tô Châu: đội toàn cấp 119 vào phó bản không ra quái → sửa (Lua, hiệu lực ngay)
> **ĐÍNH CHÍNH (02/10 khuya, sau khi soát binary):** chẩn đoán dưới đây SAI cho 2 phó bản này. `LuaFnSetCopySceneData_Param` lưu **số nguyên** (`Scene::SetCopySceneData_Param(unsigned int, int)`), nên 11.9 lưu vào Param 13 rồi đọc lại ra 11. Trước khi sửa, đội 119 vẫn ra quái, chênh cấp = 0. Bản sửa không hại gì, chỉ tăng chênh lên 9: quái Q Tô Châu cấp 119, Q Lâu Lan cấp ~104, nên đỡ bị trừ rơi đồ vì chênh cấp. Lỗi 119 **thật** chỉ xảy ra khi số lẻ được dùng thẳng làm chỉ số bảng Lua (Túc Cầu, Lâu Lan Tầm Bảo), hoặc khi ghép vào tên file `_monster_119.ini`, file này không tồn tại (xem mục soát 02/10 khuya). Việt hóa và túi boss ở dưới vẫn đúng.
- **Nguyên nhân:** khi cấp bình quân đội ≥ cấp tối đa (119), script gán `iniLevel = PlayerMaxLevel` = 119 rồi lưu `119/10 = 11.9` làm bậc quái; bảng ID quái tra `[5.9]` (Lâu Lan, trừ 6) / `[11.9]` (Tô Châu) = nil → `return`, không spawn gì, không ghi `luaerror.log`. Chỉ dính khi **mọi** thành viên đều 119 (có 1 người ≤118 là chạy). Server có 9/12 nhân vật 119. Cùng loại lỗi với Túc Cầu, nhưng lần quét trước chỉ tìm `PlayerMaxLevel/10` viết thẳng nên lọt mẫu đi vòng qua biến `iniLevel`.
- **Sửa:** `iniLevel = floor( PlayerMaxLevel/10 ) * 10` ở `event/xunhuan/xinsanhuan_1.lua` (050220, Q Lâu Lan) và `boundary_between_song_and_liao.lua` (050100, Q Tô Châu ải Tống Liêu biên cảnh). Đội 119 nay = bậc 110 + chênh 9 cấp: Q Tô Châu quái cấp 119; Q Lâu Lan quái cấp ~104 (bảng quái Lâu Lan bước 5 cấp nhưng script chia bậc 10 cấp → thấp hơn người chơi ~15 cấp, là thiết kế gốc; rơi/kinh nghiệm ×0.9).
- **Việt hóa 10 thông báo** trong `yamoshannpc_die.lua` (1129): chỉ đường sang ải 2 (57,81), Vương Diêm xuất hiện (90,183), 5 đợt boss ải 2, sang ải 3 (210,40), nhiệm vụ hoàn thành, "Đã giết X: n/m". Câu "Cấp chưa đủ 30" → 75.
- **Túi boss Q Lâu Lan** chuyển từ Hồng Kích Yêu Vương 13220–13229 (cuối **ải 2**, qua ải 2 bỏ về vẫn có túi) sang **Hỏa Diễm Yêu Ma 13260–13269** (boss cuối ải 3): `roimap.lua` + bot `tuiboss.js` `gan('qll', ...)`.
- **Đã soát, không lỗi:** đủ hàm, 8 AI boss (262–269) chỉ có chiêu đánh (không có buff hồi máu cài lén), chuỗi đếm quái 3 ải đúng, 5 lần/ngày, mọi ID quái có dòng rơi, trả nhiệm vụ không thưởng là đúng bản gốc (thưởng ở đồ rơi).
- Rollback: tag `truoc-fix-lltb-119-02-10` (game). **Chưa thử trong game.**
- Đã deploy 22:15 (cap-nhat, không restart game). Bot: `tuiboss.js` chép lên `/opt/minigame/BotDoMin` (bản cũ `/opt/tlbb-backup/tuiboss.js.truoc-0210-lltb`), restart `minigame`.

## 02/10 tối - Quân Thiên Vương Lăng (NPC Tiêu Lăng, Phượng Minh Trấn 289,67) "Phụ bản tạm đóng để sửa chữa" — mới tìm hiểu, CHƯA mở
- NPC `900069` `MyNew/CSWL/ofengming_xiaoling.lua` → sự kiện `900070` `MyNew/CSWL/efuben_wangling.lua`. Đóng = `OnEnumerate` in câu "tạm đóng" và **chú thích dòng `AddNumText(... "Quân Vương Thiên Lăng",10,-1)`** (dòng 107). Mở = bỏ chú thích 1 dòng (Lua, không cần restart).
- Lối chơi: 9 Long Trụ (15300–15303, luôn cấp 118) lưới 3×3; trụ nhóm 2 = "long mạch" (đủ 3 → xóa hết trụ, ra boss Thủ Lăng Giám 15344–15347 ở 48,48), trụ nhóm 3 = gọi 10 quái + mọi trụ miễn dịch 30 giây (32696). Boss chết: mỗi người 1 Bảo Tàng Mật Thược 38000126 → mở 1 trong 8 Kim Bảo Rương (900071 `wanglingbox.lua`) ra **nguyên liệu Long Văn** (Long Văn +1/+2/+3, Câu Thiên Thải, Chuế Long Thạch, Chú Văn Ngọc, Tịnh Vân Thủy, Ngọc Long Tủy). 3 lượt/ngày (MD 288), trưởng nhóm ≥75, mọi người ≥85, tổ đội ≥1.
- Server đủ: map `chengshiwangling.nav/.scn/.path` (scene553, clientres 579), quái + AI 253/167/180/185/189, hằng số, script 890536/200060/900071.
- **Rủi ro chính — map client:** `Scene.axp` của client chỉ có 4 ảnh bản đồ nhỏ `chengshiwangling_*.dds`, **không có** `.Scene/.Terrain/.GridInfo/.Heightmap`; nhưng có đủ bộ **`fengmingwangling_new`** (không có trên server). Bảng định nghĩa map của client bị nén, chưa đọc được clientres 579 = map nào. Nghi server cũ đóng vì lệch map client/server. Chỉ thử trong game mới chắc.
- Lỗi script thấy khi đọc: (1) rương: số ngẫu nhiên 500–700 (~20%) → 5 món nhưng `nItemId_3` = nil → mất chìa, không ra đồ (nghi); (2) loa "X đã mang đội tiến vào Quân Vương Lăng" phát **trước** khi kiểm điều kiện; (3) câu "cần ít nhất 3 người" nhưng `g_LimitMembers = 1`; (4) nhánh hết lượt gọi `DispatchEventList(..., targetId)` với `targetId` không tồn tại; (5) `Paopao` gọi với `strMonsterName` nil (sau khi đã tạo boss).

## 02/10 khuya - Tam Thần Ảo Cảnh: sửa (Lua, hiệu lực ngay, deploy 22:37, không restart) — tag `truoc-fix-tamthan-02-10`, commit `9cfac2b`
- **Rương Nhân đòi Côn Ngô Tiên Thược (100.000 KNB)**, trong khi chữ của chính rương ghi "không cần chìa". Đã bỏ yêu cầu chìa (`yehuo.lua` 894007). Thiết kế: mỗi nhân vật mỗi ngày mở **1 trong 3 rương**. Thiên cần Tiên Thược, Địa cần Bí Thược, Nhân miễn phí. Thưởng rương Nhân: 10× món a + 1 món b + 1 phiếu (1.000/2.000/5.000, trung bình khoảng 3.600 KNB).
- **Cờ "đã mở rương hôm nay"** trước dùng `VIP_SHENMI_SHOP` (ô 426), ô này dùng chung với đoạn "reset vip" trong `scene.lua`. Hậu quả: đăng nhập lại là mở được tiếp, đồng thời reset `CHONG_ZHI_YILINGQI`. Nay ghi vào ô đếm lượt của chính Tam Thần `SANSHENHUANJING_COUNT` (294): +50 = đã mở. `efuben_sanshen.lua` đếm lượt bằng `mod(..., 50)`.
- **Giới hạn 5 lượt/ngày không chặn:** điều kiện cũ là `nHumanNum >= 5`, tức phải ≥5 người cùng hết lượt mới bị chặn. Nay có 1 người hết lượt là chặn.
- KickOut đọc tọa độ ở Param 4/5 (cũ đọc Param 41/161). Bảng chặn gọi 2 boss cùng lúc nay là 3 boss Tam Thần (cũ là ID boss PMF).
- `boss3.lua`: tắt loa "rơi Trùng Lâu" giả (dòng rơi thật đã bị chú thích; boss1/boss2 đã tắt loa này sẵn).
- Chữ: client **cắt mỗi chuỗi đúng 255 byte** (câu NPC cũ dài 455 byte, hiện tới "mở ra chữ th"). Đã viết lại toàn bộ chữ của NPC ngoài, 3 Thương Lăng Tử trong phó bản và rương, mỗi chuỗi dưới 255 byte.
- **Chưa thử trong game.** Còn lại: boss dùng AI 242 hồi 50% một lần (xem mục dưới).

## 02/10 khuya - SOÁT TOÀN BỘ 17 PHÓ BẢN (chỉ đọc) → `docs/BOSS-PHO-BAN.md`
- Sổ tra cứu mới `docs/BOSS-PHO-BAN.md`: quy trình khi có báo lỗi, các loại lỗi đã gặp, hồ sơ từng phó bản (NPC, script, boss, túi, đã sửa, còn mở), công cụ `tools/soat-boss/`.
- Danh sách lỗi **chờ chủ server duyệt** nằm ở mục "Còn mở" của từng phó bản. Nặng nhất:
  - các vòng farm phiếu: song sinh và phân thân Liên Thành ở Binh Thánh, 2 Đại Lễ Bao ở PMF, Tiêu Phong 45410 ở Nhạn Môn;
  - đội toàn 119 không vào được Kỳ Cuộc / sư môn / Thủy Lao… vì thiếu file `_monster_119.ini`;
  - Bàng Xí ở Tứ Tuyệt lỗi `buffTbl` mỗi giây;
  - AI 242 hồi 50% máu.
- Phát hiện hệ thống (ngoài phó bản):
  - `scene.lua` `x888888_OnScenePlayerLogin`: đoạn "reset vip" `return` khi ô 426 == 1, nên từ lần đăng nhập thứ 2 trở đi **bỏ qua toàn bộ phần sau**. Bị bỏ: NotifyMailOnLogin, ShuaXinMiJi 890099, SkillCheck, InitRelation, HolidayCheck, AddXiaYinBuff, công thức chế tạo…
  - Loa hẹn giờ 100121 `MyNew/zhaohuan/yannan.lua` phát quảng cáo của server cũ: "khuyến mãi nạp thẻ Zing 50%" (lỗi `format` vì `50%`, chiếm 414 dòng log) và "Chào mừng đến Hồi Ức Thiên Long" ở phút 25/45. Ngoài ra 5 câu chào mừng / hướng dẫn dài hơn 255 byte.
  - 6 script boss thế giới 100125–100130 (`MyNew/zhaohuan/<map>.lua`): `Script.dat` trỏ tên không có số `1`, còn file thật có `1`, nên không bao giờ nạp được (khoảng 58 dòng log mỗi file). Nạp được thì vẫn hỏng: đợi `sceneId==508` nhưng bảng boss khai báo ở `[489]`, chữ tiếng Trung. Đây là gói làm dở của server cũ, cần làm thành dự án riêng.
  - CLAUDE.md ghi Sát Tinh "chỉ Võ Tòng 13537 có phiếu", nhưng dữ liệu hiện tại có 90001 ở cả 11 DataID.

## 02/10 23:00 - Mở thử Phụng Minh (Quân Thiên) Vương Lăng (Lua, deploy 23:01, không restart) — tag `truoc-mo-vuonglang-02-10`, commit `d2477aa`
- `efuben_wangling.lua` 900070: bỏ chú thích nút "Vào Quân Thiên Vương Lăng", bỏ câu "tạm đóng", ghi rõ điều kiện (không cần lệnh bài; tổ đội 1 người cũng được; trưởng đội ≥75, mọi người ≥85; 3 lượt/ngày). Loa "đã mang đội tiến vào" giờ chỉ phát khi vào được. Viết lại chữ lỗi "d?i ngu", bỏ `targetId` nil, Paopao dùng đúng tên boss.
- `wanglingbox.lua` 900071: rương nhận số ngẫu nhiên 401–700 (**30%** số lần mở, không phải 20% như đánh giá trước) thì báo 5 món nhưng món thứ 2 là nil. Nay gom các món đã bốc rồi mới bỏ vào rương.
- **ĐANG CHỜ THỬ** bằng bia1 (tổ 1 người): map hiện đúng không (client chỉ có `fengmingwangling_new`, không có `chengshiwangling`), đi tới tế đàn (48,48) được không, 9 Long Trụ có ra không. Hỏng thì chú thích lại dòng 107.

## 02/10 23:04 - Ác Bá đánh lén môn phái: đội toàn cấp 119 không vào được → sửa (Lua, không restart) — tag `truoc-fix-acba-02-10`, commit `ce1f676`
- Người chơi báo (Tiêu Dao): Ác Bá xuất hiện ở môn phái theo giờ, bấm vào nhưng không được đưa vào. **Bằng chứng trên VPS:** `Server/Log/assert_2026-10-02.log` lúc 22:30:22 ghi `MonsterManager::LoadMonster: read info::monstercount failed`, ngay sau khi Debug log ghi `Load ../Public/Scene/xiaoyao_1.nav` (scene 36). Sau đó `Scene::Load` trả FALSE.
- Nguyên nhân: `event/huodong/eTouximenpai_NPC_<phái>.lua` (808016–808044, cả 12 phái) gán `iniLevel = PlayerMaxLevel` = 119, rồi nạp `<map>_monster_119.ini`. Trên server chỉ có `_10 … _200` theo bước 10, nên phó bản không tạo được. Lần bấm hỏng còn **xóa NPC Ác Bá** (`LuaFnDeleteMonster`), nên phải chờ lượt sinh sau.
- Sửa: `iniLevel = floor( PlayerMaxLevel/10 ) * 10`. Riêng Thiếu Lâm chặn trần 100, vì chỉ có `shaolin_1_monster_10 … _100`: đội cấp 110–118 trước đây cũng không vào được.
- Lịch Ác Bá (`Public/Config/ActivityNotice.txt`, script 808015, đơn vị 15 phút): 00:00, 04:00, 10:00, 12:00, 16:00, 20:00, 22:00. **Chưa thử lại trong game.**
- Cùng lỗi này còn ở khoảng 30 script khác (Kỳ Cuộc 401001/401002, sư môn `shimen_0901`, Thủy Lao, nhiệm vụ thành thị `ecity_*`…). Đang chờ chủ server duyệt (mục 5 trong danh sách soát 02/10). **Ngày mở đặt trần cấp 89 cũng sẽ dính**, vì không có file `_89.ini`.

## 02/10 23:08–23:36 - Vương Lăng kẹt nhân vật → ĐÓNG; đợt sửa lớn theo danh sách đã duyệt
- **Vương Lăng:** nhân vật **Hoang** (1010100004) vào lúc 23:08:26. Client không có map, nên mất kết nối. Mỗi lần đăng nhập lại (23:10, 23:11) server lại đưa vào scene 36 (phó bản vẫn mở vì bia1 và EmVinh còn bên trong).
  - Đã đóng lại (commit `ffa20f7`): ẩn nút, chặn tạo phó bản; OnPlayerEnter / OnCopySceneTimer đẩy người ra.
  - **Phát hiện:** phó bản đang chạy KHÔNG nhận code Lua mới (sau 2 phút, timer mới vẫn chưa chạy). "Lua hiệu lực ngay" chỉ đúng cho lượt gọi mới. Đã sửa `docs/BOSS-PHO-BAN.md`.
  - Cách gỡ Hoang: bia1 ra lúc 23:30, phó bản tự đóng sau 300 giây. Hoang đăng nhập sau đó sẽ về `bkscene` 580 (286,64). **Chưa xác nhận Hoang đã ra.**
- **Đợt sửa 23:36** (tag `truoc-dot-sua-02-10b`, 5 commit `903f7bf`…`2367712`, 74 file, kiểm cú pháp bằng luaparse cả 73 file Lua): xem đầu mục 3 của `docs/BOSS-PHO-BAN.md`.
  - **CHƯA restart:** đổi `MonsterDropBoxs.txt` (song sinh, phân thân Liên Thành) chỉ có hiệu lực sau restart. Lúc deploy có 3 người online.
  - Bot `tuiboss.js`: `gan('btkt', [15190, 15073])`, đã restart minigame.
- **Đính chính:** loa "Zing 50%" / "Hồi Ức Thiên Long" ở `yannan.lua` vốn đã tắt từ đợt dọn dẹp (`--[don-dep]`), người chơi chưa từng thấy. Chỉ có dòng `format(... 50% ...)` vẫn chạy và báo lỗi. Đã chú thích 6 dòng đó.
- **Chờ chủ server trả lời:** Sát Tinh hiện đúng 1 phiếu/người/boss (Mv 60 = BV 60), tức 12 phiếu/người/lượt. Câu "hạ xuống mỗi boss chỉ 1 phiếu" có thể hiểu là cả đội 1 phiếu: bảng rơi không làm được vì mỗi người roll riêng.
- **Rủi ro ngày mở:** nhiều họ `*_20monster` (nhánh sư môn thêm kinh nghiệm) chỉ có file từ `_40`. Người chơi dưới cấp 40 đi nhánh này có thể không vào được (chưa kiểm).

## 03/10 00:02 - Long Văn +1/+2/+3 từ game ra 🧰 Rương Ích Kỷ (web) — game `9bfda46` (tag `truoc-longvan-ruong-03-10`), bot bialk `53df579`
- Lý do: người chơi không giao dịch / bày sạp được Long Văn. Client tự chặn theo bảng vật phẩm riêng, đã mã hóa trong `Bin/ccore.dat`, nên không sửa được bằng server. Đổi `EquipBase.txt` 10157001 sang quy tắc 1 (`0d87b48`) không có tác dụng với client, vẫn để nguyên (vô hại: món tạo mới có `Bind=0`).
- **Game:** NPC Ví Web (999999 `CDK/CDK.lua`) thêm ô cuối "Chuyển Long Văn ra Rương Ích Kỷ (web)".
  - Bấm vào: hiện số Long Văn trong túi kèm cảnh báo. **Long Văn đã nâng sao / chuế thuộc tính sẽ mất phần nâng cấp**, vì web chỉ lưu mã ID.
  - Đồng ý: xóa **từng món** trong túi (món đang mặc không tính), rồi ghi phiếu `Server/txt/NetCo4Web/outlv/<GUID>_<giờ>_<số>.txt`, mỗi dòng `"<GUID> <ID> <số>"`, dòng cuối `END`. Ghi phiếu lỗi thì trả lại món.
- **Bot:** `tlbb.readLvReceipts` đọc phiếu mỗi 5 giây.
  - Chỉ nhận phiếu đúng 3 ID, đúng GUID trong tên file, có END. Chống cộng trùng bằng `_tlbbLvSeen`, ghi trước khi chuyển phiếu sang `outlv/xong/`.
  - Cộng vào `ichKy.items`, ghi sổ "🎮 Gửi từ game (Ví Web)". GUID chưa liên kết ví thì giữ phiếu và ghi log ADMIN.
  - Long Văn **giữ qua đêm** (`ICHKY_GIU`), các món khác vẫn xóa lúc 00:00. Web hiện "🔒 giữ qua đêm (từ game)".
  - Rút về game (cần online + liên kết tên nhân vật) và tặng người khác dùng đúng nút cũ của Rương Ích Kỷ.
- **Chưa thử trong game.** Bản cũ của bot: `/opt/tlbb-backup/bot-truoc-longvan-0310/`.
- **03/10 00:20 (bot `ca87451`, `54311dd`):**
  - Long Văn rút về game tối đa 10 cái/lần (chặn ở server + web).
  - **Rương Ích Kỷ giữ vĩnh viễn, không giới hạn số món** (chủ server chốt). Bỏ xóa lúc 00:00 cho mọi món; vẫn giữ giới hạn mua vào rương 100 món/ngày và tặng 100 món/lần.
  - Icon game cho món không có ảnh shop (`itemicon.js`).
  - Sao lưu trước khi đổi: `/opt/tlbb-backup/database.json.truoc-ruong-vinhvien-0310`.
