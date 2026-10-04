// Kiem doc lap: so HEAD voi ban dang sua. Moi dong quai doi -> so phieu/lan ha (chung doi) truoc/sau,
// tai nguoi cap 89 va tai nguoi cung cap boss; hop khong phai phieu phai giu nguyen (tru 90002 -> 90048/90049).
const fs = require('fs'), cp = require('child_process');
const REPO = 'C:/Users/Bia/tlbbnetco4/';
const git = p => cp.execSync(`git -C ${REPO} show HEAD:${p}`, { encoding: 'latin1', maxBuffer: 64e6 });
const cur = p => fs.readFileSync(REPO + p, 'latin1');
const PH = new Set(['39910001', '39910002', '39910003', '39910004', '39910005', '39910006']);
const DP = 2.0;
const att = (() => { const t = []; for (const l of cur('server/Server/Config/DropAttenuation.txt').split(/\r?\n/)) { const c = l.split('\t'); if (/^-?\d+$/.test(c[0])) t[+c[0] + 300] = +c[1]; } return d => t[Math.max(-200, Math.min(200, d)) + 300]; })();
const lv = {}; for (const l of cur('server/Public/Config/MonsterAttrExTable.txt').split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) lv[c[0]] = +c[3]; }
const boxes = s => { const o = {}; for (const l of s.split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) { const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(c[i]); o[c[0]] = { bv: +c[1], it }; } } return o; };
const rows = s => { const o = {}; for (const l of s.split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) o[c[0]] = { mv: +c[1], b: c.slice(3).filter(x => x && x !== '-1'), n: c.length }; } return o; };
const B0 = boxes(git('server/Server/Config/DropBoxContent.txt')), B1 = boxes(cur('server/Server/Config/DropBoxContent.txt'));
const M0 = rows(git('server/Server/Config/MonsterDropBoxs.txt')), M1 = rows(cur('server/Server/Config/MonsterDropBoxs.txt'));
// hop cu khong doi
for (const k in B0) if (JSON.stringify(B0[k]) !== JSON.stringify(B1[k])) console.log('HOP CU BI DOI', k);
// phieu ky vong / lan ha
const phieu = (B, r, id, Lp) => { let s = 0, maxN = 0; for (const b of r.b) { const x = B[b]; if (!x) continue; const np = x.it.filter(i => PH.has(i)).length; if (!np) continue; const X = r.mv / x.bv * DP * att(lv[id] - Lp); const n = X >= 1 ? Math.ceil(X) : X; s += n * np / x.it.length; } return Math.round(s * 100) / 100; };
const doi = []; let loi = 0;
for (const id of new Set([...Object.keys(M0), ...Object.keys(M1)])) {
  const a = M0[id], b = M1[id];
  if (!a || !b) { console.log('DONG THEM/MAT', id); loi++; continue; }
  if (JSON.stringify(a) === JSON.stringify(b)) continue;
  if (a.mv !== b.mv || a.n !== b.n) { console.log('Mv/so cot doi', id); loi++; }
  const khac0 = a.b.filter(x => !B0[x].it.every(i => PH.has(i))).map(x => x === '90002' ? 'VAT' : x).sort();
  const khac1 = b.b.filter(x => !B1[x].it.every(i => PH.has(i))).map(x => (x === '90048' || x === '90049') ? 'VAT' : x).sort();
  if (JSON.stringify(khac0) !== JSON.stringify(khac1)) { console.log('HOP KHAC PHIEU BI DOI', id, khac0, khac1); loi++; }
  doi.push([id, lv[id], phieu(B0, a, id, 89), phieu(B1, b, id, 89), phieu(B0, a, id, lv[id]), phieu(B1, b, id, lv[id]), b.b[0]]);
}
console.log('id\tcap\t89:truoc\t89:sau\tcungcap:truoc\tcungcap:sau\tDID1');
doi.forEach(d => console.log(d.join('\t')));
console.log('dong doi:', doi.length, 'loi:', loi);
// tong so dong quai co phieu toan file truoc/sau (khong tinh cac dong da doi)
