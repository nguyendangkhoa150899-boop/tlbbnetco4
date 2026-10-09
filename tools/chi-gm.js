// Tim trang bi "CHI GM LAY DUOC": co trong EquipBase server (+ client neu dua goi Config) nhung KHONG co nguon thuong nao:
//   shop dang dung (Public/Config/ShopTable.txt), hop roi (Server/Config/DropBoxContent.txt + MonsterDropBoxs), bang mo ruong
//   (Server/Config/boxdroplist*.txt), che tao (Public/Config/ItemCompound.txt), moi so 8 chu so trong script Lua (NPC doi, qua, su kien).
// KHONG xet: hang web cua bot (Shop web / Ruong / Ghep Ngoc - cau hinh trong database bot), hang doi qua admin.
//   node tools/chi-gm.js [goi Config client .axp (tachgoi.js) de lay ten client + chi giu mon client co] > docs/vat-pham/chi-gm.tsv
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..', 'server');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8')); const rv = {}; for (const k in vis) rv[vis[k]] = k;
const vn = (s) => [...s].map((ch) => { const c = ch.charCodeAt(0); return c < 128 ? ch : (rv[c] || ch); }).join('');
const gbk = (s) => new TextDecoder('gbk').decode(Buffer.from(s, 'latin1'));
const ten = (s) => (/[一-鿿]/.test(gbk(s)) ? gbk(s) : vn(s)).replace(/#[ce][0-9A-Fa-f]{6}|#g[0-9A-Fa-f]{6}|#[A-Za-z]/g, '').trim();
const doc = (f) => fs.readFileSync(path.join(R, f), 'latin1');

// --- nguon thuong
const nguon = new Map(); const them = (id, n) => { if (!nguon.has(id)) nguon.set(id, new Set()); nguon.get(id).add(n); };
for (const l of doc('Public/Config/ShopTable.txt').split('\n')) for (const m of l.matchAll(/\b(\d{8})\b/g)) them(m[1], 'shop');
const hop = {}; for (const l of doc('Server/Config/DropBoxContent.txt').split('\n')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) for (let i = 4; i < c.length; i += 2) if (/^\d{8}$/.test(c[i])) (hop[c[0]] = hop[c[0]] || []).push(c[i]); }
const hopDung = new Set(); for (const l of doc('Server/Config/MonsterDropBoxs.txt').split('\n')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) for (const b of c.slice(3, 23)) hopDung.add(b); }
for (const [b, ds] of Object.entries(hop)) for (const id of ds) them(id, hopDung.has(b) ? 'roi' : 'hop-khong-quai');
for (const f of fs.readdirSync(path.join(R, 'Server/Config')).filter((f) => /^boxdroplist/i.test(f))) for (const m of doc('Server/Config/' + f).matchAll(/\b(\d{8})\b/g)) them(m[1], 'ruong');
for (const l of doc('Public/Config/ItemCompound.txt').split('\n')) for (const m of l.matchAll(/\b(\d{8})\b/g)) them(m[1], 'che');
const S = path.join(R, 'Public/Data/Script');
(function quet(d) { for (const f of fs.readdirSync(d, { withFileTypes: true })) { const p = path.join(d, f.name); if (f.isDirectory()) quet(p); else if (/\.lua$/i.test(f.name)) for (const m of fs.readFileSync(p, 'latin1').matchAll(/\b(\d{8})\b/g)) them(m[1], 'lua:' + path.relative(S, p).replace(/\\/g, '/')); } })(S);
// node tools/chi-gm.js --nguon <id> ... : in nguon cua tung ma roi thoat
if (process.argv[2] === '--nguon') { for (const id of process.argv.slice(3)) console.log(id, nguon.has(id) ? [...nguon.get(id)].join(' | ') : 'KHONG CO NGUON (chi GM)'); process.exit(0); }

// --- client (tuy chon)
let CL = null;
if (process.argv[2]) {
  const { mo } = require('./pet3d/trich.js'); const { giai } = require('./pet3d/giaima.js'); const A = mo(process.argv[2]);
  CL = new Map(giai(A.doc(A.ds.find((f) => f.ten === 'EquipBase.txt')).buf).buf.toString('latin1').split('\n').map((l) => { const c = l.split('\t'); return [c[0], c]; }));
}
// --- trang bi khong nguon
const DIEM = { 0: 'Vũ khí', 1: 'Mũ', 2: 'Áo', 3: 'Bao tay', 4: 'Giày', 5: 'Đai', 6: 'Nhẫn', 7: 'Hạng liên', 8: 'Cưỡi', 9: 'Nhẫn 2', 10: 'Hộ phù 2', 11: 'Hộ phù', 12: 'Hộ phù', 14: 'Hộ uyển', 15: 'Hộ kiên', 16: 'Thời trang', 17: 'Ám khí', 18: 'Long văn', 19: 'Võ hồn' };
const ra = [['id', 'ten_client', 'ten_server', 'vi_tri', 'cap', 'so_dong_thuoc_tinh', 'loai_mo_ta', 'ghi_chu'].join('\t')];
let tong = 0, khong = 0, coCl = 0;
for (const l of doc('Public/Config/EquipBase.txt').split('\n')) {
  const c = l.split('\t'); if (!/^\d{8}$/.test(c[0])) continue; tong++;
  if (nguon.has(c[0])) continue; khong++;
  const k = CL ? CL.get(c[0]) : null; if (CL && !k) continue; coCl++;
  // ten client luon VISCII; ten server phan lon GBK (vai dong viet hoa VISCII)
  ra.push([c[0], k ? vn(k[10]).replace(/#[ce][0-9A-Fa-f]{6}|#g[0-9A-Fa-f]{6}|#[A-Za-z]/g, '').trim() : '', ten(c[10]), DIEM[c[5]] || ('diem ' + c[5]), c[11], (c[92] || '') + '-' + (c[93] || ''), ten(c[22] || ''), (c[19] && c[19] !== '-1' ? 'hieu ung ' + c[19] : '')].join('\t'));
}
process.stdout.write(ra.join('\n') + '\n');
console.error('EquipBase server:', tong, '| khong nguon thuong:', khong, CL ? '| trong do client co: ' + coCl : '');
