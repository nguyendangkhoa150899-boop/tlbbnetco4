// 05/10 (sau đợt soát 5 agent, chủ server duyệt A + C1 + C2). Engine thật (Audit + item log 04/10):
// X >= 1 ra FLOOR(X) món + 1 món với xác suất phần lẻ (KHÔNG phải ceil), trần 10 món/người cắt theo thứ tự DID.
//  A1 Q boss cuối: 90046 BV 48 -> 40 (X 2,5 -> 3,0 = đúng 3 tờ); 90018 BV 22 -> 20 (X 5,45 -> 6,0 = đúng 6 tờ)
//  A2 Ngô Vĩnh 13456: 90047 BV 5 -> 24 (X 24 -> 5,0: chưa đo được boss cao hơn người có bị trừ rơi không;
//     không trừ = đúng 5 tờ, có trừ ×0,2 = 1 tờ -> không bao giờ thừa)
//  A3 dọn: Hồng Cức 13220-13229 bỏ 50001 (phiếu cũ ở boss ải); Đế Thích Thiên 15445 phiếu sang hộp riêng (bản sao 50004);
//     dạng NPC PMF 9548-9552, 9668-9672 (thân thiện, không đánh được) bỏ hộp phiếu
//  C1 119 dòng có đủ gói boss 01/10 (90030 50006 50030 50046 50047 50048 1923 50034, thiết kế chưa tính ×2)
//     -> bản sao BV×2 90050-90057 (đã dùng cho PMF nhỏ); Đoàn Diên Khánh 9320-9329/39320-39329 bỏ 3021 (12 thuốc giải), giữ 90029
//  C2 Kỳ Cuộc 1850-1859/31850-31859 + Túc Cầu 3720-3729/33720-33729: 1710 (Tân Mãng Thần Phù 6, BV 20 = 8 cái/người)
//     -> bản sao BV 160 (1 cái/người ở Mv 80)
// node tools/phieu-boss/sua-05-10b.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../../server/Server/Config/');
const F_MDB = R + 'MonsterDropBoxs.txt', F_DBC = R + 'DropBoxContent.txt';
const ghi = process.argv.includes('--ghi');
const loi = m => { console.error('LOI: ' + m); process.exit(1); };
const EOL = s => s.includes('\r\n') ? '\r\n' : '\n';
const dbcRaw = fs.readFileSync(F_DBC, 'latin1'), mdbRaw = fs.readFileSync(F_MDB, 'latin1');
const E1 = EOL(dbcRaw), E2 = EOL(mdbRaw);
const dbc = dbcRaw.split(E1), mdb = mdbRaw.split(E2);
const iHop = {}; let maxId = 0;
dbc.forEach((l, i) => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { iHop[id] = i; maxId = Math.max(maxId, +id); } });
const iQuai = {}; mdb.forEach((l, i) => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) iQuai[id] = i; });
const hopCot = id => dbc[iHop[id]].split('\t');
const dungO = b => Object.keys(iQuai).filter(id => mdb[iQuai[id]].split('\t').slice(3).includes(b));
const r = (a, b) => { const o = []; for (let i = a; i <= b; i++) o.push(String(i)); return o; };
const log = [];

// --- sửa BV tại chỗ (chỉ khi hộp đúng là chỉ dùng ở các dòng dự kiến) ---
const suaBV = (b, cu, moi, chiDung) => {
  const c = hopCot(b); if (+c[1] !== cu) loi(`${b} BV ${c[1]} khac ${cu}`);
  const d = dungO(b).sort(); const k = [...chiDung].sort();
  if (JSON.stringify(d) !== JSON.stringify(k)) loi(`${b} dung o ${d.length} dong, khac du kien ${k.length}`);
  c[1] = String(moi); dbc[iHop[b]] = c.join('\t'); log.push(`hop ${b}: BV ${cu} -> ${moi} (${d.length} dong)`);
};
suaBV('90046', 48, 40, [...r(4130, 4138), ...r(13260, 13264)]);
suaBV('90018', 22, 20, ['4139', ...r(13265, 13269), ...r(34130, 34139)]);
suaBV('90047', 5, 24, ['13456']);

