// liet ke export cua anh module (RAM). node xuat.js <img> <base hex> <regex>
const b = require('fs').readFileSync(process.argv[2]); const base = parseInt(process.argv[3], 16); const re = new RegExp(process.argv[4] || '.', 'i');
const pe = b.readUInt32LE(0x3c); const ed = b.readUInt32LE(pe + 24 + 96); const n = b.readUInt32LE(ed + 24), fa = b.readUInt32LE(ed + 28), na = b.readUInt32LE(ed + 32), oa = b.readUInt32LE(ed + 36);
const cs = (o) => { let s = ''; while (b[o]) s += String.fromCharCode(b[o++]); return s; };
for (let i = 0; i < n; i++) { const nm = cs(b.readUInt32LE(na + i * 4)); if (!re.test(nm)) continue; const ord = b.readUInt16LE(oa + i * 2); console.log((base + b.readUInt32LE(fa + ord * 4)).toString(16), nm); }
