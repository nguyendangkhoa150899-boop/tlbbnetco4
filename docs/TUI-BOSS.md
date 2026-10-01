# Túi đồ thưởng boss cuối phó bản / hoạt động (01/10, ĐANG CHỜ CHỐT — chưa code)

Yêu cầu của chủ server (nguyên văn rút gọn): mỗi hoạt động, người giết boss nhận thêm một "túi đồ" gồm các món dưới. Viết tắt: VB = Miên Bố, BN = Bí Ngân, TBP = Thần Binh Phù, CCHTP = Cao cấp Hợp Thành Phù, CLD = Công Lực Đan, YQ = Yếu Quyết (mọi môn phái, **trừ** Thanh Tâm Phổ Thiện Chú Nga My `30307219`).

## Bảng ID đã tra (từ `CommonItem.txt`)

| Viết trong yêu cầu | ID | Ghi chú |
|---|---|---|
| VB / BN cấp 6 | `20501006` / `20502006` | |
| Phiếu rút thăm vòng quay | `30070501` | Hạnh Vận Quả |
| Cửu Thiên Ngọc Toái | `20800033`, `20800034` | 2 ID cùng tên |
| TBP 1 / 2 / 3 | `30505817` / `30505818` / `30505819` | |
| CCHTP | `30900016` | Cao cấp Bảo Thạch Hợp Thành Phù |
| CLD | `39999901` | |
| Cường Hóa Chí Tôn | `38000571` | Chí Tôn Cường Hóa Tinh Hoa |
| Long Văn cấp 5 | `10157005` | "Long Văn +5" (trang bị) |
| Xuyết Nguyên / Bạo / Thương | `20310181` / `20310182` / `20310183` | Chuế Long Thạch |
| Thiên / Địa / Mệnh Hồn Ngọc | `38002045` / `38002043` / `38002041` | |
| Ngũ Độc Châu | `38000448` | còn 6 ID Ngũ Độc Châu-Nguyên Dương/Hồn Vũ/Tinh Mâu `20800039–44` |
| Giảm Kháng cấp 6 | `30110126` Băng · `30110136` Hỏa · `30110146` Huyền · `30110156` Độc | Giảm Kháng … Điêu Văn |
| Điêu văn thuộc tính cấp 5 | `30110005` Thể Lực, `30110025` Nội Lực… (họ 3011xxx5) | |
| Bí Tịch Tàn Hiệt | `38000529` (`38000530` trùng tên) | |
| Hồn Băng Châu cấp 2–4 | `20309102`–`20309104` | |
| Nhuận Hồn Thạch cấp 1/3/5 | Ngự `20310122/124/126`, Kích `20310131/133/135`, … (4 họ × 9 cấp) | |
| YQ cấp 45 | `30307211`–`30307221` (trừ `30307219`), `30308136` | |
| YQ cấp 65 | `30307200`–`30307210`, `30308135` | |
| YQ cấp 80 | `30307222`–`30307232` (+ nhóm `30308112`–`30308134`, có thể là Tiến Cấp) | |
| **Ma Thần Thạch** | **không có** | gần nhất: Ma Huyết Thạch `30505813`, Nữ Oa Thần Thạch `30505814` |
| **Võ Hồn Tâm Đắc** | **không có** | gần nhất: Vũ Học Tâm Đắc `38000531` (+1.000 điểm Bí Tịch) |
| Võ Hồn cấp 2–4 | Ngự Dao Bàn `10156102–104`, Lưu Ly Diễm `10156202–204` | |

## Hoạt động ↔ boss cuối (đã biết)
- Yến Tử Ổ: Mộ Dung Phục `39430–39432` (cấp 100+), script chết `obj/yanziwu/murongfu.lua`.
- Sát Tinh bang = Sinh Tử Lôi Đài Thủy Hử (`obj/shengsi/shengsileitai.lua`, 11 boss, chọn 1/lượt).
- PMF, Binh Thánh, Tứ Tuyệt Trang, Thiếu Thất Sơn: có script phó bản riêng (`event/piaomiaofeng*`, `bingshen*`, `sijuezhuang`, `shaoshi`), cần đọc boss cuối từng bản.
- Q Tô Châu / Q Lâu Lan: script quái 1130 / 1129 (`sancaixiagunpc_die.lua`, `yamoshannpc_die.lua`).
- **Chưa xác định:** "Long Quy" (game chỉ có pet Long Quy 3310), "Cờ 12h", "LLTB 11h30" (Lâu Lan Tầm Bảo, NPC Kim Cửu Linh, không có trong lịch `ActivityNotice`), "Ác Tặc" (chỉ có "Ác Tặc Tạo Phản" 473 cấp 50 thường; "Ác Bá" là boss `1910–1919` cấp 13–103).

## Câu hỏi đã gửi chủ server (01/10 tối) — xem tin nhắn
