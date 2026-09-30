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
| 25001 | Băng Yêu (cấp 85, TT 1357) | Băng Yêu |
| 25002 | Công Tôn Thánh (cấp 85, TT 1357) | Công Tôn Thánh |
| 25011 | Tôn Mỹ Mỹ (cấp 85, TT 1357) | Tôn Mỹ Mỹ |
| 25012 | Lâm Sung (cấp 85, TT 1357) | Lâm Sung |
| 25021 | Thủy Phỉ Đầu Lãnh (cấp 85, TT 1357) | Thủy Phỉ Đầu Lãnh |
| 25022 | Lộ Quân Dật (cấp 85, TT 1357) | Lộ Quân Dật |

Các ID khác trong PetAttrTable cũng phát được (vd 24602 Tuyền Linh Nhân Ngẫu trưởng thành 1896 - KHÔNG phát, lệch cân bằng). Trứng pet event thường bán sẵn 20.000 KNB ở Hồ Ca → Mua Thương Phẩm → tab Trân thú.

## Bản V2 (30/09 tối): cùng ngoại hình, tư chất BÌNH THƯỜNG (giá trị gốc, không 12000)

ID = ID gốc **+ 10000** (25351 → 31351 …), tên thêm " V2", cùng họ nên ngoại hình y hệt; 5 tư chất chuẩn lấy đúng bản gốc ChangYou (vd Tần Vương/Kỳ Lân 3988/3375/2148/2760/2148), trưởng thành như gốc. Phát qua panel loại Pet như bản 12000. Cần restart game (bảng .txt).

| ID V2 | Dạng boss | Pet nền | Tư chất lực/thể/linh/thân/định |
|---|---|---|---|
| 31351 | Tần Vương | Kỳ Lân | 3988/3375/2148/2760/2148 |
| 31352 | Quan Thắng | Kỳ Lân | 4133/3495/2225/2860/2225 |
| 31361 | Viễn Cổ Kỳ Hồn | Giao Long | 2148/2453/3988/2453/3375 |
| 31362 | Tống Khương | Giao Long | 2225/2543/4133/2543/3495 |
| 31371 | Viễn Cổ Kỳ Hồn | Áp Chủy Thú | 2148/2453/3988/2453/3375 |
| 31372 | Tống Khương | Áp Chủy Thú | 2225/2543/4133/2543/3495 |
| 31381 | Tần Vương | Tuyết Hồ | 3068/2760/2453/3988/2148 |
| 31382 | Quan Thắng | Tuyết Hồ | 3178/2860/2543/4133/2225 |
| 31391 | Tần Vương | Long Miêu | 4233/3160/1533/2760/2148 |
| 31392 | Quan Thắng | Long Miêu | 4385/3273/1588/2860/2225 |
| 31401 | Viễn Cổ Kỳ Hồn | Tê Điểu | 2148/2453/3988/2453/3375 |
| 31402 | Tống Khương | Tê Điểu | 2225/2543/4133/2543/3495 |
| 31411 | Cáp Đại Bá | Hùng Miêu | 2453/4295/2148/1840/2453 |
| 31412 | Lỗ Chí Sinh | Hùng Miêu | 2543/4450/2225/1908/2543 |
| 31421 | Tần Vương | Bàng Giải | 3988/3375/2148/2760/2148 |
| 31422 | Quan Thắng | Bàng Giải | 4133/3495/2225/2860/2225 |
| 31431 | Viễn Cổ Kỳ Hồn | Hồ Điệp | 2148/2453/3988/2453/3375 |
| 31432 | Tống Khương | Hồ Điệp | 2225/2543/4133/2543/3495 |
| 31441 | Cáp Đại Bá | Oa Ngưu | 2760/3988/2453/2453/2760 |
| 31442 | Lỗ Chí Sinh | Oa Ngưu | 2860/4133/2543/2543/2860 |
| 31451 | Tần Vương | Hạt Tử | 3988/3375/2148/2760/2148 |
| 31452 | Quan Thắng | Hạt Tử | 4133/3495/2225/2860/2225 |
| 31461 | Cáp Đại Bá | Xuyên Sơn Giáp | 2760/3988/2453/2453/2760 |
| 31462 | Lỗ Chí Sinh | Xuyên Sơn Giáp | 2860/4133/2543/2543/2860 |
| 31471 | Cáp Đại Bá | Huyền Giáp Lôi Xà | 2760/3988/2453/2453/2760 |
| 31472 | Lỗ Chí Sinh | Huyền Giáp Lôi Xà | 2860/4133/2543/2543/2860 |
| 31481 | Viễn Cổ Kỳ Hồn | Đương Hỗ | 2148/2453/4173/2453/3375 |
| 31482 | Tống Khương | Đương Hỗ | 2225/2543/4323/2543/3495 |
| 31491 | Tần Vương | Hải Đạo Thử | 3988/3375/2148/2760/2148 |
| 31492 | Quan Thắng | Hải Đạo Thử | 4133/3495/2225/2860/2225 |
| 31501 | Viễn Cổ Kỳ Hồn | Bảo Tương Đồng Tử | 2148/2453/3988/2453/3375 |
| 31502 | Tống Khương | Bảo Tương Đồng Tử | 2225/2543/4133/2543/3495 |
| 31511 | Viễn Cổ Kỳ Hồn | Thụ Đại Hùng | 1533/2363/4265/2453/3068 |
| 31512 | Tống Khương | Thụ Đại Hùng | 1588/2448/4418/2543/3178 |
| 31521 | Tần Vương | Hoan Nhạc Trư | 3988/3375/2148/2760/2148 |
| 31522 | Quan Thắng | Hoan Nhạc Trư | 4133/3495/2225/2860/2225 |
| 31531 | Tần Vương | Đường Trang Thử | 3988/3375/2148/2760/2148 |
| 31532 | Quan Thắng | Đường Trang Thử | 4133/3495/2225/2860/2225 |
| 31541 | Tần Vương | Niên Thú | 4295/3068/1533/2760/2148 |
| 31542 | Quan Thắng | Niên Thú | 4450/3178/1588/2860/2225 |
| 31551 | Viễn Cổ Kỳ Hồn | Uyên Ương | 2148/2453/3988/2453/3375 |
| 31552 | Tống Khương | Uyên Ương | 2225/2543/4133/2543/3495 |
| 31561 | Tần Vương | Cùng Kỳ | 4295/3068/1533/2760/2148 |
| 31562 | Quan Thắng | Cùng Kỳ | 4450/3178/1588/2860/2225 |
| 31571 | Viễn Cổ Kỳ Hồn | Tiểu Hồ Tiên | 1533/2300/4325/2453/3068 |
| 31572 | Tống Khương | Tiểu Hồ Tiên | 1588/2383/4483/2543/3178 |
| 31581 | Viễn Cổ Kỳ Hồn | Bỉ Dực Điểu | 2148/2453/4173/2453/3375 |
| 31582 | Tống Khương | Bỉ Dực Điểu | 2225/2543/4323/2543/3495 |
| 31001 | Băng Yêu (cấp 85, TT 1357) | Băng Yêu | 2083/2380/3870/2380/3275 |
| 31002 | Công Tôn Thánh (cấp 85, TT 1357) | Công Tôn Thánh | 2168/2478/4028/2478/3408 |
| 31011 | Tôn Mỹ Mỹ (cấp 85, TT 1357) | Tôn Mỹ Mỹ | 3870/3275/2083/2678/2083 |
| 31012 | Lâm Sung (cấp 85, TT 1357) | Lâm Sung | 4028/3408/2168/2788/2168 |
| 31021 | Thủy Phỉ Đầu Lãnh (cấp 85, TT 1357) | Thủy Phỉ Đầu Lãnh | 2678/3870/2380/2380/2678 |
| 31022 | Lộ Quân Dật (cấp 85, TT 1357) | Lộ Quân Dật | 2788/4028/2478/2478/2788 |