// --- hộp mới (bản sao) ---
const moiDong = [];
const saoHop = (goc, bv, ghiChu) => { const c = hopCot(goc); const id = String(++maxId); c[0] = id; c[1] = String(bv); moiDong.push(c.join('\t')); log.push(`hop moi ${id} = ban sao ${goc} BV ${bv} (${ghiChu})`); return id; };
const hopDTT = saoHop('50004', 3000, 'phieu rieng De Thich Thien');
const hop1710 = saoHop('1710', 160, 'Tan Mang Than Phu 6 cho Ky Cuoc/Tuc Cau');

// --- sửa dòng quái ---
const suaDong = (id, fn, nhan) => {
  const i = iQuai[id]; if (i === undefined) loi('khong co dong ' + id);
  const c = mdb[i].split('\t'); const cu = c.slice(3); const nCot = cu.length;
  const co = cu.filter(x => x && x !== '-1'); const moi = fn(co.slice());
  if (moi.length > 20) loi(id + ' qua 20 hop');
  const pad = cu.slice(co.length, nCot).length ? cu[co.length] : '-1';   // giữ kiểu ô trống như cũ
  while (moi.length < nCot) moi.push(moi.length < 20 ? '-1' : (pad === '' ? '' : '-1'));
  // giữ nguyên các ô sau DID20 như bản cũ
  for (let k = 20; k < nCot; k++) moi[k] = cu[k];
  mdb[i] = [...c.slice(0, 3), ...moi].join('\t');
  if (JSON.stringify(co) !== JSON.stringify(moi.slice(0, 20).filter(x => x && x !== '-1'))) log.push(`${nhan} ${id}: ${co.join(' ')} -> ${moi.slice(0, 20).filter(x => x && x !== '-1').join(' ')}`);
};
const PHIEU = new Set(['39910001', '39910002', '39910003', '39910004', '39910005', '39910006']);
const laPhieu = b => { const c = hopCot(b); const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(c[i]); return it.length && it.every(x => PHIEU.has(x)); };

for (const id of r(13220, 13229)) suaDong(id, b => b.filter(x => x !== '50001'), 'A3 Hong Cuc');
suaDong('15445', b => [hopDTT, ...b.filter(x => x !== '50004')], 'A3 De Thich Thien');
for (const id of [...r(9548, 9552), ...r(9668, 9672)]) suaDong(id, b => b.filter(x => !laPhieu(x)), 'A3 NPC PMF');

