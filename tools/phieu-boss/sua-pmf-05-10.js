// 05/10: PMF nho (cap 75) roi qua nhieu (moi nguoi ~10 mon / boss, cham tran tui).
// Goc: "goi boss chuan" 01/10 thiet ke 100/40/20/30/24/20/17/15% nhung luc do chua biet DropParam x2
// -> thuc te gap doi. Sua: dong boss PMF tro sang ban sao rieng BV x2 (hop goc giu cho quai thuong),
// 90034 (chi Ly Thu Thuy nho dung) BV 36 -> 72. Chay: node tools/phieu-boss/sua-pmf-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../../server/Server/Config/');
const F_MDB = R + 'MonsterDropBoxs.txt', F_DBC = R + 'DropBoxContent.txt';
const DONG = ['9552', '9660', '9661', '9663', '9666', '9672'];   // PMF nho 4 boss + 2 dang NPC Phu Man Nghi
const SAO = [['90030', '90050'], ['50006', '90051'], ['50030', '90052'], ['50046', '90053'], ['50047', '90054'], ['50048', '90055'], ['1923', '90056'], ['50034', '90057']];
const SUA_BV = { '90034': 72 };   // chi 9666 dung (kiem ben duoi)

const ghi = process.argv.includes('--ghi');
const loi = m => { console.error('LOI: ' + m); process.exit(1); };
const EOL = s => s.includes('\r\n') ? '\r\n' : '\n';
const dbcRaw = fs.readFileSync(F_DBC, 'latin1'), mdbRaw = fs.readFileSync(F_MDB, 'latin1');
const E1 = EOL(dbcRaw), E2 = EOL(mdbRaw);
const dbc = dbcRaw.split(E1), mdb = mdbRaw.split(E2);
const dongHop = {}; dbc.forEach((l, i) => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) dongHop[id] = i; });
for (const [, moi] of SAO) if (dongHop[moi] !== undefined) loi('hop ' + moi + ' da co');
// hop sua BV tai cho chi duoc dung o DONG
for (const b in SUA_BV) mdb.forEach(l => { const c = l.split('\t'); if (/^\d+$/.test(c[0]) && c.slice(3).includes(b) && !DONG.includes(c[0])) loi(b + ' con dung o ' + c[0]); });
// DropBoxContent: sao BV x2, chen sau hop lon nhat hien co (90049)
const moiDong = SAO.map(([goc, moi]) => { const c = dbc[dongHop[goc]].split('\t'); c[0] = moi; c[1] = String(+c[1] * 2); return c.join('\t'); });
for (const b in SUA_BV) { const c = dbc[dongHop[b]].split('\t'); console.log('BV', b, c[1], '->', SUA_BV[b]); c[1] = String(SUA_BV[b]); dbc[dongHop[b]] = c.join('\t'); }
const iSau = dongHop['90049']; if (iSau === undefined) loi('khong thay 90049');
const dbcMoi = [...dbc.slice(0, iSau + 1), ...moiDong, ...dbc.slice(iSau + 1)];
// MonsterDropBoxs: doi tham chieu tren DONG
const map = Object.fromEntries(SAO);
let n = 0;
for (let i = 0; i < mdb.length; i++) {
  const c = mdb[i].split('\t'); if (!DONG.includes(c[0])) continue;
  const truoc = c.slice(3).join(' ');
  for (let k = 3; k < c.length; k++) if (map[c[k]]) { c[k] = map[c[k]]; n++; }
  mdb[i] = c.join('\t');
  console.log(c[0], '\n  truoc:', truoc.replace(/ -1/g, ''), '\n  sau:  ', c.slice(3).join(' ').replace(/ -1/g, ''));
}
const thuTu = (L, ten) => { let t = -1; L.forEach(l => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { if (+id <= t) loi(ten + ' sai thu tu ' + id); t = +id; } }); };
thuTu(dbcMoi, 'DropBoxContent'); thuTu(mdb, 'MonsterDropBoxs');
console.log('tham chieu doi:', n, '| hop moi:', moiDong.length);
if (ghi) { fs.writeFileSync(F_DBC, dbcMoi.join(E1), 'latin1'); fs.writeFileSync(F_MDB, mdb.join(E2), 'latin1'); console.log('DA GHI'); }
