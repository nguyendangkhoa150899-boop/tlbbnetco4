# Sổ cân bằng gameplay NetCo4

Mọi lần đổi sức mạnh: chiêu, boss, tỉ lệ chế, trang bị, nhịp phó bản, tài nguyên.
Dùng sổ này để biết đã chỉnh gì, chỉnh bao nhiêu lần, số trước / sau, cái gì **chưa đo**, và trả lại bằng tag nào.

**Quy ước:** mỗi lần đổi cân bằng thì thêm hoặc sửa mục ở đây, cùng commit với thay đổi. Mỗi mục ghi:
- số trước → sau;
- file / dòng / cột đã sửa;
- tag rollback;
- lý do (ai yêu cầu);
- "Chưa đo" cho những gì chưa kiểm trong game. Đo được rồi thì ghi kết quả vào.

Chi tiết deploy và lịch sử từng ngày vẫn ở `docs/TRANG-THAI.md`. Luật rơi phiếu và ngọc 6 ở `CLAUDE.md`, không chép lại ở đây.

---

## 0. Nền chung của server (đọc trước khi cân bất cứ thứ gì)

| | Giá trị | Ở đâu |
|---|---|---|
| Người chơi | ~6–10, tổ 6 người cấp 89 là nhóm chủ lực | |
| Khóa cấp | **89** | panel GM, `Server/txt/NetCo4Cfg/capmax.txt` (ngoài repo) |
| EXP | **×5** (repo ghi ×12, panel ghi đè) | panel GM, `expparam.txt` (ngoài repo) |
| Rơi đồ boss | mỗi thành viên tự roll, ×2 DropParam, không giảm theo chênh cấp | `CLAUDE.md` quy tắc 6 |
| Phó bản | 45 phút (Sát Tinh: 900 nhịp × 3 giây) | TRANG-THAI 03/10 |

Hệ quả cần nhớ:
- Người chơi đều ở cấp 89, nên mọi thứ cân theo mốc 89. Chiêu / tâm pháp mở ở cấp 90+ (Hạo Thiên Chân Kinh) hiện **không học được**.
- Ít người chơi: một thay đổi mạnh cho 1 phái thấy ngay trong PK. Nên đổi từng bước, đo rồi mới chỉnh tiếp.

---

## 1. Chiêu thức môn phái

### Bộ Bộ Sinh Hoa (Tiêu Dao) — 08/10, chủ server yêu cầu

- **Sách:** Yếu Quyết: Bộ Bộ Sinh Hoa `30307227`, cấp 80, tâm pháp 63 (Bắc Minh Thần Công).
- **Đổi:** sát thương **×4** + hồi chiêu **120 giây → 50 giây**.
- **Commit / tag:** game `07bd473` (sát thương) + `2e77796` (hồi chiêu). Rollback tag `truoc-bubu-08-10`. Cả 2 là bảng `.txt`, cần restart.

**Chuỗi dữ liệu.** Muốn chỉnh tiếp thì sửa đúng tầng; tầng khác chỉ là hình ảnh hoặc chữ.

```
skillbook.lua: 30307227 → chiêu 544 (SkillTemplate_V1)
SkillTemplate 544 → SkillData_V1 3470..3481 (cấp 1..12)
  cột 7 = hồi chiêu (ms)                  ← ĐÃ SỬA 120000 → 50000 (cả 12 dòng)
  hiệu ứng 790
StandardImpact 790 "步步生花": 30 giây, mỗi 3 giây kích 777 (→ 10 lần mỗi lần dùng)
StandardImpact 777 → script 808230 (MyNew/Skill/Bubushenghua.lua)
  đặt 1 bẫy SpecialObjData: 151 (thường) / 231, 331 (biến thể, có 24% / 100% gây choáng 754)
  bẫy: tồn tại 30 giây, kích 1 lần, bán kính kích 2, bán kính nổ 3, tối đa 3 mục tiêu
StandardImpact 793 "步步生花陷阱伤害" (logic 001 = sát thương trực tiếp) ← ĐÃ SỬA
  cột 29 sát thương cố định: 5030 → 20120
  cột 30 hệ số:              10   → 40
```

