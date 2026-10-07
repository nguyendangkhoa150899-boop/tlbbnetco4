// 07/10 toi (chu server, sau khi thay pet mo ra ~+20%): tu chat CHUAN pet trade Ghep Ngoc 8000/4000 -> 7000 (chinh) / 3500 (phu) "cho can bang".
// Engine nhan chuan x he so ngau nhien >= 1.000 (PetConfigTable.ini ruler 0: bac 0 1.000-1.035 50% ... bac 9 1.357-1.404 0.1%)
// -> pet that ra 7000..9800 / 3500..4900, pho bien ~7000-7500.
// Ap cho 51 con dang trade: 14 ho pet dep (moi cap) + 37 ho Tran Thu Cao Cap (bo 4 ho da loai: Luong Luong Ma, Phong Dieu, Bang Giai, Tung Thu).
//   - Cao Cap: cap mang 85 giu 6000/3000 (khong co trung nao ra ban 85); moi cap khac 7000/3500.
//   - Bien di doi k: CA 5 chi so +500 x k, toi da +3500 (giu nhu tools/pet-caocap-07-10.js).
//   - TUNG chi so = max(BANG GOC cua game, muc moi): bang goc = tag truoc-pet-dep-tuchat-07-10 (14 ho) / truoc-pet-caocap-07-10 (Cao Cap)
//     - so voi ban goc, KHONG so voi ban 8000/4000 hien tai (neu khong 14 ho pet dep ket o 8000).
// Ho = (ma ho + ten goc) nhu pet-caocap-07-10.js. Doc/ghi latin1 (GBK), giu CR. CAN RESTART game. Rollback: tag truoc-pet-tuchat-7000-07-10.
const fs = require('fs'), path = require('path'), { execSync } = require('child_process');
const R = path.join(__dirname, '..');
const F_ATTR = path.join(R, 'server/Public/Config/PetAttrTable.txt');
const COT = { 'Ngoại công': 34, 'Nội công': 36, 'Cân bằng': 35 };
const goc = (n) => n.replace(/^Biến dị /, '').replace(/ \(bảo bảo\)$/, '');
const tag = (t, f) => execSync('git show ' + t + ':' + f, { cwd: R, maxBuffer: 1 << 28 }).toString('latin1').split('\n');

const pet = {};
for (const l of fs.readFileSync(path.join(R, 'docs/pet-danh-sach.tsv'), 'utf8').split('\n').slice(1)) {
  const c = l.split('\t'); if (c.length < 9) continue;
  pet[c[0]] = { g: goc(c[1]), t: c[3], cap: +c[4], bd: c[5] === '1', k: c[8].trim() };
}
// 37 ho Cao Cap: tu trung shop 219 ban GOC (truoc pet-caocap) tru 4 trung bi loai
const LOAI = ['30309812', '30309817', '30309836', '30309843'];
const s219 = tag('truoc-pet-caocap-07-10', 'server/Public/Config/ShopTable.txt').find((l) => l.startsWith('219\t')).replace(/\r$/, '').split('\t');
const TRUNG = []; for (let g = 0; g < 50; g++) { const v = (s219[25 + g * 6] || '').trim(); if (v && !LOAI.includes(v)) TRUNG.push(v); }
if (TRUNG.length !== 37) throw new Error('trung Cao Cap ' + TRUNG.length + ' (mong 37)');
const Z = tag('truoc-pet-caocap-07-10', 'server/Public/Data/Script/obj/item/zhenshoudan.lua');
const hoCC = new Set();
for (const id of TRUNG) for (const l of Z.filter((x) => x.startsWith('x300027_g_petList[' + id + ']'))) { const m = l.match(/dataId=(\d+)/); if (m) hoCC.add(pet[m[1]].t + '|' + pet[m[1]].g); }
const cc = new Set(Object.keys(pet).filter((id) => hoCC.has(pet[id].t + '|' + pet[id].g)));
const HO14 = ['Ngọc Loan Phượng', 'Ngạo Vân Thương Long', 'Thái Cổ Long Hồn', 'Hiên Viên Thiên Phượng', 'Côn Luân Tiên Tuấn', 'Nhân Ngư Công Chủ', 'Cửu Tiêu Chiến Long',
  'Thiết Phiến Công Chủ', 'Tề Thiên Đại Thánh', 'Nhị Lang Chân Quân', 'Long Tam Thái Tử', 'Bích Lạc Thanh Loan', 'Thiên Mệnh Huyền Phượng', 'Oa Hoàng Long Đế'];
const p14 = new Set(Object.keys(pet).filter((id) => HO14.includes(pet[id].g)));
for (const id of [...cc, ...p14]) if (!COT[pet[id].k]) throw new Error('ID ' + id + ' kieu la: ' + pet[id].k);
const doiBD = {}; { const nhom = {};
  for (const id of new Set([...cc, ...p14])) if (pet[id].bd) (nhom[pet[id].t + '|' + pet[id].g] = nhom[pet[id].t + '|' + pet[id].g] || []).push(+id);
  for (const ds of Object.values(nhom)) ds.sort((a, b) => a - b).forEach((id, i) => { doiBD[id] = i + 1; }); }
// bang goc tung ID
const goc14 = {}, gocCC = {};
for (const l of tag('truoc-pet-dep-tuchat-07-10', 'server/Public/Config/PetAttrTable.txt')) { const c = l.split('\t'); if (p14.has(c[0])) goc14[c[0]] = c.slice(34, 39).map(Number); }
for (const l of tag('truoc-pet-caocap-07-10', 'server/Public/Config/PetAttrTable.txt')) { const c = l.split('\t'); if (cc.has(c[0])) gocCC[c[0]] = c.slice(34, 39).map(Number); }

const A = fs.readFileSync(F_ATTR, 'latin1').split('\n'); let nCC = 0, n14 = 0;
for (let i = 0; i < A.length; i++) {
  const id = A[i].split('\t')[0]; const la14 = p14.has(id), laCC = cc.has(id); if (!la14 && !laCC) continue;
  const o = la14 ? goc14[id] : gocCC[id]; if (!o) throw new Error('khong co ban goc ID ' + id);
  const cr = A[i].endsWith('\r'); const c = A[i].replace(/\r$/, '').split('\t');
  const [chinh, phu] = laCC && pet[id].cap === 85 ? [6000, 3000] : [7000, 3500];
  const cong = Math.min(500 * (doiBD[id] || 0), 3500);
  for (let k = 34; k <= 38; k++) c[k] = String(Math.max(o[k - 34], (k === COT[pet[id].k] ? chinh : phu) + cong));
  A[i] = c.join('\t') + (cr ? '\r' : ''); if (la14) n14++; else nCC++;
}
if (nCC !== cc.size || n14 !== p14.size) throw new Error('sua ' + nCC + '/' + cc.size + ' Cao Cap, ' + n14 + '/' + p14.size + ' pet dep');
fs.writeFileSync(F_ATTR, A.join('\n'), 'latin1');
console.log('7000/3500: Cao Cap', nCC, 'ID (37 ho) | pet dep', n14, 'ID (14 ho) | bien di +500/doi toi da 3500 | khong thap hon bang goc');
