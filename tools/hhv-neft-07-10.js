// 07/10 NEFT HAU HOA VIEN (chu server chot). Ty le = xac suat MOI NGUOI / con (engine: X = Mv / BV x 2).
//   Ma Trang Thu Ve 11469 (Mv 30, cung ID o Han Huyet Linh + Thong Thien Thap -> sua hop la ca 3 map):
//     hop 86000: chi con Mien Bo 8 / Bi Ngan 8, tong 2%  (truoc: cap 5-8, tong 17%)  BV = 2*30/0.02 = 3000
//     hop 86003: Huyen Ky 6% / Thuong Hac 3% / Chi Ton 3% / Tu Vi Linh Phach 2% (truoc 3%), 14 o x 1%  BV = 2*30/0.14 = 429
//     roimap.lua HHV (62/82/182): Chi Ton Cuong Hoa 30 -> 17 (+3% hop = 20%). Xich Tieu 1375 cung map nen cung 17%.
//     newbie_2_monster.ini (chi Hau Hoa Vien): 11469 hoi sinh 5000 -> 10000 ms.
//   Xich Tieu Hoa Hon 1375 (Mv 90): hop ngoc 90081 (A+B 20%, dung chung 19 quai) -> hop moi 90097 = CHI tui B, 50%  BV = 2*90/0.5 = 360
// Doc/ghi latin1 (file GBK/VISCII), giu nguyen CR/LF tung dong. Can restart game. Rollback: tag truoc-hhv-neft-07-10.
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '../server/');
const P = { box: S + 'Server/Config/DropBoxContent.txt', mon: S + 'Server/Config/MonsterDropBoxs.txt', roi: S + 'Public/Data/Script/NetCo4/roimap.lua', ini: S + 'Public/Scene/newbie_2_monster.ini' };
const doc = (f) => fs.readFileSync(f, 'latin1');
const ghi = (f, s) => fs.writeFileSync(f, s, 'latin1');
const B = ['50601001', '50601002', '50604002', '50611001', '50611002', '50612001', '50612002', '50612003', '50612004', '50612005', '50612006', '50612007', '50612008', '50613001', '50613002', '50613003', '50613005', '50613006'];

// ---- DropBoxContent: 86000, 86003, them 90097
{
  let L = doc(P.box).split('\n');
  const datHop = (id, bv, items) => {
    const k = L.findIndex((l) => l.split('\t')[0] === id); if (k < 0) throw new Error('khong thay hop ' + id);
    const cr = L[k].endsWith('\r'); const c = L[k].replace(/\r$/, '').split('\t');
    c[1] = String(bv);
    for (let i = 4; i < c.length; i += 2) { const j = (i - 4) / 2; c[i] = j < items.length ? items[j] : '-1'; }
    L[k] = c.join('\t') + (cr ? '\r' : '');
  };
  datHop('86000', 3000, ['20501008', '20502008']);
  datHop('86003', 429, [...Array(6).fill('38000945'), ...Array(3).fill('38000946'), ...Array(3).fill('38000571'), '30600084', '30600084']);
  if (L.some((l) => l.split('\t')[0] === '90097')) throw new Error('90097 da ton tai');
  const mau = L.findIndex((l) => l.split('\t')[0] === '90080');
  const sau = L.findIndex((l) => l.split('\t')[0] === '90096'); if (mau < 0 || sau < 0) throw new Error('thieu 90080/90096');
  L.splice(sau + 1, 0, L[mau].replace(/^90080\t\d+\t/, '90097\t360\t'));
  const c97 = L[sau + 1].replace(/\r$/, '').split('\t'); const it97 = []; for (let i = 4; i < c97.length; i += 2) if (c97[i] !== '-1' && c97[i] !== '') it97.push(c97[i]);
  if (it97.slice().sort().join() !== B.slice().sort().join()) throw new Error('90080 khong phai thuan tui B');
  ghi(P.box, L.join('\n'));
}
// ---- MonsterDropBoxs: 1375 90081 -> 90097
{
  let L = doc(P.mon).split('\n');
  const k = L.findIndex((l) => l.split('\t')[0] === '1375'); const c = L[k].split('\t');
  if (c[3] !== '90081') throw new Error('1375 DID1 khong phai 90081: ' + c[3]);
  c[3] = '90097'; L[k] = c.join('\t'); ghi(P.mon, L.join('\n'));
}
// ---- roimap.lua HHV 30 -> 17
{
  let s = doc(P.roi); let n = 0;
  s = s.replace(/(\[(?:62|82|182)\]\s*=\s*\{ 38000571, )30( \})/g, (m, a, b) => { n++; return a + '17' + b; });
  if (n !== 3) throw new Error('roimap HHV: ' + n);
  s = s.replace("[62]  = { 38000571, 17 },   -- Hau Hoa Vien:", "[62]  = { 38000571, 17 },   -- [07/10] 30 -> 17 (+3% hop 86003 = 20%). Hau Hoa Vien:");
  ghi(P.roi, s);
}
// ---- newbie_2_monster.ini: 11469 hoi sinh 5000 -> 10000 (theo tung khoi [..])
{
  const L = doc(P.ini).split('\n'); let khoi = [], n = 0;
  const xong = () => { if (khoi.some((i) => /^type=11469\r?$/.test(L[i]))) for (const i of khoi) if (/^respawn_time=5000\r?$/.test(L[i])) { L[i] = L[i].replace('5000', '10000'); n++; } khoi = []; };
  L.forEach((l, i) => { if (/^\[/.test(l)) xong(); khoi.push(i); }); xong();
  if (n !== 67) throw new Error('so diem 11469 = ' + n);
  ghi(P.ini, L.join('\n'));
}
console.log('ok');
