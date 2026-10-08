// In mau: moi loai emitter / affector / renderer 1-2 vi du + tap khoa tham so (de viet bo mo phong hat). node mau-fx.js
const fs = require('fs'), path = require('path');
const gbk = (b) => new TextDecoder('gbk').decode(b);
const PAR = gbk(fs.readFileSync(path.join(__dirname, 'ra', 'fx', 'all.particle')));
const khoa = {}; const mau = {};
const ghi = (k, body) => { const s = khoa[k] || (khoa[k] = new Set()); for (const l of body.split('\n')) { const t = l.trim().split(/\s+/)[0]; if (t && !/[{}]/.test(t)) s.add(t); } if (!mau[k] || mau[k].length < 2) (mau[k] = mau[k] || []).push(body.trim().slice(0, 700)); };
// tach khoi con
const re = /(emitter|affector)\s+(\S+)\s*\{([^{}]*)\}/g; let m;
while ((m = re.exec(PAR))) ghi(m[1] + ' ' + m[2], m[3]);
// tham so cap he: bo cac khoi con
const sys = new Set(); for (const s of PAR.replace(/(emitter|affector)\s+\S+\s*\{[^{}]*\}/g, '').split('\n')) { const t = s.trim().split(/\s+/)[0]; if (t && !/[{}]/.test(t) && /^[a-z_]+$/.test(t)) sys.add(t); }
console.log('== tham so he hat:', [...sys].join(' '));
for (const k of Object.keys(khoa).sort()) { console.log('\n== ' + k + ': ' + [...khoa[k]].join(' ')); console.log(mau[k][0]); }
// renderer texcoord / ribbon: in nguyen he
for (const r of ['texcoord_billboard', 'ribbon']) { const i = PAR.indexOf('renderer ' + r); console.log('\n=== he dung ' + r + '\n' + PAR.slice(PAR.lastIndexOf('{', i - 1) - 60, i + 900)); }
