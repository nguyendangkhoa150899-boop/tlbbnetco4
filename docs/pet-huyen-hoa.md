# Pet Huyễn Hóa (ngoại hình boss) - chỉ admin phát qua tab GM, loại **Pet**

## Bộ 144 pet skin (01/10) — dùng bộ này, các bảng phía dưới là bản cũ

12 skin × Ngoại/Nội/Cân bằng × cấp mang 85/95, mỗi tổ hợp 2 bản: **Admin** (tư chất chuẩn 12000) và **V2** (tư chất gốc của pet nền). Làm bằng cách ghép **pet nền** vào ID Huyễn Hóa có sẵn, giữ nguyên skin: bảng quái giữ cột 0/1/44/50/61/65 (tên, mã ngoại hình, chân dung…), còn lại chép từ pet nền (kiểu tấn công cột 62, chỉ số); bảng pet lấy cấp mang, tuổi thọ, tư chất, trưởng thành, tính cách, cột 50 từ pet nền. Pet nền: cấp 95 Kỳ Lân 3330 (Ngoại) / Giao Long 3340 (Nội) / Hùng Miêu 7840 (Cân bằng), TT 1459; cấp 85 Niên Thú 3300 / Sồ Phượng 3290 / Long Quy 3310, TT 1357. Đã thử Cáp Đại Bá 95 Nội (25601) trong game: đúng ngoại hình, chữ Nội, cấp 95. Máy đọc: `docs/pet-skin.tsv` (panel GM đọc file này). Script: `ghep_all.js` (scratchpad 01/10), không dùng lại ID đã phát cho bia1.

### Tư chất CỐ ĐỊNH cho 144 pet Huyễn Hóa (01/10, cần restart vì sửa PetConfigTable.ini)

- Engine (`PetRuler::CreatePerception`, đọc từ Server.elf) tính tư chất = chuẩn PetAttrTable × hệ số ngẫu nhiên trong [PerParam bậc i, PerParam bậc i+1] của **ruler** do Lua truyền vào (`LuaFnCreatePetToHuman(..., ruler)`: 0 thường, 1 RMB, 2 SuperRMB). `IntelligenceRange` không dùng ở đây.
- `PetConfigTable.ini`: ruler 2 (SuperRMB) mọi `SuperRMBPerParam*` = 1.000, `SuperRMBPerRate0/1` = 999/1, trưởng thành `SuperRMB_GrowRate4` = 1000 (luôn bậc cao nhất). Ruler 0/1 (pet thường, trứng, bắt ngoài map) giữ nguyên random.
- `NetCo4/quatang.lua`: bảng `x950000_g_HuyenHoa` (144 ID, cả V2 lẫn Admin 12000) → quà `pet <ID>` trong bảng tạo với ruler 2 → ra **đúng** số trong bảng (V2 5000/2500, Admin 12000). Pet đã phát trước đó giữ tư chất cũ (lưu trong DB).
- Hoàn Đồng 4834/4907/4908 từ chối pet Huyễn Hóa (nếu không, người chơi hoàn đồng là random lại ×1,0–1,4).
- Ruler 2 còn được Huyễn Hóa Đan gốc `huantongdan_4.lua` dùng (30309150…, ra skin gốc 25009/25049…): giờ ra tư chất chuẩn ×1.000 thay vì ×1,145+. Đan này không bán ở đâu (chỉ có trong túi quay trứng 30504007/017/045/048/049, 30504119/120, các túi này cũng không bán).
- **Không có đường mua**: đã quét shop web (itemShop 257 món, rương, vòng quay), ShopTable, mọi script/bảng và 22.994 điểm spawn quái → không chỗ nào ra 144 ID này, chỉ quà admin (panel).
- Rollback: tag `truoc-v2-codinh-01-10`.

### Bản Admin (12000)

