# Túi đồ thưởng boss cuối phó bản / hoạt động (01/10 — ĐÃ LÀM, chưa test trong game)

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
- Sát Tinh bang = Sinh Tử Lôi Đài Thủy Hử (`obj/shengsi/shengsileitai.lua`): 12 NPC, khiêu chiến lần lượt từng người (mỗi NPC gọi 1 boss, NPC biến mất sau khi khiêu chiến). NPC Tống Giang (`songjiang.lua`) gọi ra **Ngô Vĩnh 13456** giống NPC Ngô Vĩnh (lỗi server cũ), nên 1 lượt có 2 con 13456.
- PMF, Binh Thánh, Tứ Tuyệt Trang, Thiếu Thất Sơn: có script phó bản riêng (`event/piaomiaofeng*`, `bingshen*`, `sijuezhuang`, `shaoshi`), cần đọc boss cuối từng bản.
- Q Tô Châu / Q Lâu Lan: script quái 1130 / 1129 (`sancaixiagunpc_die.lua`, `yamoshannpc_die.lua`).
- **Chưa xác định:** "Long Quy" (game chỉ có pet Long Quy 3310), "Cờ 12h", "LLTB 11h30" (Lâu Lan Tầm Bảo, NPC Kim Cửu Linh, không có trong lịch `ActivityNotice`), "Ác Tặc" (chỉ có "Ác Tặc Tạo Phản" 473 cấp 50 thường; "Ác Bá" là boss `1910–1919` cấp 13–103).


## ĐÃ LÀM 01/10 tối (game `33d048d` + bot bialk `9682593`) — chủ server đã chốt
**Luồng:** boss cuối chết → game ghi `Server/txt/NetCo4Web/tuiboss.log` (`<unix> TAB <scene> TAB <ID quái> TAB <GUID,...>`) → bot (`BotDoMin/tuiboss.js`, đọc 10 giây/lần) tạo 1 túi cho mỗi GUID, **bốc đồ ngay lúc tạo** → web 🪪 Cá nhân › **🎒 Túi đồ boss** hiện từng túi + nút **Nhận** → đồ vào hàng đợi quà (nhận khi **đổi bản đồ**), **4.000 KNB vào ví web** (sổ KNB loại `tuiboss`). Túi giữ 7 ngày, tối đa 60 túi/người.
- **Ai nhận:** trong phó bản = **mọi người đang trong phó bản** lúc boss cuối chết; ngoài map (Long Quy, Ác Tặc, Ác Bá ngoài phó bản…) = người giết + tổ đội ở gần. Dòng trùng trong 20 giây (cùng scene + boss) gộp lại.
- **Code game:** `NetCo4/roimap.lua` `x950001_TB_Ghi` / `x950001_TB_GhiId` (đặt trong 950001 vì script mới cần restart để đăng ký) + 1 dòng gọi ở đầu 14 hàm: `ai_liqiushui` (PMF 402269, PMF nhỏ 402282, Tứ Tuyệt 893069, Thiếu Thất 890069), `ai_wulaoda` (Binh Thánh 894066 / 895066), `murongfu` 402254, `petdropper` 501000 (Long Quy, **và Sát Tinh**: `shengsileitai` 892009 OnDie gọi 501000 OnDie, nên không gắn thêm ở 892009, gắn 2 chỗ = mỗi boss ghi 2 dòng như lượt 22:57–23:00 ngày 01/10), `seek_treasure` 808039, `oDynamicNPC_ThiefSoldier` 50012 (Ác Tặc), `sancaixiagunpc_die` 1130 (Q Tô Châu), `yamoshannpc_die` 1129 (Q Lâu Lan), `ecity_0402chuckoutvillain` `OnKillObject` (Ác Bá). Boss cuối xác định bằng câu `AddGlobalCountNews` (thông quan) trong hàm chết. Rollback: tag `truoc-tuiboss-01-10`.

