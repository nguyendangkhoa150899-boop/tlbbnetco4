// disassembler cho anh module chep tu RAM (dia chi = base + offset). node disimg.js <img> <base hex> <cmd> ...
//   at <va> [n] | xref <va> | str <chuoi> | callers <va>
const fs = require('fs'); const { Decoder, DecoderOptions, Formatter, FormatterSyntax } = require('iced-x86');
const [, , IMG, BASE, CMD, A1, A2] = process.argv; const b = fs.readFileSync(IMG); const base = parseInt(BASE, 16);
const TS = 0x1000, TE = +(process.env.TE || 0x3f2000);
const fmt = new Formatter(FormatterSyntax.Masm); fmt.firstOperandCharIndex = 10;
function all(cb) { const d = new Decoder(32, b.slice(TS, TE), DecoderOptions.None); d.ip = BigInt(base + TS); while (d.canDecode) { const x = d.decode(); cb(x); x.free(); } d.free(); }
function at(va, cnt) { const o = va - base; const d = new Decoder(32, b.slice(o, o + cnt * 15), DecoderOptions.None); d.ip = BigInt(va); const out = []; for (let i = 0; i < cnt && d.canDecode; i++) { const x = d.decode(); out.push(Number(x.ip).toString(16) + '  ' + fmt.format(x)); x.free(); } d.free(); return out.join('\n'); }
function xref(v) { const r = []; all((x) => { let hit = false; try { if (x.isCallNear || x.isJmpNear || x.isJccShortOrNear) hit = Number(x.nearBranchTarget) === v; } catch (e) { } for (let k = 0; k < x.opCount && !hit; k++) { try { if ((Number(x.immediate(k)) >>> 0) === v) hit = true; } catch (e) { } } if (!hit && (Number(x.memoryDisplacement) >>> 0) === v) hit = true; if (hit) r.push(Number(x.ip).toString(16) + '  ' + fmt.format(x)); }); return r; }
if (CMD === 'at') console.log(at(parseInt(A1, 16), +(A2 || 60)));
else if (CMD === 'xref') console.log(xref(parseInt(A1, 16) >>> 0).slice(0, 80).join('\n') || 'khong thay');
else if (CMD === 'str') { const i = b.indexOf(Buffer.from(A1, 'latin1')); console.log('va', (base + i).toString(16)); console.log(xref(base + i).join('\n') || 'khong co xref'); }
module.exports = { at, xref };
