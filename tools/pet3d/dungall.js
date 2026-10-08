// Dung du lieu 3D cho cac trung Ghep Ngoc (tu ra/noi.json, chay noi.js truoc): node dungall.js [thu muc ra = ra/pet3d] [ma trung ...]
// Moi trung <ra>/<trung>/:
//   m<k>.bin   k = 1 ban thuong, 2.. = bien di doi 1..   (than + da xuong + diem gan + danh sach hieu ung)
//   p<n>.bin   mesh cua hat kieu "renderer mesh" (vd canh, vat bay quanh)
//   k<n>.json  xuong + dong tac (站立 dung, 休闲 nghi) - da doi sang bien doi CUC BO cuoi (goc * keyframe)
//   fx.json    { ps: {ten he hat: dinh nghia}, mat: {ten vat lieu: {tex, blend, x4, clamp, cull}} } dung chung cac ban
//   t<n>.dds   texture (ten ASCII)          info.json   chi tiet
// <ra>/index.json = {trung: {ten, so, f:[file]}}
// .bin = [u32 do dai JSON][JSON][pad 4][du lieu]. JSON: {parts:[{nv,ni,i32,tex,alpha,o:{pos,nor,uv,idx,bi,bw}}], skel, anim, loc, eff}
//   bi = Uint8 x4 / dinh (chi so xuong), bw = Float32 x4 / dinh (trong so)
const fs = require('fs'), path = require('path'); const { mo } = require('./trich.js'); const { giai } = require('./giaima.js'); const { doc } = require('./docmesh.js');
const { docSkel } = require('./docskel.js'); const { chiMuc, than } = require('./fxlib.js');
const P = require('./duongdan.js'); const D = P.DATA;
const [, , RA0, ...CHON] = process.argv; const RA = RA0 || path.join(__dirname, 'ra', 'pet3d');
const gbk = (b) => new TextDecoder('gbk').decode(b);
const M = mo(path.join(D, 'Model.axp')), V = [mo(path.join(D, 'Material.axp')), mo(path.join(D, 'Effect.axp'))];
const IDXM = new Map(); for (const f of M.ds) IDXM.set(f.ten.toLowerCase(), f);
const IDXV = V.map((A) => { const m = new Map(); for (const f of A.ds) m.set(f.ten.toLowerCase(), f); return m; });
const tim = (A, ten, I) => { const f = (I || new Map(A.ds.map((x) => [x.ten.toLowerCase(), x]))).get(ten.toLowerCase()); if (!f) return null; const r = A.doc(f); return r.buf ? giai(r.buf).buf : null; };
const timM = (ten) => tim(M, ten, IDXM);
const timV = (ten) => { for (let i = 0; i < V.length; i++) { const b = tim(V[i], ten, IDXV[i]); if (b) return b; } return null; };
const MAT = gbk(timV('all.material'));
const EFF = gbk(tim(V[1], 'all.effect', IDXV[1])), IE = chiMuc(EFF);
const PAR = gbk(tim(V[1], 'all.particle', IDXV[1])), IP = chiMuc(PAR);
const OBJ = gbk(timM('all.obj'));
// all.material co ngoac lech (chu thich...) -> khong dung chi muc theo do sau, do chuoi "material <ten>" truc tiep (co nho)
const _km = new Map();
function khoiMat(ten) {
  if (_km.has(ten)) return _km.get(ten);
  let from = 0, kq = '';
  while ((from = MAT.indexOf('material ' + ten, from)) >= 0) {
    const sau = MAT[from + 9 + ten.length];
    if (sau === '\r' || sau === '\n' || sau === ' ' || sau === '\t' || sau === '{' || sau === ':') { kq = than(MAT, MAT.indexOf('{', from)); break; }
    from += 1;
  }
  _km.set(ten, kq); return kq;
}
const r4 = (a, n = 10000) => a.map((v) => Math.round(v * n) / n);