| Skin | 95 Ngoại | 95 Nội | 95 Cân bằng | 85 Ngoại | 85 Nội | 85 Cân bằng |
|---|---|---|---|---|---|---|
| Băng Yêu | 25041 | 25071 | 25101 | 25151 | 25171 | 25181 |
| Công Tôn Thánh | 25042 | 25072 | 25102 | 25152 | 25172 | 25182 |
| Tôn Mỹ Mỹ | 25051 | 25061 | 25091 | 25121 | 25131 | 25161 |
| Lâm Sung | 25052 | 25062 | 25092 | 25122 | 25132 | 25162 |
| Thủy Phỉ Đầu Lãnh | 25031 | 25081 | 25111 | 25141 | 25291 | 25321 |
| Lộ Quân Dật | 25022 | 25032 | 25082 | 25112 | 25142 | 25292 |
| Viễn Cổ Kỳ Hồn | 25401 | 25431 | 25481 | 25501 | 25511 | 25551 |
| Tống Khương | 25402 | 25432 | 25482 | 25502 | 25512 | 25552 |
| Tần Vương | 25381 | 25391 | 25421 | 25451 | 25491 | 25521 |
| Quan Thắng | 25382 | 25392 | 25422 | 25452 | 25492 | 25522 |
| Cáp Đại Bá | 25411 | 25601 | 25461 | 25471 | 25631 | 25781 |
| Lỗ Chí Sinh | 25412 | 25442 | 25462 | 25472 | 25602 | 25632 |

### Bản V2 — tư chất theo kiểu (01/10): Ngoại = Cường lực 5000, Nội = Nội lực 5000, Cân bằng = Thể lực 5000; 4 dòng còn lại 2500 (cột 34 力量 / 36 灵气 / 35 体质 PetAttrTable). ~~Random của game vẫn nhân thêm~~ → **01/10: đã tắt random, xem mục dưới**

| Skin | 95 Ngoại | 95 Nội | 95 Cân bằng | 85 Ngoại | 85 Nội | 85 Cân bằng |
|---|---|---|---|---|---|---|
| Băng Yêu | 25201 | 25241 | 25261 | 25271 | 25301 | 25331 |
| Công Tôn Thánh | 25202 | 25242 | 25262 | 25272 | 25302 | 25332 |
| Tôn Mỹ Mỹ | 25191 | 25211 | 25221 | 25231 | 25251 | 25281 |
| Lâm Sung | 25192 | 25212 | 25222 | 25232 | 25252 | 25282 |
| Thủy Phỉ Đầu Lãnh | 25771 | 25961 | 26081 | 26361 | 26421 | 26521 |
| Lộ Quân Dật | 25322 | 25772 | 25962 | 26082 | 26362 | 26422 |
| Viễn Cổ Kỳ Hồn | 25571 | 25581 | 25611 | 25641 | 25651 | 25691 |
| Tống Khương | 25572 | 25582 | 25612 | 25642 | 25652 | 25692 |
| Tần Vương | 25541 | 25561 | 25591 | 25621 | 25671 | 25711 |
| Quan Thắng | 25532 | 25542 | 25562 | 25592 | 25622 | 25672 |
| Cáp Đại Bá | 25971 | 26091 | 26371 | 26401 | 26411 | 26431 |
| Lỗ Chí Sinh | 25782 | 25972 | 26092 | 26372 | 26402 | 26412 |


Tạo bằng hàng đợi quà `pet <ID>` (NetCo4/quatang.lua). 48 con, đều cấp 95, biến dị, trưởng thành 1459. Cột "pet nền" là ngoại hình gốc bảng tham chiếu.

**Cột Kiểu (01/10):** kiểu tấn công = chữ Ngoại/Nội trên bảng pet trong game. Engine lấy từ `MonsterAttrExTable.txt` cột 62 "Công kích đặc tính ID" của dòng quái **cùng ID với pet** (`AttackTraits.txt`: 11 = Ngoại công, 12 = Nội công, 13 = Cân bằng). Kiểu đi theo pet nền, tư chất không đổi được kiểu. Bản V2 hiển thị kiểu của bản gốc; 36 ID V2 không có dòng quái riêng và 18 ID V2 (315xx) trùng ID quái phó bản thật, chủ server chốt 01/10 **không sửa**, chỉ hiển thị. Panel GM ghi kiểu sau tên trong ô chọn pet.

