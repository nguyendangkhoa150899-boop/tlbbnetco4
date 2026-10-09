// Liet ke MOI hieu ung gan vao trang bi (EquipBase cot 19 "hieu ung than khi") + tham so chinh + hieu ung con + mon dung no.
//   node tools/hieu-ung-than-khi.js            -> in tom tat
//   node tools/hieu-ung-than-khi.js --tsv > docs/vat-pham/hieu-ung-than-khi.tsv
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..', 'server');
const gbk = (x) => new TextDecoder('gbk').decode(Buffer.from(x, 'latin1'));
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8')); const rv = {}; for (const k in vis) rv[vis[k]] = k;
const vn = (s) => [...s].map((ch) => { const c = ch.charCodeAt(0); return c < 128 ? ch : (rv[c] || ch); }).join('');
const ten = (s) => { const g = gbk(s); return (/[一-鿿]/.test(g) ? g : vn(s)).replace(/#[ceg][0-9A-Fa-f]{6}|#[A-Za-z]/g, '').trim(); };
const SI = new Map(fs.readFileSync(path.join(R, 'Server/Config/StandardImpact.txt'), 'latin1').split('\n').map((l) => { const c = l.replace(/\r$/, '').split('\t'); return [c[0], c]; }));
const EB = fs.readFileSync(path.join(R, 'Public/Config/EquipBase.txt'), 'latin1').split('\n').map((l) => l.split('\t')).filter((c) => /^\d{8}$/.test(c[0]));
// tham so co ten (o ten o i, gia tri o i+1), bo gia tri 0 / -1 / rong
const thamSo = (c) => { const o = []; for (let i = 27; i < c.length - 1; i++) { const t = gbk(c[i]); if (/[一-鿿]/.test(t) && !/^(0|-1|)$/.test(c[i + 1])) o.push(t.replace(/[，,].*$/, '').trim() + '=' + c[i + 1]); } return o.join('; '); };
const DICH = [['伤害目标时的激发几率', 'tỉ lệ kích hoạt khi đánh trúng %'], ['会心一击时的激发几率', 'tỉ lệ kích hoạt khi bạo kích %'], ['受到伤害时的激发几率', 'tỉ lệ kích hoạt khi bị đánh %'],
  ['影响或生效的技能集合ID', 'nhóm chiêu'], ['伤害修正率', 'hệ số sát thương (100 = x2)'], ['给自己的子效果1', 'hiệu ứng con cho mình'], ['给目标或攻击者的子效果1', 'hiệu ứng con cho mục tiêu'],
  ['免疫率', 'miễn %'], ['反射率', 'phản %'], ['反射发生几率', 'tỉ lệ phản %'], ['反射伤害上限', 'trần phản'], ['会心攻击+', 'hội tâm công +'], ['是否忽略目标防御', 'bỏ qua phòng thủ'], ['激发次数', 'số lần']];
const viet = (s) => { for (const [a, b] of DICH) s = s.split(a).join(b); return s; };
const g = new Map(); for (const c of EB) { const h = c[19]; if (!h || h === '-1') continue; if (!g.has(h)) g.set(h, []); g.get(h).push(c); }
const rows = [];
for (const [h, ds] of g) {
  const c = SI.get(h); const sub = [];
  if (c) for (let i = 27; i < c.length - 1; i++) if (/子效果/.test(gbk(c[i])) && SI.has(c[i + 1]) && c[i + 1] !== h) { const s = SI.get(c[i + 1]); sub.push(c[i + 1] + ' ' + gbk(s[1]) + ' [logic ' + s[2] + ', ' + (s[20] === '-1' ? 'mãi' : (+s[20] / 1000) + 's') + '] ' + viet(thamSo(s))); }
  rows.push({ h, ten: c ? gbk(c[1]) : '(không có trong StandardImpact)', logic: c ? c[2] : '?', ts: c ? viet(thamSo(c)) : '', sub: sub.join(' / '), n: ds.length, mon: ds.map((x) => x[0] + ' ' + ten(x[10])) });
}
rows.sort((a, b) => +a.h - +b.h);
if (process.argv.includes('--tsv')) {
  console.log(['hieu_ung', 'ten', 'logic', 'tham_so', 'hieu_ung_con', 'so_mon', 'mon (toi da 10)'].join('\t'));
  for (const r of rows) console.log([r.h, r.ten, r.logic, r.ts, r.sub, r.n, r.mon.slice(0, 10).join(', ')].join('\t'));
} else {
  console.log('so hieu ung:', rows.length, '| so mon co hieu ung:', rows.reduce((t, r) => t + r.n, 0));
  for (const r of rows) console.log(r.h.padStart(5), 'L' + r.logic.padEnd(3), r.ten.padEnd(12), '|', r.ts.slice(0, 110), r.sub ? '| CON: ' + r.sub.slice(0, 120) : '', '| x' + r.n, '|', r.mon.slice(0, 2).join(', ').slice(0, 70));
}
