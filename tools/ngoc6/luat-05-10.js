// 05/10 LUAT NGOC CAP 6 (chu server chot) - viet lai TOAN BO hop ngoc 6 trong bang roi.
//   node tools/ngoc6/luat-05-10.js          -> chi in bao cao (khong ghi file)
//   node tools/ngoc6/luat-05-10.js --ghi    -> ghi MonsterDropBoxs.txt + DropBoxContent.txt
// Can restart game moi co hieu luc. Rollback: tag truoc-ngoc6-2tui-05-10.
//
// 2 TUI ngoc 6 (khong dung Minh Thach giam khang 5062100x / ngoc kep 50621xxx - hop 50032 giu nguyen):
//   A = thuoc tinh (Tinh Thach thuong + Thuan tinh), the luc / ne (Hong Bao, To Mau Luc), chinh xac (Tu Ngoc) - 11 loai
//   B = 18 loai con lai.  "A+B" = 1 hop tron trong so A x5 / B x7 moi loai -> ~30% ra vien tui A.
// Moi luat = xac suat p MOI NGUOI / lan ha ra 1 vien (engine: X = Mv / BV x 2, ra floor(X) + 1 voi xac suat phan le):
//   p = 1 -> X = 1 dung -> CHAC CHAN 1 vien;  p < 1 -> p% ra 1 vien. BV = 2 x Mv / p.
// Dong nao co luat: bo moi hop "thuan ngoc 6" (chi chua ngoc 506[01]xxxx), dat 1 hop moi o O DAU (DID1, khong bi tran 10 mon cat).
// Dong khong co luat ma dang co hop thuan ngoc 6 -> bo het (quai thuong / boss giua ai / NPC = khong roi ngoc).
// Song sinh: bo het hop; 1 bo hop (khong ngoc) cua 1 con don sang boss cuoi cung bac.
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../../server/Server/Config/');
const GHI = process.argv.includes('--ghi');
const A = ['50602001', '50602002', '50602003', '50602004', '50602005', '50602006', '50602007', '50602008', '50613004', '50614001', '50603001'];
const B = ['50601001', '50601002', '50604002', '50611001', '50611002', '50612001', '50612002', '50612003', '50612004', '50612005', '50612006', '50612007', '50612008', '50613001', '50613002', '50613003', '50613005', '50613006'];
const dai = (a, b) => { const o = []; for (let i = a; i <= b; i++) o.push(String(i)); return o; };
const LUAT = [];   // [ten, p, tui('AB'|'B'), ids[]]
const them = (ten, p, tui, ...ds) => LUAT.push([ten, p, tui, ds.flat(Infinity)]);
// ---- boss cuoi 1 vien (A+B)
them('Bình Thánh lớn - Gia Luật Liên Thành (cuối)', 1, 'AB', ['15190']);
them('Phiêu Miểu Phong - Lý Thu Thủy (cuối)', 1, 'AB', ['9546', '9666']);
them('Tiễu Phỉ - Đầu Lĩnh', 1, 'AB', dai(2530, 2539), dai(32530, 32539));
them('Kỳ Cuộc - Viễn Cổ Kỳ Hồn (trừ 1850)', 1, 'AB', dai(1851, 1859), dai(31850, 31859), dai(12040, 12049), dai(42040, 42049), dai(12090, 12099), dai(42090, 42099));
them('Túc Cầu - Tôn Mỹ Mỹ', 1, 'AB', dai(3720, 3729), dai(33720, 33729));
them('Lâu Lan Tầm Bảo - Trấn Bảo Long Vương', 1, 'AB', dai(12138, 12146));
them('Nhạn Môn - Gia Luật Hồng Cơ (cuối)', 1, 'AB', ['45417']);
// ---- boss ban do 1 vien (A+B)
them('Boss bản đồ (1 viên)', 1, 'AB', ['879', '11313', '11353', '3830', '3831', '3832', '2561', '42118', '42119', '42120', '42121', '43316', '880', '850', '851', '852', '853', '16834', '9100', '9110', '9120', '9130']);
// ---- boss cuoi 50% (A+B)
them('Yến Tử Ổ - Mộ Dung Phục (cuối)', 0.5, 'AB', dai(9430, 9439), dai(39430, 39439));
them('Thiếu Thất - Đinh Xuân Thu (cuối)', 0.5, 'AB', dai(14230, 14234));
them('Q Tô Châu - Sơn Trại Đại Vương (cuối)', 0.5, 'AB', dai(4130, 4139), dai(34130, 34139));
them('Tam Thần - Phệ Hồn Hoa Yêu (cuối)', 0.5, 'AB', ['42975']);
them('Lang Huyên - Hư Trúc (cuối)', 0.5, 'AB', ['43975', '43986']);
them('Sát Tinh - Ngô Vĩnh (cuối)', 0.5, 'AB', ['13456']);
them('Q Lâu Lan - Hỏa Diễm Yêu Ma (cuối)', 0.5, 'AB', dai(13260, 13269));
them('Thông Thiên Tháp - Đế Thích Thiên (cuối)', 0.5, 'AB', ['15445']);
them('Bình Thánh nhỏ - Gia Luật Liên Thành (cuối)', 0.5, 'AB', ['15088']);
// ---- boss giua ai 50% (chi PMF + Binh Thanh)
them('Phiêu Miểu Phong - boss giữa', 0.5, 'AB', ['9540', '9541', '9543', '9547', '9548', '9549', '9550', '9551', '9552', '9660', '9661', '9663', '9667', '9668', '9669', '9670', '9671', '9672', '42200', '42204']);
them('Bình Thánh - boss giữa (Tiêu Dật Phong, Gia Luật Diễm)', 0.5, 'AB', ['15110', '15175', '15008', '15073']);
// ---- boss tach ban do 30% (chi tui B)
them('Yến Vương Cổ Mộ 9 tầng / Tần Hoàng 3 tầng / Thông Thiên Tháp 4 boss', 0.3, 'B', ['1348', '1351', '1354', '1357', '1360', '1363', '1366', '1369', '1372', '1373', '1374', '1389', '1396', '1403', '15433', '15436', '15439', '15442']);
// ---- 20% (A+B)
them('Xích Tiêu Hỏa Hồn / boss MND / Vân Phủ / boss môn phái / Dã Trư Vương (Hàn Huyết Lĩnh)', 0.2, 'AB', ['1375', '42340', '42344', '42348', '42352', '42356', '42360', '42364', '42368', '42372', '42376', dai(43960, 43970), dai(869, 877), dai(33810, 33819)]);   // Han Huyet Linh: chi Da Tru Vuong (dang co ngoc); 14199/33519/42100/42106 khong chac la boss -> khong them
// ---- Ac Ba / Ac Tac (moi cap)
them('Ác Bá / Đầu Mục Ác Tặc (boss)', 0.08, 'AB', dai(3650, 3659), dai(33650, 33659), dai(3670, 3679), dai(33670, 33679));
them('Lâu La Ác Bá / Tặc Binh Lâu La Ác Tặc', 0.04, 'B', dai(3640, 3649), dai(33640, 33649), dai(3660, 3669), dai(33660, 33669));
// ---- song sinh: [ten, con song sinh (khong roi gi), con lay bo hop, boss cuoi nhan bo hop]
const SONG_SINH = [
  ['Thiếu Thất - Tiêu Viễn Sơn + Mộ Dung Bác', [dai(14220, 14224), dai(14225, 14229)], dai(14220, 14224), dai(14230, 14234)],
  ['Bình Thánh nhỏ - Tiêu Như Quân + Tiêu Như Úy', [['15028'], ['15033']], ['15028'], ['15088']],
];

