# Bot "người giả" (nghiên cứu 07–08/10/2026, tạm dừng để phát triển sau)

Chủ server muốn: server ít người → có bot giống người chơi, mặc đồ, đánh chiêu môn phái, Nga My buff máu,
gặp người chơi thì đánh, chết thì hồi sinh. Tài liệu này ghi lại cơ chế đã tìm ra, những gì đã làm và giới hạn,
để làm tiếp không phải dò lại.

## Trạng thái hiện tại

| | |
|---|---|
| Server thật (`main`) | **Không có bot.** Đã gỡ 07/10 23:5x (commit `6217dd1`, tag trước khi gỡ `truoc-go-botdoi-07-10`). VPS cần `cap-nhat.sh` (không cần restart) để xóa file bot đã chép xuống đĩa. |
| Server test (nhánh `local`, `D:\tlbb-local\code`) | Đội 6 bot quái ở Vô Lượng Sơn 1/2/3 quanh (176, 172), **đánh chiêu môn phái thật**, không xích, tự trị liệu, rút lui về đồng đội, Nga My hồi máu. Commit `0162324`. |
| Công cụ | `tools/botdoi-07-10.js` - **bản đúng nằm ở nhánh `local`** (bản trên `main` là bản cũ, mã tàng hình). |

## Hai cách làm bot và giới hạn của từng cách

### Cách A - Quái đội lốt người (đã làm trên local)

Là quái (`MonsterAttrExTable`) mang tên người, AI viết bằng file `.ai` + Lua. Làm được:
- **Chiêu môn phái thật** có hiệu ứng như người chơi.
- Không bị xích (không bất tử chạy về khi kéo xa).
- Máu < 50% tự trị liệu, máu < 25% chạy về đồng đội rồi quay lại đánh.
- Nga My hồi máu đồng đội.
- Gọi nhau, chết hồi sinh theo `respawn_time` của ini.
- Không exp, không rơi đồ.

**Không làm được (giới hạn engine, binary không có source):**
- **Tạo hình như nhân vật thật:** quái có 1 mã ngoại hình cố định, client tự tra theo bảng quái *của client*. Không có ô trang bị, nên không mặc được áo / vũ khí / thời trang, không có tóc hay mặt. Gần nhất là bộ đồ đệ tử phái (mã quái "Lâu La" / "Đệ tử" của phái).
- **Mana / nộ khí:** quái không có thanh nộ, người chơi không thấy mana của quái.
- **Farm quái:** bot cùng phe 9 với quái nên không đánh quái. Có `SetMonsterFightWithNpcFlag` nhưng chưa thử.

### Cách B - Nhân vật thật + tool auto (chưa làm)

Bot là **nhân vật người đăng nhập bằng client thật**. Ảnh "PM dev1…16" của server khác chủ server gửi 07/10 là kiểu này.

Làm được:
- Tạo hình y như nhân vật, mặc đồ tùy chọn, có mana và nộ, full tâm pháp, mọi chiêu.
- Chủ server đang dùng **Auto Chicken** (`D:\bia\Desktop\AUTOTLBBCONONG\Auto Chicken`, cấu hình `AutoSettings.json` đã có 12 nhân vật NetCo4). Tool có sẵn:
  - tự dùng chiêu (`autoSkillList`, gửi gói `skill.packetId`);
  - tự hồi máu / mana;
  - Nga My buff máu theo danh sách (`autoLotusBuff*`);
  - đi theo đội trưởng (`enableAttackFollowLeader`);
  - đánh trong bán kính một điểm (`attackRadius*`);
  - chết thì tự xử lý (`actionWhenDead`);
  - tự nhận tổ.
- **Thiếu:** không có chế độ tự đánh **người chơi** (PK).

Giá phải trả:
- Mỗi bot là 1 cửa sổ `Game.exe`, khoảng 1GB RAM. Máy nhà có 63GB nên đủ. Máy phải bật 24/7.
- Bot ăn exp, nhặt đồ như người thật → đặt chỗ không có boss.
- **Không chép đồ của nhân vật thật bằng DB trên server thật** (trùng serial món = kiểu lỗi nhân đồ). Trên server thật dùng nhân vật mới, GM phát đồ. Chép y chang chỉ để thử trên local.
- Auto Chicken là tool không rõ nguồn, can thiệp game. Máy nhà giữ khóa root VPS. Nên chạy client bot trong máy ảo riêng.

Ý tưởng cho phần PK, **chưa thử**: `LuaFnUnitUseSkill(scene, đối_tượng, chiêu, mục_tiêu, x, z, 0, 1)` hiện chỉ thấy dùng cho quái. Nếu engine cho dùng với nhân vật người, thì một bộ đếm Lua (timer theo người chơi như `scene.lua`) có thể ép nhân vật bot ra chiêu vào người lạ đứng gần, còn Auto Chicken lo phần còn lại.

Cách C - bot giao thức không cần client (dịch ngược gói tin client 1005): quá tốn công cho server khoảng 10 người, không làm.

