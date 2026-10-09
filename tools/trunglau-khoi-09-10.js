// 09/10 (chu server): "TRUNG LAU KHOI" = mu Giang Sinh 10410121 (client van hien ten / icon mu Giang Sinh - client khong sua duoc).
//  1. EquipBase 10410121: giong Trung Lau Dai 10553106 - 9 sao (quy tac 9), doan gia tri 100, 11 dong (them dong Gioi han SL, cot 32),
//     hieu ung than khi 7580. Giu cap 32 / phong thu / do ben cua mu (tooltip client doc bang client).
//  2. StandardImpact 7580 "重楼盔": logic 13 (giong 235 Khi Quan Truong Hong), 会心攻击+ = 5 (+5% bao kich), luon bat khi mac
//     (thoi gian -1, chet van giu, khong huy tay), KHONG icon buff (cot 5 = -1 nhu am khi 7539..), nhom loai tru rieng 7580.
//  3. NetCo4/quatang.lua: lenh moi "itemten <ID> <chu>" = phat 1 mon + ghi dong ten nguoi che (chu custom duoi tooltip).
// File latin1, giu CR. Rollback: tag truoc-trunglau-khoi-09-10.   node tools/trunglau-khoi-09-10.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..', 'server'); const GHI = process.argv.includes('--ghi'); let loi = 0;
const gbk = (s) => new TextDecoder('gbk').decode(Buffer.from(s, 'latin1'));
const doc = (f) => fs.readFileSync(path.join(R, f), 'latin1'); const ghi = (f, s) => { if (GHI && !loi) fs.writeFileSync(path.join(R, f), s, 'latin1'); };

// 1. EquipBase
{
  const f = 'Public/Config/EquipBase.txt'; const L = doc(f).split('\n'); let n = 0;
  for (let i = 0; i < L.length; i++) {
    if (!L[i].startsWith('10410121\t')) continue;
    const cr = L[i].endsWith('\r') ? '\r' : ''; const c = L[i].replace(/\r$/, '').split('\t');
    if (c[5] !== '1' || c[90] !== '5' || c[19] !== '-1') { console.log('LOI EquipBase: dong 10410121 khong nhu mong doi'); loi++; break; }
    // KHONG doi cap (11), do ben (16), phong thu goc (28/29): tooltip client hien so cua bang client -> doi o server se lech chu
    Object.assign(c, { 19: '7580', 32: '1', 90: '9', 91: '100', 92: '11', 93: '11' });
    L[i] = c.join('\t') + cr; n++;
  }
  if (n !== 1) { console.log('LOI EquipBase: doi ' + n); loi++; }
  console.log('EquipBase 10410121: doi', n); ghi(f, L.join('\n'));
}
// 2. StandardImpact 7580 (chen theo thu tu ma tang dan)
{
  const f = 'Server/Config/StandardImpact.txt'; const L = doc(f).split('\n');
  if (L.some((l) => l.startsWith('7580\t'))) { console.log('LOI: 7580 da co'); loi++; }
  const mau = L.find((l) => l.startsWith('235\t')); const cr = mau.endsWith('\r') ? '\r' : '';
  const c = mau.replace(/\r$/, '').split('\t');
  if (gbk(c[33]) !== '会心攻击+' || c[2] !== '13') { console.log('LOI: mau 235 khong dung khuon (cot 33 = ' + gbk(c[33]) + ')'); loi++; }
  // ten GBK "重楼盔": "重楼" lay tu 7517, "盔" tim trong ten trang bi
  const ten7517 = L.find((l) => l.startsWith('7517\t')).split('\t')[1]; let khoi = null;
  for (const l of doc('Public/Config/EquipBase.txt').split('\n')) { const t = l.split('\t')[10] || ''; for (let k = 0; k + 1 < t.length && !khoi; k++) if (gbk(t.slice(k, k + 2)) === '盔') khoi = t.slice(k, k + 2); if (khoi) break; }
  if (!khoi || gbk(ten7517.slice(0, 4)) !== '重楼') { console.log('LOI: khong ghep duoc ten GBK'); loi++; }
  Object.assign(c, { 0: '7580', 1: ten7517.slice(0, 4) + khoi, 5: '-1', 7: '7580', 8: '100', 10: '1', 12: '0', 20: '-1', 34: '5' });
  const moi = c.join('\t') + cr; let k = L.findIndex((l) => { const id = +l.split('\t')[0]; return /^\d+\t/.test(l) && id > 7580; });
  if (k < 0) k = L.length - (L[L.length - 1] === '' ? 1 : 0);
  L.splice(k, 0, moi); console.log('StandardImpact: them 7580 "' + gbk(c[1]) + '" truoc dong ' + (k + 1) + ', 会心攻击+ = ' + c[34]); ghi(f, L.join('\n'));
}
// 3. quatang.lua: lenh itemten (chen ngay truoc nhanh "knb")
{
  const f = 'Public/Data/Script/NetCo4/quatang.lua'; const s = doc(f);
  const neo = '\t\telseif kind == "knb" then'; if (s.split(neo).length !== 2) { console.log('LOI quatang: khong thay neo'); loi++; }
  const CR = s.includes('\r\n') ? '\r\n' : '\n';
  const them = [
    '\t\telseif kind == "itemten" then',
    '\t\t\t-- [09/10] "itemten <ID> <chu>": phat 1 mon + ghi chu vao dong ten nguoi che (hien duoi tooltip). Chu VISCII, toi da ~30 ky tu.',
    '\t\t\tlocal s2, e2, ten = strfind( lines[i], "^itemten%s+%d+%s+(.+)$" )',
    '\t\t\tlocal r = TryRecieveItem( sceneId, selfId, tonumber( a ), 1 )',
    '\t\t\tif r == nil or r < 0 then',
    '\t\t\t\ttinsert( left, lines[i] )',
    '\t\t\telse',
    '\t\t\t\tif ten ~= nil then',
    '\t\t\t\t\tLuaFnSetItemCreator( sceneId, selfId, r, ten )',
    '\t\t\t\t\tLuaFnRefreshItemInfo( sceneId, selfId, r )',
    '\t\t\t\tend',
    '\t\t\t\tgot = got + 1',
    '\t\t\tend'].join(CR) + CR;
  const moi = s.replace(neo, them + neo);
  if (Buffer.byteLength(moi, 'latin1') - Buffer.byteLength(s, 'latin1') !== Buffer.byteLength(them, 'latin1')) { console.log('LOI quatang: lech byte'); loi++; }
  // dau dong itemten phai qua duoc regex chung "^(%a+)%s+(%d+)" (kind = itemten, a = ID) -> giu nguyen
  console.log('quatang.lua: them nhanh itemten (' + them.split(CR).length + ' dong)'); ghi(f, moi);
}
console.log(loi ? 'CO LOI - khong ghi' : GHI ? 'DA GHI' : 'chay thu OK (them --ghi de ghi)'); process.exit(loi ? 1 : 0);
