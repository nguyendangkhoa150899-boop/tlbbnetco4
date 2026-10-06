// 07/10 (chủ server): Công Lực Đan 39999901 cắn 1 viên = 1800 viên cũ -> +180000 công lực, trần 99999 -> 999999
// (giống bản thử eea46ed 01/10, đã rollback 6f87939). Lua, có hiệu lực sau cap-nhat (không cần restart).
// Đổi số: node tools/congluc-dan-07-10.js <so> [--ghi]   (mặc định 180000). Trả về gốc: tham số 100 rồi sửa tay trần về 99999, hoặc tag truoc-congluc-180k-07-10.
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/MyLua/xiulian/Gonglidan.lua');
const ghi = process.argv.includes('--ghi');
const SO = +(process.argv.slice(2).find((a) => /^\d+$/.test(a)) || 180000);
const TRAN = Math.max(999999, SO + 200);
const raw = fs.readFileSync(F, 'latin1');
let t = raw, n = 0;
const thay = (re, f) => { const m = t.match(re); if (!m) { console.error('LOI: khong thay ' + re); process.exit(1); } t = t.replace(re, f); n++; };
thay(/\tlocal num=\d+(\t(?:-- \[NetCo4[^\]]*\] )?)/, (_, s) => '\tlocal num=' + SO + '\t-- [NetCo4 07/10: 1 vien = ' + SO / 100 + ' vien cu] ');
thay(/if total>\d+ then[^\r\n]*?(\t--)/, (_, s) => 'if total>' + TRAN + ' then -- [NetCo4 07/10]' + s);
thay(/\t\ttotal=\d+\r?\n/, (m) => '\t\ttotal=' + TRAN + (m.endsWith('\r\n') ? '\r\n' : '\n'));
thay(/(AddText\( sceneId, "C\xf4ng L\xf1c c\xfca c\xe1c h\xd5 \+)\d+"/, (_, a) => a + SO + '"');
const cnt = (s, re) => (s.match(re) || []).length;
console.log('num', SO, 'tran', TRAN, '| doi', n, 'cho | byte>127', cnt(raw, /[\x80-\xff]/g), '->', cnt(t, /[\x80-\xff]/g), 'CR', cnt(raw, /\r/g), '->', cnt(t, /\r/g));
if (ghi) { fs.writeFileSync(F, t, 'latin1'); console.log('DA GHI'); }
