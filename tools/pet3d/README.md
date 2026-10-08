# pet3d: giải mã gói client TLBB + dựng 3D trân thú

Bộ công cụ đọc file **đã mã hóa** trong gói client (`Data/*.axp`) và dựng mô hình 3D các trân thú trade cho trang Ghép Ngọc của bot.

Dữ liệu dựng ra nằm ở `/opt/minigame/pet3d` trên VPS. Bot đọc nó qua `pet3d.js` của repo bot, route `/pet3d/...`.

Làm lần đầu ngày 08/10. Mọi bước đều chỉ **đọc** client và RAM game, không sửa gì.

---

## 1. Dùng nhanh

Cài thư viện (chỉ bộ giả lập CPU cần `iced-x86`):

```bash
cd tools/pet3d && npm install
```

### Giải 1 file đã lấy ra khỏi gói

```bash
node giaima.js <file vào> <file ra>
```

File bắt đầu bằng `84 cc fa 75` là file mã hóa. File thường thì giữ nguyên.

### Liệt kê / trích file trong gói AXPK

```bash
node trich.js "<client>/Data/Model.axp" ra/thu "狸猫宝宝"
```

Tham số thứ 3 là regex lọc tên (tên tiếng Trung, GBK). File lấy ra **vẫn còn mã hóa**, phải chạy tiếp `giaima.js`.

Trong code, gọi 2 thư viện này:

```js
const { mo } = require('./trich.js');
const { giai } = require('./giaima.js');
const A = mo(path.join(P.DATA, 'Model.axp'));
const f = A.ds.find((x) => x.ten === 'all.obj');
const buf = giai(A.doc(f).buf).buf;   // đã giải
```

### Dựng lại 3D trân thú cho Ghép Ngọc

Dùng khi thêm hoặc bớt trứng trong `DOI` của `ghepngoc.js`, hoặc khi client đổi mô hình.

```bash
node noi.js          # trứng -> pet -> 9 bản -> .obj -> mesh   => ra/noi.json
node dungall.js      # giải mã + đổi sang định dạng web        => ra/pet3d/  (~80 MB)
node xem.js          # xem thử: http://127.0.0.1:8091/xem.html?t=30309847  (bộ xem /p3.js lấy từ repo bot: BotDoMin/pet3d.client.js)
```

- `noi.js 30309847 30309780` chỉ nối các trứng được ghi.
- `dungall.js ra/pet3d 30309847` chỉ dựng lại 1 trứng.

Đưa lên VPS: thay toàn bộ thư mục rồi restart bot (`pet3d.js` chỉ đọc `index.json` lúc khởi động).

```bash
tar czf pet3d-data.tgz -C ra/pet3d .
# scp lên VPS, giải nén vào /opt/minigame/pet3d, rồi:
systemctl restart minigame
```

Đường dẫn mặc định đặt trong `duongdan.js`. Máy khác thì đặt biến môi trường:

| Biến | Ý nghĩa |
|---|---|
| `TLBB_CLIENT` | thư mục client (có `Data/`, `Bin/`) |
| `GHEPNGOC_JS` | file `ghepngoc.js` của bot |

---

## 2. Thuật toán mã hóa ("SEPCIAL_FILE_HD")

Khoảng 70% file trong gói bị mã hóa, gồm mesh, skeleton, `.obj`, một số `.txt`. Texture `.dds` thì không.

### Header 96 byte

96 byte đầu XOR với khóa `khoa/key480.bin` (lấy 96 byte đầu). Sau khi XOR:

| Offset | Nội dung |
|---|---|
| 0 | `"SEPCIAL_FILE_HD\0"` (sai chính tả "SPECIAL", có sẵn trong game) |
| 16 | `u32` **loại** mã hóa |
| 20 | `u32` kích thước thân (= kích thước file − 96) |

### Thân

Thân là phần từ byte 96 trở đi. `vị_trí` = offset của byte trong **file gốc, tính cả 96 byte header**.

| Loại | Cách giải |
|---|---|
| 6 | Mã chuỗi: `p = c ^ s; s = (s + c) & 255`, với `s0 = keyT[648]`. Giải cả thân một lần, bắt đầu từ vị trí 96. |
| 13..18 | Như loại thường, nhưng **chỉ 1024 byte đầu thân** (vị trí < 1120) bị mã hóa, phần sau giữ nguyên. |
| còn lại (1..38, 100..107, 188, 199, 206, 285) | `p = BANG[loại][vị_trí & 255][c]`. Bảng ở `khoa/bang.bin` (thứ tự loại trong `bang.json`) và `khoa/bang13..18.bin`. |

