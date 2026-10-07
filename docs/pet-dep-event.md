# Trân thú đẹp - chỉ phát qua event (07/10)

Chủ server chốt 07/10 (lần 2): chỉ tắt **các con "đẹp"** dưới đây; mọi trân thú khác của Trân Thú Thương Thành (shop Nguyên Bảo tab 3: shop 132 / 218 / 219) là pet game gốc, **vẫn bán** như cũ. Pet / trứng người chơi đã có giữ nguyên. *(07/10 tối: shop 219 "Trân Thú-Cao Cấp" đã bỏ HẾT, chuyển sang trade Ghép Ngọc - xem mục cuối.)*

**Phát cho người chơi:** panel GM → Phát quà → loại **item**, nhập **ID trứng** (người chơi mở trứng ra pet, cấp pet theo cấp người chơi). Giao qua hàng đợi `Server/txt/NetCo4Qua` khi đổi bản đồ; túi Đạo cụ đầy thì trứng nằm chờ.

Tên Hán Việt máy dịch, tên trong game có thể khác. Giá cũ = giá Nguyên Bảo GM cũ đặt trong shop.

| ID trứng | Trân thú | Kiểu | Trước đây ra ở đâu | Giá cũ (NB) |
|---|---|---|---|---|
| 30309780 | Ngọc Loan Phượng Bảo Bảo | Nội công | shop 218 | 20.000 |
| 30309799 | Ngạo Vân Thương Long Bảo Bảo | Nội công | shop 218 | 20.000 |
| 30309800 | Thái Cổ Long Hồn Bảo Bảo | Nội công | shop 218 | 20.000 |
| 30309808 | Hiên Viên Thiên Phượng Bảo Bảo | Nội công | shop 219 | 20.000 |
| 30309822 | Côn Lôn Tiên Tuấn Bảo Bảo | Ngoại công | shop 219 | 20.000 |
| 30309835 | Nhân Ngư Công Chủ Bảo Bảo | Nội công | shop 219 | 20.000 |
| 30309840 | Cửu Tiêu Chiến Long Bảo Bảo | Cân bằng | shop 219 | 20.000 |
| 30309842 | Thiết Phiến Công Chủ Bảo Bảo | Nội công | shop 219 | 20.000 |
| 30309847 | Tề Thiên Đại Thánh Bảo Bảo | Cân bằng | shop 219 | 20.000 |
| 30309849 | Nhị Lang Chân Quân Bảo Bảo | Ngoại công | shop 219 | 20.000 |
| 30309851 | Long Tam Thái Tử Bảo Bảo | Cân bằng | shop 219 | 20.000 |
| 30309857 | Bích Lạc Thanh Loan | Cân bằng | shop 219 + vòng quay web | 20.000 |
| 30309858 | Thiên Mệnh Huyền Phượng | Cân bằng | vòng quay web | - |
| 30309855 | Oa Hoàng Long Đế | Cân bằng | không bán (chỉ GM) | - |

Thêm: vòng quay web của bot cũng đã tắt **Diệu Thử Tiểu Tiên 30309859** (chủ server: vòng quay không ra pet); trứng này vẫn bán ở shop 219.

Không tắt (game gốc, vẫn mua được): Chí Tôn Thần Thú (shop 218), Kỳ Lân / Giao Long / Lão Hổ / Tuyết Hồ… (shop 132), mọi con còn lại của 218 / 219, trứng trong túi quà (SchoolBags, Hạt Tử, NPC Bát Ái, Cơ duyên mật bảo).

Kỹ thuật: `tools/pet-dep-tat-07-10b.js` bỏ 12 trứng khỏi dòng shop 218 / 219 trong `Public/Config/ShopTable.txt` (dồn món, ô thừa để trống cuối dòng, `Num` giữ 50 như mọi shop) - **cần restart game**. Rollback tag `truoc-pet-dep-b-07-10` (bản gỡ cả shop: `truoc-pet-dep-07-10`, đã bỏ).

## Tư chất (07/10)

