// 06/10 khuya (chủ server): Sát Tinh (Sinh Tử Lôi Đài) quá mạnh -> giảm 40% máu, 30% công của cả 11 DataID boss
// (13456 dùng chung Ngô Dụng + Tống Giang). Chỉ Sát Tinh dùng các ID này (grep Script/Scene, ngoài obj/shengsi chỉ có roimap.lua).
// MonsterAttrExTable.txt, cột đếm từ 0: HP 19 + MaxHP 59 x0,6; công ngoại 15, công nội 17, 4 hệ 30/33/36/39, MaxAtt 55, MaxMag 57 x0,7.
// Hệ số nhân trên giá trị ĐANG CÓ (máu hiện = 90% gốc sau 2d9eca5 -> còn 54% gốc). Chặn chạy lần 2: so với HEAD phải đúng giá trị cũ.
// Kỹ năng boss là kỹ năng môn phái (script253-259.ai) -> sát thương theo công, giảm công ~ giảm sát thương; phần cộng thẳng của impact không đổi.
// Cần restart (bảng Public/Config). node tools/sattinh-nerf-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Config/MonsterAttrExTable.txt');
const ghi = process.argv.includes('--ghi');
const IDS = ['13447', '13456', '13465', '13474', '13483', '13492', '13501', '13510', '13519', '13528', '13537'];
const HS = { 19: 0.6, 59: 0.6, 15: 0.7, 17: 0.7, 30: 0.7, 33: 0.7, 36: 0.7, 39: 0.7, 55: 0.7, 57: 0.7 };
// giá trị HEAD 52d4bbb (trước nerf) cột 19 -> chặn chạy 2 lần
const HP_CU = { 13447: 1821600, 13456: 8787398, 13465: 5858265, 13474: 2127628, 13483: 2164060, 13492: 2164060, 13501: 1623045, 13510: 1623045, 13519: 1623045, 13528: 2164060, 13537: 1623045 };
const raw = fs.readFileSync(F, 'latin1');
const L = raw.split('\n');
let n = 0;
for (const id of IDS) {
  const i = L.findIndex((l) => l.split('\t')[0] === id);
  if (i < 0) { console.error('LOI: khong thay ' + id); process.exit(1); }
  const cr = L[i].endsWith('\r'), c = (cr ? L[i].slice(0, -1) : L[i]).split('\t');
  if (+c[19] !== HP_CU[id]) { console.error('LOI: ' + id + ' HP ' + c[19] + ' khac gia tri truoc nerf ' + HP_CU[id] + ' (da chay roi?)'); process.exit(1); }
  const doi = [];
  for (const [k, h] of Object.entries(HS)) {
    if (!/^\d+$/.test(c[k])) { console.error('LOI: ' + id + ' cot ' + k + ' = ' + c[k]); process.exit(1); }
    if (+c[k] === 0) continue;
    const v = String(Math.floor(+c[k] * h)); doi.push(k + ':' + c[k] + '->' + v); c[k] = v; n++;
  }
  L[i] = c.join('\t') + (cr ? '\r' : '');
  console.log(id, doi.join(' '));
}
const out = L.join('\n');
const cnt = (s, re) => (s.match(re) || []).length;
console.log('doi', n, 'o; byte>127', cnt(raw, /[\x80-\xff]/g), '->', cnt(out, /[\x80-\xff]/g), 'CR', cnt(raw, /\r/g), '->', cnt(out, /\r/g));
if (ghi) { fs.writeFileSync(F, out, 'latin1'); console.log('DA GHI'); }