**Phát trên panel (30/09 tối):** panel GM (`panel.py`) và tab 🛠️ GM trên admin.netco4.click có 3 loại quà pet, **cùng ô chọn theo tên** (không nhập ID): **Pet Huyễn Hóa 12000 (admin cấp)** = ID 253xx, **Pet Huyễn Hóa V2 (chỉ số bình thường)** = ID 353xx, **Pet khác (tất cả)** = 6.320 pet gốc (tên Hán-Việt + cấp + trưởng thành, từ `docs/pet-danh-sach.tsv`). Web tải danh sách 1 lần qua `/api/gm/pets` → panel.py `/api/pets`.

**Vì sao tư chất không đúng 12000 mà lẻ (12602, 12755…):** khi tạo pet, engine nhân tư chất chuẩn với bậc phẩm chất ngẫu nhiên `PerParam0–10` (×1.000–1.404) và cộng dao động `IntelligenceRange=50` (`Server/Config/PetConfigTable.ini`, đang bản gốc). Muốn đúng 12000 phải đặt mọi `PerParam*=1.000` và `IntelligenceRange=0` → **mọi pet trên server mất ngẫu nhiên** (phiên chiều 30/09 đã thử rồi trả về). Chưa quyết.

**30/09 tối: thêm 6 skin cấp 85** (đủ 12 skin boss của game): Băng Yêu 25001, Công Tôn Thánh 25002, Tôn Mỹ Mỹ 25011, Lâm Sung 25012, Thủy Phỉ Đầu Lãnh 25021, Lộ Quân Dật 25022 (bản 12000) và +6000 (bản V2 = gốc + 6000, tư chất gốc). Cấp mang 85, trưởng thành 1357 giữ như gốc.
