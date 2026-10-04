// So mon ky vong MOI NGUOI / lan ha (moi thanh vien tu roll ca bang, tran 10 mon/nguoi - Audit 04/10 23:46)
// giua 1 commit git (mac dinh origin/main = ban dang chay neu VPS da cap-nhat) va ban dang sua.
// node tools/phieu-boss/ky-vong.js <cap nguoi choi> <ID quai...> [--ref <commit>]
const fs = require('fs'), path = require('path'), cp = require('child_process');
const REPO = path.join(__dirname, '../..');
const a = process.argv.slice(2), ri = a.indexOf('--ref');
const ref = ri >= 0 ? a.splice(ri, 2)[1] : 'origin/main';
const Lp = +a[0], ids = a.slice(1);
const PH = new Set(['39910001', '39910002', '39910003', '39910004', '39910005', '39910006']);
const doc = (p, r) => r ? cp.execSync(`git -C "${REPO}" show ${r}:${p}`, { encoding: 'latin1', maxBuffer: 64e6 }) : fs.readFileSync(path.join(REPO, p), 'latin1');
const att = (() => { const t = {}; for (const l of doc('server/Server/Config/DropAttenuation.txt').split(/\r?\n/)) { const c = l.split('\t'); if (/^-?\d+$/.test(c[0])) t[c[0]] = +c[1]; } return d => t[Math.max(-200, Math.min(200, d))]; })();
const lv = {}; for (const l of doc('server/Public/Config/MonsterAttrExTable.txt').split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) lv[c[0]] = +c[3]; }
const tinh = r => {
  const box = {}; for (const l of doc('server/Server/Config/DropBoxContent.txt', r).split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) { const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(c[i]); box[c[0]] = { bv: +c[1], it }; } }
  const o = {};
  for (const l of doc('server/Server/Config/MonsterDropBoxs.txt', r).split(/\r?\n/)) {
    const c = l.split('\t'); if (!ids.includes(c[0])) continue;
    let mon = 0, phieu = 0;
    for (const b of c.slice(3)) { const x = box[b]; if (!x) continue; const X = +c[1] / x.bv * 2 * att(lv[c[0]] - Lp); const n = X >= 1 ? Math.ceil(X) : X; mon += n; phieu += n * x.it.filter(i => PH.has(i)).length / x.it.length; }
    o[c[0]] = [Math.min(10, mon).toFixed(1) + (mon > 10 ? '*' : ''), phieu.toFixed(2)];
  }
  return o;
};
const A = tinh(ref), B = tinh(null);
console.log(`cap ${Lp} | ID | cap boss | mon/nguoi ${ref} -> dang sua | phieu/nguoi ${ref} -> dang sua   (* = cham tran 10)`);
for (const id of ids) console.log(id, '|', lv[id], '|', (A[id] || ['-'])[0], '->', (B[id] || ['-'])[0], '|', (A[id] || ['', '-'])[1], '->', (B[id] || ['', '-'])[1]);
