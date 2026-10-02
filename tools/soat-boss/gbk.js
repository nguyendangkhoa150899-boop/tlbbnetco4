// In dong khop regex, giai GBK (doc chu thich / chuoi tieng Trung con sot)
//   node tools/soat-boss/gbk.js <ID script | duong dan> "<regex>" [so dong ngu canh]
const c = require('./_chung');
const [x, pat, ctx] = process.argv.slice(2);
if (!x) { console.log('cach dung: node tools/soat-boss/gbk.js <ID script | duong dan> "<regex>" [so dong ngu canh]'); process.exit(1); }
const re = new RegExp(pat || '.'), k = +(ctx || 0);
const L = c.doc(c.timScript(x)).split('\n');
const hien = new Set();
L.forEach((l, i) => { if (re.test(l)) for (let j = Math.max(0, i - k); j <= Math.min(L.length - 1, i + k); j++) hien.add(j); });
let truoc = -2;
for (const j of [...hien].sort((a, b) => a - b)) { if (j !== truoc + 1) console.log('   ...'); console.log(String(j + 1).padStart(4) + ': ' + c.gbk(L[j].replace(/\r$/, '')).slice(0, 200)); truoc = j; }
