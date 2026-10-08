// Doc .skeleton Ogre (Serializer_v1.10, da giai ma): xuong (ten, cha, vi tri / huong / ti le goc) + dong tac (track theo xuong, keyframe).
// Keyframe Ogre la TUONG DOI so voi tu the goc: pos = goc + t, quay = goc * q, ti le = goc * s.
const fs = require('fs');
function docSkel(buf) {
  let p = 0;
  const u16 = () => { const v = buf.readUInt16LE(p); p += 2; return v; };
  const u32 = () => { const v = buf.readUInt32LE(p); p += 4; return v; };
  const f32 = () => { const v = buf.readFloatLE(p); p += 4; return v; };
  const str = () => { const e = buf.indexOf(10, p); const s = buf.slice(p, e); p = e + 1; return new TextDecoder('gbk').decode(s); };
  if (u16() !== 0x1000) throw new Error('khong phai skeleton'); str();
  const bones = [], anims = [];
  while (p + 6 <= buf.length) {
    const s = p, id = u16(), len = u32(), e = s + len;
    if (id === 0x2000) {
      const ten = str(), h = u16(); const pos = [f32(), f32(), f32()]; const q = [f32(), f32(), f32(), f32()];   // x y z w
      const sc = p + 12 <= e ? [f32(), f32(), f32()] : [1, 1, 1];
      bones[h] = { ten, cha: -1, pos, q, sc };
    } else if (id === 0x3000) { const c = u16(), cha = u16(); if (bones[c]) bones[c].cha = cha; }
    else if (id === 0x4000) {
      const ten = str(), dai = f32(); const tracks = [];
      while (p + 6 <= buf.length) {
        const s2 = p, id2 = u16(), len2 = u32();
        if (id2 !== 0x4100) { p = s2; break; }
        const bone = u16(); const kf = [];
        while (p + 6 <= buf.length) {
          const s3 = p, id3 = u16(), len3 = u32();
          if (id3 === 0x4120) {
            // Fairy: khoi keyframe gon [so khung u16][co u16: 1 quay, 2 dich, 4 ti le][moi khung: t f32 + q x,y,z,w + dich xyz + ti le xyz]
            const n = u16(), co = u16();
            for (let i = 0; i < n; i++) {
              const t = f32(); const q = co & 1 ? [f32(), f32(), f32(), f32()] : [0, 0, 0, 1];
              const tr = co & 2 ? [f32(), f32(), f32()] : [0, 0, 0]; const sc = co & 4 ? [f32(), f32(), f32()] : null;
              kf.push({ t, q, tr, sc });
            }
            continue;
          }
          if (id3 !== 0x4110) { p = s3; break; }
          const t = f32(), q = [f32(), f32(), f32(), f32()], tr = [f32(), f32(), f32()];
          const sc = p + 12 <= s3 + len3 ? [f32(), f32(), f32()] : null;
          kf.push({ t, q, tr, sc }); p = s3 + len3;
        }
        tracks.push({ bone, kf });
      }
      anims.push({ ten, dai, tracks }); continue;
    }
    p = Math.max(p, e);
    if (len < 6) break;
  }
  return { bones, anims };
}
module.exports = { docSkel };
if (require.main === module) {
  const { giai } = require('./giaima.js'); const k = docSkel(giai(fs.readFileSync(process.argv[2])).buf);
  console.log('xuong', k.bones.length, k.bones.slice(0, 4).map((b) => b.ten + '<' + b.cha).join(' '));
  for (const a of k.anims) console.log('dong tac', a.ten, a.dai.toFixed(2) + 's', a.tracks.length, 'track', a.tracks[0] ? a.tracks[0].kf.length + ' kf' : '');
}