| ID pet | Dạng boss | Pet nền | Kiểu |
|---|---|---|---|
| 25351 | Tần Vương | Kỳ Lân | Ngoại công |
| 25352 | Quan Thắng | Kỳ Lân | Ngoại công |
| 25361 | Viễn Cổ Kỳ Hồn | Giao Long | Nội công |
| 25362 | Tống Khương | Giao Long | Nội công |
| 25371 | Viễn Cổ Kỳ Hồn | Áp Chủy Thú | Nội công |
| 25372 | Tống Khương | Áp Chủy Thú | Nội công |
| 25381 | Tần Vương | Tuyết Hồ | Ngoại công |
| 25382 | Quan Thắng | Tuyết Hồ | Ngoại công |
| 25391 | Tần Vương | Long Miêu | Ngoại công |
| 25392 | Quan Thắng | Long Miêu | Ngoại công |
| 25401 | Viễn Cổ Kỳ Hồn | Tê Điểu | Nội công |
| 25402 | Tống Khương | Tê Điểu | Nội công |
| 25411 | Cáp Đại Bá | Hùng Miêu | Cân bằng |
| 25412 | Lỗ Chí Sinh | Hùng Miêu | Cân bằng |
| 25421 | Tần Vương | Bàng Giải | Ngoại công |
| 25422 | Quan Thắng | Bàng Giải | Ngoại công |
| 25431 | Viễn Cổ Kỳ Hồn | Hồ Điệp | Nội công |
| 25432 | Tống Khương | Hồ Điệp | Nội công |
| 25441 | Cáp Đại Bá | Oa Ngưu | Cân bằng |
| 25442 | Lỗ Chí Sinh | Oa Ngưu | Cân bằng |
| 25451 | Tần Vương | Hạt Tử | Ngoại công |
| 25452 | Quan Thắng | Hạt Tử | Ngoại công |
| 25461 | Cáp Đại Bá | Xuyên Sơn Giáp | Cân bằng |
| 25462 | Lỗ Chí Sinh | Xuyên Sơn Giáp | Cân bằng |
| 25471 | Cáp Đại Bá | Huyền Giáp Lôi Xà | Cân bằng |
| 25472 | Lỗ Chí Sinh | Huyền Giáp Lôi Xà | Cân bằng |
| 25481 | Viễn Cổ Kỳ Hồn | Đương Hỗ | Nội công |
| 25482 | Tống Khương | Đương Hỗ | Nội công |
| 25491 | Tần Vương | Hải Đạo Thử | Ngoại công |
| 25492 | Quan Thắng | Hải Đạo Thử | Ngoại công |
| 25501 | Viễn Cổ Kỳ Hồn | Bảo Tương Đồng Tử | Nội công |
| 25502 | Tống Khương | Bảo Tương Đồng Tử | Nội công |
| 25511 | Viễn Cổ Kỳ Hồn | Thụ Đại Hùng | Nội công |
| 25512 | Tống Khương | Thụ Đại Hùng | Nội công |
| 25521 | Tần Vương | Hoan Nhạc Trư | Ngoại công |
| 25522 | Quan Thắng | Hoan Nhạc Trư | Ngoại công |
| 25531 | Tần Vương | Đường Trang Thử | Ngoại công |
| 25532 | Quan Thắng | Đường Trang Thử | Ngoại công |
| 25541 | Tần Vương | Niên Thú | Ngoại công |
| 25542 | Quan Thắng | Niên Thú | Ngoại công |
| 25551 | Viễn Cổ Kỳ Hồn | Uyên Ương | Nội công |
| 25552 | Tống Khương | Uyên Ương | Nội công |
| 25561 | Tần Vương | Cùng Kỳ | Ngoại công |
| 25562 | Quan Thắng | Cùng Kỳ | Ngoại công |
| 25571 | Viễn Cổ Kỳ Hồn | Tiểu Hồ Tiên | Nội công |
| 25572 | Tống Khương | Tiểu Hồ Tiên | Nội công |
| 25581 | Viễn Cổ Kỳ Hồn | Bỉ Dực Điểu | Nội công |
| 25582 | Tống Khương | Bỉ Dực Điểu | Nội công |
| 25001 | Băng Yêu (cấp 85, TT 1357) | Băng Yêu | Nội công |
| 25002 | Công Tôn Thánh (cấp 85, TT 1357) | Công Tôn Thánh | Nội công |
| 25011 | Tôn Mỹ Mỹ (cấp 85, TT 1357) | Tôn Mỹ Mỹ | Ngoại công |
| 25012 | Lâm Sung (cấp 85, TT 1357) | Lâm Sung | Ngoại công |
| 25021 | Thủy Phỉ Đầu Lãnh (cấp 85, TT 1357) | Thủy Phỉ Đầu Lãnh | Cân bằng |
| 25022 | Lộ Quân Dật (cấp 85, TT 1357) | Lộ Quân Dật | Cân bằng |

