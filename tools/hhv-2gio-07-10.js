// 07/10 HAU HOA VIEN mo 24/24, moi NHAN VAT chi o duoc 2 tieng / ngay (cong don, 0h lam moi), het gio -> ve Lac Duong.
// Sua MyNew/jiarumenpai.lua (VISCII, CRLF) bang latin1; chu tieng Viet ghi bang escape \ddd (ASCII) nhu tools/vn.py.
// Trang thai: ./txt/NetCo4Web/<GUID>.hhv = 4 dong: ngay yyyymmdd / so giay da o / lan quet cuoi (LuaFnGetCurrentTime) / da bao (0,1,2).
// Doc + ghi file MOI LAN quet (1 giay / nguoi trong map) - KHONG dua vao bien toan cuc Lua (chua chac giu giua cac lan goi).
// Chi cong gio khi 2 lan quet cach nhau <= 10 giay (ra map / offline / server tat khong tinh).
// Rollback: tag truoc-hhv-2gio-07-10.
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/MyNew/jiarumenpai.lua');
const MAP = require('./viscii-map.json');
const vn = (t) => [...t].map((ch) => (ch in MAP ? '\\' + String(MAP[ch]).padStart(3, '0') : ch === '"' ? '\\"' : ch)).join('');
let L = fs.readFileSync(F, 'latin1').split('\n');
if (!L.every((l, i) => i === L.length - 1 || l.endsWith('\r'))) throw new Error('file khong thuan CRLF');
const one = (pred, ten) => { const k = L.map((l, i) => (pred(l) ? i : -1)).filter((i) => i >= 0); if (k.length !== 1) throw new Error(ten + ': ' + k.length); return k[0]; };
const R = (s) => s + '\r';

// 1. gio mo 0-24 + ham dem gio
const mo = one((l) => l.startsWith('x990010_g_HHV_Mo = 22'), 'HHV_Mo');
L[mo] = R('x990010_g_HHV_Mo = 0     -- [07/10] mo 24/24, gioi han bang x990010_g_HHV_Giay (truoc: 22 - 24)');
const dmo = one((l) => l === 'function x990010_HHV_DangMo()\r', 'ham DangMo');
L.splice(dmo, 0, ...[
  '-- [NetCo4 07/10] moi NHAN VAT chi o Hau Hoa Vien x990010_g_HHV_Giay giay / ngay (cong don, qua 0h lam moi), het -> ve Lac Duong.',
  '-- Trang thai <GUID>.hhv trong x990010_g_VangDir: ngay yyyymmdd / giay da o / lan quet cuoi / da bao. Doc + ghi file moi lan quet.',
  'x990010_g_HHV_Giay = 7200',
  'function x990010_HHV_Ngay()',
  '\treturn GetTodayYear() * 10000 + GetTodayMonth() * 100 + GetTodayDate()',
  'end',
  'function x990010_HHV_Doc( guid )',
  '\tlocal today = x990010_HHV_Ngay()',
  '\tlocal r = { ngay = today, giay = 0, last = 0, bao = 0 }',
  '\tlocal h = openfile( x990010_g_VangDir..guid..".hhv", "r" )',
  '\tif h then',
  '\t\tlocal d = tonumber( read( h, "*l" ) or "" )',
  '\t\tlocal g = tonumber( read( h, "*l" ) or "" )',
  '\t\tlocal t = tonumber( read( h, "*l" ) or "" )',
  '\t\tlocal b = tonumber( read( h, "*l" ) or "" )',
  '\t\tclosefile( h )',
  '\t\tif d == today and g then',
  '\t\t\tr.giay = g',
  '\t\t\tif b then',
  '\t\t\t\tr.bao = b',
  '\t\t\tend',
  '\t\tend',
  '\t\tif t then',
  '\t\t\tr.last = t',
  '\t\tend',
  '\tend',
  '\treturn r',
  'end',
  'function x990010_HHV_Ghi( guid, r )',
  '\tlocal h = openfile( x990010_g_VangDir..guid..".hhv", "w" )',
  '\tif h then',
  '\t\twrite( h, r.ngay.."\\n"..r.giay.."\\n"..r.last.."\\n"..r.bao.."\\n" )',
  '\t\tclosefile( h )',
  '\tend',
  'end',
  '-- so giay con duoc o hom nay',
  'function x990010_HHV_ConLai( sceneId, selfId )',
  '\tlocal r = x990010_HHV_Doc( LuaFnGetGUID( sceneId, selfId ) )',
  '\tlocal c = x990010_g_HHV_Giay - r.giay',
  '\tif c < 0 then',
  '\t\tc = 0',
  '\tend',
  '\treturn c',
  'end',
].map(R));

