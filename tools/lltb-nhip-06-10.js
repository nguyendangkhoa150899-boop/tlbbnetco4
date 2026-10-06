// 06/10 (chủ server): Lâu Lan Tầm Bảo (event/huodong/seek_treasure.lua, 808039) ra quái nhanh hơn.
// Nhịp đếm 5 giây/tick. Gốc: chờ 7 tick (35 s); đợt 1-10 cách 8 tick (40 s), 11-20 7, 21-30 6, 31-40 5, 41-50 4; nghỉ sau đợt 30 ~90 s
// -> tới boss ~28 phút. Chủ server chọn: MỌI đợt 3 tick (15 s), chờ đầu 2 tick (10 s), nghỉ sau đợt 30 = 6 tick (30 s) -> ~13 phút.
// Đợt mới ra dù đợt cũ còn quái (không chờ đánh hết). Sửa byte (latin1), file LF. Lua. node tools/lltb-nhip-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/event/huodong/seek_treasure.lua');
const ghi = process.argv.includes('--ghi');
let s = fs.readFileSync(F, 'latin1');
const doi = [
  ['x808039_g_StartTickCount = 7  ', 'x808039_g_StartTickCount = 2  '],   // 10 s
  ['{ from = 1, to = 10, speed = 8 },', '{ from = 1, to = 10, speed = 3 },   -- [NetCo4 06/10] moi dot 15 giay (goc 8/7/6/5/4 tick)'],
  ['{ from = 11, to = 20, speed = 7 },', '{ from = 11, to = 20, speed = 3 },'],
  ['{ from = 21, to = 30, speed = 6 },', '{ from = 21, to = 30, speed = 3 },'],
  ['{ from = 31, to = 40, speed = 5 },', '{ from = 31, to = 40, speed = 3 },'],
  ['{ from = 41, to = 50, speed = 4 },', '{ from = 41, to = 50, speed = 3 },'],
  // nghỉ sau đợt 30: đợt kế ra khi oldFlush + speed <= tick -> oldFlush = tick + 6 - 3 => nghỉ 6 tick = 30 s
  ['LuaFnSetCopySceneData_Param( sceneId, 9, tickCount+18-5 );', 'LuaFnSetCopySceneData_Param( sceneId, 9, tickCount+6-3 );   -- [NetCo4 06/10] nghi 30 giay (goc 18 tick = 90 s)'],
  // đếm ngược trong lúc nghỉ: đợt kế ở oldFlush + speed (3)
  ['local diffCount = oldFlushMonsterTime+5 - tickCount;', 'local diffCount = oldFlushMonsterTime+3 - tickCount;   -- [NetCo4 06/10] khop speed 3'],
];
for (const [a, b] of doi) { const n = s.split(a).length - 1; if (n !== 1) { console.error('LOI: "' + a + '" xuat hien ' + n + ' lan'); process.exit(1); } s = s.replace(a, b); }
console.log('doi', doi.length, 'cho');
if (ghi) { fs.writeFileSync(F, s, 'latin1'); console.log('DA GHI'); }