Các ID khác trong PetAttrTable cũng phát được (vd 24602 Tuyền Linh Nhân Ngẫu trưởng thành 1896 - KHÔNG phát, lệch cân bằng). Trứng pet event thường bán sẵn 20.000 KNB ở Hồ Ca → Mua Thương Phẩm → tab Trân thú.

## Bản V2 (30/09 tối): cùng ngoại hình, tư chất BÌNH THƯỜNG (giá trị gốc, không 12000)

ID = ID gốc **+ 10000** (25351 → 31351 …), tên thêm " V2", cùng họ nên ngoại hình y hệt; 5 tư chất chuẩn lấy đúng bản gốc ChangYou (vd Tần Vương/Kỳ Lân 3988/3375/2148/2760/2148), trưởng thành như gốc. Phát qua panel loại Pet như bản 12000. Cần restart game (bảng .txt).

| ID V2 | Dạng boss | Pet nền | Tư chất lực/thể/linh/thân/định | Kiểu |
|---|---|---|---|---|
| 31351 | Tần Vương | Kỳ Lân | 3988/3375/2148/2760/2148 | Ngoại công |
| 31352 | Quan Thắng | Kỳ Lân | 4133/3495/2225/2860/2225 | Ngoại công |
| 31361 | Viễn Cổ Kỳ Hồn | Giao Long | 2148/2453/3988/2453/3375 | Nội công |
| 31362 | Tống Khương | Giao Long | 2225/2543/4133/2543/3495 | Nội công |
| 31371 | Viễn Cổ Kỳ Hồn | Áp Chủy Thú | 2148/2453/3988/2453/3375 | Nội công |
| 31372 | Tống Khương | Áp Chủy Thú | 2225/2543/4133/2543/3495 | Nội công |
| 31381 | Tần Vương | Tuyết Hồ | 3068/2760/2453/3988/2148 | Ngoại công |
| 31382 | Quan Thắng | Tuyết Hồ | 3178/2860/2543/4133/2225 | Ngoại công |
| 31391 | Tần Vương | Long Miêu | 4233/3160/1533/2760/2148 | Ngoại công |
| 31392 | Quan Thắng | Long Miêu | 4385/3273/1588/2860/2225 | Ngoại công |
| 31401 | Viễn Cổ Kỳ Hồn | Tê Điểu | 2148/2453/3988/2453/3375 | Nội công |
| 31402 | Tống Khương | Tê Điểu | 2225/2543/4133/2543/3495 | Nội công |
| 31411 | Cáp Đại Bá | Hùng Miêu | 2453/4295/2148/1840/2453 | Cân bằng |
| 31412 | Lỗ Chí Sinh | Hùng Miêu | 2543/4450/2225/1908/2543 | Cân bằng |
| 31421 | Tần Vương | Bàng Giải | 3988/3375/2148/2760/2148 | Ngoại công |
| 31422 | Quan Thắng | Bàng Giải | 4133/3495/2225/2860/2225 | Ngoại công |
| 31431 | Viễn Cổ Kỳ Hồn | Hồ Điệp | 2148/2453/3988/2453/3375 | Nội công |
| 31432 | Tống Khương | Hồ Điệp | 2225/2543/4133/2543/3495 | Nội công |
| 31441 | Cáp Đại Bá | Oa Ngưu | 2760/3988/2453/2453/2760 | Cân bằng |
| 31442 | Lỗ Chí Sinh | Oa Ngưu | 2860/4133/2543/2543/2860 | Cân bằng |
| 31451 | Tần Vương | Hạt Tử | 3988/3375/2148/2760/2148 | Ngoại công |
| 31452 | Quan Thắng | Hạt Tử | 4133/3495/2225/2860/2225 | Ngoại công |
| 31461 | Cáp Đại Bá | Xuyên Sơn Giáp | 2760/3988/2453/2453/2760 | Cân bằng |
| 31462 | Lỗ Chí Sinh | Xuyên Sơn Giáp | 2860/4133/2543/2543/2860 | Cân bằng |
| 31471 | Cáp Đại Bá | Huyền Giáp Lôi Xà | 2760/3988/2453/2453/2760 | Cân bằng |
| 31472 | Lỗ Chí Sinh | Huyền Giáp Lôi Xà | 2860/4133/2543/2543/2860 | Cân bằng |
| 31481 | Viễn Cổ Kỳ Hồn | Đương Hỗ | 2148/2453/4173/2453/3375 | Nội công |
| 31482 | Tống Khương | Đương Hỗ | 2225/2543/4323/2543/3495 | Nội công |
| 31491 | Tần Vương | Hải Đạo Thử | 3988/3375/2148/2760/2148 | Ngoại công |
| 31492 | Quan Thắng | Hải Đạo Thử | 4133/3495/2225/2860/2225 | Ngoại công |
| 31501 | Viễn Cổ Kỳ Hồn | Bảo Tương Đồng Tử | 2148/2453/3988/2453/3375 | Nội công ⚠ trùng ID quái phó bản |
| 31502 | Tống Khương | Bảo Tương Đồng Tử | 2225/2543/4133/2543/3495 | Nội công ⚠ trùng ID quái phó bản |
| 31511 | Viễn Cổ Kỳ Hồn | Thụ Đại Hùng | 1533/2363/4265/2453/3068 | Nội công ⚠ trùng ID quái phó bản |
| 31512 | Tống Khương | Thụ Đại Hùng | 1588/2448/4418/2543/3178 | Nội công ⚠ trùng ID quái phó bản |
| 31521 | Tần Vương | Hoan Nhạc Trư | 3988/3375/2148/2760/2148 | Ngoại công ⚠ trùng ID quái phó bản |
| 31522 | Quan Thắng | Hoan Nhạc Trư | 4133/3495/2225/2860/2225 | Ngoại công ⚠ trùng ID quái phó bản |
| 31531 | Tần Vương | Đường Trang Thử | 3988/3375/2148/2760/2148 | Ngoại công ⚠ trùng ID quái phó bản |
| 31532 | Quan Thắng | Đường Trang Thử | 4133/3495/2225/2860/2225 | Ngoại công ⚠ trùng ID quái phó bản |
| 31541 | Tần Vương | Niên Thú | 4295/3068/1533/2760/2148 | Ngoại công ⚠ trùng ID quái phó bản |
| 31542 | Quan Thắng | Niên Thú | 4450/3178/1588/2860/2225 | Ngoại công ⚠ trùng ID quái phó bản |
| 31551 | Viễn Cổ Kỳ Hồn | Uyên Ương | 2148/2453/3988/2453/3375 | Nội công ⚠ trùng ID quái phó bản |
| 31552 | Tống Khương | Uyên Ương | 2225/2543/4133/2543/3495 | Nội công ⚠ trùng ID quái phó bản |
| 31561 | Tần Vương | Cùng Kỳ | 4295/3068/1533/2760/2148 | Ngoại công ⚠ trùng ID quái phó bản |
| 31562 | Quan Thắng | Cùng Kỳ | 4450/3178/1588/2860/2225 | Ngoại công ⚠ trùng ID quái phó bản |
| 31571 | Viễn Cổ Kỳ Hồn | Tiểu Hồ Tiên | 1533/2300/4325/2453/3068 | Nội công ⚠ trùng ID quái phó bản |
| 31572 | Tống Khương | Tiểu Hồ Tiên | 1588/2383/4483/2543/3178 | Nội công ⚠ trùng ID quái phó bản |
| 31581 | Viễn Cổ Kỳ Hồn | Bỉ Dực Điểu | 2148/2453/4173/2453/3375 | Nội công ⚠ trùng ID quái phó bản |
| 31582 | Tống Khương | Bỉ Dực Điểu | 2225/2543/4323/2543/3495 | Nội công ⚠ trùng ID quái phó bản |
| 31001 | Băng Yêu (cấp 85, TT 1357) | Băng Yêu | 2083/2380/3870/2380/3275 | Nội công |
| 31002 | Công Tôn Thánh (cấp 85, TT 1357) | Công Tôn Thánh | 2168/2478/4028/2478/3408 | Nội công |
| 31011 | Tôn Mỹ Mỹ (cấp 85, TT 1357) | Tôn Mỹ Mỹ | 3870/3275/2083/2678/2083 | Ngoại công |
| 31012 | Lâm Sung (cấp 85, TT 1357) | Lâm Sung | 4028/3408/2168/2788/2168 | Ngoại công |
| 31021 | Thủy Phỉ Đầu Lãnh (cấp 85, TT 1357) | Thủy Phỉ Đầu Lãnh | 2678/3870/2380/2380/2678 | Cân bằng |
| 31022 | Lộ Quân Dật (cấp 85, TT 1357) | Lộ Quân Dật | 2788/4028/2478/2478/2788 | Cân bằng |