Cả 14 họ trên (660 ID: trưởng thành, biến dị, bảo bảo, mọi cấp mang 5→95) đặt **tư chất chuẩn** trong `PetAttrTable.txt` cột 34–38: thuộc tính chính theo kiểu tấn công **8000**, 4 thuộc tính còn lại **4000** - mọi cấp mang (chủ server chốt 07/10 tối, bỏ mức 6000 / 3000; trứng pet đẹp mặc định ra bản 95).

| Kiểu | 8000 | 4000 |
|---|---|---|
| Ngoại công (Côn Lôn Tiên Tuấn - bảng pet ghi "Côn Luân", trứng 30309822, Nhị Lang Chân Quân) | Cường lực | Thể lực, Nội lực, Thân pháp, Định lực |
| Nội công (Ngọc Loan Phượng, Ngạo Vân Thương Long, Thái Cổ Long Hồn, Hiên Viên Thiên Phượng, Nhân Ngư Công Chủ, Thiết Phiến Công Chủ) | Nội lực (linh khí) | Cường lực, Thể lực, Thân pháp, Định lực |
| Cân bằng (Cửu Tiêu Chiến Long, Tề Thiên Đại Thánh, Long Tam Thái Tử, Bích Lạc Thanh Loan, Thiên Mệnh Huyền Phượng, Oa Hoàng Long Đế) | Thể lực | Cường lực, Nội lực, Thân pháp, Định lực |

- Trứng tạo pet bằng ruler 1 (có hệ số ngẫu nhiên) nên 8000 là mức chuẩn, pet thật ra quanh mức đó.
- Pet người chơi **đã có** giữ chỉ số cũ (tư chất ghi lúc tạo pet).
- Cần restart game. Công cụ `tools/pet-dep-tuchat-07-10.js`, rollback tag `truoc-pet-dep-tuchat-07-10`.
- Trade up: đặt làm **món đích riêng** ở 💎 Ghép Ngọc (panel SUPER), giá dự kiến **2.000.000** (chủ server tự đặt). Trứng cấp mang 95 (Oa Hoàng Long Đế) hiện nhãn "🔒 cần cấp 95".

## Trade pet ở Ghép Ngọc (07/10)

Trang người chơi chia món đích thành 2 mục **💎 Nguyên liệu** / **🐾 Trân thú** (trứng: tên có "Thú Đản / Vật Đản / Lân Đản" hoặc cấp mang cố định). Món đích pet đặt sẵn 2.000.000: đúng 14 con trên. Chí Tôn Thần Thú `30309762` (shop 218) và Kỳ Lân `30309035` (shop 132) vẫn **bán ở shop 20.000 NB**, KHÔNG đưa vào trade (chủ server chốt 07/10). Rà đủ 347 vật phẩm ấp pet: **31 trứng ra pet cấp mang 95 cố định** (trong đó 24 bán ở shop 132) - chủ server giữ bán vì sắp mở cấp 99.

## Trứng mặc định bản cấp mang 95 + trade tạm tắt (07/10 tối)

- 13 trứng pet đẹp trước là "theo cấp nhân vật" (mở ở cấp 85–94 ra bản 85, và giữ bản 85 mãi) → đổi sang **luôn ra bản cấp mang 95** (8000 / 4000), giống Oa Hoàng Long Đế. Script kiểm cấp TRƯỚC khi trừ trứng nên nhân vật chưa tới 95 mở thì báo lỗi, không mất trứng. Công cụ `tools/pet-dep-trung95-07-10.js` (`obj/item/zhenshoudan.lua`, Lua - hiệu lực sau `cap-nhat.sh`), rollback tag `truoc-pet-dep-trung95-07-10`.
- Ghép Ngọc chỉ ghi **kiểu pet** (⚔️ Ngoại công / 🔮 Nội công / ⚖️ Cân bằng), không ghi cấp.
- 14 trứng nằm sẵn trong món đích 2.000.000 nhưng **⚫ TẮT** (người chơi không thấy) - chủ server bật + nâng giá khi người chơi đạt cấp 95 (sắp mở cấp 99).
- Trong game còn 76 trứng kiểu "theo cấp lúc mở" (58 quả bán ở shop 218/219) - không đổi, chỉ 14 trứng pet đẹp. *(07/10 tối: 29 quả của shop 219 đã đổi + bỏ khỏi shop - mục "Trân Thú Cao Cấp" bên dưới.)*

