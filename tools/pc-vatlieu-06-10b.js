// 06/10 tối (chủ server): nerf tiếp cấp phẩm chất đồ chế 80-99 theo cấp vật liệu (Miên Bố / Bí Ngân / Tinh Thiết cấp 6-7-8).
// Sửa ItemSegAffect.txt mã 240-249 (VL6), 250-259 (VL7), 260-269 (VL8): trọng số C1..C9 trên 1000.
// Chủ server đưa C5-C9; tổng thiếu tới 1000 dồn vào C5 (cả 3 cấp có C5).
//   VL6: C5 33,9% C6 52% C7 14% C8 0,1% C9 0    VL7: C5 11,8% C6 58% C7 29% C8 1% C9 0,2%    VL8: C5 14,5% C6 45% C7 38% C8 2% C9 0,5%
// Cần restart game (bảng Server/Config). Cấp phẩm chất lưu trên món lúc chế: đồ đã chế giữ nguyên.
// node tools/pc-vatlieu-06-10b.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Server/Config/ItemSegAffect.txt');
const ghi = process.argv.includes('--ghi');
//            C1 C2 C3 C4 C5   C6   C7   C8  C9   (C5/C6 = phần dồn, tính bên dưới)
const MOI = {
  // 06/10 khuya (chủ server buff lại): VL8 C7 50% / C8 10% / C9 5% (phần dư vào C6, bỏ C5); VL6/VL7 cân theo bậc thang
  // (trước: VL6 339/520/140/1/0, VL7 118/580/290/10/2, VL8 145/450/380/20/5)
  6: { tu: 240, w: [0, 0, 0, 0, null, 500, 220, 25, 5] },   // C5 25% C6 50% C7 22% C8 2,5% C9 0,5%
  7: { tu: 250, w: [0, 0, 0, 0, null, 450, 380, 50, 20] },  // C5 10% C6 45% C7 38% C8 5% C9 2%
  8: { tu: 260, w: [0, 0, 0, 0, 0, null, 500, 450, 50] },   // chủ server chốt: C7 50% C8 45% C9 5% (bỏ C6; C6 = phần dư = 0)
};
for (const v of Object.values(MOI)) { const i = v.w.indexOf(null); v.w[i] = 1000 - v.w.reduce((t, x) => t + (x || 0), 0); }
const L = fs.readFileSync(F, 'latin1').split('\n');   // giữ \r từng dòng
let n = 0;
for (const [vl, v] of Object.entries(MOI)) {
  for (let ma = v.tu; ma < v.tu + 10; ma++) {
    const i = L.findIndex((l) => l.split('\t')[0] === String(ma));
    if (i < 0) { console.error('LOI: khong thay ma ' + ma); process.exit(1); }
    const cr = L[i].endsWith('\r'), c = (cr ? L[i].slice(0, -1) : L[i]).split('\t');
    if (c.length !== 11 || c[1] !== '1000') { console.error('LOI: dong ' + ma + ' sai dinh dang'); process.exit(1); }
    const moi = [c[0], '1000', ...v.w.map(String)];
    if (moi.slice(2).reduce((t, x) => t + +x, 0) !== 1000) { console.error('LOI: tong khac 1000'); process.exit(1); }
    if (c.join('\t') !== moi.join('\t')) { L[i] = moi.join('\t') + (cr ? '\r' : ''); n++; }
  }
  console.log('VL' + vl + ' (ma ' + v.tu + '-' + (v.tu + 9) + '): C1..C9 = ' + v.w.join(' / '));
}
console.log('doi', n, 'dong');
if (ghi) { fs.writeFileSync(F, L.join('\n'), 'latin1'); console.log('DA GHI'); }
