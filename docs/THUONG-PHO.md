# 🏪 Thương Phố (06/10/2026)

Kho đồ trên web, **mỗi nhân vật một kho**. Người chơi chuyển cả túi Đạo cụ hoặc Nguyên liệu ra web qua NPC Ví Web. Trên web, họ chọn món rút về game.

## Luật chủ server chốt 06/10

- Đồ chỉ rút về **đúng nhân vật đã gửi**. Không tặng, không bán, không giao dịch trên web.
- Đồ **cố định** (khóa) vẫn chuyển được. Web giữ cờ khóa; rút về thì game khóa lại. Đồ khóa và không khóa của cùng một món là 2 chồng riêng. Ô đồ khóa có 🔒, tooltip ghi "Đã cố định" màu đỏ.
- NPC có 2 nút chuyển: "Chuyển Đạo cụ" và "Chuyển Nguyên liệu". **Trang bị không chuyển** (xem mục "Không làm").
- Giao diện kho (chốt 06/10):
  - 2 tab Đạo cụ / Nguyên liệu. Tab đang chọn trống mà tab kia có đồ thì tự chuyển sang.
  - **Gộp số lượng:** mỗi món (ID + trạng thái khóa) là 1 ô ghi tổng số, không tách chồng như game cho dễ nhìn. Số ô túi game cần trống vẫn tính theo số chồng thật (tooltip, túi rút, hộp xác nhận).
  - **2 nhóm:** Không cố định ở trên; "🔒 Cố định" ở dưới, ô viền đỏ.
  - Bấm 1 ô là chuyển cả món sang túi rút; sửa số dưới ô bên phải. Bấm Xác nhận thì hiện hộp `gConfirm` giữa màn hình (không dùng `confirm()` của trình duyệt), rồi rút một lần.
  - Ô tìm: dấu phẩy tách từ khóa, mỗi từ khóa giữ cả cụm; chỉ toàn số thì là danh sách ID.
  - Trên máy tính, túi "Rút vào game" bám theo màn hình khi cuộn.

- **Lịch sử** (06/10 trưa):
  - Mỗi lần gửi / rút / hoàn là 1 dòng. Món trùng gộp số lượng theo ID + khóa: phiếu game ghi từng ô, bot gộp lại.
  - Mỗi lần rút có trạng thái ✅ Đã vào game / ⏳ Đang chờ / ◐ Nhận một phần. Trạng thái tính từ mã lệnh có trong `.tpdone` mà game ghi, nên khớp thực tế.
  - Giữ 100 lần gần nhất cho mỗi nhân vật (`_tp[GUID].nk`, mỗi dòng có `ds` đã gộp và `tx` là mã lệnh).

## File

| Repo | File | Việc |
|---|---|---|
| game | `server/Public/Data/Script/CDK/CDK.lua` | NPC 999999: phím 94/93 hỏi xác nhận, 92/91 chuyển, 90 nhận ngay. Các hàm `x999999_*TP*` nằm cuối file. |
| game | `server/Public/Data/Script/NetCo4/quatang.lua` | Gọi `NhanTP` mỗi lần đăng nhập hoặc đổi bản đồ. |
| bialk | `BotDoMin/thuongpho.js` | Dựng danh sách món, đọc phiếu, rút, dọn hàng đợi. Dữ liệu ở `dbCache._tp[GUID]`, cấu hình ở `dbCache._tpCfg`. |
| bialk | `BotDoMin/thuongpho.client.js` | Giao diện 2 túi, phục vụ ở `/tp.js`. Bot đọc lại file mỗi lần tải nên sửa giao diện không cần restart. |
| bialk | `index.js`, `webplay.js` | Nối module; route `/api/tp/state` và `/api/tp/rut`; tab 🏪 trong nhóm Hồ sơ. |

## Giao tiếp game ↔ bot

Mọi file nằm trong `Server/txt/NetCo4Web/`.

**Danh sách món được chuyển** (`thuongpho-cho.txt`):
- Bot dựng file này lúc khởi động và mỗi 6 giờ.
- Nguồn: `CommonItem.txt`, `GemInfo.txt`, `ItemRule.txt` và quét các script dùng `SetBagItemParam`. Ra khoảng 6.921 món.
- Điều kiện để món được chuyển:
  - cất được vào ngân hàng;
  - không phải món "duy nhất";
  - không phải đồ nhiệm vụ (`4xxxxxxx`) có cột "最大持有数量" > 0. Với đồ thường, cột này **không phải giới hạn thật**: Yến Huyền Ngọc ghi 1 mà chồng được 30, người chơi giữ 2 ô. Sửa 06/10, mở thêm khoảng 360 món;
  - script của món không ghi tham số riêng.
- Trang bị (ID `1xxxxxxx`) không có trong 2 bảng nên tự động bị loại.
- **File rỗng hoặc thiếu = Thương Phố tạm khóa.** NPC không xóa gì.

