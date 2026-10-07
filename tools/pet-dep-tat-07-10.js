// 07/10 TAT NGUON PET DEP (chu server: pet dep chi phat qua event). Pham vi chot: shop 218 + 219 + tui qua; GIU shop 132.
//   1. event/prize/yuanbaoshop.lua: Tran Thu Thuong Thanh (tab 3) {132,218,219,...} -> {132,0,0,...} (0 = o trong, da dung o tab khac)
//      + Co duyen mat bao: o 20 trung Dieu Thu Tieu Tien 30309859 -> 30505806 Tan Mang Than Phu cap 7 (da co o o 18; mang gia di song song nen thay, khong xoa)
//   2. obj/item/SchoolBags.lua: bo 12 trung khoi cac goi qua (vong for phat ca goi -> xoa phan tu an toan)
//   3. MyNew/item/XieziNewServer.lua: DarenGift[1] bo trung Kim Dong Ngoc Nu 30309831
//   4. obj/dali/odali_bagaili.lua (Bat Ai Dai Ly, doi hoa hong): bo 3 dong menu 60/70/80 hoa -> trung, chan cac ma 2/3/4/201/301/401-403 TRUOC khi tru hoa
// Pet nguoi choi DA CO giu nguyen. Lua -> hieu luc sau cap-nhat.sh, khong can restart. Rollback: tag truoc-pet-dep-07-10.
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '../server/Public/Data/Script/');
const MAP = require('./viscii-map.json');
const vn = (t) => [...t].map((ch) => (ch in MAP ? '\\' + String(MAP[ch]).padStart(3, '0') : ch === '"' ? '\\"' : ch)).join('');
const doc = (f) => fs.readFileSync(S + f, 'latin1');
const ghi = (f, s) => fs.writeFileSync(S + f, s, 'latin1');
const mot = (s, a, b, ten) => { const n = s.split(a).length - 1; if (n !== 1) throw new Error(ten + ': thay ' + n + ' cho'); return s.replace(a, b); };

// 1. shop Nguyen Bao
{
  const f = 'event/prize/yuanbaoshop.lua'; let s = doc(f);
  s = mot(s, '{132,218,219,133,134,135,0}', '{132,0,0,133,134,135,0}', 'shoplist[3]');
  s = mot(s, '38001111,30309859,', '38001111,30505806,', 'jiyuanmibao 30309859');
  ghi(f, s);
}
// 2. SchoolBags
{
  const f = 'obj/item/SchoolBags.lua'; let s = doc(f); const L = s.split('\n'); let n = 0;
  const TRUNG = ['30309777', '30309844', '30309802', '30309784', '30309848', '30309759', '30309831', '30309767', '30309796', '30309764', '30309792', '30309841'];
  for (let i = 0; i < L.length; i++) {
    const m = L[i].match(/^(x889034_Gift\[\d+\] =\{)([^}]*)(\}.*)$/s); if (!m) continue;
    const ds = m[2].split(','); const con = ds.filter((x) => !TRUNG.includes(x.trim()));
    if (con.length !== ds.length) { n += ds.length - con.length; L[i] = m[1] + con.join(',') + m[3]; }
  }
  if (n !== 12) throw new Error('SchoolBags bo ' + n + ' trung');
  ghi(f, L.join('\n'));
}
// 3. XieziNewServer DarenGift[1]
{
  const f = 'MyNew/item/XieziNewServer.lua'; let s = doc(f);
  s = mot(s, 'DarenGift[1]  =  {20310110,30309831,10125019,30308059,38000187}', 'DarenGift[1]  =  {20310110,10125019,30308059,38000187}', 'DarenGift[1]');
  ghi(f, s);
}
// 4. Bat Ai
{
  const f = 'obj/dali/odali_bagaili.lua'; let L = doc(f).split('\n'); const cr = L[0].endsWith('\r') ? '\r' : '';
  const bo = L.map((l, i) => (/AddNumText\(\s*sceneId,\s*x002101_g_ScriptId,\s*"(60|70|80) /.test(l) ? i : -1)).filter((i) => i >= 0);
  if (bo.length !== 3) throw new Error('Bat Ai menu: ' + bo.length);
  for (const i of bo) L[i] = '\t \t     -- [07/10] bo doi trung tran thu (pet dep chi phat qua event)' + cr;
  const k = L.findIndex((l) => /^\s*local\s+key\s+=\s+GetNumText\(\)/.test(l));
  if (k < 0 || !L.slice(k - 3, k).some((l) => l.includes('x002101_OnEventRequest'))) throw new Error('Bat Ai: khong thay local key');
  L.splice(k + 1, 0, ...[
    '\t     -- [07/10] chan doi trung tran thu (60/70/80 hoa hong) TRUOC khi tru hoa',
    '\t     if key == 2 or key == 3 or key == 4 or key == 201 or key == 301 or key == 401 or key == 402 or key == 403 then',
    '\t \t BeginEvent( sceneId )',
    '\t \t AddText( sceneId, "' + vn('        Đổi trân thú đản đã ngưng. Trân thú đẹp chỉ phát qua sự kiện.') + '" )',
    '\t \t EndEvent( sceneId )',
    '\t \t DispatchEventList( sceneId, selfId, targetId )',
    '\t \t return',
    '\t     end',
  ].map((x) => x + cr));
  ghi(f, L.join('\n'));
}
console.log('ok');
