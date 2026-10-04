// Số món + KNB phiếu kỳ vọng MỖI NGƯỜI / lần hạ, so 1 commit git (mặc định origin/main) với bản đang sửa.
// Mô phỏng engine THẬT (đo bằng Audit + item log 04/10, xem CLAUDE.md quy tắc 6):
//  - mỗi thành viên đứng gần tự roll cả bảng;
//  - mỗi hộp X = Mv / BV × 2.0 (DropParam) × giảm rơi; ra FLOOR(X) món + 1 món với xác suất phần lẻ (KHÔNG phải ceil);
//    mỗi món bốc đều trong hộp;
//  - túi tối đa 10 món (tính theo số lượng), cắt theo THỨ TỰ DID: hộp đầu được giữ trước.
//  - Giảm rơi theo chênh cấp: người cao hơn boss 14 cấp KHÔNG bị trừ (đo 04/10). Boss cao hơn người: CHƯA đo được.
//    --att tren (mặc định) = chỉ trừ khi boss cao hơn người (theo DropAttenuation.txt); --att khong = không trừ; --att bang = trừ cả 2 chiều.
// node tools/phieu-boss/ky-vong.js <cấp người chơi> <ID quái...> [--ref <commit>] [--att tren|khong|bang] [-v]
const fs = require('fs'), path = require('path'), cp = require('child_process');
const REPO = path.join(__dirname, '../..');
const a = process.argv.slice(2);
const lay = (k, d) => { const i = a.indexOf(k); if (i < 0) return d; const v = a[i + 1]; a.splice(i, 2); return v; };
const ref = lay('--ref', 'origin/main'), attMode = lay('--att', 'tren');
const verbose = a.includes('-v'); if (verbose) a.splice(a.indexOf('-v'), 1);
const Lp = +a[0], ids = a.slice(1);
const MENH = { 39910001: 1000, 39910002: 2000, 39910003: 5000, 39910004: 10000, 39910005: 50000, 39910006: 100000 };
const LAN = 4000, TRAN = 10;
const doc = (p, r) => r ? cp.execSync(`git -C "${REPO}" show ${r}:${p}`, { encoding: 'latin1', maxBuffer: 64e6 }) : fs.readFileSync(path.join(REPO, p), 'latin1');
const bangAtt = (() => { const t = {}; for (const l of doc('server/Server/Config/DropAttenuation.txt').split(/\r?\n/)) { const c = l.split('\t'); if (/^-?\d+$/.test(c[0])) t[c[0]] = +c[1]; } return d => t[Math.max(-200, Math.min(200, d))]; })();
const att = d => attMode === 'khong' ? 1 : attMode === 'bang' ? bangAtt(d) : (d > 0 ? bangAtt(d) : 1);   // d = cấp boss - cấp người
const lv = {}; for (const l of doc('server/Public/Config/MonsterAttrExTable.txt').split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) lv[c[0]] = +c[3]; }
const tinh = r => {
  const box = {}; for (const l of doc('server/Server/Config/DropBoxContent.txt', r).split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) { const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(c[i]); box[c[0]] = { bv: +c[1], it }; } }
  const o = {};
  for (const l of doc('server/Server/Config/MonsterDropBoxs.txt', r).split(/\r?\n/)) {
    const c = l.split('\t'); if (!ids.includes(c[0])) continue;
    const hop = c.slice(3, 23).filter(b => box[b]).map(b => ({ b, ...box[b], X: +c[1] / box[b].bv * 2 * att(lv[c[0]] - Lp) }));
    let mon = 0, knb = 0, catMax = 0, dem = {};
    for (let k = 0; k < LAN; k++) {
      let tui = 0, cat = 0;
      for (const h of hop) {
        const n = Math.floor(h.X) + (Math.random() < h.X - Math.floor(h.X) ? 1 : 0);
        for (let j = 0; j < n; j++) {
          if (tui >= TRAN) { cat++; continue; }
          const it = h.it[Math.floor(Math.random() * h.it.length)]; tui++;
          if (MENH[it]) knb += MENH[it];
          if (verbose) dem[it] = (dem[it] || 0) + 1;
        }
      }
      mon += tui; catMax += cat;
    }
    o[c[0]] = { mon: mon / LAN, knb: knb / LAN, cat: catMax / LAN, dem };
  }
  return o;
};
const A = tinh(ref), B = tinh(null);
const f = (x, k, d) => x ? x[k].toFixed(d) : '-';
console.log(`người cấp ${Lp} (giảm rơi: ${attMode}) | ID | cấp boss | món/người ${ref} -> đang sửa | KNB phiếu/người | món bị cắt (trần 10)`);
for (const id of ids) {
  console.log(id, '|', lv[id], '|', f(A[id], 'mon', 1), '->', f(B[id], 'mon', 1), '|', f(A[id], 'knb', 0), '->', f(B[id], 'knb', 0), '|', f(A[id], 'cat', 1), '->', f(B[id], 'cat', 1));
  if (verbose && B[id]) console.log('   ', Object.entries(B[id].dem).sort((x, y) => y[1] - x[1]).slice(0, 8).map(([k, v]) => k + ' ' + (v / LAN).toFixed(2)).join(' · '));
}
