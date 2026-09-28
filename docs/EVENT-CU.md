# Event và chức năng bản public để lại

Rà soát 28/09/2026 (chỉ đọc code, chưa thử hết trong game). S = `server/Public/Data/Script`, AF = `server/Server/Config/AllowableScriptFunc.txt` (hàm client được phép gọi thẳng).

## Đã sửa ngày 28/09

| Việc | File | Chi tiết |
|---|---|---|
| **Lỗ hổng tự phát đồ** | `S/MyNew/item/XieziQuickly.lua` (070051, có trong AF) | Nhánh `xieziA == 9997` tạo **vật phẩm ID bất kỳ**, nhánh `9998` dịch chuyển tới **bản đồ bất kỳ**, không kiểm tra GM. Đã đổi thành `-9997`/`-9998` (không bao giờ khớp) |
| **Vòng quay may mắn** | `S/event/prize/CJHDs.lua` (890097, AF `GetItemHCJ`) | Bản cũ: client tự gửi `biaoji` nên tự chọn được món, gửi `checknum=0` thì nhận lại vô hạn. **Viết lại:** quay (index 1) tốn 1 Hạnh Vận Quả `30070501`, server tự chọn theo bảng `x890097_g_Pool` và phát ngay. Index 2 và 3 bị bỏ qua. Giao diện vẫn quay, nhưng ô hiển thị chỉ là ngẫu nhiên; món thật báo bằng thông báo |
| **Điểm danh tháng** | `S/MyNew/item/XieziQianDao.lua` (070053) | Code đầy đủ nhưng chưa đăng ký. Đã thêm `070053=` vào `Script.dat`, thêm 6 hàm vào AF (dòng 245–250): `QianDaoOpen`, `QianDaoWrite`, `QianDaoReWrite`, `QianDaoGetGift`, `WeekOpenGift`, `WeekBuyGift`. Có sẵn kiểm tra "hôm nay đã điểm danh", quà theo mỗi 5 ngày. **Chưa thử trong game** |
| **Cửa sổ "Nạp lần đầu" khi đăng nhập** | `S/MyNew/item/XieziQuickly.lua` (nhánh 8008) → `holiday.lua` `FirstMoney` | Hiện với mọi người cấp ≥10 chưa nạp (tức là tất cả, mãi mãi), nút "Nạp Ngay" mở web cũ. Đã comment dòng gọi `FirstMoney`. Nội dung cửa sổ nằm trong client (`FirstMoney.lua` phía client) nên không đổi thành cửa sổ chọn quà được |
| **VIP do admin cấp** | `S/NetCo4/quatang.lua` + panel | Lệnh hàng đợi `vip <0-10>` → `SetMissionData(CHONG_ZHI_CHONGSHU)`. Panel có ô "Cấp VIP (0-10)" |

## VIP: cách hoạt động

- Cấp VIP = biến nhân vật `CHONG_ZHI_CHONGSHU` (398). Bản gốc chỉ tăng khi **nạp tiền** (`eprize.lua` `BuyRet`), server này không có nạp, nên chỉ admin cấp được.
- Phúc lợi: `S/event/prize/shengjjll.lua` (890096) `GetGiftsForLevelUp` index 20–37. **VIP ≥1** mở chức năng (index 20–21: Tiểu Lạt Bá...), **VIP ≥2** mở quà hằng ngày: Công Lực Đan `39999901`, Chân Nguyên Tinh Phách `38000397`, Phục Hi Ngọc `38002049`, Mệnh Hồn Ngọc `38002041`, Ngưng Tức Hoàn, Kim Tàm Ti... Số lượng = (VIP − 1) × hệ số, nên VIP càng cao càng nhiều quà. Code không đặt giới hạn trên, panel giới hạn 10.
- Theo agent rà soát (chưa tự xác minh): còn đục 4 lỗ toàn bộ trang bị, kho đồ từ xa, các giao diện cường hóa.
- `scene.lua` `OnScenePlayerLogin`: ở **lần đăng nhập đầu tiên** của nhân vật, nếu VIP > 5 thì hạ xuống 5 (sau đó không kiểm tra nữa).
- **Quà thăng cấp (index 1–16) KHÔNG cần VIP.** Cần cấp ≥105 và nhận lần lượt từng mốc (`SHENG_JIJIANGLI`). Tổng khoảng 29.000 KNB kèm đồ khóa.

