// 07/10 (chu server): TAT 3 nguon con phat trung Tran Thu Cao Cap (shop 219 da bo, chi lay qua trade Ghep Ngoc - docs/pet-dep-event.md).
//  1. event/prize/yuanbaoshop.lua - Co Duyen Mat Bao (x888902_jiyuanmibao): nguoi choi luu SO THU TU mon da quay trong ngay (mission data)
//     -> KHONG xoa (lech thu tu = mua nham mon / nham gia). Thay DUNG VI TRI 20 (30309859 Dieu Thu Tieu Tien, 3000 KNB)
//     bang 50902001 (da co 2 lan trong danh sach, gia 5000) va sua gia cung vi tri trong x888902_jiyuanmibaobuy.
//  2. obj/item/SchoolBags.lua - tui qua theo cap x889034_Gift[9/13/15/25]: bo 30309844 / 30309848 / 30309831 / 30309841 (vong lap "for i, v in" -> list ngan hon van chay).
//  3. MyNew/item/XieziNewServer.lua - qua Dat Nhan DarenGift[1]: bo 30309831; vong phat "for i = 1,5" -> doi thanh getn(DarenGift[index]) (khong phat mon rong).
// Doc/ghi latin1 (file GBK), giu CR. Lua -> hieu luc sau cap-nhat.sh. Rollback: tag truoc-tat-nguon-trung-07-10.
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '../server/Public/Data/Script');
const sua = (rel, fn) => { const f = path.join(S, rel); const a = fs.readFileSync(f, 'latin1'); const b = fn(a); if (a === b) throw new Error(rel + ': khong doi'); fs.writeFileSync(f, b, 'latin1'); console.log('sua', rel); };
const mot = (s, a, b, ten) => { const n = s.split(a).length - 1; if (n !== 1) throw new Error(ten + ': ' + n + ' cho'); return s.replace(a, b); };

// 1. Co Duyen Mat Bao
sua('event/prize/yuanbaoshop.lua', (s) => {
  const lay = (ten) => { const i = s.indexOf(ten + '  =  {'); const j = s.indexOf('}', i); return [i + (ten + '  =  {').length, j]; };
  const [a1, b1] = lay('x888902_jiyuanmibao'), [a2, b2] = lay('x888902_jiyuanmibaobuy');
  const ds = s.slice(a1, b1).split(','), gia = s.slice(a2, b2).split(',');
  if (ds.length !== gia.length) throw new Error('jiyuanmibao ' + ds.length + ' mon / ' + gia.length + ' gia');
  const k = ds.findIndex((x) => x.trim() === '30309859'); if (k !== 19 || gia[k].trim() !== '3000') throw new Error('vi tri / gia 30309859 la: ' + k + ' / ' + gia[k]);
  ds[k] = ds[k].replace('30309859', '50902001'); gia[k] = gia[k].replace('3000', '5000');
  return s.slice(0, a1) + ds.join(',') + s.slice(b1, a2) + gia.join(',') + s.slice(b2);
});
// 2. tui qua theo cap
sua('obj/item/SchoolBags.lua', (s) => {
  for (const [g, id] of [[9, '30309844'], [13, '30309848'], [15, '30309831'], [25, '30309841']]) {
    const m = s.match(new RegExp('x889034_Gift\\[' + g + '\\] =\\{([^}]*)\\}')); if (!m) throw new Error('khong thay Gift[' + g + ']');
    const ds = m[1].split(','); if (!ds.includes(id)) throw new Error('Gift[' + g + '] khong co ' + id);
    s = mot(s, m[0], 'x889034_Gift[' + g + '] ={' + ds.filter((x) => x !== id).join(',') + '}', 'Gift[' + g + ']');
  }
  return s;
});
// 3. qua Dat Nhan
sua('MyNew/item/XieziNewServer.lua', (s) => {
  s = mot(s, 'DarenGift[1]  =  {20310110,30309831,10125019,30308059,38000187}', 'DarenGift[1]  =  {20310110,10125019,30308059,38000187}', 'DarenGift[1]');
  const i = s.indexOf('if  index  ==  1  then'); const j = s.indexOf('for  i  =  1,5  do', i);
  if (i < 0 || j < 0 || s.indexOf('elseif', i) < j && s.indexOf('elseif  index', i) < j && s.indexOf('elseif  index', i) > 0) throw new Error('khong thay vong phat DarenGift[1]');
  return s.slice(0, j) + 'for  i  =  1,getn(DarenGift[index])  do' + s.slice(j + 'for  i  =  1,5  do'.length);
});
