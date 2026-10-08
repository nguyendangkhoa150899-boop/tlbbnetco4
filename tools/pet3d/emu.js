// Gia lap x86-32 toi gian (iced-x86 giai ma) de chay cac ham giai ma trong anh RAM cua RSSParser.dll (ma E-lang).
// Chi ho tro tap lenh ma cac ham handler dung; gap lenh la -> nem loi de biet.
const fs = require('fs'), path = require('path');
const I = require('iced-x86');
const RN = {}; for (const [k, v] of Object.entries(I.Register)) if (typeof v === 'number') RN[v] = k === 'None' ? '' : k.toLowerCase();
const MN = {}; for (const [k, v] of Object.entries(I.Mnemonic)) if (typeof v === 'number') MN[v] = k.toLowerCase();
const OK = I.OpKind; const MS = {}; for (const [k, v] of Object.entries(I.MemorySize)) if (typeof v === 'number') MS[v] = k;
const szMS = (n) => (/Float80/.test(n) ? 10 : /64/.test(n) ? 8 : /32/.test(n) ? 4 : /16/.test(n) ? 2 : /8/.test(n) ? 1 : /Dword|DwordOffset/.test(n) ? 4 : 4);

const ANH = path.join(__dirname, 'khoa', 'RSSParser.img'), BASE = 0xfb0000;
class May {
  constructor() {
    this.pg = new Map(); const img = fs.readFileSync(ANH); this.ghi(BASE, img);
    this.r = { eax: 0, ebx: 0, ecx: 0, edx: 0, esi: 0, edi: 0, ebp: 0, esp: 0 }; this.f = { z: 0, s: 0, o: 0, c: 0 };
    this.st = []; this.sw = 0; this.cache = new Map(); this.heap = 0x30000000;
    this.stub = new Map([
      [0xfb137f, () => { const v = this.st.pop(); const t = Math.trunc(v); this.r.eax = t >>> 0; this.r.edx = Math.floor(t / 4294967296) >>> 0; this.ret(0); }],
      [0xfb8198, () => { const fn = this.r.ebx >>> 0, sp = this.r.esp; const n = this.d32(sp + 4); let a = this.d32(sp + 8);
        for (let i = 1; i < n; i++) { const b = this.d32(sp + 8 + 12 * i); if (fn === 0xfb8330) a &= b; else if (fn === 0xfb8350) a ^= b; else if (fn === 0xfb8520 || fn === 0xfb8340) a |= b; else throw new Error('ham thu vien la ' + fn.toString(16)); }
        this.r.eax = a >>> 0; this.ret(0); }],
      [0xfb8180, () => { const n = this.d32(this.r.esp + 4); const p = this.heap; this.heap += (n + 15) & ~15; this.ghi(p, Buffer.alloc(n)); this.r.eax = p; this.ret(0); }],
      [0xfb817a, () => this.ret(0)],
      [0xfb8186, () => { throw new Error('E-lang bao loi ' + this.d32(this.r.esp + 4)); }],
    ]);
  }
  trang(a) { const k = a >>> 16; let p = this.pg.get(k); if (!p) { p = new Uint8Array(65536); this.pg.set(k, p); } return p; }
  d8(a) { a >>>= 0; return this.trang(a)[a & 0xffff]; }
  g8(a, v) { a >>>= 0; this.trang(a)[a & 0xffff] = v & 255; }
  d32(a) { return (this.d8(a) | (this.d8(a + 1) << 8) | (this.d8(a + 2) << 16) | (this.d8(a + 3) << 24)) >>> 0; }
  g32(a, v) { for (let i = 0; i < 4; i++) this.g8(a + i, v >>> (8 * i)); }
  dn(a, n) { if (n === 1) return this.d8(a); if (n === 2) return this.d8(a) | (this.d8(a + 1) << 8); return this.d32(a); }
  gn(a, n, v) { if (n === 1) this.g8(a, v); else if (n === 2) { this.g8(a, v); this.g8(a + 1, v >>> 8); } else this.g32(a, v); }
  ghi(a, buf) { for (let i = 0; i < buf.length; i++) this.g8(a + i, buf[i]); }
  doc(a, n) { const b = Buffer.alloc(n); for (let i = 0; i < n; i++) b[i] = this.d8(a + i); return b; }
  dD(a) { const b = this.doc(a, 8); return b.readDoubleLE(0); }
  gD(a, v) { const b = Buffer.alloc(8); b.writeDoubleLE(v); this.ghi(a, b); }
  // thanh ghi
  reg(n) { const r = this.r; switch (n) {
    case 'al': return r.eax & 255; case 'bl': return r.ebx & 255; case 'cl': return r.ecx & 255; case 'dl': return r.edx & 255;
    case 'ah': return (r.eax >>> 8) & 255; case 'bh': return (r.ebx >>> 8) & 255; case 'ch': return (r.ecx >>> 8) & 255; case 'dh': return (r.edx >>> 8) & 255;
    case 'ax': return r.eax & 0xffff; case 'bx': return r.ebx & 0xffff; case 'cx': return r.ecx & 0xffff; case 'dx': return r.edx & 0xffff;
    default: if (!(n in r)) throw new Error('thanh ghi la ' + n); return r[n] >>> 0; } }
  setReg(n, v) { const r = this.r; v >>>= 0; const lo = (k) => (r[k] = ((r[k] & ~255) | (v & 255)) >>> 0), hi = (k) => (r[k] = ((r[k] & ~0xff00) | ((v & 255) << 8)) >>> 0), w = (k) => (r[k] = ((r[k] & ~0xffff) | (v & 0xffff)) >>> 0);
    switch (n) { case 'al': return lo('eax'); case 'bl': return lo('ebx'); case 'cl': return lo('ecx'); case 'dl': return lo('edx');
      case 'ah': return hi('eax'); case 'bh': return hi('ebx'); case 'ch': return hi('ecx'); case 'dh': return hi('edx');
      case 'ax': return w('eax'); case 'bx': return w('ebx'); case 'cx': return w('ecx'); case 'dx': return w('edx');
      default: if (!(n in r)) throw new Error('thanh ghi la ' + n); r[n] = v; } }
  szReg(n) { return /^e/.test(n) ? 4 : /[lh]$/.test(n) ? 1 : 2; }
  push(v) { this.r.esp = (this.r.esp - 4) >>> 0; this.g32(this.r.esp, v); }
  pop() { const v = this.d32(this.r.esp); this.r.esp = (this.r.esp + 4) >>> 0; return v; }
  ret(n) { this.eip = this.pop(); this.r.esp = (this.r.esp + n) >>> 0; }
  giaiMa(ip) {
    let c = this.cache.get(ip); if (c) return c;
    const d = new I.Decoder(32, this.doc(ip, 16), I.DecoderOptions.None); d.ip = BigInt(ip); const x = d.decode();
    const ops = []; for (let k = 0; k < x.opCount; k++) {
      const kd = x.opKind(k);
      if (kd === OK.Register) ops.push({ t: 'r', n: RN[x.opRegister(k)] });
      else if (kd === OK.Memory) ops.push({ t: 'm', b: RN[x.memoryBase] || '', i: RN[x.memoryIndex] || '', s: x.memoryIndexScale, d: Number(x.memoryDisplacement) >>> 0, sz: szMS(MS[x.memorySize]), seg: RN[x.memorySegment] });
      else if (kd === OK.NearBranch32 || kd === OK.NearBranch16) ops.push({ t: 'i', v: Number(x.nearBranchTarget) >>> 0 });
      else if (kd === OK.MemorySegESI || kd === OK.MemoryESEDI || kd === OK.MemorySegDI || kd === OK.MemoryESDI) ops.push({ t: 's' });
      else ops.push({ t: 'i', v: Number(x.immediate(k)) >>> 0 });
    }
    c = { mn: MN[x.mnemonic], ops, len: x.length, rep: x.hasRepPrefix, txt: '' }; x.free(); d.free(); this.cache.set(ip, c); return c;
  }
  ea(o) { if (o.seg === 'fs') throw new Error('fs:'); return ((o.b ? this.reg(o.b) : 0) + (o.i ? this.reg(o.i) * o.s : 0) + o.d) >>> 0; }
  doc_(o, sz) { if (o.t === 'r') return this.reg(o.n); if (o.t === 'i') return o.v; return this.dn(this.ea(o), sz || o.sz); }
  ghi_(o, v, sz) { if (o.t === 'r') return this.setReg(o.n, v); return this.gn(this.ea(o), sz || o.sz, v); }
  sz(o, p) { return o.t === 'r' ? this.szReg(o.n) : o.t === 'm' ? o.sz : p ? this.sz(p) : 4; }
  co(v, sz) { const m = sz === 4 ? 0xffffffff : sz === 2 ? 0xffff : 0xff, sb = sz === 4 ? 0x80000000 : sz === 2 ? 0x8000 : 0x80; v &= m; this.f.z = v === 0 ? 1 : 0; this.f.s = (v & sb) ? 1 : 0; return v >>> 0; }
  chay(dau, maxBuoc = 5e7) {
    this.eip = dau >>> 0; const DUNG = 0xdead0000; let buoc = 0;
    while (this.eip !== DUNG) {
      if (++buoc > maxBuoc) throw new Error('qua nhieu buoc');
      const s = this.stub.get(this.eip); if (s) { s(); continue; }
      const c = this.giaiMa(this.eip); const ip = this.eip; this.eip = (ip + c.len) >>> 0; const [a, b] = c.ops; const r = this.r, f = this.f;
      switch (c.mn) {
        case 'nop': break;
        case 'mov': { const z = this.sz(a, b); this.ghi_(a, this.doc_(b, z), z); break; }
        case 'movzx': { this.ghi_(a, this.doc_(b)); break; }
        case 'lea': this.setReg(a.n, this.ea(b)); break;
        case 'push': this.push(a.t === 'i' ? a.v : this.doc_(a, 4)); break;
        case 'pop': this.ghi_(a, this.pop(), 4); break;
        case 'pusha': case 'pushad': { const t = r.esp; for (const k of ['eax', 'ecx', 'edx', 'ebx']) this.push(r[k]); this.push(t); for (const k of ['ebp', 'esi', 'edi']) this.push(r[k]); break; }
        case 'popa': case 'popad': { for (const k of ['edi', 'esi', 'ebp']) r[k] = this.pop(); this.pop(); for (const k of ['ebx', 'edx', 'ecx', 'eax']) r[k] = this.pop(); break; }
        case 'add': case 'sub': case 'cmp': {
          const z = this.sz(a, b), m = z === 4 ? 4294967296 : z === 2 ? 65536 : 256, x = this.doc_(a, z), y = this.doc_(b, z) % m;
          const res = c.mn === 'add' ? x + y : x - y; const v = this.co(res, z); const sb = m / 2;
          f.c = c.mn === 'add' ? (res >= m ? 1 : 0) : (x < y ? 1 : 0);
          const sx = x >= sb, sy = y >= sb, sr = v >= sb; f.o = c.mn === 'add' ? (sx === sy && sr !== sx ? 1 : 0) : (sx !== sy && sr !== sx ? 1 : 0);
          if (c.mn !== 'cmp') this.ghi_(a, v, z); break; }
        case 'inc': case 'dec': { const z = this.sz(a), m = z === 4 ? 4294967296 : z === 2 ? 65536 : 256, x = this.doc_(a, z); const v = this.co(c.mn === 'inc' ? x + 1 : x - 1 + m, z); f.o = c.mn === 'inc' ? (v === m / 2 ? 1 : 0) : (x === m / 2 ? 1 : 0); this.ghi_(a, v, z); break; }
        case 'and': case 'or': case 'xor': case 'test': {
          const z = this.sz(a, b), x = this.doc_(a, z), y = this.doc_(b, z); const v = this.co(c.mn === 'or' ? x | y : c.mn === 'xor' ? x ^ y : x & y, z); f.c = 0; f.o = 0;
          if (c.mn !== 'test') this.ghi_(a, v, z); break; }
        case 'shr': case 'shl': { const z = this.sz(a), x = this.doc_(a, z), n = this.doc_(b, 1) & 31; const v = this.co(c.mn === 'shr' ? x >>> n : x << n, z); this.ghi_(a, v, z); break; }
        case 'imul': { if (c.ops.length !== 2) throw new Error('imul dang la'); const v = Math.imul(this.doc_(a, 4), this.doc_(b, 4)) >>> 0; this.ghi_(a, v, 4); break; }
        case 'neg': { const z = this.sz(a), m = z === 4 ? 4294967296 : z === 2 ? 65536 : 256; const x = this.doc_(a, z); f.c = x ? 1 : 0; this.ghi_(a, this.co(m - x, z), z); break; }
        case 'sete': this.ghi_(a, f.z, 1); break;
        case 'setne': this.ghi_(a, f.z ? 0 : 1, 1); break;
        case 'sbb': { const z = this.sz(a, b), m = z === 4 ? 4294967296 : 256; const v = this.co(this.doc_(a, z) - this.doc_(b, z) - f.c + 2 * m, z); this.ghi_(a, v, z); break; }
        case 'jmp': if (a.t === 'i') this.eip = a.v; else this.eip = this.doc_(a, 4); break;
        case 'je': if (f.z) this.eip = a.v; break; case 'jne': if (!f.z) this.eip = a.v; break;
        case 'jl': if (f.s !== f.o) this.eip = a.v; break; case 'jge': if (f.s === f.o) this.eip = a.v; break;
        case 'jg': if (!f.z && f.s === f.o) this.eip = a.v; break; case 'jle': if (f.z || f.s !== f.o) this.eip = a.v; break;
        case 'jns': if (!f.s) this.eip = a.v; break; case 'js': if (f.s) this.eip = a.v; break;
        case 'jb': if (f.c) this.eip = a.v; break; case 'jae': if (!f.c) this.eip = a.v; break;
        case 'jbe': if (f.c || f.z) this.eip = a.v; break; case 'ja': if (!f.c && !f.z) this.eip = a.v; break;
        case 'call': this.push(this.eip); this.eip = a.t === 'i' ? a.v : this.doc_(a, 4); break;
        case 'ret': this.ret(a ? a.v : 0); break;
        case 'leave': r.esp = r.ebp; r.ebp = this.pop(); break;
        case 'cld': break;
        case 'stosd': case 'stosb': case 'movsd': case 'movsb': case 'lodsd': {
          const n = c.mn.endsWith('d') ? 4 : 1; let lap = c.rep ? r.ecx : 1;
          while (lap-- > 0) {
            if (c.mn.startsWith('stos')) { this.gn(r.edi, n, r.eax); r.edi = (r.edi + n) >>> 0; }
            else if (c.mn.startsWith('movs')) { this.gn(r.edi, n, this.dn(r.esi, n)); r.edi = (r.edi + n) >>> 0; r.esi = (r.esi + n) >>> 0; }
            else { r.eax = this.dn(r.esi, n); r.esi = (r.esi + n) >>> 0; }
          }
          if (c.rep) r.ecx = 0; break; }
        // FPU (double)
        case 'fld': this.st.push(a.t === 'm' ? (a.sz === 8 ? this.dD(this.ea(a)) : this.doc(this.ea(a), 4).readFloatLE(0)) : this.st[this.st.length - 1 - (+a.n.slice(2) || 0)]); break;
        case 'fild': { const ad = this.ea(a); this.st.push(a.sz === 8 ? Number(this.doc(ad, 8).readBigInt64LE(0)) : a.sz === 2 ? this.doc(ad, 2).readInt16LE(0) : this.d32(ad) | 0); break; }
        case 'fstp': case 'fst': { const v = this.st[this.st.length - 1]; if (a.t === 'm') { if (a.sz === 8) this.gD(this.ea(a), v); else { const bb = Buffer.alloc(4); bb.writeFloatLE(v); this.ghi(this.ea(a), bb); } } else { this.st[this.st.length - 1 - (+a.n.slice(2) || 0)] = v; } if (c.mn === 'fstp') this.st.pop(); break; }
        case 'fadd': case 'fsub': case 'fmul': case 'fdiv': case 'fsubr': {
          let y; if (c.ops.length === 1) y = a.sz === 8 ? this.dD(this.ea(a)) : this.doc(this.ea(a), 4).readFloatLE(0); else throw new Error('fpu 2 toan hang');
          const t = this.st.length - 1, x = this.st[t];
          this.st[t] = c.mn === 'fadd' ? x + y : c.mn === 'fsub' ? x - y : c.mn === 'fmul' ? x * y : c.mn === 'fdiv' ? x / y : y - x; break; }
        case 'fcomp': case 'fcom': { const y = a.sz === 8 ? this.dD(this.ea(a)) : this.doc(this.ea(a), 4).readFloatLE(0); const x = this.st[this.st.length - 1];
          this.sw = x > y ? 0 : x < y ? 0x100 : 0x4000; if (c.mn === 'fcomp') this.st.pop(); break; }
        case 'fnstsw': this.ghi_(a, this.sw, 2); break;
        default: throw new Error('lenh chua ho tro: ' + c.mn + ' @' + ip.toString(16));
      }
    }
  }
  // goi ham stdcall/cdecl: tham so tu trai sang phai
  goi(dau, args) {
    this.r.esp = 0x7ff000; for (const k of ['eax', 'ebx', 'ecx', 'edx', 'esi', 'edi', 'ebp']) this.r[k] = 0;
    for (let i = args.length - 1; i >= 0; i--) this.push(args[i]); this.push(0xdead0000); this.chay(dau); return this.r.eax;
  }
}
// bang dieu phoi loai -> handler (doc tu ma fb1de0)
function bangLoai() {
  const m = new May(); const out = {}; let ip = 0xfb207a; const het = 0xfb2830;
  let loai = null;
  while (ip < het) { const c = m.giaiMa(ip); if (c.mn === 'cmp' && c.ops[0].t === 'm' && c.ops[1].t === 'i') loai = c.ops[1].v; if (c.mn === 'call' && loai !== null && c.ops[0].t === 'i') { out[loai] = c.ops[0].v; loai = null; } ip += c.len; }
  return out;
}
module.exports = { May, bangLoai, BASE };
if (require.main === module) { const b = bangLoai(); console.log(Object.entries(b).map(([k, v]) => k + ':' + v.toString(16)).join(' ')); }
