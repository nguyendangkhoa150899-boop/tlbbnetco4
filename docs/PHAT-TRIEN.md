# Phát triển nội dung cho NetCo4

Đọc `CLAUDE.md` trước, nhất là phần bảng mã. Mọi đường dẫn dưới đây tính từ `server/` trong repo (tương ứng `/opt/tlbb-root/home/tlbb/` trên VPS).

## Làm được và không làm được

| Làm được (chỉ cần sửa server) | Không làm được |
|---|---|
| Event qua menu NPC: vòng quay dạng menu chữ, điểm danh, quà theo cấp, đổi vật phẩm | Giao diện mới (bánh xe quay có hình, nút mới, cửa sổ mới) |
| Boss rơi đồ, thưởng khi hạ boss, boss theo giờ | Vật phẩm mới hoàn toàn (tên, hình mới) |
| Chỉnh tỉ lệ exp, rơi đồ, cấp tối đa, đồ khởi đầu | Xóa nút Đăng ký/Nạp thẻ ở màn hình đăng nhập |
| Thêm NPC vào bản đồ có sẵn | Bản đồ mới |
| Phát vật phẩm **có sẵn**: trang bị, ngọc, Trùng Lâu Giới/Ngọc... | Sửa cơ chế lõi (công thức sát thương, giao thức) vì binary không có source |

Lý do cột phải: giao diện và bảng vật phẩm phía client (`Interface.axp`, `Config.axp`) đã bị nhúng vào `Bin/OgreMain.dll` (file 94MB, nội dung bị nén hoặc mã hóa). Server có thể phát một vật phẩm mới, nhưng client không biết vật phẩm đó là gì.

## Tra ID vật phẩm

`docs/vat-pham/` có các file UTF-8 tạo từ bảng của server:

| File | Nội dung | Tên |
|---|---|---|
| `vat-pham-thuong.tsv` | 7.767 vật phẩm thường: nguyên liệu, thuốc, đạo cụ, rương | tiếng Việt |
| `ngoc-bao-thach.tsv` | 361 ngọc / bảo thạch | tiếng Việt |
| `trang-bi.tsv` | 15.661 trang bị | tiếng Trung gốc (client dịch ở phía nó) |

Ví dụ: `grep -i "Nhãn Thạch" docs/vat-pham/ngoc-bao-thach.tsv`, `grep 重楼 docs/vat-pham/trang-bi.tsv`.
Một số ID đã biết: Trùng Lâu Giới `10422016`/`10422018`, Trùng Lâu Ngọc `10423024`/`10423026`, Chân·Trùng Lâu Ngọc `10423025`, Miêu Nhãn Thạch cấp 1 `50101001`.
Các vật phẩm Kim Tằm Ty, Nhuận Hồn Thạch, Trùng Lâu Chi Mang/Chi Lệ, Mảnh đổi Yếu Quyết **không có** trong phiên bản này.
Thử nhanh trong game (tài khoản GM): `!!createitem =ID =số_lượng`. Nếu tên hiện trống hoặc client lỗi thì client không có vật phẩm đó.
Làm lại danh mục sau khi đổi bảng: xem cách tạo trong lịch sử git (`docs/vat-pham/`, script python đọc GBK/VISCII).

## Thêm một script / NPC mới

1. **Chọn ID script trong dải `950000`–`959999`** (dải trống, dành cho NetCo4). Kiểm tra `grep "^95" server/Public/Data/Script.dat`.
2. **Tạo file** `server/Public/Data/Script/NetCo4/<ten>.lua`, viết **100% ASCII** (chữ tiếng Việt dùng `tools/vn.py`). Mọi hàm đặt tiền tố `x<ID>_`.
3. **Đăng ký** trong `server/Public/Data/Script.dat` (file có dòng đầu `MGR_TXT`, xuống dòng CRLF): thêm dòng `950001=\NetCo4\<ten>.lua`. Dùng dấu `\`. Thêm bằng sửa byte, giữ CRLF.
4. **Đặt NPC** vào bản đồ: `server/Public/Scene/<map>_monster.ini`. Thêm một khối `[monsterN]` với `N` = `monstercount` hiện tại, rồi tăng `monstercount` lên 1. Chép một khối NPC có sẵn và đổi: `guid` (số duy nhất, không trùng trong file), `name`, `title`, `pos_x`, `pos_z`, `dir`, `script_id=950001`. `type` là mẫu hình NPC (lấy của một NPC có sẵn). Tên và title là chữ VISCII: tạo bằng `tools/vn.py` rồi đổi escape `\ddd` thành byte thật (file `.ini` không hiểu escape).
5. Deploy (`./cap-nhat.sh`), restart, rồi xem `/opt/tlbb-root/home/tlbb/Server/Log/luaerror.log`.
   Lỗi có sẵn từ trước, không phải do bạn: 5 dòng `open lua file false` trong `MyNew/zhaohuan/` và 2 dòng `invalid option in format`.

### Mẫu NPC có menu

```lua
x950001_g_ScriptId = 950001

