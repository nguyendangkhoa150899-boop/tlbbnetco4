// 08/10 (chu server): GIAM DINH TU CHAT trang bi xong -> ghi TEN NGUOI GIAM DINH len mon do (LuaFnSetItemCreator).
// Client hien ten nay o khung chu thich, ngay duoi cac dong thuoc tinh (cho ten nguoi che tao), giong mon "Hoang Dich".
// Ap cho ca Giam dinh (FinishAdjust) va Giam dinh lai / tay tu chat (FinishReAdjust) - nguoi giam dinh sau cung de ten.
// Luu y: mon do da co ten nguoi che tao se bi thay bang ten nguoi giam dinh.
// File VISCII -> doc/ghi latin1, giu CRLF, kiem so byte chi tang dung phan chen. Rollback: tag truoc-giamdinh-ten-08-10.
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '..', 'server/Public/Data/Script/event/equip/judge_aptitude.lua');
const goc = fs.readFileSync(F, 'latin1');
if (goc.includes('[08/10] giam dinh ghi ten')) throw new Error('da sua roi');
const CR = '\r\n';
const ghi = (bien) => '\t\t-- [08/10] giam dinh ghi ten: ten nguoi giam dinh hien duoi cac dong thuoc tinh (cho ten nguoi che tao)' + CR
  + '\t\tLuaFnSetItemCreator( sceneId, selfId, ' + bien + ', GetName( sceneId, selfId ) )' + CR
  + '\t\tLuaFnRefreshItemInfo( sceneId, selfId, ' + bien + ' )' + CR;

// 1. FinishAdjust: ngay sau "ret = LuaFnJudgeApt(...)" + "if ret == 1 then"
const A = '\tret = LuaFnJudgeApt( sceneId, selfId, nItemIndex )' + CR + '\tif ret == 1 then' + CR;
// 2. FinishReAdjust: sau "ret = LuaFnReSetItemApt(...)" -> chen khoi rieng truoc "if ret == 1 then" (thanh cong = ret 1/2/3)
const B = '\tret = LuaFnReSetItemApt( sceneId, selfId, nEquItemIndex )' + CR + '\tif ret == 1 then' + CR;
for (const [k, s] of [['A', A], ['B', B]]) { const n = goc.split(s).length - 1; if (n !== 1) throw new Error(k + ': thay ' + n + ' cho (mong 1)'); }
const chenA = ghi('nItemIndex');
const chenB = '\tif ret == 1 or ret == 2 or ret == 3 then' + CR + ghi('nEquItemIndex') + '\tend' + CR;
const moi = goc.replace(A, A + chenA).replace(B, B.replace('\tif ret == 1 then' + CR, '') + chenB + '\tif ret == 1 then' + CR);
const them = Buffer.byteLength(moi, 'latin1') - Buffer.byteLength(goc, 'latin1');
if (them !== chenA.length + chenB.length) throw new Error('so byte lech: ' + them);
fs.writeFileSync(F, moi, 'latin1');
console.log('OK +' + them + ' byte');
