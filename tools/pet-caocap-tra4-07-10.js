// 07/10 toi (chu server test tung con tren bialk): LOAI 4 trung khoi trade Ghep Ngoc, tra ve MAC DINH nhu truoc tools/pet-caocap-07-10.js:
//   30309812 Luong Luong Ma ("Tinh Tinh Ma"), 30309817 Phong Dieu, 30309836 Bang Giai, 30309843 Tung Thu (ca 4: trung co dinh cap mang 20 - zhenshoudan.lua khong doi).
//  1. ShopTable.txt shop 219: them lai 4 nhom 6 cot [PID, so/lan, gioi han, gia, giam gia, mau] DUNG nhu ban goc (tag truoc-pet-caocap-07-10), theo thu tu goc.
//  2. PetAttrTable.txt: moi dong cua 4 ho (ma ho + ten cua pet trung ra) chep lai NGUYEN dong goc (tu chat goc, bo cong doi bien di).
// Doc/ghi latin1 (file GBK), giu CR. CAN RESTART game. Rollback: tag truoc-pet-caocap-tra4-07-10.
const fs = require('fs'), path = require('path'), { execSync } = require('child_process');
const R = path.join(__dirname, '..');
const TAG = 'truoc-pet-caocap-07-10';
const TRA = { 30309812: '27749', 30309817: '27859', 30309836: '29539', 30309843: '29969' };   // trung -> pet trung ra
const goc = (f) => execSync('git show ' + TAG + ':' + f, { cwd: R, maxBuffer: 1 << 28 }).toString('latin1').split('\n');
const goc_ = (n) => n.replace(/^Biến dị /, '').replace(/ \(bảo bảo\)$/, '');

// 1. shop 219
const F_SHOP = path.join(R, 'server/Public/Config/ShopTable.txt');
const S = fs.readFileSync(F_SHOP, 'latin1').split('\n'); const S0 = goc('server/Public/Config/ShopTable.txt');
const k = S.findIndex((l) => l.startsWith('219\t')), k0 = S0.findIndex((l) => l.startsWith('219\t'));
const cr = S[k].endsWith('\r'); const c = S[k].replace(/\r$/, '').split('\t'), c0 = S0[k0].replace(/\r$/, '').split('\t');
if (c.length !== 325 || c0.length !== 325) throw new Error('so cot shop 219');
const nhom = (cc) => { const a = []; for (let g = 0; g < 50; g++) { const x = cc.slice(25 + g * 6, 31 + g * 6); if ((x[0] || '').trim()) a.push(x); } return a; };
const dang = nhom(c), them = nhom(c0).filter((x) => TRA[x[0].trim()]);
if (them.length !== 4) throw new Error('ban goc shop 219 co ' + them.length + '/4 trung');
if (dang.some((x) => TRA[x[0].trim()])) throw new Error('shop 219 da co trung roi');
const moi = [...dang, ...them]; while (moi.length < 50) moi.push(['', '', '', '', '', '']);
S[k] = [...c.slice(0, 25), ...moi.flat()].join('\t') + (cr ? '\r' : '');

// 2. tu chat
const pet = {};
for (const l of fs.readFileSync(path.join(R, 'docs/pet-danh-sach.tsv'), 'utf8').split('\n').slice(1)) { const x = l.split('\t'); if (x.length >= 9) pet[x[0]] = { g: goc_(x[1]), t: x[3] }; }
const ho = new Set(Object.values(TRA).map((p) => pet[p].t + '|' + pet[p].g));
const ids = new Set(Object.keys(pet).filter((id) => ho.has(pet[id].t + '|' + pet[id].g)));
const F_ATTR = path.join(R, 'server/Public/Config/PetAttrTable.txt');
const A = fs.readFileSync(F_ATTR, 'latin1').split('\n'); const A0 = goc('server/Public/Config/PetAttrTable.txt');
const dong0 = {}; for (const l of A0) dong0[l.split('\t')[0]] = l;
let n = 0;
for (let i = 0; i < A.length; i++) { const id = A[i].split('\t')[0]; if (!ids.has(id)) continue; if (!dong0[id]) throw new Error('ban goc thieu ID ' + id); A[i] = dong0[id]; n++; }
if (n !== ids.size) throw new Error('tra ' + n + ' / ' + ids.size + ' ID');

fs.writeFileSync(F_SHOP, S.join('\n'), 'latin1');
fs.writeFileSync(F_ATTR, A.join('\n'), 'latin1');
console.log('shop 219: them lai', them.map((x) => x[0].trim() + '@' + x[3].trim()).join(', '), '| tu chat goc:', n, 'ID (' + ho.size + ' ho)');
