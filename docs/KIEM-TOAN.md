# Kiểm toán bản public (28/09/2026)

Bộ source gốc là bản leak của server "Tân Thần Long" (admin cũ ký tên "Sun 0411", "Nguyễn Vinh"). Dưới đây là những gì đã tìm thấy và đã xử lý. Tất cả được làm bằng `deploy/02-don-dep.sh` và `deploy/04-doi-ten.sh`. File gốc được giữ trên VPS với đuôi `.goc`.

## Đã vá trong script

| File | Vấn đề | Cách vá |
|---|---|---|
| `obj/loulangucheng/oloulan_malan.lua` (NPC 001113) | 8888: 300.000 Điểm Tặng mỗi lần bấm, không giới hạn. 8889: 1 tỷ vàng cho 1 GUID cũ, lộ IP/MAC. Handler ẩn 7777 (1 tỷ vàng + 1 triệu KNB), 30000, 4444, 9999, 6666, 5555 | Chèn dòng chặn sau `local key`: chỉ cho 8887 (quà tân thủ, lên cấp 99), 15000 (buff), 30030. Ẩn menu 8888/8889 |
| `obj/qianzhuang/oqianzhuang_yuanbao.lua` (181000) | Lô đề: số trúng viết cứng lô=55, đề=56, trả x3.3/x70 KNB. Đổi thẻ cào thu vàng không trả gì | Kết quả = `{}`. Chặn `TuiBing_A` nhánh `idx` 31/9999 (các nhánh 40/50/60/70 là Chợ Thế Giới, vẫn giữ). Chặn key 19/190-192 |
| `CDK/CDK.lua` (999999) | ~2.000 mã VIP (50k KNB/mã) và 19.901 mã chia sẻ đã lộ. Mã tân thủ nhận mọi input vì file bị đặt sai tên (`TanThu.txt.txt`). `XuKaJiHuo1/2/3` client gọi thẳng được | Tắt cả NPC và 3 hàm (`if 1 then return end`). Làm rỗng mọi file mã `CDK/*.txt` |
| `MyNew/doidanhhieu.lua`, `obj/commonitem/speaker.lua`, `oloulan_malan.lua` | Quyền/danh hiệu/cấm loa gắn cứng theo GUID nhân vật của server cũ, sẽ trùng GUID nhân vật mới | `strGUID == <số>` → `strGUID == -1` |
| `obj/luoyang/oluoyang_longbatian.lua` | Handler ẩn 111: buff tàng hình GM | `-111` |
| `obj/luoyang/oluoyang_qiaofusheng.lua` | Handler ẩn 99 | `-99` |
| `MyNew/jiarumenpai.lua` (990010) | Handler ẩn 916: +10.000 điểm tiềm năng, không giới hạn | `-916` |
| `event/xunhuan/shuilao_12.lua` | Thủy Lao cấm đội có ≥3 người cùng IP (bạn bè chơi chung nhà) | 3 → 99 |
| `Server/Config/NotifyOnline.txt` + 16 file khác | Link và tên server cũ | → `NetCo4` |

Còn giữ, chưa xử lý: quà Tân Thủ 8887 (lên thẳng cấp 99, giới hạn 100 người); `phieuvan/TaiXiu.lua` và `Tomcua.lua` quảng cáo tỉ lệ 50:50 nhưng thật ra chỉ 30%/10% (chỉ để đốt vàng); `event/misc/couplequestion.lua` bắt vợ chồng khác MAC.
Code chết (không đăng ký trong `Script.dat`, không chạy được): `MyLua/Jiarumenpai.lua` (GM cho GUID 1010000001/2), `event/misc/danhhieu.lua`, `obj/dali/odali_freshbird.lua`, `new/00jianceChongBUG.lua`. Đừng đăng ký lại các file này.

## Dữ liệu và bảo mật

- Database: đã xóa 11 nhân vật, 3 tài khoản, bang, thư, pet. Bản trước khi dọn: `/opt/tlbb-backup/db-TRUOC-KHI-DON.sql.gz`.
- File trạng thái: đã xóa log IP thật của người chơi cũ (1.151 dòng), bảng xếp hạng, danh nhân đường, điểm danh theo GUID, log nạp tiền.
- MySQL: xóa user `root`/`tlbb`/`tlbbtools`/`bill` mở cho `192.168.1.%`. Chỉ còn `root` và `tlbb` nghe `localhost`/`127.0.0.1`, mật khẩu mới.
- Billing: `auto_reg=false`, chỉ nghe `127.0.0.1`.
- Đã xóa: 2 script quét cổng (`ip.sh`, `IP.sh`, `a.sh`), billing cũ `Server/Billing` (chứa mật khẩu root của admin cũ), `billing.exe`.

## Rủi ro còn lại

- Không rà soát tay hết 5.800 file Lua. Có thể còn handler ẩn, nhưng chỉ gọi được bằng cách sửa gói tin gửi từ client.
- Binary server không có source.
- Client: Windows Defender báo `Bin/RSSParser.dll` là `Trojan:Win32/Occamy!rfn` và `Bin/UpFile.exe` là `Trojan:Win32/Wacatac.H!ml`. `UpFile.exe` đã bỏ khỏi gói client. `RSSParser.dll` bắt buộc phải có để chạy game, người dùng tự quyết thêm ngoại lệ. Chưa có kết quả VirusTotal (SHA256 `1b19cdb793f4b6a840e080b1bdcb660f0ce7274b835d9b68db0f190cc5d0577c`).
- Launcher client từng tự tải bản vá từ `hoiucthienlong.com` (tên miền cũ, có thể bị người khác mua lại). Đã tắt trong `Patch/patchinfo.txt`.