- **Mọi cấp chiêu đều dùng chung 793.** Số `{A:141..1526 B:10}` trong mô tả chiêu chỉ là chữ trong client, server không dùng. Lên cấp chiêu không tăng sát thương bẫy; tăng cấp chỉ đổi lượng MP tiêu hao (cột 12).
- **Cùng dạng với Phá Thiên Thức** (925–940: `2000…21000 / 10`). Chưa rõ hệ số nhân với cái gì (công nội? cấp?). Vì vậy nhân 4 cả hai tham số để chắc chắn ra ×4, nếu công thức tuyến tính.
- **Không ảnh hưởng chiêu khác:** chỉ 6 bẫy 151/152/231/232/331/332 dùng 793. Dòng 9169 Đại Tần Phong Đích chỉ mượn 793 làm hình ảnh.
- **Sức mạnh thực tế tăng ~9,6 lần, không phải 4.**
  - Trước: 10 bẫy / 120 giây.
  - Sau: 10 bẫy / 50 giây, mỗi bẫy ×4 → 4 × 120/50 = **×9,6** sát thương theo thời gian.
  - Thời gian có bẫy trên sân: 30/120 = 25% → 30/50 = **60%**.
- **Chưa đo:**
  - Sát thương thật mỗi bẫy trước / sau, trên cùng 1 con quái và cùng nhân vật.
  - Client có tự chặn theo 120 giây ghi trong bảng chiêu của nó không. Thử: dùng chiêu, đúng 50 giây sau dùng lại.
  - Tooltip vẫn ghi 120 giây và số cũ (bảng của client, không sửa được từ server). Cần báo trước cho người chơi.
  - Ảnh hưởng PK: chưa có ai phản hồi.
- **Muốn chỉnh tiếp:**
  - Sát thương: sửa cột 29/30 dòng 793 trong `Server/Config/StandardImpact.txt` (scratchpad `bubu-x4.js`, sửa theo byte latin1).
  - Hồi chiêu: sửa cột 7 dòng 3470–3481 trong `Public/Config/SkillData_V1.txt` (scratchpad `bubu-cd50.js`).
  - Số lần nổ: sửa StandardImpact 790 cột thời lượng / chu kỳ (30000 / 3000).
  - Số mục tiêu mỗi bẫy: sửa SpecialObjData cột 23 (đang 3).

### Cách lần ra số sát thương của một chiêu bất kỳ (dùng lại được)

1. `skillbook.lua`: ID sách → `id` chiêu (SkillTemplate).
2. `SkillTemplate_V1.txt`: dòng chiêu, cuối dòng có các mã cấp → `SkillData_V1.txt`.
3. `SkillData_V1`: cột 7 hồi chiêu, cột 12 MP, sau đó là các hiệu ứng ("生效一次的附加效果") → mã `StandardImpact`.
4. `Server/Config/StandardImpact.txt`: logic `001` = sát thương trực tiếp ("伤害数值+" cố định / hệ số). Logic `010` = kích định kỳ. Logic `090` = gọi script (cột "脚本ID").
5. Script đặt bẫy / vật → `Public/Config/SpecialObjData.txt` (cột 30, 34, 36 = các hiệu ứng) → quay lại bước 4.
6. Đọc chữ Trung trong bảng bằng `iconv -f GBK -t UTF-8 -c`. Sửa bảng bằng Node latin1, kiểm `git diff` chỉ đúng dòng / cột cần đổi.

---

## 2. Boss

### Sát Tinh (Sinh Tử Lôi Đài, 12 boss) — nerf 06/10 khuya

- `MonsterAttrExTable.txt`, 11 DataID 13447…13537. DataID 13456 dùng chung cho Ngô Dụng + Tống Giang.
- **Máu ×0,4** (từ 90% gốc → 36% gốc). Lần đầu nerf −40%, chủ server tăng lên −60%.
- **Công ×0,7**: công ngoại, công nội, 4 hệ (chỉ 13492), MaxAtt, MaxMag.
- **Không đổi:** phòng, né, chính xác, tốc đánh.
- Lộ Quân Dật 13465 (boss khó nhất, giữ phần thưởng 5 phiếu/người):
  - máu 5.858.265 → 2.343.306;
  - công ngoại 145.047 → 101.532;
  - công nội 25.047 → 17.532.
- Ngô Dụng / Tống Giang: 8,79 triệu → 3,51 triệu máu. 9 boss còn lại 0,65–0,87 triệu.
- **Chưa đo:** phần sát thương cộng thẳng trong impact kỹ năng boss (nếu có) không giảm theo công. Thời gian hạ thực tế sau nerf.
- Công cụ `tools/sattinh-nerf-06-10.js`. Rollback tag `truoc-sattinh-nerf-06-10`.
- `tools/mau-boss.js` chạy lại sẽ bỏ qua 11 dòng này. Đúng ý, đừng ép.

