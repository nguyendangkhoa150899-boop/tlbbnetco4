// Ham dung chung cho tools/soat-boss: duong dan repo, giai VISCII / GBK / escape \ddd, doc bang du lieu game.
const fs = require('fs');
const path = require('path');

const REPO = path.resolve(__dirname, '..', '..');
const SV = path.join(REPO, 'server');
const SCRIPT = path.join(SV, 'Public', 'Data', 'Script');

const VIS = JSON.parse(fs.readFileSync(path.join(REPO, 'tools', 'viscii-map.json'), 'utf8'));
const VIS_NGUOC = {};
for (const k in VIS) VIS_NGUOC[VIS[k]] = k;
const GBK = new TextDecoder('gbk');

// chuoi latin1 (byte) -> tieng Viet; \ddd trong chuoi Lua cung giai luon
function viscii(s) {
  let o = '';
  for (const c of Buffer.from(s, 'latin1')) o += c < 128 ? String.fromCharCode(c) : (VIS_NGUOC[c] || '?');
  return o.replace(/\\(\d{3})/g, (a, d) => VIS_NGUOC[+d] || String.fromCharCode(+d));
}
const gbk = s => GBK.decode(Buffer.from(s, 'latin1'));

// tieng Viet -> chuoi Lua ASCII (\ddd), giong tools/vn.py
function maHoa(s) {
  return [...s.normalize('NFC')].map(c => {
    const n = c.charCodeAt(0);
    if (n < 128) return c;
    const b = VIS[c];
    if (b === undefined) throw new Error('khong co trong VISCII: ' + c);
    return '\\' + String(b).padStart(3, '0');
  }).join('');
}

const doc = p => fs.readFileSync(p, 'latin1');
const bang = p => doc(path.join(SV, p)).split(/\r?\n/).map(l => l.split('\t'));

let _quai, _roi, _hu, _sd, _ai;
// ID quai -> { ten, cap }   (Public/Config/MonsterAttrExTable.txt: cot 1 ten VISCII, cot 3 cap)
function quai() {
  if (!_quai) { _quai = {}; for (const c of bang('Public/Config/MonsterAttrExTable.txt')) if (/^\d+$/.test(c[0])) _quai[c[0]] = { ten: viscii(c[1] || '').trim(), cap: c[3] }; }
  return _quai;
}
// ID quai -> [ID hop roi > 0]   (Server/Config/MonsterDropBoxs.txt, cot 3 tro di)
function roi() {
  if (!_roi) { _roi = {}; for (const c of bang('Server/Config/MonsterDropBoxs.txt')) if (/^\d+$/.test(c[0])) _roi[c[0]] = c.slice(3).filter(v => +v > 0); }
  return _roi;
}
// ID hieu ung -> ten (GBK)   (Server/Config/StandardImpact.txt)
function hieuUng() {
  if (!_hu) { _hu = {}; for (const c of bang('Server/Config/StandardImpact.txt')) if (/^\d+$/.test(c[0])) _hu[c[0]] = gbk(c[1] || ''); }
  return _hu;
}
// ID script -> duong dan tuong doi (Public/Data/Script.dat)
function scriptDat() {
  if (!_sd) { _sd = {}; for (const l of doc(path.join(SV, 'Public/Data/Script.dat')).split(/\r?\n/)) { const m = l.match(/^0*(\d+)=\\?(\S+)/); if (m) _sd[m[1]] = m[2].replace(/\\/g, '/'); } }
  return _sd;
}
// ID AI -> file .ai   (Public/Data/AIScript.dat)
function aiDat() {
  if (!_ai) { _ai = {}; for (const l of doc(path.join(SV, 'Public/Data/AIScript.dat')).split(/\r?\n/)) { const m = l.match(/^(\d+)=(\S+?)\s*=?(.*)$/); if (m) _ai[m[1]] = { file: m[2], ten: gbk(m[3] || '').trim() }; } }
  return _ai;
}
// duong dan script: nhan ID (894000) hoac duong dan tuong doi tu Public/Data/Script
function timScript(x) {
  if (/^\d+$/.test(x)) { const p = scriptDat()[String(+x)]; if (!p) throw new Error('script ' + x + ' khong dang ky trong Script.dat'); return path.join(SCRIPT, p); }
  if (fs.existsSync(x)) return x;
  return path.join(SCRIPT, x);
}

module.exports = { fs, path, REPO, SV, SCRIPT, viscii, gbk, maHoa, doc, bang, quai, roi, hieuUng, scriptDat, aiDat, timScript };
