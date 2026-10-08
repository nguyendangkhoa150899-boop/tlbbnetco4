// Khao sat hieu ung (Effects trong .obj) cua cac trung trong ra/noi.json: loai element, renderer, emitter, affector, vat lieu.
// Trich ra/fx/all.effect + all.particle tu Effect.axp neu chua co. node khaosat-fx.js
const fs = require('fs'), path = require('path'); const P = require('./duongdan.js'); const { mo } = require('./trich.js'); const { giai } = require('./giaima.js');
const gbk = (b) => new TextDecoder('gbk').decode(b);
const FX = path.join(__dirname, 'ra', 'fx'); fs.mkdirSync(FX, { recursive: true });
const EA = mo(path.join(P.DATA, 'Effect.axp'));
for (const n of ['all.effect', 'all.particle']) if (!fs.existsSync(path.join(FX, n))) fs.writeFileSync(path.join(FX, n), giai(EA.doc(EA.ds.find((f) => f.ten === n)).buf).buf);
const EFF = gbk(fs.readFileSync(path.join(FX, 'all.effect'))), PAR = gbk(fs.readFileSync(path.join(FX, 'all.particle')));
const MA = mo(path.join(P.DATA, 'Model.axp')); const OBJ = gbk(giai(MA.doc(MA.ds.find((f) => f.ten === 'all.obj')).buf).buf);
const { chiMuc, than } = require('./fxlib.js');
const IE = chiMuc(EFF), IP = chiMuc(PAR);
const dem = (m, k) => (m[k] = (m[k] || 0) + 1);
const el = {}, rd = {}, em = {}, af = {}, thieu = new Set(), mats = new Set(); let soFx = 0, soPs = 0;
const noi = JSON.parse(fs.readFileSync(path.join(__dirname, 'ra', 'noi.json'), 'utf8'));
for (const x of noi) for (const b of x.ban || []) {
  const i = OBJ.indexOf('<Object name="' + b.obj + '">'); const s = OBJ.slice(i, OBJ.indexOf('</Object>', i));
  for (const m of s.matchAll(/<Effect name="[^"]*" effect="([^"]*)"/g)) {
    soFx++; const ie = IE.get(m[1]); if (ie === undefined) { thieu.add('effect ' + m[1]); continue; } const e = than(EFF, ie);
    for (const em2 of e.matchAll(/element\s+(\S+)/g)) dem(el, em2[1]);
    for (const p of e.matchAll(/ParticleSystem\s+(\S+)/g)) {
      soPs++; const ip = IP.get(p[1]); if (ip === undefined) { thieu.add('ps ' + p[1]); continue; } const ps = than(PAR, ip);
      const r = ps.match(/renderer\s+(\S+)/); dem(rd, r ? r[1] : '(mac dinh)');
      for (const q of ps.matchAll(/emitter\s+(\S+)/g)) dem(em, q[1]);
      for (const q of ps.matchAll(/affector\s+(\S+)/g)) dem(af, q[1]);
      const mt = ps.match(/material\s+(\S+)/); if (mt) mats.add(mt[1]);
    }
  }
}
console.log('effect:', soFx, '| particle system:', soPs, '| vat lieu khac nhau:', mats.size);
console.log('element:', el); console.log('renderer:', rd); console.log('emitter:', em); console.log('affector:', af);
console.log('thieu:', thieu.size, [...thieu].slice(0, 8));
