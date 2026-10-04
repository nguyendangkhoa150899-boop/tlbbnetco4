// 05/10 luat phieu chu server chot (MOI NGUOI / lan ha, nguoi cung cap boss = chenh 0; boss roi theo tung thanh vien):
//   boss cap < 100 = 1 to 1000 · cap >= 100 = 2 to 1000
//   Q To Chau / Q Lau Lan boss cuoi: bac < 100 = 3 to, bac >= 100 = 6 to
//   Giu nguyen: boss the gioi cap 80-99 (2 to), Ngo Vinh 13456 (5 to, canh cho cap 89), 10 boss Sat Tinh khac (0), 1850 (_pingpan_55)
// Tap dong: moi dong dang co >= 0,5 to (chenh 0) + bac 10x Q / Ky Cuoc / Tuc Cau / Lau Lan Tam Bao.
// Hop phieu dat DID1; bo moi hop chi-phieu cu; hop tron phieu (90002) -> hop Han Bang giu ky vong.
// node tools/phieu-boss/luat-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../../server/');
const F_MDB = R + 'Server/Config/MonsterDropBoxs.txt', F_DBC = R + 'Server/Config/DropBoxContent.txt';
const P1000 = '39910001', HB = '20310113';
const PH = new Set(['39910001', '39910002', '39910003', '39910004', '39910005', '39910006']);
const r = (a, b) => { const o = []; for (let i = a; i <= b; i++) o.push(String(i)); return o; };
const Q3 = new Set([...r(4130, 4138), ...r(13260, 13264)]);
const Q6 = new Set(['4139', ...r(34130, 34139), ...r(13265, 13269)]);
const THEM = new Set([...Q6, '1859', ...r(31850, 31859), '3729', ...r(33720, 33729), ...r(12141, 12146)]);
const GIU = new Set(['11313', '1403', '43316', '15433', '15436', '13456', '1850']);

const ghi = process.argv.includes('--ghi');
const loi = m => { console.error('LOI: ' + m); process.exit(1); };
const EOL = s => s.includes('\r\n') ? '\r\n' : '\n';
const dbcRaw = fs.readFileSync(F_DBC, 'latin1'), mdbRaw = fs.readFileSync(F_MDB, 'latin1');
const E1 = EOL(dbcRaw), E2 = EOL(mdbRaw);
const dbc = dbcRaw.split(E1), mdb = mdbRaw.split(E2);
const lv = {}; for (const l of fs.readFileSync(R + 'Public/Config/MonsterAttrExTable.txt', 'latin1').split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) lv[c[0]] = +c[3]; }
const box = {}; let maxId = 0;
dbc.forEach(l => { const c = l.split('\t'); if (/^\d+$/.test(c[0])) { const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(c[i]); box[c[0]] = { bv: +c[1], it }; maxId = Math.max(maxId, +c[0]); } });
const maxId0 = maxId;
const chiPhieu = b => box[b] && box[b].it.length && box[b].it.every(x => PH.has(x));
const tronPhieu = b => box[b] && box[b].it.some(x => PH.has(x)) && !chiPhieu(b);
const nMon = (mv, bv) => { const X = mv / bv * 2; return X >= 1 ? Math.ceil(X) : X; };
const soPhieu = c => c.slice(3).reduce((s, b) => { const x = box[b]; if (!x) return s; const k = x.it.filter(i => PH.has(i)).length; return k ? s + nMon(+c[1], x.bv) * k / x.it.length : s; }, 0);
// tim / tao hop 1 mon (item) voi BV
const mau = dbc.find(l => l.startsWith('90001\t')).split('\t');
const moiDong = [];
const hop1 = (item, bv) => {
  for (const id in box) if (box[id].bv === bv && box[id].it.length === 1 && box[id].it[0] === item) return id;
  const id = String(++maxId), c = mau.slice(); c[0] = id; c[1] = String(bv); c[4] = item;
  moiDong.push(c.join('\t')); box[id] = { bv, it: [item] }; return id;
};
const bvChoSo = (mv, n) => { const Xt = n === 1 ? 1 : n === 2 ? 2 : n - 0.5; const bv = Math.round(mv * 2 / Xt); if (bv < 4) loi('BV < 4 cho Mv ' + mv); if (Math.ceil(mv / bv * 2 - 1e-9) !== n || (n === 1 && mv / bv * 2 > 1)) loi(`BV ${bv} khong ra ${n} to voi Mv ${mv}`); return bv; };

const bao = []; const dem = {};
for (let i = 0; i < mdb.length; i++) {
  const c = mdb[i].split('\t'); const id = c[0]; if (!/^\d+$/.test(id)) continue;
  const truoc = soPhieu(c);
  if (GIU.has(id)) continue;
  if (!(truoc >= 0.5 || THEM.has(id))) continue;
  const cap = lv[id]; if (cap === undefined) loi('khong co cap ' + id);
  const n = Q3.has(id) ? 3 : Q6.has(id) ? 6 : cap < 100 ? 1 : 2;
  const mv = +c[1];
  const hopP = hop1(P1000, bvChoSo(mv, n));
  const cu = c.slice(3), nCot = cu.length;
  const giu = cu.filter(b => b && b !== '-1' && !chiPhieu(b)).map(b => {
    if (!box[b]) loi(id + ' tro hop khong co ' + b);
    if (!tronPhieu(b)) return b;
    const x = box[b]; if (!(x.it.length === 2 && x.it.includes(HB))) loi(id + ' hop tron phieu la ' + b + ': ' + x.it);
    const hbKyVong = nMon(mv, x.bv) / 2; return hop1(HB, Math.round(mv * 2 / Math.min(1, hbKyVong)));
  });
  const moi = [hopP, ...giu]; if (moi.length > 20) loi(id + ' qua 20 hop'); while (moi.length < nCot) moi.push('-1');
  mdb[i] = [...c.slice(0, 3), ...moi].join('\t');
  const sau = soPhieu(mdb[i].split('\t'));
  if (sau !== n) loi(`${id} sau = ${sau} khac ${n}`);
  const k = `${cap < 80 ? '<80' : cap < 100 ? '80-99' : cap < 110 ? '100-109' : '110+'} ${(+truoc.toFixed(2))} -> ${n}`;
  (dem[k] = dem[k] || []).push(id);
}
const thuTu = (L, ten) => { let t = -1; L.forEach(l => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { if (+id <= t) loi(ten + ' sai thu tu ' + id); t = +id; } }); };
const iCuoi = dbc.findIndex(l => l.split('\t')[0] === String(maxId0));
if (iCuoi < 0) loi('khong thay hop cuoi ' + maxId0);
const dbcMoi = [...dbc.slice(0, iCuoi + 1), ...moiDong, ...dbc.slice(iCuoi + 1)];
thuTu(dbcMoi, 'DropBoxContent'); thuTu(mdb, 'MonsterDropBoxs');
Object.keys(dem).sort().forEach(k => { const v = dem[k]; console.log(k.padEnd(22), v.length, 'dong:', v.slice(0, 14).join(',') + (v.length > 14 ? ',...' : '')); });
console.log('hop moi:', moiDong.map(d => d.split('\t').slice(0, 2).join(' BV') + ' ' + d.split('\t')[4]).join(' | ') || 'khong');
if (ghi) { fs.writeFileSync(F_DBC, dbcMoi.join(E1), 'latin1'); fs.writeFileSync(F_MDB, mdb.join(E2), 'latin1'); console.log('DA GHI'); }
