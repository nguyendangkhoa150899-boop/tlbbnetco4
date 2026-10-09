# Client: giải mã và hướng phát triển (nghiên cứu 08/10/2026)

Tài liệu này gom toàn bộ những gì đã tìm ra về **client** (`Thien Long Gate/`), những gì đã làm từ đó, và việc còn treo. Đọc trước khi định sửa thứ gì phía client.

- Công cụ và chi tiết kỹ thuật (thuật toán, định dạng, địa chỉ RE): **`tools/pet3d/README.md`**.
- Phần web dùng kết quả này: repo bot, `BotDoMin/pet3d.js` + `pet3d.client.js` + `ghepngoc.client.js`.

---

## 1. Tóm tắt: giờ làm được gì

| Việc | Trước 08/10 | Giờ |
|---|---|---|
| Đọc mô hình / skeleton / `.obj` / bảng trong gói client | Không (70% file bị mã hóa) | **Được.** Đã giải hết thuật toán (49 kiểu) |
| Đọc bảng client (`EquipBase.txt`, `CharModelEx.txt`…) | Không, vì `Config.axp` / `Interface.axp` không có trên đĩa | **Được**, tách từ RAM game |
| Dựng 3D pet trên web (tư thế đứng + hiệu ứng) | Không | **Đã làm** và đã deploy: Ghép Ngọc → "✨ Xem biến dị" |
| **Sửa** bảng / chữ phía client (tên món, mô tả, số giây Trùng Lâu…) | Không | **Không** bằng file ngoài đĩa: đã thử 08/10, client bỏ qua `Bin/Config.axp` (mục 4) |

`docs/PHAT-TRIEN.md` cột "Không làm được" (giao diện mới, vật phẩm mới…) vẫn đúng **cho tới khi** mục 4 thử thành công.

---

## 2. Client được bảo vệ thế nào (đã tìm ra)

| Thành phần | Sự thật |
|---|---|
| `Data/*.axp` | Gói AXPK. Tra file theo hashB = cột 3 của file `(list)` cuối gói (`tools/pet3d/trich.js`). |
| File mã hóa | Bắt đầu `84 cc fa 75`. Header 96 byte XOR khóa → `"SEPCIAL_FILE_HD"` + loại + kích thước; thân giải theo bảng (vị trí, byte). Texture `.dds` không mã hóa. |
| Ai giải mã | `Bin/RSSParser.dll` (nén UPX, viết bằng E-lang) **vá** `Render.dll` và `Game.exe` lúc chạy. Không phải `OgreMain.dll`. |
| `Config.axp`, `Interface.axp` | **Không có trên đĩa.** Nằm trong `Bin/OgreMain.dll` (Themida, 94 MB), chỉ hiện ra trong RAM khi game chạy. Log `Bin/Fairy.log` vẫn ghi đường dẫn `../Bin/Config.axp`. |
| Bảng client | Thường không mã hóa bên trong gói Config (ví dụ `EquipBase.txt`, `CharModelEx.txt` dạng chữ thường). |

Lấy lại các gói ẩn: bật game → `dumpmod.ps1` (chỉ đọc RAM) → `node tachgoi.js img\OgreMain.dll_<base>.img`. Lần 08/10, gói thứ 2 là Config (3483 file, 145 MB).

---

## 3. Đã làm: "✨ Xem biến dị" trên Ghép Ngọc

- 51 trứng trade, 404 bản ngoại hình (bản thường + đời biến dị).
- Pet đứng đúng động tác game (站立 / 休闲), vũ khí cầm đúng tay.
- Hiệu ứng hạt dựng lại từ `all.effect` / `all.particle` / `all.material`: 1892 hệ hạt.
- Dữ liệu (~127 MB) nằm ngoài git ở VPS `/opt/minigame/pet3d`, dựng bằng `tools/pet3d`: `node noi.js && node dungall.js`.
- Mỗi lần dựng có mã `v` riêng trong `index.json`, trang gắn `?v=` nên không bị cache cũ.
  - Bài học 08/10: một máy giữ `m9.bin` cũ 7 ngày nên không thấy hiệu ứng.
- Thêm / bớt trứng trong `DOI` (`ghepngoc.js`) thì phải dựng lại dữ liệu rồi chép lên VPS.

Giới hạn: hiệu ứng là **mô phỏng gần đúng**, chưa thử trên điện thoại thật. Con nhiều hạt nhất là Linh Thiên Đại Thánh đời 8 (54 hệ).

---

