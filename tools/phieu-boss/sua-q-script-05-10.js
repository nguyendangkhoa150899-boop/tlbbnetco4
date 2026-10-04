// 05/10 (chủ server): rơi qua script ở ải 1-2 hai Q (sancaixiagunpc_die.lua 1130, yamoshannpc_die.lua 1129):
//   Cửu Thiên Ngọc Toái 20800034 -> 20% (cần nhiều, không giảm sâu); Miên Bố / Bí Ngân 6 (RoiBoc nhóm 1, 10%)
//   -> Miên Bố 8 20501008 1% + Bí Ngân 8 20502008 1% (tổng 2%/quái/người). Sửa theo byte, giữ CRLF.
// node tools/phieu-boss/sua-q-script-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const D = path.join(__dirname, '../../server/Public/Data/Script/event/xunhuan/');
const ghi = process.argv.includes('--ghi');
for (const f of ['sancaixiagunpc_die.lua', 'yamoshannpc_die.lua']) {
  let s = fs.readFileSync(D + f, 'latin1');
  const L = s.split('\r\n');
  const iCt = L.findIndex(l => l.includes('"RoiDo", sceneId, selfId, killerId, 20800034,'));
  const iBoc = L.findIndex(l => l.includes('"RoiBoc", sceneId, selfId, killerId, 1,'));
  if (iCt < 0 || iBoc < 0 || iBoc !== iCt + 1) { console.error('LOI ' + f + ' khong thay dong'); process.exit(1); }
  const tab = L[iCt].match(/^\s*/)[0];
  L[iCt] = tab + 'CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20800034, 20 )  -- [NetCo4 01/10] Cuu Thien Ngoc Toai 20% (02/10: 40 -> 30 -> 20 -> 25 -> 30; 05/10 -> 20)';
  L.splice(iBoc, 1,
    tab + 'CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20501008, 1 )  -- [NetCo4 05/10] Mien Bo 8 1% (truoc: RoiBoc Mien Bo / Bi Ngan 6 10%)',
    tab + 'CallScriptFunction( 950001, "RoiDo", sceneId, selfId, killerId, 20502008, 1 )  -- [NetCo4 05/10] Bi Ngan 8 1%');
  const moi = L.join('\r\n');
  console.log(f, 'dong', iCt + 1, '-', iBoc + 2);
  if (ghi) fs.writeFileSync(D + f, moi, 'latin1');
}
console.log(ghi ? 'DA GHI' : '(chay thu)');