---

## 3. Chế đồ: cấp phẩm chất theo vật liệu (`Server/Config/ItemSegAffect.txt`)

**Cơ chế:**
- `ItemSegQuality.txt` cột "N级材料三精_<vị trí>" trỏ tới mã `ItemSegAffect`.
- Mỗi mã có trọng số C1..C9 trên 1000.
- Vật liệu 6 / 7 / 8 = mã 240–249 / 250–259 / 260–269 (quy tắc EquipBase cột 90 từ 10 đến 19).
- Cấp phẩm chất lưu trên món lúc chế: đồ cũ giữ nguyên. Cần restart.
- Công cụ: `tools/pc-vatlieu-06-10b.js`, xem bảng bằng `tools/tile-che.js`.

**Vật liệu cấp 8 (Miên Bố 8, Bí Ngân 8…): đã đổi 7 lần trong 06–07/10.**

| Lúc | C5 | C6 | C7 | C8 | C9 | Cấp TB | Tag (trả về bản trước) |
|---|---|---|---|---|---|---|---|
| Gốc server | | | | | 100% | 9,00 | |
| 06/10 14:14 | | | 40% | 52% | 8% | | `truoc-pc-vatlieu8-06-10` |
| 06/10 tối (nerf) | 14,5% | 45% | 38% | 2% | 0,5% | 6,29 | `truoc-pc-vatlieu-06-10b` |
| 06/10 khuya (buff) | | 35% | 50% | 10% | 5% | 6,85 | `truoc-pc-vatlieu-buff-06-10` |
| 06/10 khuya | | | 50% | 45% | 5% | 7,55 | |
| 07/10 | | | 30% | 60% | 10% | ~7,8 | `truoc-pc-vl8-30-60-10-07-10` |
| 07/10 | | | 20% | 40% | 40% | ~8,2 | `truoc-pc-vl8-20-40-40-07-10` |
| 07/10 | | | | 50% | 50% | 8,5 | `truoc-pc-vl8-50-50-07-10` |
| **07/10 CHỐT** | | | | **65%** | **35%** | 8,35 | `truoc-pc-vl8-65-35-07-10` |

- **Đi kèm:** túi đồ boss cho Miên Bố 8 / Bí Ngân 8 tăng từ ×2–3 lên **×3–6 mỗi lượt** (06/10 tối, cả 16 hoạt động). VL8 dư dả + 35% ra C9 nghĩa là khoảng 3 lần chế ra 1 món C9.
- **VL6 / VL7** (06/10 khuya buff, chưa đổi lại):
  - VL6 = C5 25 / C6 50 / C7 22 / C8 2,5 / C9 0,5%;
  - VL7 = C5 10 / C6 45 / C7 38 / C8 5 / C9 2%.
- **VL1–5:** C8 ≤ 0,1%, C9 = 0.
- **Còn lệch chưa xử lý:**
  - VL1–2 ra C7 18% (cao hơn VL5–6).
  - Ô "vật liệu cấp 2 × Nhẫn" trỏ nhầm mã (xem TRANG-THAI 06/10 14:14).
- **Bài học:** 7 lần đổi trong ~12 giờ. Lần sau chốt mục tiêu bằng một con số trước, ví dụ "trung bình N lần chế ra 1 món C9", rồi mới đặt tỉ lệ.

---

## 4. Trang bị

- **Đục lỗ 4 miễn phí (NPC Quách Kiến An, `obj/luoyang/oluoyang_penghuaiyu.lua` menu 2021, `tEquipGemTable`):**
  - Gốc: miễn phí cho Lệnh Bài 9 / Võ Hồn 10 / Ám Khí 17 / Long Văn 18.
  - 03/10: **tắt hẳn**, tag `truoc-tat-lo4free-03-10`.
  - 08/10: bật lại **chỉ Long Văn** (`12cc1a2`), tag `truoc-lo4-longvan-08-10`.
  - 08/10: **Long Văn + Võ Hồn** (`18b7673`), tag `truoc-lo4-vohon-08-10`.
  - 08/10: **Long Văn + Võ Hồn + Lệnh Bài** (`tEquipGemTable = {9,10,18}`), tag `truoc-lo4-lenhbai-08-10`.
  - 08/10: **+ Tọa Kỵ** (`{8,9,10,18}`), tag `truoc-lo4-toaky-08-10`. Bảng client "Đục Lỗ Cực Hạn" (`stiletto.lua` có nhánh loại 8, 1 Kim Chi Tiễn / Hàn Ngọc Tinh Túy + 3.000 vàng) **không cho kéo tọa kỵ vào** → dùng đường NPC quét túi. Trước đó 93 lần đục lỗ 4 trong Audit, 0 lần tọa kỵ. **Chưa đo:** client có hiện / cho khảm ô 4 trên tọa kỵ không.
  - Ám Khí vẫn phải dùng Kim Chi Tiễn: Điểm Kim Chi Tiễn 20109101 = 20.000 KNB (03/10).
  - **Chưa đo:** Võ Hồn cấp 8 chưa có `&WH` có nhận lỗ qua đường này không.