## 4. Đã thử (thất bại): sửa chữ phía client bằng Config.axp ngoài đĩa

### Vấn đề gốc

Tooltip Trùng Lâu trên client hiện **chữ viết cứng** trong bảng của client (`EquipBase.txt` cột mô tả, `EquipExtraAttr.txt` dòng "Thần Khí"). Server **không gửi** các số này xuống.

Hệ quả: đổi `dur` (ms) / `rate` (%) trong panel **🐉 Custom Trùng Lâu** (`docs/TRUNG-LAU-CUSTOM.md`) thì **hiệu lực thật đổi, chữ trên client không đổi**.

Số hiện trên client (đọc 08/10):

| Mã | Tên (client) | Số trong mô tả |
|---|---|---|
| 10553100 / 10553112 | Trùng Lâu Liên | 5 giây |
| 10553101 / 10553113 | Trùng Lâu Giới | 5 giây |
| 10553102 / 10553114 | Trùng Lâu Ngọc | 5 giây |
| 10553103 / 104 / 105 | Chân Trùng Lâu Liên / Giới / Ngọc | 10 giây |
| 10553106 / 10553107 | Trùng Lâu Đái / Chân | 10 / 25 giây |
| 10553108 / 10553109 | Trùng Lâu Kiên / Chân | giảm miễn 15% / 30% |
| 10553110 / 10553111 | Trùng Lâu Giáp / Chân | phản 15% / 30% |
| 10422016 / 10423024 | Trùng Lâu Giới / Ngọc (bản trade) | 15 giây |

### Phép thử (đang chờ chủ server làm, 08/10 ~17:00)

1. Máy chủ server đã có sẵn `Bin/Config.axp`. Nó **giống hệt** gói Config gốc, chỉ đổi Chân Trùng Lâu Liên **"10 giây" → "99 giây"** (cùng độ dài nên không phải đóng gói lại).
   - Tạo bằng: `node tools/pet3d/thu-config.js img/goi2.axp "<client>/Bin/Config.axp.THU" "10553103<TAB>" "#G10 gi" "#G99 gi"`.
2. Acc **bialk** (GUID 1010100017) đã được gửi 1 Chân Trùng Lâu Liên 10553103 qua hàng quà. Nhận khi đăng nhập hoặc đổi bản đồ.
3. Mở game, rê chuột lên món đó:
   - **"99 giây"** → client đọc gói ngoài đĩa. Làm tiếp mục kế hoạch dưới.
   - **"10 giây"** hoặc game lỗi → xóa `Bin/Config.axp` là về như cũ. Hướng sửa client coi như **không khả thi** (phải sửa thẳng OgreMain.dll có Themida, rủi ro hỏng client).

**Kết quả 08/10 17:09: THẤT BẠI.**

- Game mở lại lúc 17:03:18, sau khi có `Bin/Config.axp` (16:41). `Fairy.log` 17:03:30 vẫn ghi đã thêm `../Bin/Config.axp`.
- Nhưng tooltip món Chân Trùng Lâu Liên vẫn ghi **"liên tục 10 giây"**, không phải 99.
- Kết luận: hook trong `OgreMain.dll` luôn trả bản **nhúng sẵn**, file cùng tên trên đĩa bị bỏ qua. File thử đã xóa.
- Phát hiện thêm trong lúc thử: con số còn nằm ở chỗ thứ 3 là chú thích biểu tượng **buff** khi đang mặc. Đó là `ImpactSEData_V1.txt` id 2311 / 2313 / 2315 (Chân Giới / Ngọc / Liên): "tấn công thì hữu **6%** tỷ lệ … duy trì liên tục **10 giây**".

**Hướng còn lại (chưa làm, không khuyên làm):** vá chữ trong RAM sau khi OgreMain tự giải nén. Cách này cần một launcher/DLL chèn vào game trên máy từng người. Phức tạp, dễ bị antivirus chặn, và phải làm lại mỗi khi đổi client.

**Thay thế thực tế:** cho người chơi xem số thật ở chỗ khác. Ví dụ trang web (Ghép Ngọc / Shop / một mục "Trùng Lâu" đọc thẳng cấu hình panel), hoặc lời thoại NPC trong game (server sửa được, không cần client). Còn tooltip trong game thì chấp nhận ghi số gốc.

_Phần dưới giữ lại để tham khảo nếu sau này tìm được cách cho client đọc gói ngoài._

### Kế hoạch nếu thử thành công (không áp dụng - phép thử đã thất bại)

