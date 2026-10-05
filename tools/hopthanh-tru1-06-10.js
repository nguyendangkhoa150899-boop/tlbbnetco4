// 06/10 (chủ server): Hợp thành bảo thạch / nguyên liệu (event/liveabilityevent/gem_compound.lua, 701602): MỖI Ô CHỈ NHẬN 1 CÁI.
// Lỗi gốc: LuaFnEraseItem(bagIndex) xóa NGUYÊN Ô túi -> đặt chồng 14 Cao cấp Hợp Thành Phù vào ô phù = mất cả 14, chỉ tính 1
// (1010100018 mất oan 28 tờ trong 6 lần, 05-06/10). 5 ô nguyên liệu cũng vậy nếu nguyên liệu xếp chồng (Miên Bố, Bí Ngân...).
// Cách sửa: TRƯỚC khi trừ gì, ô nào có > 1 cái (LuaFnGetItemCountInBagPos(sceneId, selfId, ô) - dịch ngược Server: HumanItemLogic::GetItem
// -> _ITEM::GetItemCount, tức số lượng chồng ở đúng ô) thì báo "tách ra" và dừng. KHÔNG dùng LuaFnDelAvailableItem (trừ theo ID ở ô bất kỳ
// -> đặt phù không khóa, trừ phù có khóa chỗ khác, ngọc ra không khóa = rửa đồ khóa). Lua -> hiệu lực sau cap-nhat, không restart.
// node tools/hopthanh-tru1-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/event/liveabilityevent/gem_compound.lua');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const ghi = process.argv.includes('--ghi');
// chữ tiếng Việt -> chuỗi Lua toàn ASCII (escape thập phân VISCII)
const lua = (t) => [...t.normalize('NFC')].map((ch) => { const c = ch.charCodeAt(0); if (c < 128) return ch === '"' || ch === '\\' ? '\\' + ch : ch; if (vis[ch] === undefined) throw new Error('khong co VISCII: ' + ch); return '\\' + vis[ch]; }).join('');
const MSG = lua('Mỗi ô chỉ được đặt 1 cái. Bấm "Tách" trong túi để tách chồng ra rồi đặt lại.');
let s = fs.readFileSync(F, 'latin1');
if (s.includes('LuaFnGetItemCountInBagPos')) { console.error('LOI: da sua roi'); process.exit(1); }
const moc = 'local newItemIndex = x701602_GetStuffUpgraded( standardStuff )';
const i = s.indexOf(moc); if (i < 0 || s.indexOf(moc, i + 1) >= 0) { console.error('LOI: khong thay dung 1 moc'); process.exit(1); }
const dau = s.lastIndexOf('\n', i) + 1;   // đầu dòng mốc
const eol = s[s.indexOf('\n', i) - 1] === '\r' ? '\r\n' : '\n';
const chen = [
  '\t-- [NetCo4 06/10] MOI O CHI 1 CAI: LuaFnEraseItem ben duoi xoa NGUYEN O -> dat ca chong vao la mat ca chong (1010100018 mat 28 phu).',
  '\t-- Chan truoc khi tru bat cu thu gi. LuaFnGetItemCountInBagPos = so luong chong o dung o do (HumanItemLogic::GetItem -> GetItemCount).',
  '\tlocal nc_nhieu = 0',
  '\tfor i = 1, 5 do',
  '\t\tif bagIndexList[i] ~= -1 and LuaFnGetItemCountInBagPos( sceneId, selfId, bagIndexList[i] ) > 1 then',
  '\t\t\tnc_nhieu = 1',
  '\t\tend',
  '\tend',
  '\tif bagIndex6 ~= -1 and LuaFnGetItemCountInBagPos( sceneId, selfId, bagIndex6 ) > 1 then',
  '\t\tnc_nhieu = 1',
  '\tend',
  '\tif nc_nhieu == 1 then',
  '\t\tBeginEvent( sceneId )',
  '\t\t\tAddText( sceneId, "' + MSG + '" )',
  '\t\tEndEvent( sceneId )',
  '\t\tDispatchMissionTips( sceneId, selfId )',
  '\t\treturn',
  '\tend',
  '',
];
s = s.slice(0, dau) + chen.join(eol) + eol + s.slice(dau);
console.log('chen ' + chen.length + ' dong truoc moc, xuong dong ' + JSON.stringify(eol));
if (ghi) { fs.writeFileSync(F, s, 'latin1'); console.log('DA GHI'); }
