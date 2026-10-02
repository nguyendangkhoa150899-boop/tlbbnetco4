# Shop trong game (Tiệm Nguyên Bảo và cửa hàng NPC): những gì đã sửa

Sổ này ghi mọi thay đổi ở shop **trong game**, tức file `server/Public/Config/ShopTable.txt`.
Mỗi dòng trong file là một **kệ**, cột đầu là số kệ.

**Shop web** (Thiên Long & KNB, Quà tặng trên bot) là danh sách riêng do chủ server tự đặt trong admin, lưu ở bot.
Khi sửa shop game thì **không đụng shop web**.

## Cách đọc một kệ

- Cột 7 là loại tiền: `1` = vàng, `5` = Kim Nguyên Bảo (KNB), `6` = Điểm Tặng.
- Món bắt đầu ở cột 25, mỗi ô 6 cột: `ID, 1, -1, giá, 100, màu`. Ô trống ghi rỗng.
- File dùng xuống dòng CRLF. Giữ đúng CRLF khi sửa.
- **Mọi thay đổi ShopTable chỉ có hiệu lực sau khi restart game.** Deploy bằng `cap-nhat.sh -y` chỉ chép file.
- Làm trống một kệ thì xóa trắng mọi ô từ cột 25 trở đi, giữ nguyên các cột 0–24. Kệ 164 và kệ 270 làm theo cách này.

## Nhật ký thay đổi

| Ngày | Kệ | Nút trong game | Thay đổi | Commit | Tag quay lại |
|---|---|---|---|---|---|
| 28/09 | nhiều kệ | Tiệm KNB | Bỏ Thanh Tâm Phổ Thiện Chú 30307219 khỏi cửa hàng KNB (chỉ admin phát) | d4a9591 | |
| 29/09 | 150 | Tiệm Bảo Thạch, nút Ngọc cấp 3 | 25 ngọc cấp 4 lên cấp 5, giá 0 | fc8516f | |
| 29/09 | 150 | như trên | Giữ giá Điểm Tặng gốc cho ngọc cấp 5 | d8c682d | |
| 01/10 | 137 | Kỳ Trân Dị Bảo | Thêm Kiền Khôn Hồ 30008009 và Kiền Khôn Bội 30008033, 1.000 Điểm Tặng | add811d | |
| 02/10 | 150 | Tiệm Bảo Thạch | Trả 25 ngọc về **cấp 4** như gốc, giá Điểm Tặng gốc | bd73440 | truoc-shop150-ngoc4-02-10 |
| 02/10 | 164 | Võ Công Bí Tịch > Yếu Quyết 80 | Bỏ hết 24 Yếu Quyết cấp 80, kệ để trống | ab81ad4 | truoc-xoa-yq80-02-10 |
| 02/10 | 181 | Khu Buôn Bán > Đạo cụ hấp dẫn | Bỏ Chưởng Quỹ Yếu Quyết 30008053 | b039dbe | truoc-xoa-30008053-02-10 |
| 02/10 | 180 | Khu Buôn Bán > Vật phẩm mới | Bỏ Canh Danh Thiếp 30008105 và Chuyển Tính Đan 30900048 | db37f51 | truoc-xoa-ke180-02-10 |
| 02/10 | 136 | Thần khí 42, bản 2.000 | Không đổi kệ. Dòng thuộc tính cố định khi mua (sửa EquipBase + ItemSegValue, xem dưới) | 4f483fd | truoc-thankhi42-02-10 |
| 02/10 | 102, 133, 134 | Sách kỹ năng trân thú | Cả 3 kệ trả bằng **KNB**, giá mới theo bảng dưới | 2cde507 | truoc-sachpet-shopbaby-02-10 |
| 02/10 | 270 | Khu Buôn Bán > **Shop BaBy** | **Tắt**: làm trống kệ, bỏ 19 món | 2cde507 | truoc-sachpet-shopbaby-02-10 |
| 03/10 | 153 → 155 | Tiệm Bảo Thạch | **Điểm Kim Chi Tiễn 20109101** (đục lỗ thứ 4): bỏ khỏi kệ 153 (2.000 Điểm Tặng), chuyển sang kệ 155 (KNB, tab có Kim Toa / Điểm Chuế Phù), giá **20.000 KNB**, đứng sau Gia Công Phù. Loại tiền đặt chung cho cả kệ nên không đổi tại chỗ được; 8 món còn lại của kệ 153 giữ Điểm Tặng | 586ee07 | truoc-kimchitien-03-10 |
| 03/10 | 153 | Tiệm Bảo Thạch (tab Hợp Thành Phù / Điêu Trác Phù) | **Thay cho dòng trên.** Kim Chi Tiễn về lại kệ 153 (ô thứ 3), **cả kệ đổi sang KNB**, giữ nguyên con số giá: Tương Khảm Phù cao cấp 98, Trích Trừ Phù cấp 9 98, **Điểm Kim Chi Tiễn 20.000**, Điêu Trác Phù cấp 4–7 4.000–7.000, Dong Luyện Phù 500, Hợp Thành Phù sơ cấp 500. Kệ 155 trả về như gốc | 7cc2ada | truoc-ke153-knb-03-10 |
| 03/10 | 180 | Khu Buôn Bán > Vật phẩm mới | **Hàn Ngọc Tinh Túy 20310111**: 3.000 → **20.000 KNB**, ngang Kim Chi Tiễn. Cả 2 đều là nguyên liệu đục lỗ thứ 4 (`SlotCost.txt` cho trang bị thường, `stiletto.lua` cho Lệnh Bài/Võ Hồn/Long Văn/Tọa Kỵ/Thời Trang). Lưu ý: Hàn Ngọc còn là nguyên liệu 4 viên/lần của 60 công thức chế đồ (`ItemCompound.txt`: Tịch Diệt/Thiên Ẩn/Tru Ma… Oản, Kiên, Yêu Hoàn, Giới, Hộ Phù), không có nguồn rơi | (commit này) | truoc-hanngoc-20000-03-10 |

