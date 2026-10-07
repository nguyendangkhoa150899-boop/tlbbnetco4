// 07/10 (lan 2) chu server: chi tat "pet dep" (12 trung trong bang pet dep), con lai cua shop 218/219 la pet game goc -> tra lai cho nguoi choi mua.
// (Lan 1 tools/pet-dep-tat-07-10.js go ca shop 218/219 + tui qua -> da tra 4 file Lua ve tag truoc-pet-dep-07-10.)
// Sua Public/Config/ShopTable.txt (GBK, CRLF) bang latin1: bo nhom 6 cot [PID, so/lan, gioi han, gia, giam gia, mau] cua tung trung,
// don cac mon sau len, o thua de trong o cuoi (dung kieu cac shop khac: Num luon 50, mon xep lien tu dau). CAN RESTART game.
// Rollback: tag truoc-pet-dep-b-07-10.
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Config/ShopTable.txt');
const BO = {
  218: ['30309780', '30309799', '30309800'],   // Ngoc Loan Phuong, Ngao Van Thuong Long, Thai Co Long Hon
  219: ['30309808', '30309857', '30309840', '30309847', '30309849', '30309851', '30309835', '30309842', '30309822'],   // Hien Vien Thien Phuong, Bich Lac Thanh Loan, Cuu Tieu Chien Long, Te Thien, Nhi Lang, Long Tam Thai Tu, Nhan Ngu Cong Chu, Thiet Phien Cong Chu, Con Lon Tien Tuan
};
const L = fs.readFileSync(F, 'latin1').split('\n');
for (const [shop, bo] of Object.entries(BO)) {
  const k = L.findIndex((l) => l.startsWith(shop + '\t')); if (k < 0) throw new Error('khong thay shop ' + shop);
  const cr = L[k].endsWith('\r'); const c = L[k].replace(/\r$/, '').split('\t');
  if (c.length !== 325) throw new Error('shop ' + shop + ' co ' + c.length + ' cot');
  const nhom = []; for (let g = 0; g < 50; g++) nhom.push(c.slice(25 + g * 6, 31 + g * 6));
  const that = nhom.filter((x) => (x[0] || '').trim());
  const con = that.filter((x) => !bo.includes(x[0].trim()));
  if (that.length - con.length !== bo.length) throw new Error('shop ' + shop + ': bo duoc ' + (that.length - con.length) + '/' + bo.length);
  while (con.length < 50) con.push(['', '', '', '', '', '']);
  const moi = [...c.slice(0, 25), ...con.flat()];
  L[k] = moi.join('\t') + (cr ? '\r' : '');
  console.log('shop', shop, ':', that.length, '->', that.length - bo.length, 'mon');
}
fs.writeFileSync(F, L.join('\n'), 'latin1');