1. **Công cụ sinh `Config.axp`** từ cấu hình thật của server (ước vài giờ):
   - Đọc `dur` / `rate` từ panel Custom Trùng Lâu, viết lại câu mô tả của mỗi mã cho đúng số.
   - Chữ dài/ngắn khác bản gốc nên phải **đóng gói lại AXPK**. Bảng băm giữ nguyên vì tên file không đổi; chỉ dời offset/size trong bảng khối + dòng `(list)`.
   - Mỗi lần đổi cấu hình Trùng Lâu thì sinh lại file.
2. **Phát cho người chơi:** mọi người phải chép `Config.axp` (~130–145 MB) vào `Bin/` của client, hoặc đưa vào bản cập nhật client (`UpdateLaunch` / `Patch/`, chưa tìm hiểu). Ai không chép thì vẫn thấy số cũ, không lỗi gì.
3. **Mở rộng được** (cùng cơ chế): tên / mô tả vật phẩm, sửa chữ Việt hóa sai, mô tả skill… Bất cứ thứ gì nằm trong bảng của gói Config.
   - `Interface.axp` (giao diện) cũng là gói ẩn tương tự; phải thử riêng (`../Bin/Interface.axp`).
   - Vật phẩm **mới hoàn toàn** vẫn cần thêm dòng vào bảng client và giữ khớp với bảng server.

### Lưu ý

- Gói Config tách từ RAM có thể khác nhẹ bản game thực sự đọc (thứ tự khối…). Phép thử "chỉ đổi 2 byte" là để chắc nó vẫn chạy.
- Client của mọi người phải **cùng phiên bản** với gói đã tách. Đổi client thì tách lại.

---

## 5. Ý tưởng còn treo (chưa làm)

| Ý tưởng | Ghi chú |
|---|---|
| Kiểm "✨ Xem biến dị" trên điện thoại thật | Nếu nặng: giảm hạt (quota) khi màn nhỏ |
| So hiệu ứng với game cho vài pet | Chỗ nào lệch thì so `fx.json` với `ra/mau-fx.txt`, chỉnh trong `pet3d.client.js` |
| Dùng lại bộ xem cho thú cưỡi / trang phục / boss | Cùng chuỗi `.obj` → mesh → skeleton → effect; chỉ cần danh sách mã ngoại hình |
| Hiện số Trùng Lâu thật cho người chơi | Không sửa được tooltip client (mục 4). Làm qua web hoặc NPC nếu cần |

---

## 6. Thư mục `netco4/tlbb code` (đọc 09/10)

Thư mục ngoài repo, 6 file (2021). Đã đọc hết:

| File | Thực chất | Dùng được không |
|---|---|---|
| `Lệnh GM.txt` | Danh sách lệnh `!!` | **Trùng y hệt** `docs/lenh-gm.txt` |
| 3 file `.docx` (lệnh GM, các lệnh trong game) | Danh sách mã `!!createitem` (ngọc, điêu văn, thần khí 106, pet 75/85/95, đồ tân thủ, "SPECIAL SET") | Một phần. Mã đúng với bản của mình thì dùng được; nhiều mã Trùng Lâu ghi trong đó (10413104 / 10415056 / 10420089) **không tồn tại** ở bản này, còn 10553237 là "Thanh Phong Di Giang" chứ không phải Trùng Lâu |
| `ImpactColVN.txt` | Tên sai: thực ra là **EquipBase tiếng Trung** của một **phiên bản game khác** (21.200 món). Byte GBK bị lưu như VISCII trong UTF-16; khôi phục = ký tự → byte VISCII (`tools/viscii-map.json`) → giải GBK | **Không.** 6.571 mã không có ở server lẫn client của mình (client không biết thì không hiện được). Trong đó cũng **không có** Trùng Lâu Ngoa / Thủ / Khôi |
| `CommonItemVN.txt` | CommonItem tiếng Trung của bản đó, cùng kiểu lỗi mã hóa | **Không.** 1.792 mã không có ở bản của mình |

Ứng viên "mượn món" cho Trùng Lâu Khôi / Ngoa (có ở **cả** server lẫn client):
- **Mũ:** `10410098–10410127` Hoan Lạc / Hạnh Phúc Thánh Đản Mạo. Ví dụ `10410121` "Mão Giáng Sinh 3x".
- **Giày:** `10411032` Cẩm Bạch Hài ("Hài cấp 4").
- **Bao tay:** chưa chọn.

Mô tả client của mũ Giáng Sinh ghi "thời hạn 7 thiên". Chữ này cứng, server bỏ hạn được nhưng chữ vẫn còn.
