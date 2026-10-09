// 09/10 (chu server, THU): 20 thoi trang thuoc tinh 9 sao (xem thoitrang9-09-10.js) -> so lo ngoc toi da 0 -> 4
// (EquipBase cot 18 "镶嵌宝石上限"; trang bi thuong 3, mon dac biet 4). Thoi trang cap 1 -> SlotCost 101-104 da co:
// lo 1-3 = 3000-4200 bac + 1 x 20109001, lo 4 = 20.000.000 bac + 20109101 va 3.000.000 bac + 20310111.
// CHUA BIET chay duoc: bang client van ghi 0 lo (client khoa, khong sua) + quy tac ngoc -> o trang bi nam trong binary server
// (diem 16 thoi trang khong co trong mo ta ngoc nao). Can cap-nhat + restart roi ra NPC thu. Rollback: tag truoc-thoitrang-lo-09-10.
//   node tools/thoitrang-lo-09-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '..', 'server', 'Public/Config/EquipBase.txt');
const IDS = ['10553236', '10553281', '10553308', '10553326', '10553344', '10553353', '10553362', '10553371', '10553380', '10553389',
  '10553398', '10553407', '10553416', '10553425', '10553434', '10553443', '10553452', '10553461', '10553470', '10553479'];
const GHI = process.argv.includes('--ghi'); let loi = 0, n = 0;
const goc = fs.readFileSync(F, 'latin1'); const L = goc.split('\n');
for (let i = 0; i < L.length; i++) {
  const cr = L[i].endsWith('\r') ? '\r' : ''; const c = L[i].replace(/\r$/, '').split('\t');
  if (!IDS.includes(c[0])) continue;
  if (c[5] !== '16' || c[18] !== '0' || c[90] !== '9') { console.log('LOI ' + c[0] + ': diem ' + c[5] + ' lo ' + c[18] + ' quy tac ' + c[90]); loi++; continue; }
  c[18] = '4'; L[i] = c.join('\t') + cr; n++;
}
const moi = L.join('\n');
if (n !== IDS.length) { console.log('LOI: doi ' + n + '/' + IDS.length); loi++; }
if (Buffer.byteLength(moi, 'latin1') !== Buffer.byteLength(goc, 'latin1')) { console.log('LOI: lech byte'); loi++; }
console.log('EquipBase: ' + n + ' thoi trang so lo 0 -> 4');
if (GHI && !loi) fs.writeFileSync(F, moi, 'latin1');
console.log(loi ? 'CO LOI - khong ghi' : GHI ? 'DA GHI' : 'chay thu OK (them --ghi de ghi)'); process.exit(loi ? 1 : 0);
