// Tra / doi gia 1 mon trong ShopTable.txt (shop trong game). Cot 7 = loai tien (1 vang, 5 KNB, 6 Diem Tang);
// mon tu cot 25, moi o 6 cot: ID, 1, -1, gia, 100, mau. Sua theo byte (latin1), giu nguyen CRLF.
//   node tools/shop-gia.js <ID> [<ID>...]                     -> liet ke moi ke co mon do
//   node tools/shop-gia.js --doi <ke> <ID> <gia moi> [--ghi]   -> doi gia o ke do (kiem dung 1 o)
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Config/ShopTable.txt');
const raw = fs.readFileSync(F, 'latin1');
const EOL = raw.includes('\r\n') ? '\r\n' : '\n';
const L = raw.split(EOL);
const TIEN = { 1: 'vang', 5: 'KNB', 6: 'Diem Tang' };
const a = process.argv.slice(2);
const o = (c) => { const out = []; for (let i = 25; i + 3 < c.length; i += 6) if (c[i] && c[i] !== '-1' && /^\d+$/.test(c[i])) out.push({ i, id: c[i], gia: c[i + 3] }); return out; };
if (a[0] === '--doi') {
  const [, ke, id, gia] = a; const ghi = a.includes('--ghi');
  if (!/^\d+$/.test(gia)) { console.error('gia sai'); process.exit(1); }
  const idx = L.findIndex(l => l.split('\t')[0] === ke);
  if (idx < 0) { console.error('khong co ke ' + ke); process.exit(1); }
  const c = L[idx].split('\t'); const hit = o(c).filter(x => x.id === id);
  if (hit.length !== 1) { console.error(`ke ${ke} co ${hit.length} o ${id}`); process.exit(1); }
  console.log(`ke ${ke} (${TIEN[c[7]] || 'tien ' + c[7]}) ${id}: ${c[hit[0].i + 3]} -> ${gia}`);
  c[hit[0].i + 3] = gia; L[idx] = c.join('\t');
  if (ghi) { fs.writeFileSync(F, L.join(EOL), 'latin1'); console.log('DA GHI'); }
  process.exit(0);
}
for (const l of L) { const c = l.split('\t'); if (!/^\d+$/.test(c[0])) continue; for (const x of o(c)) if (a.includes(x.id)) console.log(`ke ${c[0]}\ttien ${TIEN[c[7]] || c[7]}\t${x.id}\tgia ${x.gia}`); }