- **Thú cưỡi 10141214** (幻雪羊驼): quy tắc phẩm chất 7 → **9** (07/10).
  - Tốc độ vẫn +100%; 10141215/16 là +120%.
  - Chỉ món tạo sau restart mới là C9.
  - Tag `truoc-thucuoi-c9-07-10`.

- **Trùng Lâu → Chân Trùng Lâu (08/10):** NPC Tuyết Phi Phi (Lạc Dương 218,318, script 112000 `MyNew/duihuanxitong.lua`).
  - Server (`wuyazi85o.lua` 895111 nhánh 36) nhận 10553100 / 101 / 102 (Liên / Giới / Ngọc), 106 (Đai), 108 (Vai), 110 (Giáp), 112–114. Trừ **250** Thiên Địa Huyền Tinh (100 → 500 → 250 trong 08/10. 500 không dùng được: bảng 21090722 đòi 1 chồng kéo vào ô ≥ số trên bảng, mà chồng tối đa 250 → **trần thực tế 250**, muốn hơn phải sửa server riêng, giữ số trên bảng ≤ 250. Tag `truoc-trunglau-250-08-10`) 39901012, không tốn vàng. Giữ lỗ, đá, cường hóa, người chế, khóa, ràng buộc; xóa món cũ.
  - **Trùng Lâu cũ (1042xxxx, 08/10 `899a625`, tag `truoc-trunglau-cu-08-10`):** Giới 10422016 / 018 → Chân Giới **10553104**, Ngọc 10423024 / 026 → Chân Ngọc **10553105**, cùng số Huyền Tinh. So sánh (EquipBase): bản cũ công cơ bản 331, 7–16 dòng mức thấp, không bộ, khống chế **15 giây**; Chân dòng mới công **886**, +4 dòng giảm kháng 4 hệ, bộ 156, 13–16 dòng mức cao (đoạn 4321), khống chế **10 giây** → mạnh hơn rõ, chỉ ngắn khống chế. Thuộc tính được tung lại khi nâng. Chân Ngọc cũ 10423025 (20 giây, công 331, 9 dòng) không đổi. Bảng nâng nhận dải ID 10422016–10553114: client cho kéo mọi trang bị trong dải, server từ chối món sai ("Bỏ vào trọng lâu").
  - Bảng client cũ 20150511 chỉ nhận Liên / Giới / Ngọc và ghi "800 cái" → Đai / Vai / Giáp không kéo vào được. 08/10 đổi sang bảng chung 21090722 (game `ffe02f7`, tag `truoc-trunglau-ui-08-10`).
  - **Huyền Tinh chỉ admin phát** (gỡ khỏi shop kệ 212 ngày 08/10, tag `truoc-go-huyentinh-08-10`). Còn Rương Thiên Tam Thần 1/5 mỗi lần mở (chìa 100.000 KNB).
  - Tẩy Chân Trùng Lâu: 1 Ma Huyết Thạch 30505813 + 100 vàng (nhánh 23). Bảng tẩy truyền "cần 13" nguyên liệu và hiện 80 vàng (`duihuanxitong.lua` menu 5500), server chỉ trừ 1 viên và 100 vàng. **Chưa đo:** client có đòi đủ 13 viên mới cho bấm không.
  - Lúc sửa: 4 nhân vật (1010100014 / 016 / 017 / 018) đều có Trùng Lâu Đai 10553106, chưa ai nâng.

