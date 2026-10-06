// 07/10 (chủ server): thú cưỡi 10141214 (Huyễn Tuyết Dương Đà, mã hình 316) lên C9: EquipBase cột 90 (品质规则, đếm từ 0) 7 -> 9,
// giống 10141215/10141216 (C9). Quy tắc 1-9 = cấp cố định. Chỉ món tạo SAU restart mới là C9 (phẩm chất ghi lên món lúc tạo).
// Tốc độ (impact 5286 = +100%) không đổi. Cần restart. node tools/thucuoi-c9-07-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Config/EquipBase.txt');
const ghi = process.argv.includes('--ghi');
const ID = '10141214', COT = 90, CU = '7', MOI = '9';
const raw = fs.readFileSync(F, 'latin1'); const L = raw.split('\n');
const i = L.findIndex((l) => l.split('\t')[0] === ID);
if (i < 0) { console.error('LOI: khong thay ' + ID); process.exit(1); }
const cr = L[i].endsWith('\r'), c = (cr ? L[i].slice(0, -1) : L[i]).split('\t');
if (c[COT] !== CU) { console.error('LOI: cot ' + COT + ' = ' + c[COT] + ', cho ' + CU + ' (da chay?)'); process.exit(1); }
c[COT] = MOI; L[i] = c.join('\t') + (cr ? '\r' : '');
const out = L.join('\n'); const cnt = (s, re) => (s.match(re) || []).length;
console.log(ID, 'cot', COT, CU, '->', MOI, '| byte>127', cnt(raw, /[\x80-\xff]/g), '->', cnt(out, /[\x80-\xff]/g), 'CR', cnt(raw, /\r/g), '->', cnt(out, /\r/g));
if (ghi) { fs.writeFileSync(F, out, 'latin1'); console.log('DA GHI'); }
