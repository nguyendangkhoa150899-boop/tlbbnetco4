// 05/10 (chủ server): Túc Cầu + Kỳ Cuộc thường ra quái nhanh, 3 giây / con (mỗi ngày vẫn 1 lượt -> không đổi tổng đồ, chỉ bớt chờ).
// Túc Cầu (efuben_cuju.lua 402040): đếm ngược 60 s -> 13 s, quả nhỏ 15/12/10/5 s -> 3 s, quả lớn 10 s -> 3 s, chữ đếm ngược sửa cho khớp.
//   ~27 phút chờ quả -> ~8 phút. Boss vẫn chờ 10 s sau khi đánh hết quả.
// Kỳ Cuộc thường (efuben_1_zhenlong_huodong.lua 401001): quân cờ 9/8/7/6/5 s -> 3 s, chờ bắt đầu 30 -> 10 s (chữ tự tính). ~23 -> ~10 phút.
// Kỳ Cuộc nhanh 401002 (3/2 s) không đổi. Sửa theo byte (latin1), giữ CRLF; mỗi chỗ kiểm đúng giá trị cũ.
// node tools/nhip-quai-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const D = path.join(__dirname, '../server/Public/Data/Script/event/fuben/');
const ghi = process.argv.includes('--ghi');
const loi = m => { console.error('LOI: ' + m); process.exit(1); };
const sua = (L, i, cu, moi, nhan) => { if (!L[i].includes(cu)) loi(`${nhan} dong ${i + 1} khong co "${cu}"`); if (L[i].split(cu).length !== 2) loi(`${nhan} dong ${i + 1} co nhieu "${cu}"`); L[i] = L[i].replace(cu, moi); console.log(`  ${nhan} dong ${i + 1}: ${cu} -> ${moi}`); };
const tim = (L, s, tu = 0) => { const i = L.findIndex((l, k) => k >= tu && l.includes(s)); if (i < 0) loi('khong thay ' + s); return i; };

// ---- Túc Cầu ----
const fC = D + 'efuben_cuju.lua';
const C = fs.readFileSync(fC, 'latin1').split('\r\n');
console.log('efuben_cuju.lua');
// câu đếm ngược đầu (60 giây) nằm ngay trước khối nStep==0
const i0 = tim(C, 'if nStep==0 and nCurTime-nPreTime>=10  then');
const iDau = (() => { for (let k = i0; k > i0 - 12; k--) if (C[k].includes('TipAllHuman') && C[k].includes(' 60 ')) return k; loi('khong thay cau 60 giay'); })();
sua(C, iDau, ' 60 ', ' 13 ', 'dem nguoc dau');
const DEM = [[0, ' 50 ', ' 11 '], [1, ' 40 ', ' 9 '], [2, ' 30 ', ' 7 '], [3, ' 20 ', ' 5 '], [4, ' 10 ', ' 3 ']];
for (const [s, cu, moi] of DEM) {
  const i = tim(C, `if nStep==${s} and nCurTime-nPreTime>=10  then`);
  sua(C, i, '>=10  then', '>=2  then', `buoc ${s}`);
  sua(C, i + 1, cu, moi, `chu buoc ${s}`);
  if (s === 4) sua(C, i + 3, 'nCurTime+5)', 'nCurTime)', 'buoc 4 bo +5');
}
// quả lớn (bước 24 / 54 / 124): 3 lần chờ 10 s + chữ 30/20/10
const iTo = tim(C, 'if nStep==24 or nStep==54 or nStep==124  then');
const iCau30 = tim(C, ' 30 ', iTo); if (!C[iCau30].includes('TipAllHuman')) loi('cau 30 qua lon');
sua(C, iCau30, ' 30 ', ' 9 ', 'qua lon chu 30');
let k = iTo;
for (const [cu, moi] of [[' 20 ', ' 6 '], [' 10 ', ' 3 '], [null, null]]) {
  const i = tim(C, 'if nCurTime-nStep_1_T >= 10 then', k + 1); sua(C, i, '>= 10 then', '>= 3 then', 'qua lon cho');
  if (cu) sua(C, i + 1, cu, moi, 'qua lon chu');
  k = i;
}
// quả nhỏ: 4 nhịp
const iNhip = tim(C, '(nStep>=5   and nStep<24  and nCurTime-nPreTime >= 15) or');
sua(C, iNhip, '>= 15)', '>= 3)', 'nhip 1');
sua(C, iNhip + 1, '>= 12)', '>= 3)', 'nhip 2');
sua(C, iNhip + 2, '>= 10)', '>= 3)', 'nhip 3');
sua(C, iNhip + 3, '>= 5)', '>= 3)', 'nhip 4');

// ---- Kỳ Cuộc thường ----
const fK = D + 'efuben_1_zhenlong_huodong.lua';
const K = fs.readFileSync(fK, 'latin1').split('\r\n');
console.log('efuben_1_zhenlong_huodong.lua');
const iL = tim(K, 'x401001_g_createMonsterIntervalInfoList = {');
for (const [o, cu] of [[1, 9], [2, 8], [3, 7], [4, 6], [5, 5]]) sua(K, iL + o, `intervalTickCount=${cu}}`, 'intervalTickCount=3}', 'quan co');
sua(K, tim(K, 'x401001_g_startTickCount = 30;'), '= 30;', '= 10;', 'cho bat dau');

if (ghi) { fs.writeFileSync(fC, C.join('\r\n'), 'latin1'); fs.writeFileSync(fK, K.join('\r\n'), 'latin1'); console.log('DA GHI'); } else console.log('(chay thu)');
