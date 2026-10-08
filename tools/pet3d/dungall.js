// Dung du lieu 3D cho cac trung Ghep Ngoc (tu ra/noi.json, chay noi.js truoc): node dungall.js [thu muc ra = ra/pet3d] [ma trung ...]
// Moi trung: <ra>/<trung>/m<k>.bin (k = 1 thuong, 2.. = bien di doi 1..) + texture t<n>.dds (ten ASCII) + info.json; <ra>/index.json = {trung: {ten, so, f:[file]}}
// m<k>.bin = [u32 do dai JSON][JSON {parts:[{nv,ni,i32,tex,alpha,o:{pos,nor,uv,idx}}]}][pad 4][du lieu Float32/Uint16/Uint32]
const fs = require('fs'), path = require('path'); const { mo } = require('./trich.js'); const { giai } = require('./giaima.js'); const { doc } = require('./docmesh.js');
const P = require('./duongdan.js'); const D = P.DATA;
const [, , RA0, ...CHON] = process.argv; const RA = RA0 || path.join(__dirname, 'ra', 'pet3d');
const M = mo(path.join(D, 'Model.axp')), V = [mo(path.join(D, 'Material.axp')), mo(path.join(D, 'Effect.axp'))];
const tim = (A, ten) => { const t = ten.toLowerCase(); const f = A.ds.find((x) => x.ten.toLowerCase() === t); if (!f) return null; const r = A.doc(f); return r.buf ? giai(r.buf).buf : null; };
const timV = (ten) => { for (const A of V) { const b = tim(A, ten); if (b) return b; } return null; };
const MAT = new TextDecoder('gbk').decode(tim(V[0], 'all.material'));
function khoiMat(ten) {
  let from = 0;
  while ((from = MAT.indexOf('material ' + ten, from)) >= 0) {
    const sau = MAT[from + 9 + ten.length];
    if (sau === '\r' || sau === '\n' || sau === ' ' || sau === '\t' || sau === '{' || sau === ':') {
      const j = MAT.indexOf('{', from); let d = 0, k = j;
      for (; k < MAT.length; k++) { if (MAT[k] === '{') d++; else if (MAT[k] === '}' && --d === 0) break; }
      return MAT.slice(from, k + 1);
    }
    from += 1;
  }
  return '';
}
function texCua(mat) {
  const ds = ['jpg_' + mat + '.dds', 'tga_' + mat + '.dds'];
  const k = khoiMat(mat);
  for (const m of k.matchAll(/(?:set_texture_alias\s+\S+|texture)\s+([^\s]+\.(?:dds|tga|png|jpg))/gi)) ds.push(m[1]);
  for (const t of ds) { const b = timV(t); if (b) return { ten: t, buf: b, alpha: /^tga_/i.test(t) || /alpha_rejection|AlphaTemplate/i.test(k) ? 1 : 0 }; }
  return null;
}
const noi = JSON.parse(fs.readFileSync(path.join(__dirname, 'ra', 'noi.json'), 'utf8'));
const tong = { trung: 0, ban: 0, byte: 0, thieu: [] }, CHI = {};
for (const x of noi) {
  if (!x.ban || (CHON.length && !CHON.includes(x.trung))) continue;
  const dir = path.join(RA, x.trung); fs.mkdirSync(dir, { recursive: true });
  const texDa = new Map(), texFile = new Map(); const info = { ten: x.ten, ban: [] };
  x.ban.forEach((b, k) => {
    const parts = [], bufs = []; let off = 0;
    const them = (ta) => { const u = Buffer.from(ta.buffer, ta.byteOffset, ta.byteLength); const o = off; bufs.push(u); off += u.length; while (off % 4) { bufs.push(Buffer.alloc(1)); off++; } return o; };
    for (const e of b.ent || []) {
      const raw = tim(M, e.file); if (!raw) { tong.thieu.push(x.trung + ':' + e.file); continue; }
      let m; try { m = doc(raw); } catch (err) { tong.thieu.push(x.trung + ':' + e.file + ' ' + err.message); continue; }
      for (const s of m.sub) {
        const g = s.g || m.shared; if (!g || !g.pos.length) continue;
        // vat lieu gan trong .obj (Entity material=) ghi de vat lieu cua mesh: cac ban bien di thuong dung chung 1 mesh, chi khac vat lieu
        const matTen = e.mat || (s.mat && s.mat !== '(ma hoa)' ? s.mat : '');
        let tx = texDa.get(matTen);
        if (tx === undefined) { const t = texCua(matTen) || texCua(e.mat); if (t && !texFile.has(t.ten)) { texFile.set(t.ten, 't' + texFile.size + '.dds'); fs.writeFileSync(path.join(dir, texFile.get(t.ten)), t.buf); } tx = t ? { ten: texFile.get(t.ten), alpha: t.alpha } : null; texDa.set(matTen, tx); }
        const i32 = g.n > 65535;
        parts.push({ nv: g.n, ni: s.idx.length, i32: i32 ? 1 : 0, tex: tx ? tx.ten : '', alpha: tx ? tx.alpha : 0,
          o: { pos: them(new Float32Array(g.pos)), nor: g.nor.length ? them(new Float32Array(g.nor)) : -1, uv: g.uv.length ? them(new Float32Array(g.uv)) : -1, idx: them(i32 ? new Uint32Array(s.idx) : new Uint16Array(s.idx)) } });
      }
    }
    const js = Buffer.from(JSON.stringify({ parts }), 'utf8'); let pad = (4 - ((4 + js.length) % 4)) % 4;
    const hd = Buffer.alloc(4); hd.writeUInt32LE(js.length);
    const out = Buffer.concat([hd, js, Buffer.alloc(pad), ...bufs]);
    fs.writeFileSync(path.join(dir, 'm' + (k + 1) + '.bin'), out); tong.ban++; tong.byte += out.length;
    info.ban.push({ pet: b.pet, mh: b.mh, phan: parts.length });
  });
  for (const f of fs.readdirSync(dir)) if (f.endsWith('.dds')) tong.byte += fs.statSync(path.join(dir, f)).size;
  info.so = info.ban.length; info.f = fs.readdirSync(dir).filter((f) => /^(m\d+\.bin|t\d+\.dds)$/.test(f)); fs.writeFileSync(path.join(dir, 'info.json'), JSON.stringify(info)); CHI[x.trung] = { ten: x.ten, so: info.so, f: info.f }; tong.trung++;
  console.log(x.trung, x.ten, info.ban.map((b) => b.phan).join(','), 'tex', texDa.size);
}
fs.writeFileSync(path.join(RA, 'index.json'), JSON.stringify(CHI));
console.log('XONG', tong.trung, 'trung', tong.ban, 'ban', (tong.byte / 1048576).toFixed(1) + ' MB', 'thieu:', tong.thieu.length, tong.thieu.slice(0, 10));
