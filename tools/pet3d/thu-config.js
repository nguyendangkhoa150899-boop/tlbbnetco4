// Tao goi AXPK thu: ban sao goi (vd Config.axp tach tu RAM bang tachgoi.js), doi 1 chuoi CUNG DO DAI trong cac file chi dinh.
// Khong doi kich thuoc nao -> khong can dong goi lai (bang bam / bang khoi giu nguyen). Dung de thu client co doc goi ngoai dia khong.
//   node thu-config.js <goi vao> <goi ra> <dong bat dau bang (vd "10553103\t")> <chuoi cu> <chuoi moi> [file1,file2 = EquipBase.txt,EquipBase1.txt]
//   vd: node thu-config.js img/goi2.axp "<client>/Bin/Config.axp.THU" "10553103	" "#G10 gi" "#G99 gi"
// Chuoi so sanh theo byte latin1 (file game la VISCII/GBK). File trong goi phai KHONG ma hoa (khong bat dau 84 cc).
const fs = require('fs'); const { mo } = require('./trich.js');
const [, , VAO, RA, DAU, CU, MOI, DS = 'EquipBase.txt,EquipBase1.txt'] = process.argv;
if (!MOI) { console.log('node thu-config.js <goi vao> <goi ra> <dau dong> <chuoi cu> <chuoi moi> [file,...]'); process.exit(1); }
if (Buffer.byteLength(CU, 'latin1') !== Buffer.byteLength(MOI, 'latin1')) throw new Error('chuoi moi phai CUNG do dai chuoi cu');
const b = Buffer.from(fs.readFileSync(VAO)); const A = mo(VAO);
const bo = b.readUInt32LE(16), bc = b.readUInt32LE(20); let sua = 0;
for (const ten of DS.split(',')) {
  const f = A.ds.find((x) => x.ten === ten); if (!f) { console.log('khong co file', ten); continue; }
  const want = A.doc(f).buf; if (!want) { console.log('khong doc duoc', ten); continue; }
  // tim vi tri khoi trong goi (khoi co dung kich thuoc + noi dung trung)
  let off = -1; for (let i = 0; i < bc; i++) { const o = b.readUInt32LE(bo + i * 12), n = b.readUInt32LE(bo + i * 12 + 4); if (n === f.size && b.slice(o, o + 64).equals(want.slice(0, 64))) { off = o; break; } }
  if (off < 0) { console.log('khong thay khoi', ten); continue; }
  if (b[off] === 0x84 && b[off + 1] === 0xcc) throw new Error(ten + ' bi ma hoa - khong sua tai cho duoc');
  const blk = b.slice(off, off + f.size); const r = blk.indexOf(Buffer.from(DAU, 'latin1'));
  if (r < 0) { console.log('khong thay dong', JSON.stringify(DAU), 'trong', ten); continue; }
  const e = blk.indexOf(10, r); const k = blk.slice(r, e).indexOf(Buffer.from(CU, 'latin1'));
  if (k < 0) { console.log('khong thay chuoi', JSON.stringify(CU), 'trong dong', ten); continue; }
  blk.write(MOI, r + k, 'latin1'); sua++; console.log(ten, '@', off + r + k, 'OK');
}
fs.writeFileSync(RA, b); console.log('sua', sua, 'cho ->', RA, b.length, 'byte');