**Game → web:**
- Game kiểm từng ô. Ô bị bỏ qua nếu: khóa mật khẩu (`LuaFnIsItemAvailable`), đang khóa (`LuaFnIsItemLocked ~= 0`), hoặc có **tham số riêng khác 0** (`GetBagItemParam` ở offset 0/4/8, kiểu 2). Trường hợp có tham số riêng gồm ngân phiếu, đồ dùng dở…: rút về là thành món mới, tức là dup hoặc mất.
- Game **xóa ô trước**, kiểm ô đã trống, rồi mới ghi phiếu `outtp/<GUID>_<giờ>_<số>.txt`:
  - mỗi dòng `<GUID> <ID> <số> <khóa 0/1> <túi 1/2>`;
  - dòng cuối `END`;
  - phiếu hoàn có thêm dòng đầu `HOAN`.
- Ghi phiếu lỗi thì game trả lại đồ.
- Bot cộng kho, lưu tên phiếu vào `_tpSeen` **trước** khi chuyển phiếu sang `outtp/xong/`, nên không cộng trùng.

**Web → game:**
- Bot trừ kho, rồi ghi `<GUID>.tpin`: mỗi dòng `<mã> <ID> <số> <khóa> <túi> <số chồng>`, mỗi dòng tối đa 5 ô.
- Game chỉ phát dòng nào **đủ ô trống**. Mã của dòng được ghi vào `<GUID>.tpdone` **trước khi phát**.
- Phát lỗi giữa chừng thì phần còn lại thành phiếu `HOAN` quay về kho.
- **Không có nút hủy lệnh đang chờ.** Hủy đúng lúc game đang đọc là thành 2 bộ đồ.
- Bot chỉ dọn `.tpin`. **Không bao giờ ghi `.tpdone`**: game ghi nối đuôi file này, nếu bot đổi tên file thì mất dấu "đã phát" và game phát lại.

**Đồ cố định khi rút về** (sửa sau khi mô phỏng bắt được lỗi khóa oan):
1. Phát hết đồ cố định trước, rồi mới phát đồ không cố định.
2. Nếu túi còn chồng **không cố định chưa đầy** của cùng món, lệnh đồ cố định phải chờ. Game báo người chơi cất chồng đó đi. Lý do: game sẽ chồng món mới vào chồng đó, rồi `LuaFnItemBind` khóa cả chồng của người chơi.
3. Phát hết rồi mới khóa. **Không bao giờ khóa ô vốn là đồ không khóa của người chơi**, kể cả khi số chồng trong bảng sai. Trường hợp xấu nhất: vài món cố định rút về thành không khóa.

## Tắt khẩn cấp

```
touch /opt/tlbb-root/home/tlbb/Server/txt/NetCo4Web/thuongpho-tat     # tắt: NPC không nhận đồ, web khóa nút rút
rm    /opt/tlbb-root/home/tlbb/Server/txt/NetCo4Web/thuongpho-tat     # mở lại
```

- Có hiệu lực trong 5 giây và còn nguyên sau khi restart.
- Đồ trong kho và lệnh đang chờ vẫn giữ nguyên. Lệnh đang chờ **vẫn được phát** khi người chơi đăng nhập.
- Chặn một món cụ thể: `TP.setCfg({ chan: [...] })` (chưa có nút trên panel).

## Đã kiểm

Bản mô phỏng chạy đúng `CDK.lua` bằng fengari, với API game giả, nối với `thuongpho.js` thật. Kết quả **35/35** ở cả 2 giả định engine (chồng hoặc không chồng đồ khác trạng thái khóa). Các ca đã chạy:
- đếm ô và lý do giữ lại;
- khóa tách chồng;
- đọc phiếu 2 lần không cộng trùng;
- chặn rút sai;
- túi đầy thì để chờ;
- nhận dần từng phần;
- không phát trùng;
- không khóa oan;
- phát lỗi giữa chừng thì hoàn đủ;
- tắt bằng cấu hình và bằng file.

## Chưa kiểm trong game (làm bằng acc test ngay sau deploy)

1. NPC Ví Web có 3 nút mới; màn xác nhận đếm đúng số ô.
2. **Đồ thường có `GetBagItemParam` = 0 không.** Nếu NPC báo "có thuộc tính riêng" cho đồ thường thì lớp kiểm này quá chặt.
3. Đồ có hạn dùng có bị giữ lại không. Nếu không bị giữ lại thì phải chặn bằng danh sách.
4. Rút về có đúng khóa / không khóa không; game có chồng đồ khóa vào đồ không khóa không.
5. Đổi bản đồ thì tự nhận; túi đầy thì có câu báo.

## Không làm (và vì sao)

- **Trang bị:** có chỉ số ngẫu nhiên, ngọc khảm, cường hóa. Web chỉ lưu ID, nên rút về là món trắng mới, thành công cụ reroll hoặc dup.
- **Nút hủy lệnh đang chờ:** lý do ở mục "Web → game".

## Rủi ro còn lại

Game xóa đồ trong RAM (ShareMemory) trước rồi mới ghi phiếu. Nếu ShareMemory sập trước khi kịp lưu xuống DB, nhân vật quay về bản cũ (còn đồ) mà phiếu đã ghi, tức là dup. KNB và ngọc 6 đang chịu cùng rủi ro này. Không `kill` game ngoài `systemctl`.
