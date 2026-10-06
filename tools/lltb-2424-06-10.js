// 06/10 (chủ server): Lâu Lan Tầm Bảo (event/huodong/seek_treasure.lua, 808039) mở 24/24, vẫn 1 lượt/ngày.
// Giờ mở: x808039_IsOpenNow so time = giờ*100+phút với khung (start, end) loại trừ 2 đầu. Khung 1 19:30-22:00 -> -1..2400 = cả ngày;
// khung 2 (11:30-14:30) nằm trong khung 1, giữ nguyên. Giới hạn ngày có sẵn: MD_SEEK_TREASURE = GetTime2Day() (đổi lúc 00:00).
// Lua, hiệu lực sau cap-nhat. node tools/lltb-2424-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/event/huodong/seek_treasure.lua');
const ghi = process.argv.includes('--ghi');
let s = fs.readFileSync(F, 'latin1');
const a = '\t[1] = {startTime = 1930, endTime = 2200},';
const b = '\t[1] = {startTime = -1, endTime = 2400},   -- [NetCo4 06/10] mo 24/24 (goc 19:30-22:00); van 1 luot/ngay (MD_SEEK_TREASURE)';
if (s.split(a).length !== 2) { console.error('LOI: khong thay dung 1 moc'); process.exit(1); }
s = s.replace(a, b);
console.log('ok');
if (ghi) { fs.writeFileSync(F, s, 'latin1'); console.log('DA GHI'); }