const GOI = { '90030': '90050', '50006': '90051', '50030': '90052', '50046': '90053', '50047': '90054', '50048': '90055', '1923': '90056', '50034': '90057' };
for (const k in GOI) { const c = hopCot(GOI[k]), g = hopCot(k); if (+c[1] !== +g[1] * 2 || c.slice(4).join('\t') !== g.slice(4).join('\t')) loi(`ban sao ${GOI[k]} khong khop ${k}`); }
const goiRows = Object.keys(iQuai).filter(id => { const b = mdb[iQuai[id]].split('\t').slice(3); return Object.keys(GOI).every(g => b.includes(g)); });
if (goiRows.length !== 119) loi('so dong goi ' + goiRows.length);
for (const id of goiRows) suaDong(id, b => b.map(x => GOI[x] || x), 'C1 goi');
// C4 (chủ server 05/10): Yến Tử Ổ - Đoàn Diên Khánh 3-6 thuốc giải/người (chắc 3 + 3 hộp 50%), giảm nguyên liệu cấp 8
//   (Tinh Thiết / Miên Bố / Bí Ngân 8): 7 boss ải 100% -> 25% (3005 -> bản sao BV 160 ở Mv 20),
//   Đoàn Diên Khánh / Cưu Ma Trí / Mộ Dung Phục 2 -> 50% (90030 -> bản sao BV 240 ở Mv 60). Cả lượt ~13 -> ~3,3/người.
const giai3 = saoHop('90029', 40, 'thuoc giai chac 3 (Mv60)');
const giai05 = saoHop('90029', 240, 'thuoc giai 50%, gan 3 lan');
const mat8YtoAi = saoHop('3005', 160, 'mat8 boss ai Yen Tu O 25%');
const mat8YtoChinh = saoHop('90030', 240, 'mat8 DDK/Cuu/MDP Yen Tu O 50%');
const PHIEU_SET = new Set(['90001', '90043']);
for (const id of [...r(9320, 9329), ...r(39320, 39329)]) suaDong(id, b => {
  if (+mdb[iQuai[id]].split('\t')[1] !== 60) loi(id + ' Mv khac 60');
  if (!b.includes('90029') || !b.includes('3021')) loi(id + ' thieu 90029/3021');
  const p = b.filter(x => PHIEU_SET.has(x)), con = b.filter(x => !PHIEU_SET.has(x) && x !== '90029' && x !== '3021').map(x => x === '90030' ? mat8YtoChinh : x);
  return [...p, giai3, giai05, giai05, giai05, ...con];
}, 'C4 DDK');
const YTO_AI = [...r(9330, 9379), ...r(9390, 9429), ...r(39330, 39379), ...r(39390, 39429)].filter(id => iQuai[id] !== undefined && mdb[iQuai[id]].split('\t').slice(3).includes('3005'));
for (const id of YTO_AI) suaDong(id, b => { if (+mdb[iQuai[id]].split('\t')[1] !== 20) loi(id + ' Mv khac 20'); return b.map(x => x === '3005' ? mat8YtoAi : x); }, 'C4 YTO ai');
// Cưu Ma Trí / Mộ Dung Phục: C1 vừa đổi 90030 -> 90050 (BV120 = 1 món), Yến Tử Ổ hạ tiếp xuống 50%
for (const id of [...r(9380, 9389), ...r(39380, 39389), ...r(9430, 9439), ...r(39430, 39439)]) suaDong(id, b => { if (!b.includes('90050')) loi(id + ' thieu 90050'); return b.map(x => x === '90050' ? mat8YtoChinh : x); }, 'C4 YTO Cuu/MDP');
for (const id of [...r(1850, 1859), ...r(31850, 31859), ...r(3720, 3729), ...r(33720, 33729)]) suaDong(id, b => { const m = +mdb[iQuai[id]].split('\t')[1]; if (m !== 80) loi(id + ' Mv ' + m); return b.map(x => x === '1710' ? hop1710 : x); }, 'C2');

// --- chèn hộp mới + kiểm ---
const iCuoi = iHop['90066']; if (iCuoi === undefined) loi('khong thay 90066');
const dbcMoi = [...dbc.slice(0, iCuoi + 1), ...moiDong, ...dbc.slice(iCuoi + 1)];
const thuTu = (L, ten) => { let t = -1; L.forEach(l => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { if (+id <= t) loi(ten + ' sai thu tu ' + id); t = +id; } }); };
thuTu(dbcMoi, 'DropBoxContent'); thuTu(mdb, 'MonsterDropBoxs');
const nhom = {}; for (const x of log) { const k = x.split(' ').slice(0, 2).join(' '); nhom[k] = (nhom[k] || 0) + 1; }
log.filter(x => x.startsWith('hop')).forEach(x => console.log(x));
console.log(Object.entries(nhom).filter(([k]) => !k.startsWith('hop')).map(([k, n]) => k + ': ' + n + ' dong').join('\n'));
if (process.argv.includes('-v')) log.forEach(x => console.log('  ' + x));
if (ghi) { fs.writeFileSync(F_DBC, dbcMoi.join(E1), 'latin1'); fs.writeFileSync(F_MDB, mdb.join(E2), 'latin1'); console.log('DA GHI'); }
