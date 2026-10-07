// 07/10 (chu server): TRAN THU CAO CAP (shop 219 = Tiem KNB > Tiem Tran Thu > tab "Tran Thu-Cao Cap") bo khoi shop het, dua vao trade Ghep Ngoc.
//  1. Public/Config/ShopTable.txt: shop 219 xoa het 41 mon (Num giu 50; shop rong da co tien le: 164, 270). CAN RESTART game.
//  2. obj/item/zhenshoudan.lua: 29 trung "linh hoat" (type=2, 7 moc cap) -> type=1 ban moc 95 (giong tools/pet-dep-trung95-07-10.js).
//     12 trung co dinh cap thap (cap mang 5/20/45, ho khong co ban 95) giu nguyen. Lua -> hieu luc sau cap-nhat.sh.
//  3. Public/Config/PetAttrTable.txt cot 34..38: tu chat chuan theo CAP MANG cua tung ID (chu server chot 07/10):
//     cap mang 85 -> 6000 (thuoc tinh chinh theo kieu) / 3000 (4 cai con lai); moi cap khac -> 8000 / 4000
//     (ban 95 cua trung linh hoat + pet cap thap 5/20/45 "bang cap 95").
//     TUNG chi so = max(cu, muc moi) -> khong chi so nao thap hon ban cu (ban bien di / cap 85 co chi so phu cu > 3000-4000 giu so cu).
//     Ho = pet co MA HO (cot type) nam trong cac ma ho cua pet ma trung ra VA trung ten goc - KHONG gop theo ten:
//     Bang Giai / Tung Thu / That Xao Ly Mieu cung ten voi ho pet thuong (cua 791, sóc 306, meo shop 218 2391..2397);
//     ma ho 2780/2781 dung chung voi Huyen Hoa Thuy Phi / Ha Dai Ba. CAN RESTART game.
//     Bien di (pet ghep ra) DOI 1..7: CA 5 chi so + 500 x doi (toi da +3500) cho ca 41 ho nay VA 14 ho pet dep (moi cap 8000/4000 nhu cu).
// Doc/ghi latin1 (file GBK), giu CR tung dong. Rollback: tag truoc-pet-caocap-07-10.
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..');
const F_SHOP = path.join(R, 'server/Public/Config/ShopTable.txt');
const F_TRUNG = path.join(R, 'server/Public/Data/Script/obj/item/zhenshoudan.lua');
const F_ATTR = path.join(R, 'server/Public/Config/PetAttrTable.txt');
const COT = { 'Ngoại công': 34, 'Nội công': 36, 'Cân bằng': 35 };   // giong pet-dep-tuchat-07-10.js
const goc = (n) => n.replace(/^Biến dị /, '').replace(/ \(bảo bảo\)$/, '');

const pet = {};
for (const l of fs.readFileSync(path.join(R, 'docs/pet-danh-sach.tsv'), 'utf8').split('\n').slice(1)) {
  const c = l.split('\t'); if (c.length < 9) continue;
  pet[c[0]] = { g: goc(c[1]), t: c[3], cap: +c[4], bd: c[5] === '1', k: c[8].trim() };
}

// --- 1. shop 219: lay danh sach trung roi xoa het
const S = fs.readFileSync(F_SHOP, 'latin1').split('\n');
const k219 = S.findIndex((l) => l.startsWith('219\t')); if (k219 < 0) throw new Error('khong thay shop 219');
const crS = S[k219].endsWith('\r'); const c219 = S[k219].replace(/\r$/, '').split('\t');
if (c219.length !== 325) throw new Error('shop 219 co ' + c219.length + ' cot');
const TRUNG = []; for (let g = 0; g < 50; g++) { const v = (c219[25 + g * 6] || '').trim(); if (v) TRUNG.push(v); }
if (TRUNG.length !== 41) throw new Error('shop 219 co ' + TRUNG.length + ' mon (mong 41)');
for (let i = 25; i < 325; i++) c219[i] = '';
S[k219] = c219.join('\t') + (crS ? '\r' : '');