- **Soát toàn bộ Trùng Lâu 08/10** (so bản gốc `651afc2` / repo / prod; công cụ scratchpad `trunglau-audit/soat.js`, `con.js`):
  - 20 dòng EquipBase, bộ 155 / 156, đoạn thuộc tính 100 / 4321: **giống gốc**, prod = repo.
  - Hiệu ứng thần khí: giống gốc, **trừ 7506** (Phá Quân Trùng Lâu Đai) 15000 → 5000 ms, chủ server yêu cầu 01/10 (`9649d6b`, tag `truoc-trunglau-dai-01-10`).
  - Số thật (tỉ lệ kích hoạt % khi đánh trúng / thời gian hiệu ứng con):

    | Món | Thường | Chân |
    |---|---|---|
    | Giới cũ 10422016/018 (Vọng Nguyệt) | 3% / **20 giây** (tooltip ghi 15) | không có |
    | Ngọc cũ 10423024/026 (Nghịch Thiên) | 3% / 20 giây | 10423025: **2%** / 20 giây (tooltip "tỉ lệ cao hơn" nhưng thật thấp hơn - lỗi dữ liệu gốc) |
    | Liên 10553100 (Già Mục) | 2% / 5 giây | 10553103: 4% / 10 giây |
    | Giới 10553101 (Vọng Nguyệt) | 2% / 5 giây | 10553104: 4% / 10 giây |
    | Ngọc 10553102 (Nghịch Thiên) | 2% / 5 giây | 10553105: 4% / 10 giây |
    | **Đai 10553106 (Phá Quân, bỏ qua phòng thủ)** | 3% / **5 giây** (gốc 15) | 10553107: **6% / 30 giây** (chưa nerf) |
    | Vai 10553108 (giảm miễn) | miễn 15% | 10553109: 30% |
    | Giáp 10553110 (phản đòn) | phản 15%, trần 150.000 | 10553111: 30%, trần 300.000 |

  - **Lệch lớn nhất:** Đai thường đã nerf còn 5 giây, Chân Đai vẫn **30 giây** và tỉ lệ gấp đôi → nâng Đai lên Chân = Phá Quân ×6 thời gian ×2 tỉ lệ. Chờ chủ server quyết.

- **Từ 08/10 chỉnh Trùng Lâu dòng mới qua trang admin 🐉 Custom Trùng Lâu** (dòng, điểm, tỉ lệ, thời gian): `docs/TRUNG-LAU-CUSTOM.md`. Số trong bảng trên là bản gốc; số đang chạy xem trên trang.

---

## 5. Tu luyện / tài nguyên

- **Công Lực Đan** (`Gonglidan.lua` 390102, đan 39999901): đang **+100, trần 99.999** (bản gốc).
  - 07/10 thử +180.000 (1 viên = 1.800 viên) rồi trả lại ngay.
  - Muốn đổi lại: `node tools/congluc-dan-07-10.js <số> --ghi`.
- **Chi phí full 15 sách tu luyện** (0 → 150): 172.350 công lực, 12,07 tỉ EXP, 670.500 vàng.
- **Chưa sửa, có ảnh hưởng cân bằng:**
  - Hạo Thiên Chân Kinh đòi cấp 90 → khóa 89 không học được.
  - NPC đổi 200 triệu EXP lấy đan đòi cấp 109.
  - `x390101_ReGongLi`: qua ngày **đặt** công lực = 200 (không cộng) → công lực dư mất.

---

## 6. Nhịp hoạt động

| Hoạt động | Đổi | Tag |
|---|---|---|
| Phó bản (chung) | 45 phút | 03/10 |
| Sát Tinh | 18 → 45 phút | 03/10 |
| Lâu Lan Tầm Bảo | tới boss ~28 → ~13 phút (đợt 15 giây, chờ đầu 10 giây, nghỉ 30 giây); mở 24/24, vẫn 1 lượt/ngày | `truoc-lltb-nhip-06-10`, `truoc-lltb-2424-06-10` |
| Túc Cầu | reset 00:00 giờ VN (trước: đủ 24 tiếng) | `truoc-tuccau-00h-06-10` |

---

## 7. Danh sách "chưa đo" (gom lại để kiểm một lượt)

- [ ] Bộ Bộ Sinh Hoa: sát thương bẫy trước / sau; hồi chiêu 50 giây có bị client chặn không; phản hồi PK.
- [ ] Sát Tinh sau nerf: thời gian hạ, tổ có bị đánh chết không.
- [ ] Đục lỗ 4 Võ Hồn cấp 8 chưa có `&WH`.
- [ ] VL8 65 / 35: đếm C8 / C9 thật qua log chế sau ~20 lần.