## Trân Thú Cao Cấp (shop 219) → trade Ghép Ngọc (07/10 tối)

Chủ server chốt: **bỏ hết 41 trứng còn lại của tab "Trân Thú-Cao Cấp"** (Tiệm KNB → Tiệm Trân Thú; shop 219, thứ tự tab trong `event/prize/yuanbaoshop.lua`: Sơ cấp 132 / Trung cấp 218 / Cao cấp 219) khỏi shop, đưa vào **món đích Ghép Ngọc 2.000.000, ⚫ TẮT** như 14 con pet đẹp (bật khi người chơi đủ cấp 95). Công cụ `tools/pet-caocap-07-10.js`, rollback tag `truoc-pet-caocap-07-10`.

- **Shop**: dòng 219 trong `ShopTable.txt` để trống (đã có tiền lệ shop rỗng 164, 270) - **cần restart game**.
- **Trứng "linh hoạt"** (29 quả, ra pet theo cấp nhân vật) → **luôn ra bản cấp mang 95** (`zhenshoudan.lua` type=1, kiểm cấp TRƯỚC khi trừ trứng) - Lua, hiệu lực sau `cap-nhat.sh`.
- **12 trứng cố định cấp thấp** (cấp mang 5 / 20 / 45 - họ không có bản 95): giữ cấp mang, tư chất "bằng cấp 95" (8000/4000).
- **Tư chất chuẩn** (`PetAttrTable` cột 34–38, 41 họ = 1469 ID): cấp mang **85 → 6000/3000**, mọi cấp khác **8000/4000** (chính theo kiểu: Ngoại = Cường lực, Nội = Nội lực, Cân bằng = Thể lực).
- **Biến dị theo đời** (pet ghép/phối ra; trong mỗi cấp mang các ID biến dị xếp tăng dần = đời 1, 2, …): **cả 5 chỉ số +500 × đời, tối đa +3500** (đời 7; cấp 95 có 8 đời, đời 8 cũng +3500; cấp 5 có 2 đời, cấp 20 có 2, cấp 45 có 3). Áp cho **cả 14 họ pet đẹp** ở trên (giữ 8000/4000 mọi cấp, chỉ thêm phần đời). Trưởng thành / bảo bảo: mức gốc.
- **Không chỉ số nào thấp hơn bản cũ**: từng chỉ số = max(cũ, mới) (199 ID biến dị / cấp 85 có chỉ số phụ cũ > mức mới giữ số cũ trước khi cộng đời; sau khi cộng đời đều cao hơn).
- Họ xác định theo **mã họ (cột type) + tên**, không gộp theo tên: Bàng Giải (cua thường họ 791, trứng shop 132), Tùng Thử (họ 306), Thất Xảo Ly Miêu (trứng 30309779 shop 218, họ 2391–2397) **khác họ**, không bị đổi; mã họ 2780/2781 dùng chung với Huyễn Hóa Thủy Phỉ / Hà Đại Bá - lọc thêm theo tên.
- Pet người chơi **đã có** giữ chỉ số cũ (tư chất ghi lúc tạo pet).
- Ghép Ngọc (bot `ghepngoc.js`): 41 trứng có nhãn kiểu (KIEU), 29 trứng ghi cấp mang 95 (CAN_CAP); cả 41 có sẵn icon (`data/itemicons.json`), tự vào tab 🐾 Trân thú.
- **Đã tắt 3 nguồn khác** (chủ server chốt 07/10 tối, `tools/tat-nguon-trung-caocap-07-10.js`, Lua - sau `cap-nhat.sh`, rollback tag `truoc-tat-nguon-trung-07-10`): Cơ Duyên Mật Bảo (`yuanbaoshop.lua` `x888902_jiyuanmibao`) vị trí 20 Diệu Thử Tiểu Tiên 30309859 / 3.000 KNB → thay **đúng chỗ** bằng 50902001 / 5.000 (người chơi lưu số thứ tự món đã quay, xóa sẽ lệch); túi quà theo cấp `obj/item/SchoolBags.lua` (x889034_Gift 9/13/15/25) bỏ 30309844, 30309848, 30309831, 30309841; quà Đạt Nhân `MyNew/item/XieziNewServer.lua` DarenGift[1] bỏ 30309831 + vòng phát `for i = 1,5` → `getn(...)`. `ShopTable9999/OPENCu/TEST.txt` là bản sao cũ, game không đọc. Pet 85: không có trứng nào trong 41 họ ra pet 85 → chủ server bỏ qua giá 1.500.000.

