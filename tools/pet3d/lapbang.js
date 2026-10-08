// Lap bang giai ma cho moi loai: p = B[loai][pos & 255][c] bang cach chay handler that (gia lap) tung (pos, c).
// Kiem chung: chay handler tren khoi ngau nhien voi pos ngau nhien, so voi bang. Ra bang.bin + bang.json
const fs = require('fs'), path = require('path'); const { May, bangLoai } = require('./emu.js');
const H = bangLoai(); const m = new May(); const BUF = 0x20000000;
const loais = Object.keys(H).map(Number).sort((a, b) => a - b);
const bang = {}, ket = {};
for (const t of loais) {
  try {
    const B = Buffer.alloc(256 * 256);
    // 1 lan goi cho ca 256 gia tri c tai cung pos: dung n=1 tung byte (handler chi phu thuoc pos + byte)
    for (let p = 0; p < 256; p++) for (let c = 0; c < 256; c++) { m.g8(BUF, c); m.goi(H[t], [p, BUF, 1]); B[p * 256 + c] = m.d8(BUF); }
    // kiem chung: 3 khoi ngau nhien
    let sai = 0;
    for (let k = 0; k < 3; k++) {
      const pos = 96 + Math.floor(Math.random() * 100000), n = 700; const src = Buffer.alloc(n); for (let i = 0; i < n; i++) src[i] = Math.floor(Math.random() * 256);
      m.ghi(BUF, src); m.goi(H[t], [pos, BUF, n]); const o = m.doc(BUF, n);
      for (let i = 0; i < n; i++) if (o[i] !== B[((pos + i) & 255) * 256 + src[i]]) sai++;
    }
    bang[t] = B; ket[t] = sai ? 'SAI ' + sai : 'ok';
  } catch (e) { ket[t] = 'loi ' + e.message; }
  process.stdout.write(t + ':' + ket[t] + '  ');
}
const ok = loais.filter((t) => ket[t] === 'ok');
fs.writeFileSync(path.join(__dirname, 'khoa', 'bang.bin'), Buffer.concat(ok.map((t) => bang[t])));
fs.writeFileSync(path.join(__dirname, 'khoa', 'bang.json'), JSON.stringify(ok));
console.log('\nOK', ok.length, '/', loais.length);
