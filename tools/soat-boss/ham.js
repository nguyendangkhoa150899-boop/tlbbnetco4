// In rieng cac ham Lua co ten khop regex (bo chu thich, dong trong, end/else/return le). Doc luong boss nhanh hon doc ca file.
//   node tools/soat-boss/ham.js <ID script | duong dan> "<regex ten ham>"
//   node tools/soat-boss/ham.js 894006 "OnDie|OnLeaveCombat"
const c = require('./_chung');
const [x, pat] = process.argv.slice(2);
if (!x) { console.log('cach dung: node tools/soat-boss/ham.js <ID script | duong dan> "<regex ten ham>"'); process.exit(1); }
const re = new RegExp(pat || '.');
let bat = false;
c.doc(c.timScript(x)).split('\n').forEach((l, i) => {
  const t = l.replace(/\r$/, '');
  const fm = t.match(/^\s*function\s+(\S+?)\s*\(/);
  if (fm) bat = re.test(fm[1]);
  if (!bat) return;
  const s = c.viscii(t.replace(/--.*$/, '')).replace(/\s+/g, ' ').trim();
  if (!s || /^(end|else|return)$/.test(s)) return;
  console.log(String(i + 1).padStart(4) + ': ' + s.slice(0, 200));
});
