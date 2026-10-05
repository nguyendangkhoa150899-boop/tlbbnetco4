// 05/10 khuya (chủ server): phần thưởng CUỐI Sát Tinh chuyển từ Ngô Vĩnh 13456 sang Lộ Quân Dật 13465 (khó nhất).
// 2 dòng MonsterDropBoxs chỉ khác 2 hộp đầu: 90088 (ngọc 6, X 0,5) + 90047 (phiếu 1000, X 5) -> ĐỔI CHỖ phần hộp (cột DID1..DID20)
// của 2 dòng. Mv giữ nguyên (cùng 60). Kiểm phần còn lại giống hệt trước khi đổi. Cần restart game (bảng .txt).
// Túi boss web: roimap.lua x950001_TB_g_SatTinhBoss (Lua, sửa riêng). node tools/sattinh-cuoi-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Server/Config/MonsterDropBoxs.txt');
const ghi = process.argv.includes('--ghi');
const raw = fs.readFileSync(F, 'latin1');
const L = raw.split('\n');   // giữ \r của từng dòng
const tim = (id) => { const i = L.findIndex((l) => l.split('\t')[0] === id); if (i < 0) { console.error('LOI: khong thay dong ' + id); process.exit(1); } return i; };
const iN = tim('13456'), iL = tim('13465');
const tach = (l) => { const cr = l.endsWith('\r'); const c = (cr ? l.slice(0, -1) : l).split('\t'); return { c, cr }; };
const N = tach(L[iN]), Q = tach(L[iL]);
const hopN = N.c.slice(3).filter((b) => b !== '-1'), hopQ = Q.c.slice(3).filter((b) => b !== '-1');
console.log('truoc 13456 Ngo Vinh :', hopN.join(' '));
console.log('truoc 13465 Lo Quan Dat:', hopQ.join(' '));
if (hopN[0] !== '90088' || hopN[1] !== '90047') { console.error('LOI: 13456 khong bat dau bang 90088 90047 (da doi roi?)'); process.exit(1); }
if (hopN.slice(2).join(' ') !== hopQ.join(' ')) { console.error('LOI: phan hop con lai cua 2 dong khac nhau - khong doi cho mu'); process.exit(1); }
if (N.c[1] !== Q.c[1] || N.c[2] !== Q.c[2] || N.c.length !== Q.c.length) { console.error('LOI: Mv / loai / so cot khac nhau'); process.exit(1); }
const moiN = N.c.slice(0, 3).concat(Q.c.slice(3)), moiQ = Q.c.slice(0, 3).concat(N.c.slice(3));
L[iN] = moiN.join('\t') + (N.cr ? '\r' : ''); L[iL] = moiQ.join('\t') + (Q.cr ? '\r' : '');
console.log('sau   13456 Ngo Vinh :', moiN.slice(3).filter((b) => b !== '-1').join(' '));
console.log('sau   13465 Lo Quan Dat:', moiQ.slice(3).filter((b) => b !== '-1').join(' '));
if (ghi) { fs.writeFileSync(F, L.join('\n'), 'latin1'); console.log('DA GHI'); }
