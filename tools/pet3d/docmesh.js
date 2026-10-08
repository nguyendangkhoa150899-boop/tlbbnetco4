// Doc .mesh Ogre (v1.40) cua client TLBB. File "ma hoa" (bat dau 84 cc fa 75): chi 128 byte dau bi thay
// (phan dau rieng + header Ogre + M_MESH) -> doc cac khoi con tu byte 128. File thuong: bo qua header Ogre (25 byte) + M_MESH (6+1).
// Ra JSON: {sub:[{mat, pos:[], nor:[], uv:[], idx:[]}]}
const fs = require('fs');
function doc(buf) {
  let p = 0;
  const u16 = () => { const v = buf.readUInt16LE(p); p += 2; return v; };
  const u32 = () => { const v = buf.readUInt32LE(p); p += 4; return v; };
  const str = () => { const e = buf.indexOf(10, p); const s = buf.slice(p, e); p = e + 1; return new TextDecoder('gbk').decode(s); };
  const ma = buf[0] === 0x84 && buf[1] === 0xcc;
  if (ma) p = 128; else { if (buf.readUInt16LE(0) !== 0x1000) throw new Error('khong phai mesh'); p = buf.indexOf(10, 2) + 1; if (u16() !== 0x3000) throw new Error('thieu M_MESH'); u32(); p += 1; }
  const out = { sub: [], shared: null };
  function geometry(end) {
    const n = u32(); const decl = []; const bufs = {};
    while (p < end) {
      const id = u16(), len = u32(), s = p - 6, e = s + len;
      if (id === 0x5100) { while (p < e) { const cid = u16(); u32(); if (cid !== 0x5110) { p -= 6; break; } decl.push({ src: u16(), type: u16(), sem: u16(), off: u16(), idx: u16() }); } }
      else if (id === 0x5200) { const bind = u16(), size = u16(); const did = u16(); const dlen = u32(); if (did !== 0x5210) throw new Error('thieu 0x5210'); bufs[bind] = { size, data: buf.slice(p, p + n * size) }; p += n * size; }
      else { p = s; break; }
      p = Math.max(p, e);
    }
    const g = { n, pos: [], nor: [], uv: [] };
    const f = (b, o) => b.readFloatLE(o);
    for (const el of decl) {
      const B = bufs[el.src]; if (!B) continue;
      for (let i = 0; i < n; i++) {
        const o = i * B.size + el.off;
        if (el.sem === 1 && el.type === 2) g.pos.push(f(B.data, o), f(B.data, o + 4), f(B.data, o + 8));
        else if (el.sem === 4 && el.type === 2) g.nor.push(f(B.data, o), f(B.data, o + 4), f(B.data, o + 8));
        else if (el.sem === 7 && el.idx === 0 && el.type === 1) g.uv.push(f(B.data, o), f(B.data, o + 4));
      }
    }
    return g;
  }
  while (p + 6 <= buf.length) {
    const id = u16(), len = u32(), s = p - 6, e = s + len;
    if (id === 0x4000) {
      // ten vat lieu co the nam trong vung ma hoa (file 84cc) -> do vi tri: sau ten la [co dung chung 0/1][so chi so u32][co 32bit 0/1][chi so...]
      // roi (neu khong dung chung) toi ngay khoi 0x5000 geometry, tat ca trong do dai khoi submesh (so tho).
      let mat = '';
      if (ma && p < 400) {
        let q = -1;
        for (let t = p; t < Math.min(p + 300, e - 6); t++) {
          const sh = buf[t], c = buf.readUInt32LE(t + 1), w = buf[t + 5];
          if (sh > 1 || w > 1 || !c || c % 3 || c > 3e6) continue;
          const sau = t + 6 + c * (w ? 4 : 2); if (sau + 6 > e) continue;
          if (sh === 1 || buf.readUInt16LE(sau) === 0x5000) { q = t; break; }
        }
        if (q < 0) throw new Error('khong do duoc cuoi ten vat lieu');
        mat = '(ma hoa)'; p = q;
      } else mat = str();
      const dung = buf[p++], cnt = u32(), b32 = buf[p++];
      const idx = []; for (let i = 0; i < cnt; i++) idx.push(b32 ? u32() : u16());
      let g = null;
      if (!dung) { const gid = u16(), glen = u32(); if (gid !== 0x5000) throw new Error('submesh thieu geometry, gap ' + gid.toString(16)); g = geometry(p - 6 + glen); }
      // bo qua khoi con (0x4010 op, 0x4100 bone, 0x4200 alias)
      while (p + 6 <= buf.length) { const cid = buf.readUInt16LE(p); if (cid !== 0x4010 && cid !== 0x4100 && cid !== 0x4200) break; p += buf.readUInt32LE(p + 2); }
      out.sub.push({ mat, dung: !!dung, idx, g });
      continue;
    }
    if (id === 0x5000) { out.shared = geometry(e); p = Math.max(p, e); continue; }
    p = e;   // 0x6000 skeleton link, 0x7000 bone, 0x9000 bounds, 0xA000 ten, 0xB000 edge, 0xD000 anim...
  }
  return out;
}
module.exports = { doc };
if (require.main === module) {
  const m = doc(fs.readFileSync(process.argv[2]));
  for (const s of m.sub) { const g = s.g || m.shared; console.log('mat', s.mat, '| tam giac', s.idx.length / 3, '| dinh', g ? g.n : '?', '| pos', g ? g.pos.length / 3 : 0, 'nor', g ? g.nor.length / 3 : 0, 'uv', g ? g.uv.length / 2 : 0); }
  const g = m.sub[0] && (m.sub[0].g || m.shared); if (g) { let mn = [1e9, 1e9, 1e9], mx = [-1e9, -1e9, -1e9]; for (let i = 0; i < g.pos.length; i += 3) for (let k = 0; k < 3; k++) { mn[k] = Math.min(mn[k], g.pos[i + k]); mx[k] = Math.max(mx[k], g.pos[i + k]); } console.log('khung:', mn.map((x) => x.toFixed(1)).join(','), '->', mx.map((x) => x.toFixed(1)).join(',')); }
}