### 29 trứng linh hoạt → bản 95

| ID trứng | Trân thú | Kiểu | Pet ra (cấp mang) |
|---|---|---|---|
| 30309807 | Cửu Lê Yêu Hổ Bảo Bảo | ⚔️ Ngoại công | 27419 (95) |
| 30309809 | Bách Biến Uông Tử Bảo Bảo | ⚔️ Ngoại công | 27559 (95) |
| 30309810 | Huyền Hoang Đằng Xà Bảo Bảo | ⚖️ Cân bằng | 27629 (95) |
| 30309811 | Oa Hoàng Long Mãng Bảo Bảo | ⚖️ Cân bằng | 27699 (95) |
| 30309813 | Huyền Nữ Xà Bảo Bảo | 🔮 Nội công | 27819 (95) |
| 30309820 | Mao Mao Ngưu Bảo Bảo | ⚔️ Ngoại công | 27969 (95) |
| 30309821 | Thánh Trang Tiểu Lộc Bảo Bảo | 🔮 Nội công | 28039 (95) |
| 30309823 | Thái Thương Long Tử Bảo Bảo | ⚔️ Ngoại công | 28179 (95) |
| 30309824 | Bạo Tẩu Hùng Miêu Bảo Bảo | ⚖️ Cân bằng | 28249 (95) |
| 30309825 | Manh Âm Hoa Linh Bảo Bảo | 🔮 Nội công | 28319 (95) |
| 30309827 | Tiểu Mã Ca Bảo Bảo | ⚔️ Ngoại công | 28399 (95) |
| 30309828 | Bách Chiến Kim Cương Bảo Bảo | ⚔️ Ngoại công | 28469 (95) |
| 30309829 | Thanh Dương Chân Quân Bảo Bảo | ⚖️ Cân bằng | 28539 (95) |
| 30309830 | Linh Thiên Đại Thánh Bảo Bảo | ⚖️ Cân bằng | 28609 (95) |
| 30309831 | Kim Đồng Ngọc Nữ Bảo Bảo | 🔮 Nội công | 28679 (95) |
| 30309832 | Thất Xảo Li Miêu Bảo Bảo | 🔮 Nội công | 29379 (95) |
| 30309833 | Hàm Đậu Hùng Bảo Bảo | ⚖️ Cân bằng | 29449 (95) |
| 30309837 | Chiến Tu La Bảo Bảo | ⚔️ Ngoại công | 29609 (95) |
| 30309838 | Tà Linh Bảo Bảo | ⚖️ Cân bằng | 29679 (95) |
| 30309839 | Hồ Yêu Kiếm Quân Bảo Bảo | ⚔️ Ngoại công | 29749 (95) |
| 30309841 | Đồng Tâm Uyên Ương Bảo Bảo | 🔮 Nội công | 29889 (95) |
| 30309844 | Thông Tí Viên Hầu Bảo Bảo | ⚖️ Cân bằng | 30039 (95) |
| 30309845 | Đậu Thú Sa Bảo Bảo | ⚔️ Ngoại công | 30109 (95) |
| 30309846 | Mĩ Hầu Vương Bảo Bảo | ⚖️ Cân bằng | 30179 (95) |
| 30309848 | Trĩ Nguyệt Linh Bảo Bảo | 🔮 Nội công | 30319 (95) |
| 30309852 | Hồ Tiểu Tiên Bảo Bảo | 🔮 Nội công | 30569 (95) |
| 30309853 | Manh Bảo Trư Bảo Bảo | 🔮 Nội công | 30639 (95) |
| 30309859 | Diệu Thử Tiểu Tiên | ⚔️ Ngoại công | 30949 (95) |
| 30309856 | Linh Mị Nhân | 🔮 Nội công | 30719 (95) |

