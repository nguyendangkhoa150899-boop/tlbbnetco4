// Noi cac trung Ghep Ngoc -> pet -> ho (thuong + bien di doi 1..N) -> ma ngoai hinh (server MonsterAttrExTable cot 44)
// -> CharModelEx (client, cfg/) -> .obj -> danh sach Entity (mesh + vat lieu) trong all.obj (Model.axp). Ra ra/noi.json
//   node noi.js [ma trung ...]   (khong ghi = lay het trung trong DOI cua ghepngoc.js)
const fs = require('fs'), path = require('path'); const P = require('./duongdan.js'); const { mo } = require('./trich.js'); const { giai } = require('./giaima.js');
const R = P.REPO;
const DOI = fs.readFileSync(P.GHEPNGOC_JS, 'utf8').match(/const DOI = (\{[\s\S]*?\});/)[1];
const CHON = process.argv.slice(2); const trung = CHON.length ? CHON : Object.keys(eval('(' + DOI + ')'));
const Z = fs.readFileSync(R + '/server/Public/Data/Script/obj/item/zhenshoudan.lua', 'latin1');
const pet = {}; for (const l of fs.readFileSync(R + '/docs/pet-danh-sach.tsv', 'utf8').split('\n').slice(1)) { const c = l.split('\t'); if (c.length >= 9) pet[c[0]] = { ten: c[1], t: c[3], cap: c[4], bd: c[5] === '1', bb: c[6] === '1' }; }
const goc = (n) => n.replace(/^Biến dị /, '').replace(/ \(bảo bảo\)$/, '');
const MA = {}; for (const l of fs.readFileSync(R + '/server/Public/Config/MonsterAttrExTable.txt', 'latin1').split('\n')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) MA[c[0]] = c[44]; }
const CM = {}; for (const l of new TextDecoder('gbk').decode(fs.readFileSync(path.join(__dirname, 'cfg', 'CharModelEx.txt'))).split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) CM[c[0]] = c[1]; }
const MA_AXP = mo(path.join(P.DATA, 'Model.axp')); const OBJ = new TextDecoder('gbk').decode(giai(MA_AXP.doc(MA_AXP.ds.find((f) => f.ten === 'all.obj')).buf).buf);
function ent(obj) {
  const i = OBJ.indexOf('<Object name="' + obj + '">'); if (i < 0) return null;
  const e = OBJ.indexOf('</Object>', i); const s = OBJ.slice(i, e);
  const el = s.slice(s.indexOf('<EntityList>'), s.indexOf('</EntityList>'));
  return [...el.matchAll(/<Entity name="([^"]*)" file="([^"]*)" material="([^"]*)"/g)].map((m) => ({ file: m[2], mat: m[3] }));
}
const out = [];
for (const id of trung) {
  const k = Z.indexOf('x300027_g_petList[' + id + '] = {type=1, dataId=');
  const m = k < 0 ? null : Z.slice(k).match(/dataId=(\d+)/);
  if (!m) { out.push({ trung: id, loi: 'khong thay pet' }); continue; }
  const p = pet[m[1]]; const ho = Object.keys(pet).filter((k) => pet[k].t === p.t && pet[k].cap === p.cap && goc(pet[k].ten) === goc(p.ten) && !pet[k].bb).sort((a, b) => a - b);
  const thuong = ho.find((k) => !pet[k].bd), bd = ho.filter((k) => pet[k].bd);
  const ban = [thuong, ...bd].filter(Boolean).map((k) => { const mh = MA[k]; const obj = CM[mh]; return { pet: k, mh, obj, ent: obj ? ent(obj) : null }; });
  out.push({ trung: id, pet: m[1], ten: goc(p.ten), ban });
}
fs.mkdirSync(path.join(__dirname, 'ra'), { recursive: true }); fs.writeFileSync(path.join(__dirname, 'ra', 'noi.json'), JSON.stringify(out, null, 1));
for (const x of out) console.log(x.trung, x.ten || x.loi, (x.ban || []).length + ' ban', (x.ban || []).map((b) => b.mh + (b.ent ? ':' + b.ent.length : ':X')).join(' '));