function x950001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
	AddText( sceneId, "Ch\224o m\215ng \240\170n NetCo4" )
	AddNumText( sceneId, x950001_g_ScriptId, "Quay th\216", 6, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x950001_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key = GetNumText()
	if key == 1 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			return
		end
		local r = random( 100 )
		if r <= 5 then
			LuaFnItemBind( sceneId, selfId, TryRecieveItem( sceneId, selfId, 10423024, 1 ) )
		else
			AddMoney( sceneId, selfId, 10000 )
		end
	end
end
```

## API Lua đã thấy dùng trong source (số lần xuất hiện)

| Hàm | Dùng | Ghi chú |
|---|---|---|
| `TryRecieveItem(sceneId, selfId, itemId, soLuong)` | 5070 | Cho vật phẩm, trả về vị trí trong túi. Tên hàm viết sai chính tả (`Recieve`) là đúng tên gốc |
| `LuaFnItemBind(sceneId, selfId, viTri)` | 2357 | Khóa vật phẩm (không giao dịch được) |
| `LuaFnGetPropertyBagSpace(sceneId, selfId)` | ~390 | Số ô trống trong túi, kiểm tra trước khi cho đồ |
| `LuaFnGetAvailableItemCount` / `LuaFnDelAvailableItem` | ~1600 | Đếm / trừ vật phẩm (đổi đồ) |
| `AddMoney` / `GetMoney` | 463 / 276 | Vàng |
| `YuanBao(sceneId, selfId, -1, 1, n)` | 316 | Cộng KNB (tham số thứ 4: 1 = cộng, 2 = trừ, cần kiểm lại) |
| `ZengDian(sceneId, selfId, targetId, 1, n)` | 53 | Cộng Điểm Tặng |
| `AddExp` | 792 | |
| `GetMissionData` / `SetMissionData(sceneId, selfId, MD_..., v)` | 2373 | Biến lưu **theo nhân vật** (đã nhận quà chưa...). Hằng `MD_*` ở `ScriptGlobal.lua`. Dùng số mới phải chắc là chưa có ai dùng |
| `LuaFnGetWorldGlobalData(i)` / `LuaFnSetWorldGlobalData(i, v)` | 28 | Biến **toàn server** (lưu `t_global`) |
| `BroadMsgByChatPipe(sceneId, selfId, msg, 4)` | 1322 | Thông báo toàn server |
| `GetHour()` / `LuaFnGetCurrentTime()` | | Event theo giờ |
| `random(n)` | 1915 | Số ngẫu nhiên 1..n |
| `x<ID>_OnDie(sceneId, selfId, killerId)` | 1218 | Chạy khi quái hoặc boss chết, dùng cho thưởng khi hạ boss |

Dialect **Lua 4.0**: `openfile/read/write/closefile`, `getn(t)`, `strfind`, `strsub`. Không có `false` (dùng `nil`). `return` phải là lệnh cuối của khối (viết `if 1 then return end`). Không dùng cú pháp Lua 5 (`#t`, `string.x`, `local function`).
Hàm mà client gọi thẳng qua giao diện phải có trong `Server/Config/AllowableScriptFunc.txt`. Menu NPC thì không cần.

## Rơi đồ

- `Server/Config/MonsterDropBoxs.txt`: `ID quái`, `Mvalue`, `?`, `DID1..DID20` (ID hộp rơi, `-1` = trống).
- `Server/Config/DropBoxContent.txt`: `ID hộp`, `BoxValue`, `ID thông báo (DropNotify.txt)`, `?`, rồi các cặp `ItemID, Level`.
- Ý nghĩa chính xác của `Mvalue`/`BoxValue` (tỉ lệ) **chưa xác minh**. Trước khi đổi, so với một boss đã biết tỉ lệ rơi.
- Thưởng chắc chắn khi hạ boss (vào thẳng túi người hạ hoặc cả đội) thì viết trong `x<ID>_OnDie` của script boss. Boss mẫu: `Public/Data/Script/MyNew/zhaohuan/boss1..7.lua`.
- Ý tưởng "bảng drop boss" (ảnh tham khảo từ server Thanh Ca TL): giữ khung khu vực → boss → rơi đồ khóa/không khóa + KNB. Vật phẩm không có trong game thì thay bằng vật phẩm cùng vai trò trong `docs/vat-pham/`.

## Kiểm thử

- Giai đoạn test: `./cap-gm.sh --tat-ca` rồi restart, để mọi người đều là GM.
- Trước khi chơi thật: `./tlbb.sh stop && ./reset-choi-that.sh && ./tlbb.sh start`. Lệnh này xóa nhân vật và đồ, giữ tài khoản và code, có sao lưu trước.
- Lệnh GM trong game: xem `docs/lenh-gm.txt`.