// --- 2 + ho cho 3: doc trung TRUOC khi sua
let Z = fs.readFileSync(F_TRUNG, 'latin1').split('\n');
const maHo = new Set(), tenHo = new Set();
const doi = [];
for (const id of TRUNG) {
  const ps = Z.filter((l) => l.startsWith('x300027_g_petList[' + id + ']')).map((l) => (l.match(/dataId=(\d+)/) || [])[1]).filter(Boolean);
  if (!ps.length) throw new Error(id + ': khong co trong zhenshoudan.lua');
  for (const p of ps) { if (!pet[p]) throw new Error(id + ': pet ' + p + ' khong co trong pet-danh-sach.tsv'); maHo.add(pet[p].t); tenHo.add(pet[p].g); }
  if (Z.some((l) => l.startsWith('x300027_g_petList[' + id + '] = {type=2'))) doi.push(id);
}
if (doi.length !== 29) throw new Error('so trung linh hoat ' + doi.length + ' (mong 29)');
for (const id of doi) {
  const dau0 = 'x300027_g_petList[' + id + '] = {type=2, dataIds={}, level=1}';
  const dau = Z.findIndex((l) => l.startsWith(dau0));
  const moc = Z.map((l, i) => (l.startsWith('x300027_g_petList[' + id + '].dataIds[') ? i : -1)).filter((i) => i >= 0);
  if (moc.length !== 7) throw new Error(id + ': ' + moc.length + ' moc');
  const m95 = moc.map((i) => Z[i].match(/dataId=(\d+),minHumanLevel=(\d+)/)).find((x) => x && x[2] === '95');
  if (!m95) throw new Error(id + ': khong co moc 95');
  const cr = Z[dau].endsWith('\r') ? '\r' : '';
  const duoi = Z[dau].replace(/\r$/, '').slice(dau0.length);   // giu chu thich cuoi dong
  Z[dau] = 'x300027_g_petList[' + id + '] = {type=1, dataId=' + m95[1] + ', level=1}' + duoi + '   -- [07/10] tran thu cao cap: mac dinh ban cap mang 95' + cr;
  for (const i of moc.sort((a, b) => b - a)) Z.splice(i, 1);
}

// --- 3. tu chat
const A = fs.readFileSync(F_ATTR, 'latin1').split('\n'); let n = 0, n14 = 0;
const can = Object.keys(pet).filter((id) => maHo.has(pet[id].t) && tenHo.has(pet[id].g));
// 14 ho pet dep (trade tu truoc, tools/pet-dep-tuchat-07-10.js: theo ten, moi cap 8000/4000) - chi them cong DOI bien di
const HO14 = ['Ngọc Loan Phượng', 'Ngạo Vân Thương Long', 'Thái Cổ Long Hồn', 'Hiên Viên Thiên Phượng', 'Côn Luân Tiên Tuấn', 'Nhân Ngư Công Chủ', 'Cửu Tiêu Chiến Long',
  'Thiết Phiến Công Chủ', 'Tề Thiên Đại Thánh', 'Nhị Lang Chân Quân', 'Long Tam Thái Tử', 'Bích Lạc Thanh Loan', 'Thiên Mệnh Huyền Phượng', 'Oa Hoàng Long Đế'];
const cu14 = new Set(Object.keys(pet).filter((id) => HO14.includes(pet[id].g)));
for (const id of [...can, ...cu14]) if (!COT[pet[id].k]) throw new Error('ID ' + id + ' kieu la: ' + pet[id].k);
// DOI bien di (pet ghep/phoi ra): trong 1 ma ho (1 cap mang) + 1 ten, cac ID "bien di" xep tang dan = doi 1, 2, ... (cap 95 co 8 con)
// -> CA 5 chi so +500 x doi, toi da +3500 (doi 7; doi 8 cung +3500). Truong thanh / bao bao: muc goc. (chu server chot 07/10)
const doiBD = {}; { const nhom = {};
  for (const id of new Set([...can, ...cu14])) if (pet[id].bd) (nhom[pet[id].t + '|' + pet[id].g] = nhom[pet[id].t + '|' + pet[id].g] || []).push(+id);
  for (const ds of Object.values(nhom)) ds.sort((a, b) => a - b).forEach((id, i) => { doiBD[id] = i + 1; }); }
const canSet = new Set(can);
for (let i = 0; i < A.length; i++) {
  const id = A[i].split('\t')[0]; const moi = canSet.has(id); if (!moi && !cu14.has(id)) continue;
  const cr = A[i].endsWith('\r'); const c = A[i].replace(/\r$/, '').split('\t');
  const [chinh, phu] = moi && pet[id].cap === 85 ? [6000, 3000] : [8000, 4000];
  const cong = Math.min(500 * (doiBD[id] || 0), 3500);
  for (let k = 34; k <= 38; k++) c[k] = String(Math.max(+c[k], (k === COT[pet[id].k] ? chinh : phu) + cong));
  A[i] = c.join('\t') + (cr ? '\r' : ''); if (moi) n++; else n14++;
}
if (n !== can.length || n14 !== cu14.size) throw new Error('sua ' + n + ' / ' + can.length + ' ID, 14 ho ' + n14 + ' / ' + cu14.size);

fs.writeFileSync(F_SHOP, S.join('\n'), 'latin1');
fs.writeFileSync(F_TRUNG, Z.join('\n'), 'latin1');
fs.writeFileSync(F_ATTR, A.join('\n'), 'latin1');
console.log('shop 219: bo', TRUNG.length, 'trung |', doi.length, 'trung -> ban 95 |', tenHo.size, 'ho,', n, 'ID pet (cap 85: 6000/3000, con lai 8000/4000) | 14 ho pet dep', n14, 'ID | bien di doi k: +500k (toi da 3500)');
console.log('TRUNG=' + TRUNG.join(','));
