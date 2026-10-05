// Tìm MỌI nguồn rơi 1 vật phẩm trong bảng rơi: hộp nào chứa, quái nào dùng hộp đó, kỳ vọng mỗi người / lần hạ
// (engine thật: X = Mv/BV × 2 × giảm rơi (chỉ khi quái cao hơn người); ra floor(X) + phần lẻ; mỗi món bốc đều trong hộp).
// node tools/tim-nguon.js <itemID> [cấp người chơi, mặc định 89]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../server/');
const item = process.argv[2], Lp = +(process.argv[3] || 89);
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const rv = {}; for (const k in vis) rv[vis[k]] = k;
const dec = s => [...s].map(ch => { const c = ch.charCodeAt(0); return c < 128 ? ch : (rv[c] || '?'); }).join('');
const L = f => fs.readFileSync(R + f, 'latin1').split(/\r?\n/);
const att = (() => { const t = {}; for (const l of L('Server/Config/DropAttenuation.txt')) { const c = l.split('\t'); if (/^-?\d+$/.test(c[0])) t[c[0]] = +c[1]; } return d => d > 0 ? t[Math.min(200, d)] : 1; })();
const box = {}; for (const l of L('Server/Config/DropBoxContent.txt')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) { const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(c[i]); box[c[0]] = { bv: +c[1], it }; } }
const mon = {}; for (const l of L('Public/Config/MonsterAttrExTable.txt')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) mon[c[0]] = { ten: dec(c[1]).trim(), cap: +c[3], boss: c[14] === '1' }; }
// điểm spawn trên bản đồ (file LF, bỏ file monstercount=0)
const spawn = {};
for (const f of fs.readdirSync(R + 'Public/Scene').filter(f => /_monster\.ini$/i.test(f))) {
  const t = fs.readFileSync(R + 'Public/Scene/' + f, 'latin1'); const mc = t.match(/monstercount\s*=\s*(\d+)/i); if (mc && +mc[1] === 0) continue;
  for (const m of t.matchAll(/^type\s*=\s*(\d+)\s*$/gm)) (spawn[m[1]] = spawn[m[1]] || {})[f.replace(/_monster\.ini$/i, '')] = ((spawn[m[1]] || {})[f.replace(/_monster\.ini$/i, '')] || 0) + 1;
}
const hopCo = Object.keys(box).filter(b => box[b].it.includes(item));
const out = [];
for (const l of L('Server/Config/MonsterDropBoxs.txt')) {
  const c = l.split('\t'); if (!/^\d+$/.test(c[0])) continue;
  let kv = 0; const h = [];
  for (const b of c.slice(3, 23)) { if (!hopCo.includes(b)) continue; const x = box[b]; const m = mon[c[0]] || { cap: 0 }; const X = +c[1] / x.bv * 2 * att(m.cap - Lp); const n = x.it.filter(i => i === item).length / x.it.length; kv += X * n; h.push(`${b}(BV${x.bv})`); }
  if (!h.length) continue;
  const m = mon[c[0]] || { ten: '?', cap: '?', boss: false };
  out.push({ id: c[0], ...m, mv: +c[1], kv, h: h.join(' '), sp: spawn[c[0]] ? Object.entries(spawn[c[0]]).map(([k, v]) => k + '×' + v).join(',') : '' });
}
out.sort((a, b) => b.kv - a.kv);
console.log(`vật phẩm ${item} | người cấp ${Lp} | ${hopCo.length} hộp chứa: ${hopCo.map(b => b + '(BV' + box[b].bv + ', ' + box[b].it.length + ' món)').join(' ')}`);
console.log(`${out.length} quái có rơi | kỳ vọng = số cái / người / lần hạ`);
for (const r of out) console.log([r.id, r.ten, 'cấp ' + r.cap, r.boss ? 'BOSS' : 'quái', 'Mv ' + r.mv, r.kv.toFixed(3), r.h, r.sp ? 'map: ' + r.sp : ''].join('\t'));
