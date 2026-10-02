// In file script (giai VISCII + \ddd). Chu thich tieng Trung (GBK) se ra ky tu la: dung gbk.js de doc.
//   node tools/soat-boss/doc.js <ID script | duong dan> [dong dau] [dong cuoi]
//   node tools/soat-boss/doc.js 894007 30 130
const c = require('./_chung');
const [x, a, b] = process.argv.slice(2);
if (!x) { console.log('cach dung: node tools/soat-boss/doc.js <ID script | duong dan> [dong dau] [dong cuoi]'); process.exit(1); }
const L = c.doc(c.timScript(x)).split('\n');
const tu = +(a || 1), den = +(b || L.length);
for (let i = tu; i <= Math.min(den, L.length); i++) console.log(String(i).padStart(4) + ': ' + c.viscii(L[i - 1].replace(/\r$/, '')));
