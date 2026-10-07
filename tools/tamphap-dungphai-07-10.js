// 07/10 VA LO HONG hoc tam phap PHAI KHAC (event/prize/yuanbaoshop.lua 888902, nhanh 1002 = nut Hoc o su phu).
// x888902_g_CheckXinFa chi kiem ID co trong bang cua BAT KY phai nao -> client sua gui ID tam phap phai khac la hoc duoc.
// Them: ID tam phap phai thuoc mon phai cua nhan vat (LuaFnGetMenPai), sai thi bao + dung TRUOC khi tru tien / EXP.
// Dong k cua x888902_XinFaList <-> mon phai (doi chieu Public/Config/XinFa_V1.txt cot 1): 1-9 = phai 0-8, 10-12 = phai 10-12 (9 = chua vao phai).
// Doc/ghi latin1 (file VISCII/GBK), giu CR; chu tieng Viet viet bang escape \ddd. Lua -> hieu luc sau cap-nhat.sh. Rollback: tag truoc-tamphap-dungphai-07-10.
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/event/prize/yuanbaoshop.lua');
const MAP = require('./viscii-map.json');
const vn = (t) => [...t].map((ch) => (ch in MAP ? '\\' + String(MAP[ch]).padStart(3, '0') : ch)).join('');
let s = fs.readFileSync(F, 'latin1');
const cr = s.includes('\r\n') ? '\r\n' : '\n';
const mot = (a, b, ten) => { const n = s.split(a).length - 1; if (n !== 1) throw new Error(ten + ': ' + n + ' cho'); s = s.replace(a, b); };
// 1. chen kiem phai ngay sau khoi "tam phap so lieu sai lam" (XinFaCK < 1 or > 5)
const neo = s.indexOf('if  XinFaCK  <  1  or  XinFaCK  >  5  then');
if (neo < 0 || s.indexOf('if  XinFaCK  <  1  or  XinFaCK  >  5  then', neo + 1) >= 0) throw new Error('neo XinFaCK');
const het = s.indexOf('end', s.indexOf('return', neo));   // "end" dong khoi do
const cuoiDong = s.indexOf('\n', het) + 1;
const chen = [
  '\t   if  x888902_g_XinFaPhai(shopB)  ~=  andid  then   -- [NetCo4 07/10] chi hoc tam phap CUA PHAI MINH (chan client sua gui ID phai khac)',
  '\t                 x888902_NotifyTip(  sceneId,  selfId,  "' + vn('Tâm pháp này không thuộc môn phái của các hạ') + '"  )',
  '\t \t return',
  '\t   end',
].join(cr) + cr;
s = s.slice(0, cuoiDong) + chen + s.slice(cuoiDong);
// 2. ham tra phai cua 1 ID tam phap (dat ngay truoc x888902_g_CheckXinFa)
mot('function  x888902_g_CheckXinFa(sceneId,  selfId,  shopB)', [
  '-- [NetCo4 07/10] ID tam phap -> mon phai. Dong k cua x888902_XinFaList = phai x888902_XinFaPhaiDong[k] (XinFa_V1.txt cot 1); khong co = -1',
  'x888902_XinFaPhaiDong  =  {0,1,2,3,4,5,6,7,8,10,11,12}',
  'function  x888902_g_XinFaPhai(shopB)',
  '\tfor  k,Data  in  x888902_XinFaList  do',
  '\t\tfor  _,id  in  Data  do',
  '\t\t\tif  id  ==  shopB  then',
  '\t\t\t\treturn  x888902_XinFaPhaiDong[k]',
  '\t\t\tend',
  '\t\tend',
  '\tend',
  '\treturn  -1',
  'end',
  'function  x888902_g_CheckXinFa(sceneId,  selfId,  shopB)'].join(cr), 'CheckXinFa');
fs.writeFileSync(F, s, 'latin1');
console.log('ok');
