// 05/10 (chủ server): Vô Lượng Sơn (wuliang_monster.ini, scene 6/73/74) quái Võ Ý (script_id=999998, 309 điểm) hồi sinh 15/10 s -> 5 s.
// Chỉ đổi dòng respawn_time trong khối có script_id=999998; NPC / quái nhiệm vụ giữ nguyên. Sửa theo byte (latin1), giữ CRLF. Cần restart game.
// node tools/vls-hoisinh-05-10.js [ms, mặc định 5000] [--ghi]   (05/10 tối: chủ server đổi 5 s -> 2 s)
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Scene/wuliang_monster.ini');
const ghi = process.argv.includes('--ghi');
const MOI = Number((process.argv.find(a => /^\d+$/.test(a))) || 5000);   // ms, vd: node tools/vls-hoisinh-05-10.js 2000 --ghi
const raw = fs.readFileSync(F, 'latin1');
const EOL = raw.includes('\r\n') ? '\r\n' : '\n';
const L = raw.split(EOL);
let khoi = null, nDoi = 0, nKhoi = 0; const cu = {};
const xong = () => {
  if (!khoi) return;
  if (khoi.script === '999998') {
    nKhoi++;
    if (khoi.iHs < 0) { console.error('LOI: khoi ' + khoi.ten + ' khong co respawn_time'); process.exit(1); }
    const m = L[khoi.iHs].match(/^(respawn_time\s*=\s*)(\d+)(.*)$/);
    cu[m[2]] = (cu[m[2]] || 0) + 1;
    if (+m[2] !== MOI) { L[khoi.iHs] = m[1] + MOI + m[3]; nDoi++; }
  }
};
for (let i = 0; i < L.length; i++) {
  const h = L[i].match(/^\[(.+)\]\s*$/);
  if (h) { xong(); khoi = { ten: h[1], script: null, iHs: -1 }; continue; }
  if (!khoi) continue;
  const s = L[i].match(/^script_id\s*=\s*(-?\d+)/); if (s) khoi.script = s[1];
  if (/^respawn_time\s*=/.test(L[i])) khoi.iHs = i;
}
xong();
console.log('khoi Vo Y:', nKhoi, '| hoi sinh cu:', JSON.stringify(cu), '| doi:', nDoi, '->', MOI, 'ms');
if (ghi) { fs.writeFileSync(F, L.join(EOL), 'latin1'); console.log('DA GHI'); }