### 12 trứng cố định cấp thấp (giữ cấp mang)

| ID trứng | Trân thú | Kiểu | Pet ra (cấp mang) |
|---|---|---|---|
| 30309812 | Tịnh Tịnh Mã Bảo Bảo | ⚔️ Ngoại công | 27749 (20) |
| 30309814 | Tuần Du Tiểu Tiên Bảo Bảo | 🔮 Nội công | 27829 (20) |
| 30309815 | Chung Tiểu Hoa Bảo Bảo | ⚖️ Cân bằng | 27839 (45) |
| 30309816 | Tiểu Lãng Nhân Bảo Bảo | ⚔️ Ngoại công | 27849 (20) |
| 30309817 | Phong Điểu Bảo Bảo | ⚔️ Ngoại công | 27859 (20) |
| 30309818 | An Tử Bảo Bảo | ⚔️ Ngoại công | 27869 (20) |
| 30309819 | Chung Tiểu Hắc Bảo Bảo | ⚖️ Cân bằng | 27879 (5) |
| 30309826 | Tiểu Dịch Bảo Bảo | ⚖️ Cân bằng | 28329 (20) |
| 30309834 | Nguyên Nguyên Bảo Bảo | ⚖️ Cân bằng | 29459 (5) |
| 30309836 | Bàng Giải Bảo Bảo | ⚔️ Ngoại công | 29539 (20) |
| 30309843 | Tùng Thử Bảo Bảo | 🔮 Nội công | 29969 (20) |
| 30309850 | Đông Tử Bảo Bảo | ⚔️ Ngoại công | 30399 (20) |

## Chủ server test từng con trên bialk → loại 4 con (07/10 tối)

Phát thẳng pet bảo bảo (hàng đợi `pet <ID>`, 4 con / lượt) cho bialk xem. **Loại 4 con** khỏi trade, trả về **mặc định** (`tools/pet-caocap-tra4-07-10.js`, rollback tag `truoc-pet-caocap-tra4-07-10`, cần restart):
30309812 Lượng Lượng Mã ("Tịnh Tịnh Mã"), 30309817 Phong Điểu, 30309836 Bàng Giải, 30309843 Tùng Thử - cả 4 là trứng cố định cấp mang 20 → **bán lại shop 219, 20.000** (đúng nhóm cột gốc), tư chất cả họ (16 ID) chép lại nguyên dòng gốc, bỏ khỏi món đích Ghép Ngọc + nhãn kiểu. Còn **51 con** trong trade (14 pet đẹp + 37 Cao Cấp), đều ⚫ TẮT.

**Số đời biến dị** (ghi trên thẻ Ghép Ngọc 🧬, bot `DOI`): đếm ID biến dị cùng mã họ + tên ở cấp mang pet trứng ra. Bản 95: **8 đời**; cấp 20 và Chung Tiểu Hắc (5): 2; Chung Tiểu Hoa (45): 3; **Oa Hoàng Long Đế và Nguyên Nguyên: chỉ 1 đời** (bảng gốc của game - không thêm được đời vì client cần dòng pet tương ứng). Mỗi đời +500 cả 5 tư chất (tối đa +3500) → bản 95 đời 8 tổng tư chất 41.500, Oa Hoàng Long Đế tối đa 26.500. Lưu ý: bảng cũ (trước restart) 14 họ pet đẹp có biến dị **bằng y bảo bảo** - chủ server thấy "biến dị rất ít chỉ số" là do chưa restart.