// ---- vat lieu than pet
function texCua(mat) {
  const ds = ['jpg_' + mat + '.dds', 'tga_' + mat + '.dds'];
  const k = khoiMat(mat);
  for (const m of k.matchAll(/(?:set_texture_alias\s+\S+|texture)\s+([^\s]+\.(?:dds|tga|png|jpg))/gi)) ds.push(m[1]);
  for (const t of ds) { const b = timV(t); if (b) return { ten: t, buf: b, alpha: /^tga_/i.test(t) || /alpha_rejection|AlphaTemplate/i.test(k) ? 1 : 0 }; }
  return null;
}
// ---- vat lieu hat: texture + hoa tron (pass dau tien)
function matHat(ten) {
  const k = khoiMat(ten); if (!k) return null;
  const g = (re) => { const m = k.match(re); return m ? m[1].trim() : ''; };
  const tex = g(/\btexture\s+([^\s]+)/), sb = g(/scene_blend\s+([^\r\n]+)/), co = g(/colour_op_ex\s+(\S+)/);
  const blend = /^add\b|one one\b/.test(sb) ? 'add' : /alpha_blend|src_alpha one_minus_src_alpha/.test(sb) ? 'alpha' : /modulate|dest_colour zero/.test(sb) ? 'mod' : /colour_blend/.test(sb) ? 'add' : sb ? 'alpha' : 'none';
  // 2 he so hoa tron dung nhu Ogre (vd khoi "lam toi": zero one_minus_src_colour - neu coi la alpha se thanh o vuong den)
  const TAT = { add: ['one', 'one'], modulate: ['dest_colour', 'zero'], colour_blend: ['src_colour', 'one_minus_src_colour'], alpha_blend: ['src_alpha', 'one_minus_src_alpha'] };
  const tk = sb.split(/\s+/).filter(Boolean); const bf = TAT[tk[0]] || (tk.length >= 2 ? tk.slice(0, 2) : null);
  const sc = k.match(/scroll_anim\s+(\S+)\s+(\S+)/), ro = k.match(/rotate_anim\s+(\S+)/);
  return { tex, blend, bf, x4: co === 'modulate_x4' ? 4 : co === 'modulate_x2' ? 2 : 1, clamp: /tex_address_mode\s+clamp/.test(k) ? 1 : 0,
    cull: /cull_hardware\s+none/.test(k) ? 0 : 1, rej: /alpha_rejection/.test(k) ? 1 : 0, scroll: sc ? [+sc[1], +sc[2]] : null, rot: ro ? +ro[1] : 0 };
}
// ---- he hat / hieu ung -> JSON
function thamSo(body) {
  const o = {};
  for (const l of body.split('\n')) {
    const t = l.trim().split(/\s+/); if (!t[0] || /[{}]/.test(t[0])) continue;
    const v = t.slice(1); const so = v.map(Number);
    o[t[0]] = v.length === 0 ? '' : so.every((x) => !isNaN(x)) ? (so.length === 1 ? so[0] : so) : v.join(' ');
  }
  return o;
}
function heHat(ten) {
  const i = IP.get(ten); if (i === undefined) return null; const b = than(PAR, i);
  const con = []; const re = /(emitter|affector)\s+(\S+)\s*\{([^{}]*)\}/g; let m;
  while ((m = re.exec(b))) con.push({ k: m[1], t: m[2], p: thamSo(m[3]) });
  const goc = thamSo(b.slice(1, -1).replace(/(emitter|affector)\s+\S+\s*\{[^{}]*\}/g, ''));
  return { ...goc, em: con.filter((x) => x.k === 'emitter').map((x) => ({ t: x.t, ...x.p })), af: con.filter((x) => x.k === 'affector').map((x) => ({ t: x.t, ...x.p })) };
}
function hieuUng(ten) {
  const i = IE.get(ten); if (i === undefined) return null; const b = than(EFF, i);
  const el = []; const re = /element\s+(\S+)\s*\{([^{}]*)\}/g; let m;
  while ((m = re.exec(b))) { const p = thamSo(m[2]); if (m[1] === 'Particle' && p.ParticleSystem) el.push({ ps: String(p.ParticleSystem), pos: p.Position || [0, 0, 0], q: p.Orientation || [1, 0, 0, 0], t0: p.StartTime || 0 }); }
  return el;
}
// ---- xuong: bien doi cuc bo cuoi cho dong tac (Ogre: pos = goc + t, quay = goc * q)
const qmul = (a, b) => [a[3] * b[0] + a[0] * b[3] + a[1] * b[2] - a[2] * b[1], a[3] * b[1] - a[0] * b[2] + a[1] * b[3] + a[2] * b[0], a[3] * b[2] + a[0] * b[1] - a[1] * b[0] + a[2] * b[3], a[3] * b[3] - a[0] * b[0] - a[1] * b[1] - a[2] * b[2]];
const DONG_TAC = ['站立', '休闲'];
function xuongJson(k) {
  const bones = k.bones.map((b) => ({ n: b.ten, c: b.cha, p: r4(b.pos), q: r4(b.q, 1e5), s: b.sc && b.sc.some((v) => v !== 1) ? r4(b.sc) : undefined }));
  const anims = {};
  for (const a of k.anims) {
    if (!DONG_TAC.includes(a.ten)) continue;
    anims[a.ten] = { d: Math.round(a.dai * 1000) / 1000, tr: a.tracks.filter((t) => t.kf.length && k.bones[t.bone]).map((t) => {
      const b = k.bones[t.bone]; const T = [], Q = [], Pp = [];
      for (const f of t.kf) { T.push(Math.round(f.t * 1000) / 1000); Q.push(...r4(qmul(b.q, f.q), 1e4)); Pp.push(...r4([b.pos[0] + f.tr[0], b.pos[1] + f.tr[1], b.pos[2] + f.tr[2]], 1000)); }
      return { b: t.bone, t: T, q: Q, p: Pp };
    }) };
  }
  return { bones, anims };
}

