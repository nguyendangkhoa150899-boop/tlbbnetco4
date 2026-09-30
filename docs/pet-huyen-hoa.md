# Pet Huyễn Hóa (ngoại hình boss) - chỉ admin phát qua tab GM, loại **Pet**

Tạo bằng hàng đợi quà `pet <ID>` (NetCo4/quatang.lua). 48 con, đều cấp 95, biến dị, trưởng thành 1459. Cột "pet nền" là ngoại hình gốc bảng tham chiếu.

| ID pet | Dạng boss | Pet nền |
|---|---|---|
| 25351 | Tần Vương | Kỳ Lân |
| 25352 | Quan Thắng | Kỳ Lân |
| 25361 | Viễn Cổ Kỳ Hồn | Giao Long |
| 25362 | Tống Khương | Giao Long |
| 25371 | Viễn Cổ Kỳ Hồn | Áp Chủy Thú |
| 25372 | Tống Khương | Áp Chủy Thú |
| 25381 | Tần Vương | Tuyết Hồ |
| 25382 | Quan Thắng | Tuyết Hồ |
| 25391 | Tần Vương | Long Miêu |
| 25392 | Quan Thắng | Long Miêu |
| 25401 | Viễn Cổ Kỳ Hồn | Tê Điểu |
| 25402 | Tống Khương | Tê Điểu |
| 25411 | Cáp Đại Bá | Hùng Miêu |
| 25412 | Lỗ Chí Sinh | Hùng Miêu |
| 25421 | Tần Vương | Bàng Giải |
| 25422 | Quan Thắng | Bàng Giải |
| 25431 | Viễn Cổ Kỳ Hồn | Hồ Điệp |
| 25432 | Tống Khương | Hồ Điệp |
| 25441 | Cáp Đại Bá | Oa Ngưu |
| 25442 | Lỗ Chí Sinh | Oa Ngưu |
| 25451 | Tần Vương | Hạt Tử |
| 25452 | Quan Thắng | Hạt Tử |
| 25461 | Cáp Đại Bá | Xuyên Sơn Giáp |
| 25462 | Lỗ Chí Sinh | Xuyên Sơn Giáp |
| 25471 | Cáp Đại Bá | Huyền Giáp Lôi Xà |
| 25472 | Lỗ Chí Sinh | Huyền Giáp Lôi Xà |
| 25481 | Viễn Cổ Kỳ Hồn | Đương Hỗ |
| 25482 | Tống Khương | Đương Hỗ |
| 25491 | Tần Vương | Hải Đạo Thử |
| 25492 | Quan Thắng | Hải Đạo Thử |
| 25501 | Viễn Cổ Kỳ Hồn | Bảo Tương Đồng Tử |
| 25502 | Tống Khương | Bảo Tương Đồng Tử |
| 25511 | Viễn Cổ Kỳ Hồn | Thụ Đại Hùng |
| 25512 | Tống Khương | Thụ Đại Hùng |
| 25521 | Tần Vương | Hoan Nhạc Trư |
| 25522 | Quan Thắng | Hoan Nhạc Trư |
| 25531 | Tần Vương | Đường Trang Thử |
| 25532 | Quan Thắng | Đường Trang Thử |
| 25541 | Tần Vương | Niên Thú |
| 25542 | Quan Thắng | Niên Thú |
| 25551 | Viễn Cổ Kỳ Hồn | Uyên Ương |
| 25552 | Tống Khương | Uyên Ương |
| 25561 | Tần Vương | Cùng Kỳ |
| 25562 | Quan Thắng | Cùng Kỳ |
| 25571 | Viễn Cổ Kỳ Hồn | Tiểu Hồ Tiên |
| 25572 | Tống Khương | Tiểu Hồ Tiên |
| 25581 | Viễn Cổ Kỳ Hồn | Bỉ Dực Điểu |
| 25582 | Tống Khương | Bỉ Dực Điểu |

Các ID khác trong PetAttrTable cũng phát được (vd 24602 Tuyền Linh Nhân Ngẫu trưởng thành 1896 - KHÔNG phát, lệch cân bằng). Trứng pet event thường bán sẵn 20.000 KNB ở Hồ Ca → Mua Thương Phẩm → tab Trân thú.

## Bản V2 (30/09 tối): cùng ngoại hình, tư chất BÌNH THƯỜNG (giá trị gốc, không 12000)

ID = ID gốc **+ 10000** (25351 → 35351 …), tên thêm " V2", cùng họ nên ngoại hình y hệt; 5 tư chất chuẩn lấy đúng bản gốc ChangYou (vd Tần Vương/Kỳ Lân 3988/3375/2148/2760/2148), trưởng thành như gốc. Phát qua panel loại Pet như bản 12000. Cần restart game (bảng .txt).