Ví dụ: loại 8 (mesh pet) là `k = keyT[(vị_trí & 127) + 777]; p = ((c ^ k) - k) & 255`.

Phép `& 127` là **AND, không phải chia lấy dư**: hàm thư viện E-lang `fb8330` = AND, `fb8350` = XOR.

### Ghi nhớ

- Byte `00` luôn giải ra `00`, nên file mã hóa trông như "nhiều chỗ để thô". Đừng để điều này đánh lừa.
- Bảng lập bằng cách **giả lập chính code của game** (`emu.js` chạy handler trong ảnh RAM `khoa/RSSParser.img`). Không ai dịch tay 49 kiểu này.
- `lapbang.js` lập lại `bang.bin` và tự kiểm chứng bằng khối ngẫu nhiên, mất khoảng 2,5 phút.

### Mã nằm ở đâu (để lần sau tìm lại)

| Thành phần | Chi tiết |
|---|---|
| `Bin/RSSParser.dll` | Nén UPX, viết bằng E-lang (易语言). Khi chạy nó **vá 2 chỗ**. |
| Vá 1: `Render.dll` + `0xD4DA5` | Đường đọc file map bộ nhớ, `jmp` sang RSSParser. Chỉ giải loại 6 tại chỗ. |
| Vá 2: `Game.exe` `0x591080` | Hàm `decrypt(header, vị_trí, buf, n)` (vtable `0x61A648`, tên `"SEPCIAL_FILE_HD"` nằm ngay sau), thay bằng callback RSSParser `rva 0x6B7D`. Bảng phân loại `rva 0x207A..0x2830`: mỗi `cmp [ebx], loại` đi kèm `call handler`. |
| Ai gọi decrypt | Stream bọc của `Render.dll` (`rva 0x2C00`): `pos = tell()` → `read()` → `decrypt(hdr, pos, buf, n)` sau **mỗi lần đọc**. |
| Khóa (RSSParser, base RAM `0xFB0000`) | `key480` ở `rva 0x82E74` (480 byte). `keyT` là mảng E-lang ở `rva 0x82583` (`+4` = độ dài 2208, `+8` = dữ liệu). |
| `OgreMain.dll` | **Không** giải mã. Themida nén nó; `importMesh` chuẩn đòi stream đã sạch. |

`Config.axp` / `Interface.axp` **không có trên đĩa**. Chúng nằm trong `OgreMain.dll` (Themida) và chỉ hiện ra trong RAM khi game chạy. Log `Bin/Fairy.log` ghi `../Bin/Config.axp`. `tachgoi.js` tách chúng ra.

---

## 3. Lấy lại khóa khi client đổi RSSParser / OgreMain

Bật game (Windows, tiến trình `Game.exe`), rồi chạy các bước dưới. Tất cả **chỉ đọc** RAM.

```powershell
# 1. Chép ảnh các module đã tự giải nén ra img/
#    (đường dẫn script phải tuyệt đối hoặc .\)
.\dumpmod.ps1 -ProcId <pid Game.exe> -Out img -Loc 'RSSParser|OgreMain|Render|Game'

# 2. Tách gói Config ẩn, lấy CharModelEx.txt mới vào cfg/
node tachgoi.js img\OgreMain.dll_<base>.img
node trich.js img\goi2.axp cfg "^CharModelEx\.txt$"
node giaima.js cfg\CharModelEx.txt cfg\CharModelEx.txt
```

Bước 3: lấy khóa mới. Chép `img/RSSParser.dll_<base>.img` thành `khoa/RSSParser.img`.

- Nếu **base khác `0xFB0000`**, sửa `BASE` trong `emu.js` và địa chỉ bảng phân loại trong `bangLoai()`.
- Tìm lại `key480` (96 byte đầu XOR với header một file mã hóa phải ra `SEPCIAL_FILE_HD`) và `keyT`. Ghi chúng ra `khoa/key480.bin` và `khoa/keyT.bin`.
- Chạy `node lapbang.js`. Kết quả phải là `OK n / n`, trừ 6 và 13..18 (đã biết, xử lý riêng trong `giaima.js`).

Bước 4: kiểm tra. Chạy `node giaima.js` trên 1 mesh mã hóa. Kết quả phải bắt đầu bằng `00 10 [MeshSerializer_v1.40]`.

Đọc mã máy trong ảnh RAM:

```bash
node disimg.js <img> <base hex> at <va> [n]      # disassemble tại địa chỉ
node disimg.js <img> <base hex> xref <va>        # lệnh tham chiếu địa chỉ
node xuat.js <img> <base hex> <regex>            # liệt kê export
```

Biến môi trường `TE=0x...` đặt điểm cuối vùng code khi quét `xref`.

