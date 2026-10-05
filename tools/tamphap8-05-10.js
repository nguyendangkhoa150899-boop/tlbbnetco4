// 05/10 (chủ server): tâm pháp thứ 8 (Điển Bí) của mọi môn phái mặc định cấp 119.
//  - player_login.lua (888890, chạy mỗi lần đăng nhập): nhân vật đã vào phái + cấp >= 80 (điều kiện học của sách) mà tâm pháp 8 < 119 -> đặt 119. Không hạ nếu đã cao hơn.
//  - obj/book/skillbook.lua (338000): học sách Điển Bí xong lên 119 ngay, khỏi đăng nhập lại.
// ID: 0..8 = 72..80, Cô Tô 10 = 71, Đường Môn 11 = 88, Quỷ Cốc 12 = 96 (XinFa_V1.txt, cột "典秘").
// Sửa theo byte (latin1), chỉ chèn dòng ASCII, giữ kiểu xuống dòng của dòng mốc. node tools/tamphap8-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '../server/Public/Data/Script/');
const ghi = process.argv.includes('--ghi');
const CAP = 119;

function chenSau(file, moc, dong, dauHieu) {
  const F = S + file, s = fs.readFileSync(F, 'latin1');
  if (s.includes(dauHieu)) { console.error('LOI: ' + file + ' da sua roi'); process.exit(1); }
  const i = s.indexOf(moc); if (i < 0 || s.indexOf(moc, i + 1) >= 0) { console.error('LOI: ' + file + ' khong thay dung 1 moc: ' + moc); process.exit(1); }
  const het = s.indexOf('\n', i); const eol = s[het - 1] === '\r' ? '\r\n' : '\n';
  const moi = s.slice(0, het + 1) + dong.map(l => l + eol).join('') + s.slice(het + 1);
  console.log(file + ': chen ' + dong.length + ' dong sau byte ' + het + ' | xuong dong ' + JSON.stringify(eol));
  return { F, moi, eol };
}

// 1) player_login.lua: goi trong OnDefaultEvent + ham o cuoi file
const a = chenSau('player_login.lua', 'CheckAccountSafe( sceneId, selfId );',
  ['\tx888890_TamPhap8( sceneId, selfId )   -- [NetCo4 05/10] tam phap thu 8 mac dinh cap ' + CAP], 'x888890_TamPhap8');
const ham = [
  '',
  '--**********************************',
  '-- [NetCo4 05/10] Chu server: tam phap thu 8 (Dien Bi) cua moi mon phai mac dinh cap ' + CAP + '.',
  '-- Nhan vat da vao phai, cap >= 80 (dieu kien hoc cua sach): thap hon ' + CAP + ' thi nang len, khong ha neu da cao hon.',
  '--**********************************',
  'x888890_g_TamPhap8 = { [0] = 72, [1] = 73, [2] = 74, [3] = 75, [4] = 76, [5] = 77, [6] = 78, [7] = 79, [8] = 80, [10] = 71, [11] = 88, [12] = 96 }',
  'x888890_g_TamPhap8Cap = ' + CAP,
  'function x888890_TamPhap8( sceneId, selfId )',
  '\tlocal id = x888890_g_TamPhap8[ GetMenPai( sceneId, selfId ) ]',
  '\tif not id then',
  '\t\treturn',
  '\tend',
  '\tif GetLevel( sceneId, selfId ) < 80 then',
  '\t\treturn',
  '\tend',
  '\tif HaveXinFa( sceneId, selfId, id ) < x888890_g_TamPhap8Cap then',
  '\t\tLuaFnSetXinFaLevel( sceneId, selfId, id, x888890_g_TamPhap8Cap )',
  '\tend',
  'end',
];
const moiA = a.moi.replace(/(\r?\n)*$/, '') + a.eol + ham.join(a.eol) + a.eol;

// 2) skillbook.lua: sau AddXinFa cua sach tam phap
const b = chenSau('obj/book/skillbook.lua', 'AddXinFa(  sceneId,  selfId,  skillBook.id  )',
  ['\t \t \t if skillBook.id == 71 or ( skillBook.id >= 72 and skillBook.id <= 80 ) or skillBook.id == 88 or skillBook.id == 96 then LuaFnSetXinFaLevel( sceneId, selfId, skillBook.id, ' + CAP + ' ) end   -- [NetCo4 05/10] tam phap 8 mac dinh ' + CAP],
  'tam phap 8 mac dinh');

if (ghi) { fs.writeFileSync(a.F, moiA, 'latin1'); fs.writeFileSync(b.F, b.moi, 'latin1'); console.log('DA GHI'); }