| ID V2 | Dạng boss | Pet nền | Tư chất lực/thể/linh/thân/định |
|---|---|---|---|
| 35351 | Tần Vương | Kỳ Lân | 3988/3375/2148/2760/2148 |
| 35352 | Quan Thắng | Kỳ Lân | 4133/3495/2225/2860/2225 |
| 35361 | Viễn Cổ Kỳ Hồn | Giao Long | 2148/2453/3988/2453/3375 |
| 35362 | Tống Khương | Giao Long | 2225/2543/4133/2543/3495 |
| 35371 | Viễn Cổ Kỳ Hồn | Áp Chủy Thú | 2148/2453/3988/2453/3375 |
| 35372 | Tống Khương | Áp Chủy Thú | 2225/2543/4133/2543/3495 |
| 35381 | Tần Vương | Tuyết Hồ | 3068/2760/2453/3988/2148 |
| 35382 | Quan Thắng | Tuyết Hồ | 3178/2860/2543/4133/2225 |
| 35391 | Tần Vương | Long Miêu | 4233/3160/1533/2760/2148 |
| 35392 | Quan Thắng | Long Miêu | 4385/3273/1588/2860/2225 |
| 35401 | Viễn Cổ Kỳ Hồn | Tê Điểu | 2148/2453/3988/2453/3375 |
| 35402 | Tống Khương | Tê Điểu | 2225/2543/4133/2543/3495 |
| 35411 | Cáp Đại Bá | Hùng Miêu | 2453/4295/2148/1840/2453 |
| 35412 | Lỗ Chí Sinh | Hùng Miêu | 2543/4450/2225/1908/2543 |
| 35421 | Tần Vương | Bàng Giải | 3988/3375/2148/2760/2148 |
| 35422 | Quan Thắng | Bàng Giải | 4133/3495/2225/2860/2225 |
| 35431 | Viễn Cổ Kỳ Hồn | Hồ Điệp | 2148/2453/3988/2453/3375 |
| 35432 | Tống Khương | Hồ Điệp | 2225/2543/4133/2543/3495 |
| 35441 | Cáp Đại Bá | Oa Ngưu | 2760/3988/2453/2453/2760 |
| 35442 | Lỗ Chí Sinh | Oa Ngưu | 2860/4133/2543/2543/2860 |
| 35451 | Tần Vương | Hạt Tử | 3988/3375/2148/2760/2148 |
| 35452 | Quan Thắng | Hạt Tử | 4133/3495/2225/2860/2225 |
| 35461 | Cáp Đại Bá | Xuyên Sơn Giáp | 2760/3988/2453/2453/2760 |
| 35462 | Lỗ Chí Sinh | Xuyên Sơn Giáp | 2860/4133/2543/2543/2860 |
| 35471 | Cáp Đại Bá | Huyền Giáp Lôi Xà | 2760/3988/2453/2453/2760 |
| 35472 | Lỗ Chí Sinh | Huyền Giáp Lôi Xà | 2860/4133/2543/2543/2860 |
| 35481 | Viễn Cổ Kỳ Hồn | Đương Hỗ | 2148/2453/4173/2453/3375 |
| 35482 | Tống Khương | Đương Hỗ | 2225/2543/4323/2543/3495 |
| 35491 | Tần Vương | Hải Đạo Thử | 3988/3375/2148/2760/2148 |
| 35492 | Quan Thắng | Hải Đạo Thử | 4133/3495/2225/2860/2225 |
| 35501 | Viễn Cổ Kỳ Hồn | Bảo Tương Đồng Tử | 2148/2453/3988/2453/3375 |
| 35502 | Tống Khương | Bảo Tương Đồng Tử | 2225/2543/4133/2543/3495 |
| 35511 | Viễn Cổ Kỳ Hồn | Thụ Đại Hùng | 1533/2363/4265/2453/3068 |
| 35512 | Tống Khương | Thụ Đại Hùng | 1588/2448/4418/2543/3178 |
| 35521 | Tần Vương | Hoan Nhạc Trư | 3988/3375/2148/2760/2148 |
| 35522 | Quan Thắng | Hoan Nhạc Trư | 4133/3495/2225/2860/2225 |
| 35531 | Tần Vương | Đường Trang Thử | 3988/3375/2148/2760/2148 |
| 35532 | Quan Thắng | Đường Trang Thử | 4133/3495/2225/2860/2225 |
| 35541 | Tần Vương | Niên Thú | 4295/3068/1533/2760/2148 |
| 35542 | Quan Thắng | Niên Thú | 4450/3178/1588/2860/2225 |
| 35551 | Viễn Cổ Kỳ Hồn | Uyên Ương | 2148/2453/3988/2453/3375 |
| 35552 | Tống Khương | Uyên Ương | 2225/2543/4133/2543/3495 |
| 35561 | Tần Vương | Cùng Kỳ | 4295/3068/1533/2760/2148 |
| 35562 | Quan Thắng | Cùng Kỳ | 4450/3178/1588/2860/2225 |
| 35571 | Viễn Cổ Kỳ Hồn | Tiểu Hồ Tiên | 1533/2300/4325/2453/3068 |
| 35572 | Tống Khương | Tiểu Hồ Tiên | 1588/2383/4483/2543/3178 |
| 35581 | Viễn Cổ Kỳ Hồn | Bỉ Dực Điểu | 2148/2453/4173/2453/3375 |
| 35582 | Tống Khương | Bỉ Dực Điểu | 2225/2543/4323/2543/3495 |

**Phát trên panel (30/09 tối):** panel GM (`panel.py`) và tab 🛠️ GM trên admin.netco4.click có 3 loại quà pet, **cùng ô chọn theo tên** (không nhập ID): **Pet Huyễn Hóa 12000 (admin cấp)** = ID 253xx, **Pet Huyễn Hóa V2 (chỉ số bình thường)** = ID 353xx, **Pet khác (tất cả)** = 6.320 pet gốc (tên Hán-Việt + cấp + trưởng thành, từ `docs/pet-danh-sach.tsv`). Web tải danh sách 1 lần qua `/api/gm/pets` → panel.py `/api/pets`.

**Vì sao tư chất không đúng 12000 mà lẻ (12602, 12755…):** khi tạo pet, engine nhân tư chất chuẩn với bậc phẩm chất ngẫu nhiên `PerParam0–10` (×1.000–1.404) và cộng dao động `IntelligenceRange=50` (`Server/Config/PetConfigTable.ini`, đang bản gốc). Muốn đúng 12000 phải đặt mọi `PerParam*=1.000` và `IntelligenceRange=0` → **mọi pet trên server mất ngẫu nhiên** (phiên chiều 30/09 đã thử rồi trả về). Chưa quyết.