### Chưa đổi, còn chờ chủ server

- **Kệ 151**, ngọc cấp 6 bán bằng KNB, 10.000–30.000: bỏ trống hay giữ.
- **Kệ 31**, bán bằng vàng: còn Chưởng Quỹ Yếu Quyết 30008053 ở ô thứ 7.

## Thần khí 42, bản 2.000 KNB (kệ 136)

Mua ra luôn có đúng 10 dòng:
- băng, hỏa, huyền, độc 80
- công 3000
- chính xác 1500, hội tâm 15
- thể lực 100, thân pháp 50
- tất cả thuộc tính 5

| Loại công | Vũ khí |
|---|---|
| Nội công | Phiến 10304000, Hoàn 10305000, Nỏ 10306000 |
| Ngoại công | Kiếm 10302000, Đao 10300000, Trượng 10307000 |

- Game gốc để Kiếm và Trượng là nội, Hoàn là ngoại. Bản này làm theo yêu cầu của chủ server.
- Cách làm: thêm đoạn giá trị 4400 vào `ItemSegValue.txt`. Trong `EquipBase.txt`, cột 91 của 6 cây trỏ về 4400, số dòng đặt 10–10, chỉ bật 10 thuộc tính.
- Tư chất vẫn ngẫu nhiên 126–250.
- Cây mua trước 02/10 **giữ bộ dòng cũ** (5 dòng), nhưng **số được tính lại** theo đoạn 4400. Lý do: server tính lại số mỗi lần nhân vật vào game. Kết quả là ngoại/nội công lên 3000, chính xác 1500, hội tâm 15, thân pháp 50, còn Cường lực/Nội lực giữ như cũ, vì đoạn 4400 có giá trị 63 giống đoạn gốc (sửa ở 1c82ac1). Kiếm và Trượng cũ vẫn giữ dòng nội công.
- Bản 10.000 KNB, ID đuôi 005, không đổi.

## Shop BaBy (kệ 270): 19 món đã bỏ

Kệ 270 là nơi duy nhất bán các món này. Muốn bán lại thì lấy dòng 270 từ tag `truoc-sachpet-shopbaby-02-10`.

| ID | Món | Giá cũ (KNB) |
|---|---|---|
| 31001475 | Ngộ Linh Châu | 1.000 |
| 31001476 | Giác Linh Châu | 1.000 |
| 31001470–31001474 | Ngũ Nghệ Tàn Quyển: Thi, Thư, Lễ, Nhạc, Xạ | 1.000 |
| 31001469 | Ngũ Nghệ Toàn Quyển | 5.100 |
| 31001465 | Điển Tịch Chú Giải | 2.000 |
| 31001466 | Điển Tịch Tàn Hiệt | 2.000 |
| 31001467 | Giáng Tử Tiên Lộ | 500 |
| 31001468 | Xích Hà Tiên Lộ | 1.000 |
| 30008401–30008407 | 7 bộ thời trang BaBy: Ngọc Vũ Thanh Trù, Ngọc Cẩm Kim Sa, Thanh Phong Di Giang, Phi Hồng Cẩm Trang, Vân Mộng Tinh Thường, Bích Mộng Liên Hoa, Linh Ô Lộng Vũ | 40.000 |