// ================= doc bang =================
const docF = (f) => fs.readFileSync(R + f, 'latin1');
const tachDong = (t) => t.split('\n');   // giu \r cua tung dong (file tron CRLF/LF)
const mdT = tachDong(docF('MonsterDropBoxs.txt'));
const dbT = tachDong(docF('DropBoxContent.txt'));
const box = {};
for (const l of dbT) { const c = l.replace(/\r$/, '').split('\t'); if (!/^\d+$/.test(c[0])) continue; const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1' && c[i] !== '0') it.push(c[i]); box[c[0]] = { bv: +c[1], it }; }
const thuan = (b) => box[b] && box[b].it.length > 0 && box[b].it.every((x) => /^506[01]\d{4}$/.test(x));
const coNgoc = (b) => box[b] && box[b].it.some((x) => /^506[01]\d{4}$/.test(x));
const md = {};   // id -> { i (chi so dong), c (cot) }
mdT.forEach((l, i) => { const c = l.replace(/\r$/, '').split('\t'); if (/^\d+$/.test(c[0])) md[c[0]] = { i, c, cr: l.endsWith('\r') }; });
const hopCua = (id) => md[id].c.slice(3, 23).filter((b) => b && b !== '-1' && b !== '0');
const Ecua = (hop, mv) => { let a = 0, b = 0; for (const h of hop) { const B_ = box[h]; if (!B_ || !B_.it.length || !(B_.bv > 0)) continue; const X = mv / B_.bv * 2, n = B_.it.length; a += X * B_.it.filter((x) => A.includes(x)).length / n; b += X * B_.it.filter((x) => B.includes(x)).length / n; } return [a, b]; };

// ================= ap luat =================
const luatCua = {}; for (const [ten, p, tui, ids] of LUAT) for (const id of ids) { if (luatCua[id]) throw new Error('ID ' + id + ' co 2 luat: ' + luatCua[id][0] + ' / ' + ten); luatCua[id] = [ten, p, tui]; }
const ssCon = new Set(SONG_SINH.flatMap((s) => s[1].flat()));
for (const id of ssCon) if (luatCua[id]) throw new Error('song sinh ' + id + ' lai co luat');
let nextBox = Math.max(...Object.keys(box).map(Number)) + 1;
const hopMoi = {};   // key tui|BV -> id
const dongHopMoi = [];
const mau = dbT.find((l) => l.startsWith('90072\t')).replace(/\r$/, '');
const soCotHop = mau.split('\t').length;
function taoHop(tui, bv) {
  const k = tui + '|' + bv; if (hopMoi[k]) return hopMoi[k];
  const it = tui === 'B' ? B.slice() : [...A.flatMap((x) => Array(5).fill(x)), ...B.flatMap((x) => Array(7).fill(x))];
  if (4 + it.length * 2 > soCotHop) throw new Error('hop qua nhieu mon');
  const c = [String(nextBox), String(bv), '-1', '0']; for (const x of it) c.push(x, '-1'); while (c.length < soCotHop) c.push('-1');
  dongHopMoi.push(c.join('\t')); box[String(nextBox)] = { bv, it }; hopMoi[k] = String(nextBox); return String(nextBox++);
}
const bao = {}, loi = [];
const ghiHop = (id, hop) => { const c = md[id].c; if (hop.length > 20) { loi.push(id + ': ' + hop.length + ' o > 20'); hop = hop.slice(0, 20); } for (let j = 0; j < 20; j++) c[3 + j] = hop[j] || '-1'; };
// song sinh truoc (don hop sang boss cuoi, roi ap luat ngoc cho boss cuoi o duoi)
for (const [ten, cap, nguon, dich] of SONG_SINH) {
  nguon.forEach((src, k) => {
    const d = dich[k]; if (!md[src] || !md[d]) { loi.push(ten + ': thieu dong ' + src + '/' + d); return; }
    const bo = hopCua(src).filter((b) => !coNgoc(b));
    ghiHop(d, hopCua(d).concat(bo));
    (bao[ten] = bao[ten] || []).push(src + ' -> ' + d + ': +' + bo.length + ' hop (' + bo.join(',') + ')');
  });
  for (const id of cap.flat()) if (md[id]) ghiHop(id, []);
}
let bo0 = 0; const bo0ds = [];
for (const id of Object.keys(md)) {
  const r = md[id], mv = +r.c[1], hop = hopCua(id), L_ = luatCua[id];
  const [a0, b0] = Ecua(hop, mv);
  if (L_) {
    const [ten, p, tui] = L_;
    if (!(mv > 0)) { loi.push(id + ' (' + ten + '): Mv = 0, khong dat duoc'); continue; }
    const bv = Math.round(2 * mv / p);
    const moi = [taoHop(tui, bv), ...hop.filter((b) => !thuan(b))];
    ghiHop(id, moi);
    const [a1, b1] = Ecua(moi, mv);
    (bao[ten] = bao[ten] || []).push(id + ' ' + (a0 + b0).toFixed(2) + '->' + (a1 + b1).toFixed(3) + (tui === 'AB' ? ' (A ' + a1.toFixed(3) + ')' : ''));
  } else if (hop.some(thuan)) {
    ghiHop(id, hop.filter((b) => !thuan(b))); bo0++; if (a0 + b0 >= 0.05) bo0ds.push(id + ':' + (a0 + b0).toFixed(2));
  }
}
// ngoc con lai trong hop TRON (ngoc + do khac) - bao de biet
const conTron = []; for (const id of Object.keys(md)) { const [a, b] = Ecua(hopCua(id), +md[id].c[1]); const tr = hopCua(id).filter((h) => coNgoc(h) && !thuan(h)); if (tr.length && a + b > 0.001) conTron.push(id + ':' + (a + b).toFixed(3) + '(' + tr.join(',') + ')'); }

for (const [ten, ds] of Object.entries(bao)) console.log('## ' + ten + ' (' + ds.length + ')\n   ' + ds.join(' | '));
console.log('\n## Bo ngoc 6 (khong co luat): ' + bo0 + ' dong. Dong >= 0,05 truoc do: ' + bo0ds.join(' '));
console.log('## Hop moi: ' + dongHopMoi.length + ' (' + Object.keys(hopMoi).join(' ') + ')');
console.log('## Ngoc con trong hop tron (khong dung): ' + (conTron.join(' ') || 'khong co'));
console.log('## LOI: ' + (loi.join(' | ') || 'khong'));
if (GHI) {
  if (loi.length) throw new Error('co loi, khong ghi');
  for (const id of Object.keys(md)) { const r = md[id]; mdT[r.i] = r.c.join('\t') + (r.cr ? '\r' : ''); }
  fs.writeFileSync(R + 'MonsterDropBoxs.txt', mdT.join('\n'), 'latin1');
  // DropBoxContent: chen hop moi ngay sau dong co ID lon nhat (giu thu tu tang dan, giu kieu xuong dong cua file)
  const iMax = dbT.reduce((m, l, i) => (/^\d+\t/.test(l) && +l.split('\t')[0] > +dbT[m].split('\t')[0] ? i : m), dbT.findIndex((l) => /^\d+\t/.test(l)));
  const cr = dbT[iMax].endsWith('\r') ? '\r' : '';
  if (!cr && iMax === dbT.length - 1) dbT[iMax] = dbT[iMax];
  dbT.splice(iMax + 1, 0, ...dongHopMoi.map((l) => l + cr));
  fs.writeFileSync(R + 'DropBoxContent.txt', dbT.join('\n'), 'latin1');
  console.log('DA GHI 2 file');
}