const noi = JSON.parse(fs.readFileSync(path.join(__dirname, 'ra', 'noi.json'), 'utf8'));
// ma phien ban moi lan dung (index.json -> v): trang gan ?v= vao duong dan -> file cache 7 ngay van tai lai khi dung lai
const PB = Date.now().toString(36);
const tong = { trung: 0, ban: 0, byte: 0, thieu: [], hat: 0, hatThieu: new Set() };
// chi dung lai vai trung -> giu cac trung khac trong index.json cu
let CHI = {}; if (CHON.length) { try { CHI = JSON.parse(fs.readFileSync(path.join(RA, 'index.json'), 'utf8')); } catch { /* chua co */ } }
for (const x of noi) {
  if (!x.ban || (CHON.length && !CHON.includes(x.trung))) continue;
  const dir = path.join(RA, x.trung); fs.rmSync(dir, { recursive: true, force: true }); fs.mkdirSync(dir, { recursive: true });
  const texDa = new Map(), texFile = new Map(), skelFile = new Map(), meshHat = new Map(); const FX = { ps: {}, mat: {} };
  const info = { ten: x.ten, ban: [] };
  const luuTex = (ten, buf) => { if (!texFile.has(ten)) { texFile.set(ten, 't' + texFile.size + '.dds'); fs.writeFileSync(path.join(dir, texFile.get(ten)), buf); } return texFile.get(ten); };
  const luuSkel = (ten) => {
    if (skelFile.has(ten)) return skelFile.get(ten);
    const b = timM(ten); let f = null;
    if (b) { try { const k = docSkel(b); f = 'k' + skelFile.size + '.json'; fs.writeFileSync(path.join(dir, f), JSON.stringify(xuongJson(k))); } catch (e) { tong.thieu.push(x.trung + ':' + ten + ' ' + e.message); } }
    skelFile.set(ten, f); return f;
  };
  // dong goi 1 danh sach entity (than pet hoac mesh hat) -> {parts, skel, bufs}
  function dongGoi(ents) {
    const parts = [], bufs = []; let off = 0, skel = null;
    const them = (ta) => { const u = Buffer.from(ta.buffer, ta.byteOffset, ta.byteLength); const o = off; bufs.push(u); off += u.length; while (off % 4) { bufs.push(Buffer.alloc(1)); off++; } return o; };
    for (const e of ents) {
      const raw = timM(e.file); if (!raw) { tong.thieu.push(x.trung + ':' + e.file); continue; }
      let m; try { m = doc(raw); } catch (err) { tong.thieu.push(x.trung + ':' + e.file + ' ' + err.message); continue; }
      if (m.skel && !skel) skel = luuSkel(m.skel);
      for (const s of m.sub) {
        const g = s.g || m.shared; if (!g || !g.pos.length) continue;
        // vat lieu gan trong .obj (Entity material=) ghi de vat lieu cua mesh: cac ban bien di thuong dung chung 1 mesh, chi khac vat lieu
        const matTen = e.mat || (s.mat && s.mat !== '(ma hoa)' ? s.mat : '');
        let tx = texDa.get(matTen);
        if (tx === undefined) { const t = texCua(matTen) || (e.mat ? texCua(e.mat) : null); tx = t ? { ten: luuTex(t.ten, t.buf), alpha: t.alpha } : null; texDa.set(matTen, tx); }
        const i32 = g.n > 65535; const o = { pos: them(new Float32Array(g.pos)), nor: g.nor.length ? them(new Float32Array(g.nor)) : -1, uv: g.uv.length ? them(new Float32Array(g.uv)) : -1, idx: them(i32 ? new Uint32Array(s.idx) : new Uint16Array(s.idx)) };
        // da xuong: toi da 4 xuong / dinh, chuan hoa trong so
        const bwSrc = s.bw.length ? s.bw : (s.g ? [] : m.bw || []);
        if (skel && bwSrc.length) {
          const ds = Array.from({ length: g.n }, () => []);
          for (let i = 0; i < bwSrc.length; i += 3) if (ds[bwSrc[i]]) ds[bwSrc[i]].push([bwSrc[i + 1], bwSrc[i + 2]]);
          const bi = new Uint8Array(g.n * 4), bw = new Float32Array(g.n * 4);
          ds.forEach((l, v) => { l.sort((a, b) => b[1] - a[1]); const top = l.slice(0, 4); const tg = top.reduce((t, a) => t + a[1], 0) || 1; top.forEach((a, j) => { bi[v * 4 + j] = a[0]; bw[v * 4 + j] = a[1] / tg; }); if (!top.length) bw[v * 4] = 0; });
          o.bi = them(bi); o.bw = them(bw);
        }
        parts.push({ nv: g.n, ni: s.idx.length, i32: i32 ? 1 : 0, tex: tx ? tx.ten : '', alpha: tx ? tx.alpha : 0, o });
      }
    }
    return { parts, skel, bufs };
  }
  const ghiBin = (f, hd, bufs) => {
    const js = Buffer.from(JSON.stringify(hd), 'utf8'); const pad = (4 - ((4 + js.length) % 4)) % 4; const h = Buffer.alloc(4); h.writeUInt32LE(js.length);
    const out = Buffer.concat([h, js, Buffer.alloc(pad), ...bufs]); fs.writeFileSync(path.join(dir, f), out); return out.length;
  };
  // he hat (+ vat lieu, texture, mesh hat) -> FX
  function ganHat(ten) {
    if (FX.ps[ten] !== undefined) return !!FX.ps[ten];
    const h = heHat(ten); if (!h) { tong.hatThieu.add(ten); FX.ps[ten] = null; return false; }
    if (h.material && FX.mat[h.material] === undefined) {
      const mt = matHat(String(h.material));
      if (mt && mt.tex) { const b = timV(mt.tex); mt.tex = b ? luuTex(mt.tex, b) : ''; }
      FX.mat[h.material] = mt;
    }
    if (h.renderer === 'mesh' && h.mesh_name) {
      const mn = String(h.mesh_name);
      if (!meshHat.has(mn)) {
        const g = dongGoi([{ file: mn, mat: '' }]); const f = 'p' + meshHat.size + '.bin';
        if (g.parts.length) { tong.byte += ghiBin(f, { parts: g.parts, skel: g.skel }, g.bufs); meshHat.set(mn, f); } else meshHat.set(mn, null);
      }
      h.pm = meshHat.get(mn);
    }
    FX.ps[ten] = h; tong.hat++; return true;
  }
  x.ban.forEach((b, k) => {
    const g = dongGoi(b.ent || []);
    // diem gan + hieu ung trong .obj
    const i = OBJ.indexOf('<Object name="' + b.obj + '">'); const so = i < 0 ? '' : OBJ.slice(i, OBJ.indexOf('</Object>', i));
    const loc = {};
    for (const m of so.matchAll(/<Locator name="([^"]*)" bonename="([^"]*)" x="([^"]*)" y="([^"]*)" z="([^"]*)" qx="([^"]*)" qy="([^"]*)" qz="([^"]*)" qw="([^"]*)"/g))
      loc[m[1]] = { b: m[2], p: r4([+m[3], +m[4], +m[5]]), r: r4([+m[6], +m[7], +m[8], +m[9]]) };   // r = truc (x,y,z) + goc (rad)
    const eff = [];
    for (const m of so.matchAll(/<Effect name="[^"]*" effect="([^"]*)" locator="([^"]*)"/g)) {
      const el = hieuUng(m[1]); if (!el) { tong.hatThieu.add('effect ' + m[1]); continue; }
      const dung = el.filter((e) => ganHat(e.ps)); if (dung.length) eff.push({ loc: m[2], el: dung });
    }
    const usedLoc = {}; for (const e of eff) if (loc[e.loc]) usedLoc[e.loc] = loc[e.loc];
    tong.byte += ghiBin('m' + (k + 1) + '.bin', { parts: g.parts, skel: g.skel, loc: usedLoc, eff }, g.bufs); tong.ban++;
    info.ban.push({ pet: b.pet, mh: b.mh, phan: g.parts.length, hieuUng: eff.length });
  });
  fs.writeFileSync(path.join(dir, 'fx.json'), JSON.stringify(FX));
  for (const f of fs.readdirSync(dir)) if (/\.(dds|json)$/.test(f)) tong.byte += fs.statSync(path.join(dir, f)).size;
  info.so = info.ban.length; info.f = fs.readdirSync(dir).filter((f) => /^([mp]\d+\.bin|t\d+\.dds|k\d+\.json|fx\.json)$/.test(f));
  fs.writeFileSync(path.join(dir, 'info.json'), JSON.stringify(info)); CHI[x.trung] = { ten: x.ten, so: info.so, v: PB, f: info.f }; tong.trung++;
  console.log(x.trung, x.ten, 'hieu ung/ban:', info.ban.map((b) => b.hieuUng).join(','), '| tex', texFile.size, '| xuong', skelFile.size, '| mesh hat', meshHat.size);
}
fs.writeFileSync(path.join(RA, 'index.json'), JSON.stringify(CHI));
console.log('XONG', tong.trung, 'trung', tong.ban, 'ban', (tong.byte / 1048576).toFixed(1) + ' MB', '| he hat', tong.hat, '| thieu', tong.thieu.length, tong.thieu.slice(0, 6), '| hat thieu', tong.hatThieu.size, [...tong.hatThieu].slice(0, 5));