`docram.ps1` quét RAM tìm mesh **đã sạch** (`[MeshSerializer_v1.40]`). Lần 08/10 chỉ thấy mesh vốn không mã hóa, vì game giải mã từng mẩu đọc chứ không giữ cả file sạch trong RAM.

---

## 4. Từ trứng trade đến mô hình (`noi.js`)

1. **Trứng → pet.** `obj/item/zhenshoudan.lua` có dòng `x300027_g_petList[<trứng>] = {type=1, dataId=<pet>}`.
2. **Pet → họ.** Tra `docs/pet-danh-sach.tsv`, lấy các pet cùng mã họ, cùng cấp mang, cùng tên gốc, bỏ bảo bảo:
   - `bien_di = 0` là bản thường;
   - `bien_di = 1` xếp theo ID tăng dần là đời 1..N.
3. **Mã ngoại hình.** Cột 44 của `server/Public/Config/MonsterAttrExTable.txt`.
4. **Ngoại hình → `.obj`.** `cfg/CharModelEx.txt` (bảng của client, cột 1).
5. **`.obj` → mesh.** Lấy `<EntityList>` trong `all.obj` (Model.axp): mỗi Entity có `file` (mesh) và `material`.

**Vật liệu của Entity ghi đè vật liệu trong mesh.** Nhiều họ dùng chung 1 mesh cho cả 9 bản, chỉ khác vật liệu (khác màu).

Texture lấy theo thứ tự ưu tiên:
1. `jpg_<vật liệu>.dds`
2. `tga_<vật liệu>.dds` (có alpha)
3. `texture` / `set_texture_alias` trong `all.material`

Texture nằm trong `Material.axp`, một số ở `Effect.axp`.

---

## 5. Xương, động tác, hiệu ứng (`docskel.js`, `dungall.js`)

### Xương `.skeleton` (Ogre `[Serializer_v1.10]`, đã giải mã)

| Chunk | Nội dung | Bẫy |
|---|---|---|
| `0x2000` xương | tên, handle `u16`, vị trí 3f, quay x,y,z,w | **Độ dài chunk KHÔNG tính tên xương** → phải đọc tuần tự, không nhảy theo độ dài |
| `0x3000` cha | con `u16`, cha `u16` | |
| `0x4000` động tác | tên, độ dài (giây) | |
| `0x4100` track | xương `u16` | |
| `0x4120` khung (riêng của Fairy) | `[số khung u16][cờ u16: 1 quay, 2 dịch, 4 tỉ lệ]`, mỗi khung `t f32 (+ quay 4f)(+ dịch 3f)(+ tỉ lệ 3f)` | Ogre chuẩn là `0x4110` từng khung |

- Khung động tác **tương đối** so với tư thế gốc: `pos = gốc + t`, `quay = gốc × q`. `dungall.js` đổi sẵn sang biến đổi cục bộ cuối cùng.
- Pet có các động tác 站立 (đứng), 休闲 (nghỉ), 跑步, 攻击, 受击, 倒地… Bộ xem chạy **站立** lặp, cứ 3 vòng xen 1 lần 休闲.

### Mesh: gán đỉnh-xương

- Liên kết skeleton: chunk `0x6000` (tên file).
- Gán đỉnh-xương: `0x4100` trong submesh, hoặc `0x7000` cho hình dùng chung. Mỗi lần gán là `[đỉnh u32][xương u16][trọng số f32]`.
- `dungall.js` giữ tối đa 4 xương/đỉnh, chuẩn hóa trọng số.

### Hiệu ứng: chuỗi tra

1. `.obj` có `<Effects><Effect effect="…" locator="…">`.
2. `<Locator bonename x y z qx qy qz qw>` = gắn vào xương, dịch rồi quay. `qx,qy,qz` là **trục**, `qw` là **góc (radian)**, không phải quaternion.
3. `Effect.axp/all.effect` → `effect <tên> { element Particle { Position, Orientation (w x y z), ParticleSystem, StartTime } }`.
4. `Effect.axp/all.particle` → hệ hạt `<tên> { quota, material, particle_width/height, renderer, billboard_type, … emitter X {…} affector Y {…} }`. Không có từ khóa `particle_system`.
5. `Material.axp/all.material` → vật liệu hạt: `texture`, `scene_blend add|alpha_blend`, `colour_op_ex modulate_x4` (sáng ×4), `tex_address_mode clamp`.

Số liệu của 51 trứng: 1892 hệ hạt.