**Bước tiếp đã đề xuất (chủ server tạm dừng 08/10):**
1. Trên server test, tạo tài khoản `botbialk`, nhân vật chép nguyên bialk (Tiêu Dao).
2. Bạn mở thêm 1 client test và chạy Auto Chicken cho nó.
3. Thử đoạn Lua ép nhân vật người ra chiêu vào người lạ (phần PK).

## Cơ chế đã tìm ra (quan trọng khi làm tiếp)

1. **Mã quái MỚI bị tàng hình.** Client có bảng quái riêng (nằm nén trong gói `.axp`, không đọc được). Server tạo quái mã 64601–64606 thì vẫn có thật, vẫn đánh chết người, nhưng client không vẽ. Pet Tân Vương trước đây gặp đúng chuyện này. → **Chỉ dùng mã quái có sẵn trong game gốc** rồi ghi đè chỉ số phía server.
   - Mã đang dùng: 2068 Nga My Lâu La 89, 2048 Cái Bang Lâu La 89, 2198 Đệ tử Cái Bang 85, 2108 Tiêu Dao Lâu La 89, 2028 Thiếu Lâm Lâu La 89, 2178 Đệ tử Thiếu Lâm 85.
   - Đã kiểm không có ini / script / drop / bảng nhiệm vụ nào dùng các mã này. Script tìm mã trống: `tim-ma-bot.js` (lọc theo tên phái, hình người cột 65 = 2, không có trong `*_monster.ini`, số trong Lua, `MonsterDropBoxs`).
2. **`AIS_ToSkill(id)` nhận mã MẪU chiêu (`SkillTemplate_V1`)**, không phải mã cấp chiêu (`SkillData_V1`).
   - Lần 1 truyền mã cấp chiêu → quái không ra chiêu, chỉ đánh thường ("như vô phái").
   - Chiêu môn phái thật dùng được cho quái: boss gốc `script301.ai` (Tiêu Dật Phong, Thiếu Lâm 281–309) và `script337/338.ai` ("Hung thần ác sát": Thiếu Lâm 282–305, Cái Bang 342–364) đều làm vậy.
   - Chiêu quái (551–637) thì hiệu ứng giống pet / thú.
   - Mã mẫu chiêu từng phái: Thiếu Lâm 281–307, Cái Bang 341–366, Nga My 401–426, Tiêu Dao 521–546, Minh Giáo 311–336, Võ Đang 371–386 (phái 0/2/4/8/1/3 ở cột 2 `SkillTemplate_V1`).
3. **Xích của quái** nằm ở `Public/Config/MonsterAITable.ini`: `AIPARAM3` = khoảng cách bỏ đuổi, `AIPARAM6`, `AIPARAM9` = có Lua. Nhánh `local` thêm `[AI33]` (`AINUMBER=34`): chủ động, quét 10m, `AIPARAM3`/`AIPARAM6` = 9999999 (không xích), có Lua, gọi đồng bọn.
4. **AI Lua của quái:** base AI có `AIPARAM9=1` + `script_id` trong ini → engine gọi `OnInit`, `OnHeartBeat(scene, self, nTick)`, `OnEnterCombat`, `OnLeaveCombat`, `OnKillCharacter`, `OnDie`. Mẫu: `event/bingshen/ai_hadaba.lua`.
   - Hàm dùng được: `LuaFnUnitUseSkill`, `GetHp` / `GetMaxHp` / `SetHp`, `GetMonsterCount` / `GetMonsterObjID` / `GetMonsterDataID`, `MonsterAI_Get/SetIntParamByIndex`.
   - Chú ý: quái **không** thi chiêu "thân thiện" lên quái khác được. Hồi máu đồng đội phải cộng máu bằng `SetHp`, còn ra chiêu chỉ để có hiệu ứng.
5. **Rút lui:** `AIS_ToFlee(1)` trong `.ai` = chạy về đồng đội gần nhất (boss gốc dùng khi máu < 20%).
6. **Đổi chỉ số không cần restart:** GM gõ `!!RELOADMONSTERATTR`. Thêm quái / ini / `.ai` / `Script.dat` / `MonsterAITable.ini` thì cần restart.
7. **Đặt tên:** ini có trường `name=` (đã điền tên VISCII). Chưa xác nhận client hiện tên này hay tên gốc trong bảng quái của client.

## Server test để làm tiếp

`D:\tlbb-local\HUONG-DAN.txt`. Tóm tắt:
- Bật / tắt: `BAT-SERVER-TEST.cmd` / `TAT-SERVER-TEST.cmd`. Giữ WSL sống bằng `giu-song-wsl.vbs` trong thư mục Startup.
- Đồng bộ code nhánh `local`: `local.sh dongbo`, rồi `local.sh restart`.
- Client: `G:\NetCo4-Local` (Defender đã có ngoại lệ cho thư mục này vì `RSSParser.dll`).
- Kiểm bot mọc: `D:\tlbb-local\kiem-bot3.sh`.
