// 05/10: Ac Ba danh len mon phai (Lau La 3660-3669 / Ac Ba 3670-3679) + Ac Tac / Tac Binh (3640-3649 / 3650-3659),
// moi bac + 30000. Nerf 19h 04/10 tinh "2,6 ngoc 6 / luot / CA TO" nhung do roi theo TUNG NGUOI -> to 6 nguoi gap 6.
// Chu server chot: chia 6 (dung y nerf 19h). Hop chi 2 su kien dung: BV x6 tai cho; hop dung chung: ban sao BV x6.
// node tools/phieu-boss/acba-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../../server/Server/Config/');
const F_MDB = R + 'MonsterDropBoxs.txt', F_DBC = R + 'DropBoxContent.txt';
const HE_SO = 6, BO_QUA = 1000000;   // hop BV >= 1 trieu ~ 0%, khong dung
const laDong = id => (id >= 3640 && id <= 3679) || (id >= 33640 && id <= 33679);
const ghi = process.argv.includes('--ghi');
const loi = m => { console.error('LOI: ' + m); process.exit(1); };
const EOL = s => s.includes('\r\n') ? '\r\n' : '\n';
const dbcRaw = fs.readFileSync(F_DBC, 'latin1'), mdbRaw = fs.readFileSync(F_MDB, 'latin1');
const E1 = EOL(dbcRaw), E2 = EOL(mdbRaw);
const dbc = dbcRaw.split(E1), mdb = mdbRaw.split(E2);
const iHop = {}; let maxId = 0;
dbc.forEach((l, i) => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { iHop[id] = i; maxId = Math.max(maxId, +id); } });
const bvCua = b => +dbc[iHop[b]].split('\t')[1];
// hop tren cac dong su kien + dem dung ngoai
const tren = new Set(), ngoai = {};
mdb.forEach(l => { const c = l.split('\t'); if (!/^\d+$/.test(c[0])) return; const trong = laDong(+c[0]); for (const b of c.slice(3)) if (b && b !== '-1') { if (trong) tren.add(b); else ngoai[b] = (ngoai[b] || 0) + 1; } });
const doi = {}, moiDong = []; const maxId0 = maxId;
for (const b of [...tren].sort((x, y) => x - y)) {
  if (iHop[b] === undefined) loi('hop khong co ' + b);
  const bv = bvCua(b); if (bv >= BO_QUA) { console.log('bo qua', b, 'BV', bv); continue; }
  if (!ngoai[b]) { const c = dbc[iHop[b]].split('\t'); c[1] = String(bv * HE_SO); dbc[iHop[b]] = c.join('\t'); console.log('tai cho', b, 'BV', bv, '->', bv * HE_SO); }
  else { const c = dbc[iHop[b]].split('\t'); const id = String(++maxId); c[0] = id; c[1] = String(bv * HE_SO); moiDong.push(c.join('\t')); doi[b] = id; console.log('ban sao', b, '(dung o', ngoai[b], 'dong khac) ->', id, 'BV', bv * HE_SO); }
}
let n = 0;
for (let i = 0; i < mdb.length; i++) { const c = mdb[i].split('\t'); if (!/^\d+$/.test(c[0]) || !laDong(+c[0])) continue; for (let k = 3; k < c.length; k++) if (doi[c[k]]) { c[k] = doi[c[k]]; n++; } mdb[i] = c.join('\t'); }
const iCuoi = iHop[String(maxId0)];
const dbcMoi = [...dbc.slice(0, iCuoi + 1), ...moiDong, ...dbc.slice(iCuoi + 1)];
const thuTu = (L, ten) => { let t = -1; L.forEach(l => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { if (+id <= t) loi(ten + ' sai thu tu ' + id); t = +id; } }); };
thuTu(dbcMoi, 'DropBoxContent'); thuTu(mdb, 'MonsterDropBoxs');
console.log('tham chieu doi sang ban sao:', n);
if (ghi) { fs.writeFileSync(F_DBC, dbcMoi.join(E1), 'latin1'); fs.writeFileSync(F_MDB, mdb.join(E2), 'latin1'); console.log('DA GHI'); }
