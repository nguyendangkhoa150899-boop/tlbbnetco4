// 07/10 NANG TU CHAT 14 ho PET DEP (chi phat qua event / trade up Ghep Ngoc - docs/pet-dep-event.md).
// Moi ID cua ho (truong thanh, bien di, bao bao, moi cap mang 5..95): tu chat CHUAN (PetAttrTable cot 34..38) =
//   thuoc tinh chinh theo kieu tan cong 8000, 4 thuoc tinh con lai 4000 - MOI cap mang (07/10 toi: bo muc 6000/3000; trung pet dep da mac dinh ra ban 95):
//   Ngoai cong -> 34 Cuong luc (力量) | Noi cong -> 36 Noi luc / linh khi (灵气) | Can bang -> 35 The luc (体质)
//   (giong cach bo Huyen Hoa V2: Ngoai = Cuong luc, Noi = Noi luc, Can bang = The luc). 37 Than phap, 38 Dinh luc = 3000.
// Trung tao pet bang ruler 1 (co nhan he so ngau nhien) -> 6000 la muc CHUAN, pet that ra quanh do. Pet DA CO giu chi so cu.
// Doc / ghi latin1 (file GBK), giu CR tung dong. CAN RESTART game. Rollback: tag truoc-pet-dep-tuchat-07-10.
//   node tools/pet-dep-tuchat-07-10.js          -> ghi
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..');
const F = path.join(R, 'server/Public/Config/PetAttrTable.txt');
const HO = ['Ngọc Loan Phượng', 'Ngạo Vân Thương Long', 'Thái Cổ Long Hồn', 'Hiên Viên Thiên Phượng', 'Côn Luân Tiên Tuấn', 'Nhân Ngư Công Chủ', 'Cửu Tiêu Chiến Long',
  'Thiết Phiến Công Chủ', 'Tề Thiên Đại Thánh', 'Nhị Lang Chân Quân', 'Long Tam Thái Tử', 'Bích Lạc Thanh Loan', 'Thiên Mệnh Huyền Phượng', 'Oa Hoàng Long Đế'];
const COT = { 'Ngoại công': 34, 'Nội công': 36, 'Cân bằng': 35 };
const goc = (n) => n.replace(/^Biến dị /, '').replace(/ \(bảo bảo\)$/, '');
const kieu = {}, cap = {};
for (const l of fs.readFileSync(path.join(R, 'docs/pet-danh-sach.tsv'), 'utf8').split('\n').slice(1)) {
  const c = l.split('\t'); if (c.length < 9 || !HO.includes(goc(c[1]))) continue;
  if (!COT[c[8]]) throw new Error('ID ' + c[0] + ' kieu la: ' + c[8]);
  kieu[c[0]] = c[8]; cap[c[0]] = +c[4];
}
const L = fs.readFileSync(F, 'latin1').split('\n'); let n = 0;
for (let i = 0; i < L.length; i++) {
  const id = L[i].split('\t')[0]; if (!kieu[id]) continue;
  const cr = L[i].endsWith('\r'); const c = L[i].replace(/\r$/, '').split('\t');
  const [chinh, phu] = [8000, 4000];   // 07/10 toi: chu server bo 6000/3000 - moi ban (moi cap mang) 8000/4000
  for (let k = 34; k <= 38; k++) c[k] = String(k === COT[kieu[id]] ? chinh : phu);
  L[i] = c.join('\t') + (cr ? '\r' : ''); n++;
}
if (n !== Object.keys(kieu).length) throw new Error('sua ' + n + ' / ' + Object.keys(kieu).length + ' ID');
fs.writeFileSync(F, L.join('\n'), 'latin1');
console.log('da dat tu chat', n, 'ID (' + HO.length + ' ho)');
