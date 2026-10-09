// 09/10 (chu server): 20 thoi trang thuoc tinh (mau 1 cua 20 mau chu server chon) -> 9 SAO (quy tac pham chat 9, dang la 5)
// va CHI GM co: go 20 ma khoi 2 NPC doi thoi trang (MyNew/duihuanxitong.lua 112000, obj/loulangucheng/oloulan_malan.lua 001113)
// + nhuom (New/paodian/ShiZhuangRanSe.lua 830001): thay bang mau 2 cung mau (ma + 1, van 5 sao) -> do dai danh sach giu nguyen.
// Mon da co giu cap pham chat luc tao (5 sao) -> phai tao lai sau restart. File latin1, giu CR; kiem so byte. Rollback: tag truoc-thoitrang9-09-10.
//   node tools/thoitrang9-09-10.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..', 'server');
const IDS = ['10553236', '10553281', '10553308', '10553326', '10553344', '10553353', '10553362', '10553371', '10553380', '10553389',
  '10553398', '10553407', '10553416', '10553425', '10553434', '10553443', '10553452', '10553461', '10553470', '10553479'];
const GHI = process.argv.includes('--ghi');
let loi = 0; const bao = (s) => console.log(s);

// 1. EquipBase cot 90: 5 -> 9
{
  const F = path.join(R, 'Public/Config/EquipBase.txt'); const goc = fs.readFileSync(F, 'latin1'); const L = goc.split('\n'); let n = 0;
  for (let i = 0; i < L.length; i++) {
    const cr = L[i].endsWith('\r') ? '\r' : ''; const c = L[i].replace(/\r$/, '').split('\t');
    if (!IDS.includes(c[0])) continue;
    if (c[5] !== '16' || c[90] !== '5') { bao('LOI ' + c[0] + ': vi tri ' + c[5] + ' quy tac ' + c[90] + ' (mong 16 / 5)'); loi++; continue; }
    c[90] = '9'; L[i] = c.join('\t') + cr; n++;
  }
  const moi = L.join('\n');
  if (n !== IDS.length) { bao('LOI EquipBase: doi ' + n + '/' + IDS.length); loi++; }
  if (Buffer.byteLength(moi, 'latin1') !== Buffer.byteLength(goc, 'latin1')) { bao('LOI EquipBase: lech byte'); loi++; }
  bao('EquipBase: ' + n + ' ma quy tac 5 -> 9'); if (GHI && !loi) fs.writeFileSync(F, moi, 'latin1');
}
// 2. NPC doi + nhuom: moi ma -> ma + 1 (chi trong danh sach so)
for (const f of ['Public/Data/Script/MyNew/duihuanxitong.lua', 'Public/Data/Script/obj/loulangucheng/oloulan_malan.lua', 'Public/Data/Script/New/paodian/ShiZhuangRanSe.lua']) {
  const F = path.join(R, f); const goc = fs.readFileSync(F, 'latin1'); let n = 0;
  const moi = goc.replace(/\b(1055\d{4})\b/g, (m) => { if (!IDS.includes(m)) return m; n++; return String(+m + 1); });
  if (Buffer.byteLength(moi, 'latin1') !== Buffer.byteLength(goc, 'latin1')) { bao('LOI ' + f + ': lech byte'); loi++; }
  const con = IDS.filter((id) => new RegExp('\\b' + id + '\\b').test(moi));
  if (con.length) { bao('LOI ' + f + ': con ' + con.join(',')); loi++; }
  bao(f + ': thay ' + n + ' cho'); if (GHI && !loi) fs.writeFileSync(F, moi, 'latin1');
}
bao(loi ? 'CO LOI - khong ghi' : GHI ? 'DA GHI' : 'chay thu OK (them --ghi de ghi)');
process.exit(loi ? 1 : 0);
