// Moi quai co hop phieu NBP (ban dang sua): cap, KNB phieu ky vong MOI NGUOI / lan ha tai nguoi cung cap boss (chenh 0),
// gom theo moc cap. node tools/phieu-boss/theo-cap.js [--chi-tiet <cap tu> <cap den>]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../../server/');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, '../viscii-map.json'), 'utf8'));
const rv = {}; for (const k in vis) rv[vis[k]] = k;
const dec = s => [...s].map(ch => { const c = ch.charCodeAt(0); return c < 128 ? ch : (rv[c] || '?'); }).join('');
const L = f => fs.readFileSync(R + f, 'latin1').split(/\r?\n/);
const MENH = { 39910001: 1000, 39910002: 2000, 39910003: 5000, 39910004: 10000, 39910005: 50000, 39910006: 100000 };
const box = {}; for (const l of L('Server/Config/DropBoxContent.txt')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) { const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(+c[i]); box[c[0]] = { bv: +c[1], it }; } }
const mon = {}; for (const l of L('Public/Config/MonsterAttrExTable.txt')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) mon[c[0]] = { ten: dec(c[1]).trim(), cap: +c[3] }; }
const out = [];
for (const l of L('Server/Config/MonsterDropBoxs.txt')) {
  const c = l.split('\t'); if (!/^\d+$/.test(c[0])) continue;
  let knb = 0; const hop = [];
  for (const b of c.slice(3)) { const x = box[b]; if (!x) continue; const v = x.it.filter(i => MENH[i]); if (!v.length) continue; const X = +c[1] / x.bv * 2; const n = X; /* 05/10: engine ra floor(X) + phần lẻ theo xác suất -> kỳ vọng đúng bằng X */ knb += n * v.reduce((s, i) => s + MENH[i], 0) / x.it.length; hop.push(b + ':' + x.bv); }
  if (!hop.length) continue;
  const m = mon[c[0]] || { ten: '?', cap: -1 };
  out.push({ id: c[0], ten: m.ten, cap: m.cap, mv: +c[1], knb: Math.round(knb), hop: hop.join(' ') });
}
const a = process.argv.slice(2);
if (a[0] === '--chi-tiet') { const lo = +a[1], hi = +a[2]; out.filter(r => r.cap >= lo && r.cap <= hi && r.knb >= 500).sort((x, y) => x.cap - y.cap || x.id - y.id).forEach(r => console.log([r.id, r.cap, r.knb, r.ten, r.hop].join('\t'))); process.exit(); }
const moc = r => r.cap < 80 ? '<80' : r.cap < 100 ? '80-99' : r.cap < 110 ? '100-109' : '110+';
const g = {}; for (const r of out) { if (r.knb < 500) continue; const k = moc(r) + ' | ' + r.knb; g[k] = (g[k] || 0) + 1; }
Object.keys(g).sort().forEach(k => console.log(k, '->', g[k], 'dong'));
