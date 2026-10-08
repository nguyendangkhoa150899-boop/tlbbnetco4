// Trich file tu goi AXPK cua client (CHI DOC).
// 08/10: cot 3 cua file "(list)" (ten|sizeHex|xHex) CHINH LA hashB cua ten = cot 2 cua bang bam (32768 o x {hashA, hashB, 0x80000000|block}).
// -> tra ten: lay xHex trong list, tim o bang bam co hashB = xHex -> block -> doc (kiem lai kich thuoc). Khong can biet thuat toan bam.
//   node trich.js <goi.axp> <thu muc ra> <regex ten (GBK da giai)>
const fs = require('fs'), path = require('path');
function mo(GOI) {
  const fd = fs.openSync(GOI, 'r'); const h = Buffer.alloc(40); fs.readSync(fd, h, 0, 40, 0);
  if (h.toString('latin1', 0, 4) !== 'AXPK') throw new Error('khong phai AXPK');
  const ho = h.readUInt32LE(12), bo = h.readUInt32LE(16), bc = h.readUInt32LE(20);
  const B = Buffer.alloc(bc * 12); fs.readSync(fd, B, 0, B.length, bo);
  const H = Buffer.alloc(bo - ho); fs.readSync(fd, H, 0, H.length, ho);
  const theoB = new Map();
  for (let i = 0; i < H.length; i += 12) { const x = H.readUInt32LE(i + 8); if (!x) continue; const k = H.readUInt32LE(i + 4); if (!theoB.has(k)) theoB.set(k, []); theoB.get(k).push(x & 0x3FFFFFFF); }
  const lb = Buffer.alloc(B.readUInt32LE((bc - 1) * 12 + 4)); fs.readSync(fd, lb, 0, lb.length, B.readUInt32LE((bc - 1) * 12));
  const ds = lb.toString('latin1').split(/\r?\n/).map((l) => l.split('|')).filter((c) => c.length >= 3 && /^[0-9A-F]{8}$/i.test(c[1]))
    .map((c) => ({ goc: c[0], ten: new TextDecoder('gbk').decode(Buffer.from(c[0], 'latin1')), size: parseInt(c[1], 16), hb: parseInt(c[2], 16) >>> 0 }));
  function doc(f) {
    const ung = (theoB.get(f.hb) || []).filter((bi) => B.readUInt32LE(bi * 12 + 4) === f.size);
    if (ung.length !== 1) return { loi: ung.length ? 'trung ' + ung.length : 'khong thay' };
    const off = B.readUInt32LE(ung[0] * 12); const buf = Buffer.alloc(f.size); fs.readSync(fd, buf, 0, f.size, off); return { buf };
  }
  return { ds, doc };
}
module.exports = { mo };
if (require.main === module) {
  const [, , GOI, RA, RE] = process.argv; const A = mo(GOI); const re = new RegExp(RE, 'i'); fs.mkdirSync(RA, { recursive: true });
  for (const f of A.ds.filter((x) => re.test(x.ten))) { const r = A.doc(f); if (r.buf) fs.writeFileSync(path.join(RA, f.ten), r.buf); console.log(f.ten, ':', r.buf ? r.buf.length + ' byte' : r.loi); }
}
