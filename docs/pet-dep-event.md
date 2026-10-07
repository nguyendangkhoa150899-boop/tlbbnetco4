# Trân thú đẹp - chỉ phát qua event (07/10)

Chủ server chốt 07/10 (lần 2): chỉ tắt **các con "đẹp"** dưới đây; mọi trân thú khác của Trân Thú Thương Thành (shop Nguyên Bảo tab 3: shop 132 / 218 / 219) là pet game gốc, **vẫn bán** như cũ. Pet / trứng người chơi đã có giữ nguyên.

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
- Trong game còn 76 trứng kiểu "theo cấp lúc mở" (58 quả bán ở shop 218/219) - không đổi, chỉ 14 trứng pet đẹp.