## Bảng xếp hạng (`S/event/prize/shengjjll.lua`, index 20–25 mở tab, 40 nhận thưởng)

Thưởng chỉ là **danh hiệu + buff 24h**. Nhận lại được mỗi 24h (khi buff hết). So khớp theo **tên** nhân vật. File điểm lưu ở `Server/Config/Paiming/*.txt`.

| Tab | File / tính điểm theo | Tình trạng |
|---|---|---|
| Top Level | `dengji.txt`, `scene.lua` `OnSceneHumanLevelUp`, cấp ≥80 | Chạy được. Lỗi: chỉ cập nhật ở cấp có thư hệ thống (lệnh gọi nằm trong vòng lặp gửi thư) |
| Top Tài Phú | `chongzi.txt`, chỉ ghi khi nạp | **Chết** (không có nạp) |
| Top Tiểu Lạt Bá | `laba.txt`, mỗi lần dùng loa, ≥10 lần | Chạy được |
| Top Tặng/Thu Hoa | `songhua.txt`/`shouhua.txt`, ≥10 lần | Chạy được |
| Top Sát Khí | `sharen.txt`, giết người chơi cấp ≥85 ở bản đồ thường | Chạy được |

## Icon trên cùng màn hình (việc ghép icon với script là suy luận, giao diện client bị khóa)

| Icon | Script | Tình trạng |
|---|---|---|
| Đặc Quyền VIP | 890096 `GetGiftsForUI(14)` | Chạy khi admin cấp VIP (xem trên) |
| Càn quét phó bản | 890096 `GetGiftsForUI(10/41)` | **Hỏng**: `FUBEN_SDDS` không được cộng ở đâu, không có code càn quét |
| Điểm danh tháng | 070053 | Đã bật 28/09 (chưa thử) |
| Đón Năm Mới | 888903 `holiday.lua` | 17 ngày lễ cố định (ngày âm lịch ghi cứng theo năm cũ), túi Tử Ngọc/Tổ Mẫu Lục cấp 5 |
| Tu La Nữ Thần, Phục Cổ, Tình Cô Nhân, Đặc Sắc | không tìm thấy phía server | Nhiều khả năng là icon trống |

## Sự kiện khác

| Sự kiện | File / ID | Ghi chú |
|---|---|---|
| Quà thăng cấp | 890096 index 1–16 | Cấp ≥105, nhận tuần tự, khoảng 29.000 KNB |
| Cầu phúc EXP | 890096 index 30 | 1000 KNB đổi EXP, tối đa 3 lần/ngày |
| Quà online | `New/TakeGift.lua` 889103 | 10 mốc phút online |
| Quà hoạt động | `event/prize/hyzda.lua` 890536 | Mốc 1/50/150/450 điểm mỗi ngày |
| Đạt nhân | `MyNew/item/XieziNewServer.lua` 070052 | `DaRenGift(1)` 1 lần. QiLinGift đòi 200 ô trống nên không nhận được |
| Đầu tư | `event/prize/TouZi.lua` 920032 | Cần VIP |
| Boss hẹn giờ | `New/BossHHL.lua` 891024 (19:45–22:30), `BossMND.lua` 891025, `BossVanPhu.lua` 891026, `event/bossgroup/bg_*.lua` (boss Kim Cương ở Thương Sơn 810001, lịch trong `Public/Config/ActivityNotice.txt`) | Chưa xác minh NPC hẹn giờ có trên bản đồ |
| Võ hồn | `new/event/wuhun/*` (chỉ có trên VPS) | Chưa phân tích |

## Còn nên làm

- Ẩn hoặc tắt: Càn quét, Top Tài Phú, Đầu tư, 4 icon không có backend. Không xóa được icon (giao diện client bị khóa), chỉ làm cho bấm vào báo "đã tắt".
- Sửa cập nhật Top Level (đưa `x888899_SetDengji` ra khỏi vòng lặp gửi thư trong `scene.lua`).
- Cập nhật ngày âm lịch cho Đón Năm Mới.
