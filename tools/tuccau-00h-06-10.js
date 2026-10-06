// 06/10 (chủ server): Túc Cầu (event/fuben/efuben_cuju.lua, 402040) reset lúc 00:00 giờ Việt Nam thay vì "đủ 24 tiếng từ lần vào trước".
// Lỗi thấy: 05/10 tổ vào 18:53 + 1 người 19:05 -> 06/10 19:00 cả tổ vẫn bị chặn (người 19:05 chưa đủ 24h).
// MD_CUJU_PRE_TIME = giây unix lúc vào (LuaFnGetCurrentTime). Ngày VN = floor((giây + 7*3600) / 86400). Cùng ngày -> chặn.
// Câu báo "sau 24 giờ" -> "sau 0 giờ đêm nay". Sửa byte (latin1), giữ CRLF. Lua -> hiệu lực sau cap-nhat. node tools/tuccau-00h-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/event/fuben/efuben_cuju.lua');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const lua = (t) => [...t.normalize('NFC')].map((ch) => { const c = ch.charCodeAt(0); if (c < 128) return ch; if (vis[ch] === undefined) throw new Error('khong co VISCII: ' + ch); return '\\' + vis[ch]; }).join('');
const ghi = process.argv.includes('--ghi');
let s = fs.readFileSync(F, 'latin1');
const cu = 'if nCurTime-time < 60*60*24   then';
const moi = 'if floor( ( nCurTime + 25200 ) / 86400 ) == floor( ( time + 25200 ) / 86400 ) then   -- [NetCo4 06/10] reset 00:00 gio VN (cu: du 24 gio tu lan vao truoc)';
if (s.split(cu).length !== 2) { console.error('LOI: khong thay dung 1 moc'); process.exit(1); }
const i = s.indexOf(cu);
s = s.replace(cu, moi);
// câu báo trong khối ngay sau: thay đoạn từ "#G" tới hết chuỗi
const kh = s.indexOf('\n', i), ket = s.indexOf('end', kh);
const doan = s.slice(kh, ket);
const g = doan.indexOf('#G'), q = doan.indexOf('");', g);
if (g < 0 || q < 0) { console.error('LOI: khong thay cau bao #G'); process.exit(1); }
const cauMoi = '#G' + lua(' Mỗi ngày chỉ 1 lần, qua 0 giờ đêm nay hãy đến tìm ta!');
s = s.slice(0, kh) + doan.slice(0, g) + cauMoi + doan.slice(q) + s.slice(ket);
console.log('doi moc + cau bao');
if (ghi) { fs.writeFileSync(F, s, 'latin1'); console.log('DA GHI'); }