| Hoạt động | Boss cuối (ID) | Đồ trong túi (bot `HD` trong `tuiboss.js`) | Trần túi/ngày |
|---|---|---|---|
| Q Tô Châu | Biên Cảnh Đại Vương 4130–4139, 34130–34139 | chung + Cửu Thiên Ngọc Toái ×1 | (lượt game) |
| Q Lâu Lan | boss đợt 5 13220–13229 | chung + Cửu Thiên Ngọc Toái ×1 | |
| Yến Tử Ổ | Mộ Dung Phục 9430–9439, 39430–39432 | chung + TBP3 ×2–3 + Ma Huyết Thạch ×2–5 | |
| Binh Thánh lớn/nhỏ | 15175 / 15073 | chung + Long Văn +5 ×1 + Chuế Long Thạch Nguyên/Bạo/Thương ×10 trộn | |
| Tứ Tuyệt Trang | Bàng Xí 14145 | chung + Thiên/Địa/Mệnh Hồn Ngọc ×10 trộn | |
| PMF thường (nhỏ, cấp 75) | Lý Thu Thủy 9666 | chung + Ngũ Độc Châu ×20 + Giảm Kháng Điêu Văn cấp 6 ×1 (Băng/Hỏa/Huyền/Độc) | |
| PMF khiêu chiến (lớn, cấp 95) | Lý Thu Thủy 9546 | chung + Ngũ Độc Châu ×20 + Điêu Văn Công cấp 5 ×1 (Băng/Hỏa/Huyền/Độc Công) | |
| Sát Tinh | **chỉ Ngô Vĩnh 13456 của NPC Ngô Vĩnh, 1 túi/lượt** (từ 01/10 23:40; trước đó 11 boss = 11 túi/lượt) | chung + Ngũ Độc Châu ×20 + TBP cấp 1–3 ×5 + Ma Huyết Thạch ×1–3 | (3 lượt/ngày) |
| Thiếu Thất Sơn | Đinh Xuân Thu 14234 | chung + CCHTP ×5 | |
| Long Quy (Thánh Thú Sơn) | 11353 | chung + CCHTP ×3 + Chí Tôn Cường Hóa ×5 + CLD ×3–5 | 3 |
| Lâu Lan Tầm Bảo | Trấn Bảo Long Vương 12138–12146 | Vũ Học Tâm Đắc ×15 + Bí Tịch Tàn Hiệt ×10 + Võ Hồn cấp 2–4 ×1 (Ngự Dao Bàn/Lưu Ly Diễm) | 2 |
| Ác Tặc Tạo Phản | 473 (30 con/đợt) | YQ cấp 45 hoặc 80 ×1 + CCHTP ×1–2 + CLD ×1–3 + Hồn Băng Châu cấp 2–4 ×1–3 | 3 |
| Ác Bá | 1910–1919 | YQ cấp 65 hoặc Tiến Cấp ×1 + CCHTP ×1–2 + CLD ×1–3 + Nhuận Hồn Thạch (4 loại × cấp 1/3/5) ×1–3 | 3 |
| Kỳ Cuộc = Cờ 12h (từ 02/10) | Viễn Cổ Kỳ Hồn: thường 1850–1859 / 31850–31859, tân thủ 3 12040–12049 / 42040–42049, tân thủ 6 12090–12099 / 42090–42099 (hook trong khối `objType == LastBoss[mgroup]` của `efuben_1_zhenlong_huodong.lua` 401001 + `efuben_1_zhenlong2_huodong.lua` 401002) | Vũ Học Tâm Đắc ×15 + Bí Tịch Tàn Hiệt ×5 + Võ Hồn cấp 2–4 ×1 (không KNB) | 1 (game cũng chỉ cho 1 lượt/ngày) |
"Chung" = Miên Bố/Bí Ngân 6 ×10 trộn + Phiếu rút thăm `30070501` ×2 + 4.000 KNB (web).

**Giả định tự chốt (đổi được trong `tuiboss.js`):** Cửu Thiên Ngọc Toái ×1; "Điêu văn thuộc tính" = Công nguyên tố; YQ 1 cuốn bốc trong cả 2 cấp (45+80, 65+Tiến Cấp), không phải mỗi cấp 1 cuốn; Lâu Lan Tầm Bảo / Ác Tặc / Ác Bá không có phần "chung" và KNB (danh sách gốc không ghi); trần túi/ngày cho 4 hoạt động không có giới hạn lượt của game. **Chưa test trong game.**

## Sửa cấu hình trên web admin (01/10 tối, bot bialk `7bf10e2`)
Tab **🎒 Túi Boss** ở admin.netco4.click (SUPER) **và** mod.netco4.click: bên trái 13 hoạt động (🟢 bật / ⚫ tắt, ✎ = đã sửa khác mặc định), bên phải bảng món: mỗi dòng gõ **1 ID** (món cố định) hoặc **nhiều ID cách dấu phẩy** (mỗi cái bốc ngẫu nhiên 1 trong đó), **SL từ – đến**; ô KNB, Trần/ngày (0 = không giới hạn), Bật. Ô **🔍 Tìm vật phẩm** theo tên → bấm kết quả để thêm vào dòng đang chọn. **💾 Lưu** kiểm từng ID có trong game, áp cho **túi tạo sau đó** (túi đã có giữ đồ đã bốc). **↩ Về mặc định** xóa bản sửa. **📜 Lịch sử sửa** ghi lúc nào, cổng SUPER/mod + IP, trước → sau (`_tuiBossCfgLog` trong `database.json`, 300 dòng gần nhất). ID boss cuối **không sửa ở web** (phải khớp danh sách trong `roimap.lua` của game). Ngày mở: xóa thêm `_tuiBossCfg` nếu muốn về mặc định; giữ lại nếu đã chỉnh cho server chính.