// 2. menu NPC: cau gioi thieu + kiem gio con lai truoc khi dich chuyen
const at = one((l) => l.includes('AddText(sceneId,"Map #cFF0000H') && l.includes('x990010_g_HHV_Mo'), 'AddText HHV');
const tab = L[at].match(/^\s*/)[0];
L.splice(at, 1,
  R(tab + 'local nHHVPhut = floor( x990010_HHV_ConLai( sceneId, selfId ) / 60 )   -- [07/10]'),
  R(tab + 'AddText(sceneId,"' + vn('Map #cFF0000Hậu Hoa Viên #Wmở cả ngày, mỗi nhân vật được ở #Y') + '"..floor( x990010_g_HHV_Giay / 60 ).."' + vn(' phút#W mỗi ngày (hôm nay còn #Y') + '"..nHHVPhut.."' + vn(' phút#W, qua 0h làm mới). Map chủ yếu rơi #GVải Bông, Bí Ngân các loại, Nguyên Liệu Tinh Thông, Nguyên Liệu Ngũ Hành Ngọc, vàng khóa và vàng không khóa!') + '")'));
const tf = one((l) => l.includes('"TransferFunc",sceneId, selfId, 182,50,50'), 'TransferFunc 182');
const t2 = L[tf].match(/^\s*/)[0];
L.splice(tf, 0, ...[
  t2 + 'local nHHVCon = x990010_HHV_ConLai( sceneId, selfId )   -- [07/10] 2 tieng / nhan vat / ngay',
  t2 + 'if nHHVCon <= 0 then',
  t2 + '\tx990010_NotifyFailBox( sceneId, selfId, targetId, "' + vn('Hôm nay các hạ đã ở Hậu Hoa Viên đủ #Y') + '"..floor( x990010_g_HHV_Giay / 60 ).."' + vn(' phút#W. Qua 0h quay lại nhé.') + '" )',
  t2 + '\treturn',
  t2 + 'end',
  t2 + 'x990010_NotifyTip( sceneId, selfId, "' + vn('Hậu Hoa Viên: hôm nay còn ') + '"..floor( nHHVCon / 60 ).."' + vn(' phút.') + '" )',
].map(R));

// 3. timer 1 giay: dem gio + bao truoc + dua ra
const tm = one((l) => l === 'function x990010_OnSceneTimer(sceneId)\r', 'OnSceneTimer');
const het = L.findIndex((l, i) => i > tm && l === 'end\r');
if (het - tm > 20) throw new Error('OnSceneTimer dai bat thuong: ' + (het - tm));
if (!L.slice(tm, het).some((l) => l.includes('x990010_HHV_DangMo() == 0'))) throw new Error('OnSceneTimer khong nhu cu');
L.splice(tm, het - tm + 1, ...[
  'function x990010_OnSceneTimer(sceneId)',
  '',
  '\tlocal nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)',
  '\tlocal now = LuaFnGetCurrentTime()',
  '\tfor i=0, nHumanCount-1 do',
  '\t\tlocal nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)',
  '\t\tif LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1  then',
  '\t\tif  x990010_HHV_DangMo() == 0 then -- [NetCo4 30/09] truoc: nHour < 20 or nHour > 22',
  '\t\tx990010_NotifyTip( sceneId, nHumanId, "' + vn('Thời gian mở cửa Map đã hết xin các hạ lượng thứ ') + '" )',
  '\t\tCallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 0,198,325)',
  '\t\telse',
  '\t\t\t-- [NetCo4 07/10] dem gio o map (giay that), het x990010_g_HHV_Giay -> ve Lac Duong',
  '\t\t\tlocal guid = LuaFnGetGUID( sceneId, nHumanId )',
  '\t\t\tlocal r = x990010_HHV_Doc( guid )',
  '\t\t\tlocal d = now - r.last',
  '\t\t\tif r.last > 0 and d > 0 and d <= 10 then',
  '\t\t\t\tr.giay = r.giay + d',
  '\t\t\tend',
  '\t\t\tr.last = now',
  '\t\t\tlocal con = x990010_g_HHV_Giay - r.giay',
  '\t\t\tif con <= 0 then',
  '\t\t\t\tx990010_NotifyTip( sceneId, nHumanId, "' + vn('Hết thời gian ở Hậu Hoa Viên hôm nay, đưa các hạ về Lạc Dương. Qua 0h quay lại nhé.') + '" )',
  '\t\t\t\tCallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 0,198,325)',
  '\t\t\telseif con <= 60 and r.bao < 2 then',
  '\t\t\t\tr.bao = 2',
  '\t\t\t\tx990010_NotifyTip( sceneId, nHumanId, "' + vn('Hậu Hoa Viên: còn 1 phút hôm nay.') + '" )',
  '\t\t\telseif con <= 600 and r.bao < 1 then',
  '\t\t\t\tr.bao = 1',
  '\t\t\t\tx990010_NotifyTip( sceneId, nHumanId, "' + vn('Hậu Hoa Viên: còn 10 phút hôm nay.') + '" )',
  '\t\t\tend',
  '\t\t\tx990010_HHV_Ghi( guid, r )',
  '\t\tend',
  '\t\tend',
  '\tend',
  '',
  'end',
].map(R));
fs.writeFileSync(F, L.join('\n'), 'latin1');
console.log('ok');