**Phát trên panel (30/09 tối):** panel GM (`panel.py`) và tab 🛠️ GM trên admin.netco4.click có 3 loại quà pet, **cùng ô chọn theo tên** (không nhập ID): **Pet Huyễn Hóa 12000 (admin cấp)** = ID 253xx, **Pet Huyễn Hóa V2 (chỉ số bình thường)** = ID 353xx, **Pet khác (tất cả)** = 6.320 pet gốc (tên Hán-Việt + cấp + trưởng thành, từ `docs/pet-danh-sach.tsv`). Web tải danh sách 1 lần qua `/api/gm/pets` → panel.py `/api/pets`.

**Vì sao tư chất không đúng 12000 mà lẻ (12602, 12755…):** khi tạo pet, engine nhân tư chất chuẩn với bậc phẩm chất ngẫu nhiên `PerParam0–10` (×1.000–1.404) và cộng dao động `IntelligenceRange=50` (`Server/Config/PetConfigTable.ini`, đang bản gốc). Muốn đúng 12000 phải đặt mọi `PerParam*=1.000` và `IntelligenceRange=0` → **mọi pet trên server mất ngẫu nhiên** (phiên chiều 30/09 đã thử rồi trả về). Chưa quyết.

**30/09 tối: thêm 6 skin cấp 85** (đủ 12 skin boss của game): Băng Yêu 25001, Công Tôn Thánh 25002, Tôn Mỹ Mỹ 25011, Lâm Sung 25012, Thủy Phỉ Đầu Lãnh 25021, Lộ Quân Dật 25022 (bản 12000) và +6000 (bản V2 = gốc + 6000, tư chất gốc). Cấp mang 85, trưởng thành 1357 giữ như gốc.
