// 10/10 (chu server): TINH THONG - admin chon 3 dong cho moi nhom, toi luyen (Ly Hoa) CHAC CHAN ra 3 dong do.
//   Nhom "thu" = Mu/Ao/Bao tay/Giay/Dai/Ho kien (diem 1,2,3,4,5,15); nhom "cong" = Nhan/Hang lien/Ho phu/Ho uyen (6,7,12,14).
//   Cau hinh: Server/txt/NetCo4Cfg/tinhthong.txt (panel/tinhthong.py ghi, trang admin bot doc/ghi):  "cong BG HG XG" / "thu TL TL TL".
//   Khong co file / thieu nhom -> tay ngau nhien nhu goc. Dong dang KHOA giu nguyen; dong trung ma voi cau hinh GIU CAP (khong ve cap 1).
//   Mon da du 3 dong theo cau hinh -> bao va KHONG tru Ly Hoa / vang.
//  1. MyLua/jingtong/jingtongClient.lua (890087): nhanh cau hinh trong x890087_chuilian + ham x890087_TTDong / x890087_TTGhep.
//  2. MyLua/ShuaXinClient.lua (892002): loi go "FN" -> "NF" (dong Noi phong o vi tri 3 truoc day KHONG duoc cong chi so).
// File latin1 (VISCII), giu kieu xuong dong tung cho; kiem so byte. Rollback: tag truoc-tinhthong-3dong-10-10.
//   node tools/tinhthong-3dong-10-10.js [--ghi]
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '..', 'server', 'Public', 'Data', 'Script');
const GHI = process.argv.includes('--ghi'); let loi = 0;
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const enc = (s) => Buffer.from([...s].map((ch) => { const c = ch.charCodeAt(0); if (c < 128) return c; if (vis[ch] === undefined) throw new Error('VISCII thieu ' + ch); return vis[ch]; })).toString('latin1');
function thay(s, cu, moi, ten) { const k = s.split(cu).length - 1; if (k !== 1) { console.log('LOI ' + ten + ': neo xuat hien ' + k + ' lan'); loi++; return s; } return s.replace(cu, () => moi); }

