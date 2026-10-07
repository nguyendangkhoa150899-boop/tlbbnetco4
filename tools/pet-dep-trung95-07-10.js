// 07/10 (chu server): 14 trung PET DEP (trade Ghep Ngoc) MAC DINH ra ban CAP MANG 95 (tu chat 8000/4000), khong con "theo cap nhan vat".
// obj/item/zhenshoudan.lua: 13 trung type=2 (7 moc cap) -> type=1, dataId = ban moc 95 (minHumanLevel=95); xoa 7 dong .dataIds[n] cua trung do
// (de lai se loi luc nap: bang type=1 khong co dataIds). Oa Hoang Long De 30309855 da la type=1 ban 95.
// type=1: OnConditionCheck kiem cap nhan vat >= cap mang TRUOC khi tru trung -> chua toi 95 thi bao loi, KHONG mat trung.
// Doc/ghi latin1 (file GBK), giu CR. Lua -> hieu luc sau cap-nhat.sh. Rollback: tag truoc-pet-dep-trung95-07-10.
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/obj/item/zhenshoudan.lua');
const TRUNG = ['30309780', '30309799', '30309800', '30309808', '30309822', '30309835', '30309840', '30309842', '30309847', '30309849', '30309851', '30309857', '30309858'];
let L = fs.readFileSync(F, 'latin1').split('\n');
for (const id of TRUNG) {
  const dau = L.findIndex((l) => l.startsWith('x300027_g_petList[' + id + '] = {type=2, dataIds={}, level=1}'));
  if (dau < 0) throw new Error(id + ': khong thay dong type=2');
  const moc = L.map((l, i) => (l.startsWith('x300027_g_petList[' + id + '].dataIds[') ? i : -1)).filter((i) => i >= 0);
  if (moc.length !== 7) throw new Error(id + ': ' + moc.length + ' moc');
  const m95 = moc.map((i) => L[i].match(/dataId=(\d+),minHumanLevel=(\d+)/)).find((x) => x && x[2] === '95');
  if (!m95) throw new Error(id + ': khong co moc 95');
  const cr = L[dau].endsWith('\r') ? '\r' : '';
  const duoi = L[dau].replace(/\r$/, '').slice(('x300027_g_petList[' + id + '] = {type=2, dataIds={}, level=1}').length);   // giu chu thich cuoi dong
  L[dau] = 'x300027_g_petList[' + id + '] = {type=1, dataId=' + m95[1] + ', level=1}' + duoi + '   -- [07/10] pet dep: mac dinh ban cap mang 95' + cr;
  for (const i of moc.sort((a, b) => b - a)) L.splice(i, 1);
  console.log(id, '-> pet', m95[1]);
}
fs.writeFileSync(F, L.join('\n'), 'latin1');
