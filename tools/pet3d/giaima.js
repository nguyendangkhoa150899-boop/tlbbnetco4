// Giai ma file client TLBB "SEPCIAL_FILE_HD" (bat dau 84 cc fa 75). Thuat toan lay tu RSSParser.dll
// (hook Render.dll + thay ham 0x591080 cua Game.exe; Render goi giai_ma(header, vi_tri, buf, n) sau MOI lan doc stream):
//  - 96 byte dau XOR voi khoa K (480 byte) -> "SEPCIAL_FILE_HD\0" + loai (u32 @16) + kich thuoc than (u32 @20) + ...
//  - than (tu byte 96), vi_tri = offset trong file goc (tinh ca 96 byte header):
//      loai 6       : ma chuoi p = c ^ s, s = (s + c) & 255, s0 = T[648] (giai ca than 1 lan tu vi tri 96)
//      loai khac    : p = BANG[loai][vi_tri & 255][c]  (bang lap bang cach gia lap handler that: lapbang.js)
//      loai 13..18  : chi 1024 byte dau than (vi_tri < 1120) bi ma hoa, phan sau giu nguyen
const fs = require('fs'), path = require('path');
const K = fs.readFileSync(path.join(__dirname, 'khoa', 'key480.bin')), T = fs.readFileSync(path.join(__dirname, 'khoa', 'keyT.bin'));
const DS = JSON.parse(fs.readFileSync(path.join(__dirname, 'khoa', 'bang.json'), 'utf8')), BB = fs.readFileSync(path.join(__dirname, 'khoa', 'bang.bin'));
const BANG = {}; DS.forEach((t, i) => (BANG[t] = BB.subarray(i * 65536, (i + 1) * 65536)));
const GIOI_HAN = { 13: 1120, 14: 1120, 15: 1120, 16: 1120, 17: 1120, 18: 1120 };
function giai(b) {
  if (b.length < 96 || b[0] !== 0x84 || b[1] !== 0xcc) return { buf: b, loai: 0 };
  const h = Buffer.alloc(96); for (let i = 0; i < 96; i++) h[i] = b[i] ^ K[i];
  if (h.toString('latin1', 0, 15) !== 'SEPCIAL_FILE_HD') throw new Error('sai chu ky');
  const loai = h.readUInt32LE(16), n = h.readUInt32LE(20); const o = Buffer.alloc(n);
  if (loai === 6) { let s = T[648]; for (let i = 0; i < n; i++) { const c = b[96 + i]; o[i] = c ^ s; s = (s + c) & 255; } }
  else if (BANG[loai] || GIOI_HAN[loai]) {
    const B = BANG[loai] || bangGioiHan(loai), lim = GIOI_HAN[loai] || Infinity;
    for (let i = 0; i < n; i++) { const a = i + 96; o[i] = a < lim ? B[((a & 255) << 8) | b[a]] : b[a]; }
  } else throw new Error('loai chua ho tro ' + loai);
  return { buf: o, loai };
}
// bang cho loai 13..18 (lapbang.js bao SAI vi phan sau 1120 khong ma hoa): lap lai bang gia lap voi vi_tri < 1120
const _bgh = {};
function bangGioiHan(t) {
  if (_bgh[t]) return _bgh[t];
  const f = path.join(__dirname, 'khoa', 'bang' + t + '.bin');
  if (fs.existsSync(f)) return (_bgh[t] = fs.readFileSync(f));
  const { May, bangLoai } = require('./emu.js'); const H = bangLoai(), m = new May(), BUF = 0x20000000; const B = Buffer.alloc(65536);
  for (let p = 0; p < 256; p++) for (let c = 0; c < 256; c++) { m.g8(BUF, c); m.goi(H[t], [256 + p, BUF, 1]); B[p * 256 + c] = m.d8(BUF); }
  fs.writeFileSync(f, B); return (_bgh[t] = B);
}
module.exports = { giai };
if (require.main === module) { const r = giai(fs.readFileSync(process.argv[2])); fs.writeFileSync(process.argv[3], r.buf); console.log('loai', r.loai, r.buf.length, 'byte'); }