| Loại | Số lượng |
|---|---|
| renderer | billboard 3934, texcoord_billboard 622, mesh 173, ribbon 13 |
| emitter | Box, Ring, Cylinder, Point, PolarEmitter (+ Ellipsoid, HollowEllipsoid) |
| affector | ColourFading, ScaleInterpolator, Rotator, Movement, Revolution, RevoluMove, MeshRotator, MeshAnimationAffector |

`node khaosat-fx.js` in lại thống kê này. `node mau-fx.js > ra/mau-fx.txt` in mẫu tham số từng loại.

### Nghĩa tham số đã dò ra (so với hình trong game)

- **`ScaleInterpolator`.** Khi `use_interpolated_scale true`, cỡ = `particle_width/height × scaleN` (mắt Tề Thiên: 0.2 × 30 = 6). `width_range` chỉ dùng khi không nội suy. Nếu nhân cả hai, hạt to gấp hàng trăm lần.
- **`ColourFading`.** `colourN` tại `timeN` (phần đời 0..1), `repeat_times`, `opacity`, `fade_in_time` / `fade_out_time`.
- **Hòa trộn cộng trên canvas trong suốt** phải **không ghi kênh alpha** (`blendSrcAlpha 0, blendDstAlpha 1`). Ghi alpha thì thành mảng đen trên nền trang.
- **Hướng vùng phát** theo `AreaEmitter::genAreaAxes` của Ogre: `up = direction × X` (hoặc `× Y`); `width` theo `up × direction`, `height` theo `up`, `depth` theo `direction`.
- **Hạt kiểu mesh** (cánh, vật bay) là mesh riêng `p<n>.bin` (có thể có xương), xoay theo `MeshRotator`.

Bộ mô phỏng nằm ở repo bot, file `BotDoMin/pet3d.client.js`, phục vụ ở `/p3.js`. Nó gần giống game, không giống từng điểm ảnh.

---

## 6. Định dạng dữ liệu web (`ra/pet3d`)

```
index.json          { "<trứng>": { ten, so, f: [file...] } }   (dungall.js vài trứng thì GỘP với index cũ)
<trứng>/m<k>.bin    k = 1 bản thường, 2.. = biến dị đời 1..
<trứng>/p<n>.bin    mesh của hạt kiểu mesh
<trứng>/k<n>.json   xương + động tác: { bones:[{n,c,p,q,s}], anims:{ 站立:{ d, tr:[{b,t,q,p}] }, 休闲:… } }
<trứng>/fx.json     { ps: {tên hệ hạt: tham số + em:[...] + af:[...] (+ pm: p<n>.bin)}, mat: {tên: {tex, blend, x4, clamp, cull, rej, scroll}} }
<trứng>/t<n>.dds    texture (tên ASCII)
<trứng>/info.json   chi tiết pet / mã ngoại hình / số hiệu ứng từng bản
```

`.bin` gồm:
1. `u32` độ dài JSON;
2. JSON;
3. đệm cho tròn 4 byte;
4. dữ liệu.

JSON của `.bin`:

```
{ parts: [{ nv, ni, i32, tex, alpha, o: { pos, nor, uv, idx, bi, bw } }],
  skel: "k0.json",
  loc: { tên điểm gắn: { b: xương, p: [x,y,z], r: [trục x,y,z, góc] } },
  eff: [{ loc, el: [{ ps, pos, q (w,x,y,z), t0 }] }] }
```

- `o.*` là offset tính từ sau phần đệm.
- `bi` là `Uint8 ×4`, `bw` là `Float32 ×4` mỗi đỉnh.

---

## 7. Giới hạn và bẫy đã gặp

- **Hiệu ứng là mô phỏng lại.** Vài affector của Fairy (`RevoluMove`, `increment_*` của `ScaleInterpolator`, `use_constant_scale`) chỉ làm gần đúng. Nếu một pet trông khác game, so tham số trong `fx.json` với `ra/mau-fx.txt`.
- **Khung nhìn** tính theo tư thế đang đứng (đỉnh qua da xương). Con bay đứng cao hơn tư thế gốc.
- **Mesh phụ** kiểu `...1eye.mesh` không nằm trong `.obj` thì **bỏ qua**.
- **Sửa file JS chứa `\` qua heredoc / `node -e` trong bash dễ mất dấu `\`** (regex hỏng âm thầm). Dùng trình sửa file.
- **Bảng `MonsterAttrExTable` / `PetAttrTable` của client có thể khác bản server.** Mã ngoại hình lấy theo **server** (cột 44), tên `.obj` lấy theo **client**.
- **Bảng phân loại `trich.js`.** Ở `Effect.axp`, cột 3 của `(list)` không khớp hashB; dự phòng là khớp khối theo kích thước (chỉ khi có đúng 1 khối).
