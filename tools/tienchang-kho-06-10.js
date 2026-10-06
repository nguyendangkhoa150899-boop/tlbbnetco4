// 06/10 (chủ server): NPC Tiền Trang Lạc Dương (obj/luoyang/oluoyang_qianzhuang.lua, 000076) không mở thêm rương kho được.
// Lỗi: bảng x000076_g_Box chỉ có 2 mức (20->40 ô, 40->60 ô), mức 60->80 / 80->100 bị comment trong bản gốc. Người đã có 60 ô:
//  - FindBoxNum trả 0 -> nút "Mua Rương Mới" ẩn; bấm ô rương xám trên giao diện -> x000076_g_Box[0].Cost = lỗi Lua, không phản hồi.
// Engine (LuaFnEnableBankRentIndex, dịch ngược Server) nhận chỉ số rương 2..5 = 40/60/80/100 ô -> tối đa 100 ô.
// Sửa: bỏ comment 2 mức gốc (60 ô 200.000, 80 ô 400.000 vàng) + chặn BoxNum = 0 (đã tối đa) ở 2 chỗ dùng Cost.
// Byte-level (latin1), giữ kiểu xuống dòng từng dòng. Lua -> hiệu lực sau cap-nhat. node tools/tienchang-kho-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/obj/luoyang/oluoyang_qianzhuang.lua');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const lua = (t) => [...t.normalize('NFC')].map((ch) => { const c = ch.charCodeAt(0); if (c < 128) return ch; if (vis[ch] === undefined) throw new Error('khong co VISCII: ' + ch); return '\\' + vis[ch]; }).join('');
const ghi = process.argv.includes('--ghi');
const L = fs.readFileSync(F, 'latin1').split('\n');
const eol = (l) => (l.endsWith('\r') ? '\r' : '');
const bo = (l) => l.replace(/\r$/, '');
let n = 0;
// 1) bỏ comment 2 mức
for (const [cu, moi] of [['\t\t\t--{Capacity=60,Cost=200000},', '\t\t\t{Capacity=60,Cost=200000},   -- [NetCo4 06/10] mo lai (goc bi comment)'],
                         ['\t\t\t--{Capacity=80,Cost=400000}', '\t\t\t{Capacity=80,Cost=400000}    -- [NetCo4 06/10] mo lai; engine toi da chi so 5 = 100 o']]) {
  const i = L.findIndex((l) => bo(l) === cu);
  if (i < 0) { console.error('LOI: khong thay dong ' + cu); process.exit(1); }
  L[i] = moi + eol(L[i]); n++;
}
// 2) chặn BoxNum = 0 sau dòng FindBoxNum của nhánh mua (eventId 8) và nhánh hỏi xác nhận (else)
const MSG = lua('Kho của các hạ đã mở tối đa (100 ô), không thể mua thêm rương.');
const chen = (i, thut) => { const e = eol(L[i]); L.splice(i + 1, 0, ...[
  thut + 'if BoxNum == 0 then   -- [NetCo4 06/10] da toi da 100 o: truoc day x000076_g_Box[0].Cost loi Lua, khong phan hoi',
  thut + '\tx000076_MsgBox( sceneId, selfId, "' + MSG + '" )',
  thut + '\treturn',
  thut + 'end'].map((x) => x + e)); n++; };
const viTri = L.map((l, i) => (/^\t\tlocal\tBoxNum = x000076_FindBoxNum\(/.test(bo(l)) ? i : -1)).filter((i) => i >= 0);
if (viTri.length !== 3) { console.error('LOI: mong 3 dong FindBoxNum, thay ' + viTri.length); process.exit(1); }
// dòng 1 (OnDefaultEvent, chỉ hiện nút, đã xử lý 0) bỏ qua; chèn sau dòng 2 và 3, từ dưới lên để chỉ số không lệch
chen(viTri[2], '\t\t'); chen(viTri[1], '\t\t');
console.log('doi', n, 'cho');
if (ghi) { fs.writeFileSync(F, L.join('\n'), 'latin1'); console.log('DA GHI'); }