## Sách kỹ năng trân thú (kệ 102, 133, 134): giá mới, tất cả bằng KNB

Sách pet là nhóm ID 30402xxx, định nghĩa trong `Public/Config/PetSkillBook.txt` (sách → mã kỹ năng).
Loại chiêu lấy từ `SkillTemplate_V1.txt` cột 27: `0` chủ nhân bấm, `1` pet tự đánh, `2` bị động tăng chỉ số.

Trước 02/10:
- Kệ 102 bán bằng vàng, giá 100.
- Kệ 133 bán bằng Điểm Tặng, giá 299 hoặc 501.
- Kệ 134 bán bằng KNB, giá 1.960 hoặc 3.000.

| Nhóm | Giá KNB | Số sách |
|---|---|---|
| Chủ động có chữ "Cao cấp" | 50.000 | 17 |
| Chủ động thường | 20.000 | 27 |
| 5 chiêu mạnh không có chữ "Cao cấp" | 10.000 | 5 |
| Bị động, cả thường lẫn Cao cấp | 5.000 | 36 |

**50.000:** 30402026 Cao cấp Huyết Bạo, 030 Băng Bạo, 034 Trọng Sinh, 036 Cộng Sinh, 038 Trì Liệu, 040 Nhục Tường, 042 Thần Hữu, 044 Thị Huyết, 046 Huyết Tế, 048 Ngụy Trang, 050 Phụ Thân, 072 Mãnh Kích, 076 Hư Nhược, 078 Phá Trán, 080 Suất Bán, 092 Liên Kích, 094 Thống Kích. Tất cả ở kệ 134.

**20.000:** 30402025 Huyết Bạo, 029 Băng Bạo, 033 Trọng Sinh, 035 Cộng Sinh, 037 Trì Liệu, 039 Nhục Tường, 041 Thần Hữu, 043 Thị Huyết, 045 Huyết Tế, 047 Ngụy Trang, 049 Phụ Thân, 051 Hàn Băng Chú, 052 Liệt Hỏa Chú, 053 Huyết Độc Chú, 054 Huyền Lôi Chú, 071 Mãnh Kích (kệ 102), 075 Hư Nhược, 077 Phá Trán, 079 Suất Bán, 081 Giải Huyệt, 082 Thanh Tỉnh, 083 Minh Mục, 084 Khinh Linh, 085 Cố Nguyên, 086 Sái Thoát, 091 Liên Kích, 093 Thống Kích. Trừ Mãnh Kích, tất cả ở kệ 133.

**10.000:** 30402087 Băng Thiên Tuyết Địa, 088 Liệt Hỏa Liệu Nguyên, 089 Huyết Độc Vạn Lí, 090 Ngũ Lôi Oanh Đính, 095 Bào Hao. Tất cả ở kệ 134.

**5.000:**
- **Kệ 102:** 30402005 Trì Độn, 006 Giảo Hoạt, 007 Hàm Hậu, 008 Bính Mệnh, 009 Pháp Hồn, 010 Man Lực, 011 Tá Lực, 013 Di Hồn, 015 Thuấn Ảnh, 017 Cường Thân, 019 Ngưng Thần.
- **Kệ 133:** 055 Phản Kích, 059 Phản Chấn, 061 Linh Động, 063 Hợp Khí, 065 Đả Nộ, 067 Trung Tâm, 069 Nội Lực, 073 Thức Phá, 096 Băng Hồn, 097 Hỏa Hồn, 098 Độc Hồn, 099 Huyền Hồn.
- **Kệ 134, bản Cao cấp:** 012 Tá Lực, 014 Di Hồn, 016 Thuấn Ảnh, 018 Cường Thân, 020 Ngưng Thần, 056 Phản Kích, 060 Phản Chấn, 062 Linh Động, 064 Hợp Khí, 066 Đả Nộ, 068 Trung Tâm, 070 Nội Lực, 074 Thức Phá.

Tên trong `CommonItem.txt` của 30402073/074 bị lỗi chữ thành "Thứcấphá". Tên đúng là Thức Phá.
