// 06/10 tối (chủ server): cân bậc thang đồ chế sau khi nerf VL6-8 (tools/pc-vatlieu-06-10b.js): vật liệu cấp 1-5 và "không vật liệu"
// KHÔNG được ra C8/C9 nhiều hơn VL6 (C8 0,1%, C9 0) -> mã ItemSegAffect của các ô đó: C9 = 0, C8 = tối đa 0,1% tổng; phần bớt dồn vào
// cấp phẩm chất THẤP NHẤT đang có của mã. C1-C7 khác giữ nguyên.
// Phạm vi: các quy tắc (EquipBase cột 90) của đồ chế 80-99 (ItemCompound), cột ItemSegQuality "无材料制造_xx" (20-38) + "N级材料三精_xx" N=1..5.
// AN TOÀN: mã nào CŨNG nằm ở cột rơi đồ (1-7: quái / thủ lĩnh / đầu mục / rương / boss) hoặc cột VL6-8 của BẤT KỲ quy tắc nào -> bỏ qua, in ra.
// Cần restart game. node tools/pc-vatlieu-thap-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '..', 'server') + '/';
const ghi = process.argv.includes('--ghi');
const td = new TextDecoder('gbk');
const rows = (f) => { const o = {}; for (const l of fs.readFileSync(S + f, 'latin1').split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0] || '')) o[c[0]] = c; } return o; };
const H = td.decode(fs.readFileSync(S + 'Server/Config/ItemSegQuality.txt')).split(/\r?\n/)[1].split('\t');
const sq = rows('Server/Config/ItemSegQuality.txt'), eb = rows('Public/Config/EquipBase.txt'), ic = rows('Public/Config/ItemCompound.txt');
// cột theo tiêu đề (không đoán chỉ số)
const cotKhong = [], cotVL = {}, cotRoi = [];
H.forEach((h, i) => {
  if (/^\d+-无材料制造_\d\d号装配点/.test(h)) cotKhong.push(i);
  const m = h.match(/^\d+-(\d)级材料三精_\d\d号装配点/); if (m) (cotVL[m[1]] = cotVL[m[1]] || []).push(i);
  if (/^[0-6]-/.test(h) && i >= 1 && i <= 7) cotRoi.push(i);   // 0-普通怪 .. 6-天BOSS
});
if (cotKhong.length !== 19 || [1, 2, 3, 4, 5, 6, 7, 8].some((n) => (cotVL[n] || []).length !== 19) || cotRoi.length !== 7) { console.error('LOI: cot ItemSegQuality khong dung mong doi'); process.exit(1); }
// quy tắc của đồ chế 80-99
const quyTac = new Set();
for (const c of Object.values(ic)) { const e = eb[c[2]]; if (e && +e[11] >= 80 && +e[11] <= 99) quyTac.add(e[90]); }
// mã dùng ở chỗ KHÔNG được đụng
const cam = new Set();
for (const r of Object.values(sq)) for (const i of [...cotRoi, ...cotVL[6], ...cotVL[7], ...cotVL[8]]) if (r[i] && r[i] !== '-1') cam.add(r[i]);
// mã đích
const dich = new Set();
for (const q of quyTac) { const r = sq[q]; if (!r) continue; for (const i of [...cotKhong, ...cotVL[1], ...cotVL[2], ...cotVL[3], ...cotVL[4], ...cotVL[5]]) if (r[i] && r[i] !== '-1') dich.add(r[i]); }
const F = S + 'Server/Config/ItemSegAffect.txt';
const L = fs.readFileSync(F, 'latin1').split('\n');
const boQua = [], doi = [];
for (const ma of [...dich].sort((a, b) => a - b)) {
  if (cam.has(ma)) { boQua.push(ma); continue; }
  const i = L.findIndex((l) => l.split('\t')[0] === ma); if (i < 0) { console.error('LOI: khong thay ma ' + ma); process.exit(1); }
  const cr = L[i].endsWith('\r'), c = (cr ? L[i].slice(0, -1) : L[i]).split('\t');
  const t = +c[1], w = c.slice(2, 11).map(Number);
  const tongW = w.reduce((a, b) => a + b, 0);
  if (tongW !== t) console.log('  (canh bao) ma ' + ma + ': tong trong so ' + tongW + ' khac cot total ' + t + ' - du lieu goc, giu nguyen phan lech');
  const tranC8 = Math.floor(t / 1000);   // 0,1% tổng
  const bot = w[8] + Math.max(0, w[7] - tranC8);
  if (!bot) continue;
  const truoc = w.slice();
  w[8] = 0; w[7] = Math.min(w[7], tranC8);
  const thap = w.findIndex((x) => x > 0); w[thap] += bot;
  c.splice(2, 9, ...w.map(String));
  L[i] = c.join('\t') + (cr ? '\r' : '');
  doi.push(ma + ': C' + (thap + 1) + ' +' + bot + ' | C8 ' + truoc[7] + '->' + w[7] + ' C9 ' + truoc[8] + '->0 (tong ' + t + ')');
}
console.log('quy tac:', [...quyTac].join(','), '| ma dich:', dich.size, '| doi:', doi.length, '| bo qua (dung chung roi do / VL6-8):', boQua.join(',') || 'khong');
doi.forEach((x) => console.log('  ' + x));
if (ghi) { fs.writeFileSync(F, L.join('\n'), 'latin1'); console.log('DA GHI'); }