// 1. jingtongClient.lua
{
  const F = path.join(S, 'MyLua/jingtong/jingtongClient.lua'); const goc = fs.readFileSync(F, 'latin1'); let s = goc;
  const R = (x) => x.split('\n').join('\r\n');   // file CRLF
  const tipDu = enc('Trang bị đã có đủ 3 dòng Tinh Thông theo cấu hình, tẩy nữa không đổi gì (không trừ Ly Hỏa)');
  const thayR = (x, a, b, t) => thay(x, R(a), R(b), t);
  // a. kiem truoc khi tru Ly Hoa: mon da dung 3 dong -> khong tru
  s = thayR(s, ' if LuaFnGetAvailableItemCount(sceneId, selfId, lihuoID) <10 then\n',
    ' -- [NetCo4 10/10] Tinh Thong admin chon 3 dong: mon da dung 3 dong theo cau hinh -> bao, KHONG tru Ly Hoa / vang\n' +
    ' local tt0 = x890087_TTDong( iio )\n' +
    ' if tt0 ~= nil then\n' +
    '\tlocal _, mn0 = LuaFnGetItemCreator( sceneId, selfId, EQItem )\n' +
    '\tif mn0 ~= nil and x890087_TTGhep( mn0, tt0, sun1, sun2, sun3 ) == mn0 then\n' +
    '\t\tx890087_Tips( sceneId, selfId, "' + tipDu + '" )\n' +
    '\t\treturn\n' +
    '\tend\n' +
    ' end\n' +
    ' if LuaFnGetAvailableItemCount(sceneId, selfId, lihuoID) <10 then\n', 'a');
  // b. nhanh cau hinh truoc nhanh ngau nhien goc
  s = thayR(s, 'local JTsre ="" \nif myname == nil then \n',
    'local JTsre ="" \n' +
    'local tt = x890087_TTDong( iio )   -- [NetCo4 10/10] admin chon 3 dong (trang bot) -> tay chac chan ra 3 dong do\n' +
    'if tt ~= nil then\n' +
    '\tJTsre = x890087_TTGhep( myname, tt, sun1, sun2, sun3 )\n' +
    'else\n' +
    'if myname == nil then \n', 'b');
  // c. dong nhanh goc
  s = thayR(s, 'end\nend \n\nLuaFnSetItemCreator( sceneId, selfId, EQItem, JTsre )',
    'end\nend \nend   -- [NetCo4 10/10] het nhanh ngau nhien goc\n\nLuaFnSetItemCreator( sceneId, selfId, EQItem, JTsre )', 'c');
  // d. ham moi o cuoi file (file ket thuc CRLF)
  const N = '\r\n';
  const ham = [
    '',
    '---**************',
    '--- [NetCo4 10/10] TINH THONG: ADMIN CHON 3 DONG (trang admin bot -> panel/tinhthong.py -> file duoi)',
    '--- File ASCII, moi nhom 1 dong: "cong BG HG XG" / "thu TL TL TL". Khong co file / thieu nhom -> tay ngau nhien nhu goc.',
    '---**************',
    'x890087_g_TTFile = "./txt/NetCo4Cfg/tinhthong.txt"',
    'x890087_g_TTThu = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1, [15] = 1 }   -- mu, ao, bao tay, giay, dai, ho kien',
    'x890087_g_TTCong = { [6] = 1, [7] = 1, [12] = 1, [14] = 1 }                 -- nhan, hang lien, ho phu, ho uyen',
    '',
    '-- 3 ma dong admin chon cho diem trang bi iio, hoac nil (khong cau hinh -> ngau nhien goc)',
    'function x890087_TTDong( iio )',
    '\tlocal nhom = nil',
    '\tif x890087_g_TTThu[iio] ~= nil then',
    '\t\tnhom = "thu"',
    '\telseif x890087_g_TTCong[iio] ~= nil then',
    '\t\tnhom = "cong"',
    '\tend',
    '\tif nhom == nil then',
    '\t\treturn nil',
    '\tend',
    '\tlocal h = openfile( x890087_g_TTFile, "r" )',
    '\tif h == nil then',
    '\t\treturn nil',
    '\tend',
    '\tlocal kq = nil',
    '\tlocal line = read( h, "*l" )',
    '\twhile line do',
    '\t\tlocal _, _, k, a, b, c = strfind( line, "^%s*(%a+)%s+(%u%u)%s+(%u%u)%s+(%u%u)" )',
    '\t\tif k == nhom then',
    '\t\t\tkq = { a, b, c }',
    '\t\tend',
    '\t\tline = read( h, "*l" )',
    '\tend',
    '\tclosefile( h )',
    '\treturn kq',
    'end',
    '',
    '-- Ghep chuoi nguoi che tao moi: dong KHOA giu nguyen; dong trung ma cau hinh giu cap; con lai = ma cau hinh cap 01',
    'function x890087_TTGhep( myname, tt, sun1, sun2, sun3 )',
    '\tif myname == nil then',
    '\t\tmyname = ""',
    '\tend',
    '\tlocal khoa = { sun1, sun2, sun3 }',
    '\tlocal _, _, a1, l1, a2, l2, a3, l3 = strfind( myname, "&JT(%u%u)(%d%d)(%u%u)(%d%d)(%u%u)(%d%d)" )',
    '\tlocal cu = nil',
    '\tif a1 ~= nil then',
    '\t\tcu = { { a1, l1 }, { a2, l2 }, { a3, l3 } }',
    '\tend',
    '\tlocal moi = "&JT"',
    '\tfor i = 1, 3 do',
    '\t\tlocal ma = tt[i]',
    '\t\tlocal cap = "01"',
    '\t\tif cu ~= nil then',
    '\t\t\tif khoa[i] == 1 then',
    '\t\t\t\tma = cu[i][1]',
    '\t\t\t\tcap = cu[i][2]',
    '\t\t\telseif cu[i][1] == tt[i] then',
    '\t\t\t\tcap = cu[i][2]',
    '\t\t\tend',
    '\t\tend',
    '\t\tmoi = moi .. ma .. cap',
    '\tend',
    '\tif cu ~= nil then',
    '\t\tlocal r = gsub( myname, "&JT(%u%u)(%d%d)(%u%u)(%d%d)(%u%u)(%d%d)", moi, 1 )',
    '\t\treturn r',
    '\tend',
    '\treturn myname .. moi',
    'end',
    ''].join(N);
  if (!/\r\nend$/.test(s)) { console.log('LOI d: cuoi file khong nhu mong doi'); loi++; }
  s = s + ham;
  const d = Buffer.byteLength(s, 'latin1') - Buffer.byteLength(goc, 'latin1');
  console.log('jingtongClient.lua: +' + d + ' byte');
  if (GHI && !loi) fs.writeFileSync(F, s, 'latin1');
}
// 2. ShuaXinClient.lua: "FN" -> "NF"
{
  const F = path.join(S, 'MyLua/ShuaXinClient.lua'); const goc = fs.readFileSync(F, 'latin1');
  const s = thay(goc, '\t if JT3str == "FN"\tthen ', '\t if JT3str == "NF"\tthen ', 'FN');
  console.log('ShuaXinClient.lua: lech byte ' + (Buffer.byteLength(s, 'latin1') - Buffer.byteLength(goc, 'latin1')));
  if (GHI && !loi) fs.writeFileSync(F, s, 'latin1');
}
console.log(loi ? 'CO LOI - khong ghi' : GHI ? 'DA GHI' : 'chay thu OK (them --ghi de ghi)'); process.exit(loi ? 1 : 0);
