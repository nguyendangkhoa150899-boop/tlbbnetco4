// Tim chuoi tieng Viet trong file game (.lua/.txt/.ini), ca dang VISCII thuong lan dang \ddd
//   node tools/soat-boss/tim.js "Thuong Lang Tu co dau" ["chuoi 2" ...]
const c = require('./_chung');
const qs = process.argv.slice(2);
if (!qs.length) { console.log('cach dung: node tools/soat-boss/tim.js "chuoi tieng Viet" [...]'); process.exit(1); }
const map = JSON.parse(c.fs.readFileSync(c.path.join(c.REPO, 'tools', 'viscii-map.json'), 'utf8'));
const byte = s => [...s.normalize('NFC')].map(ch => ch.charCodeAt(0) < 128 ? ch : String.fromCharCode(map[ch])).join('');
const mau = qs.flatMap(q => [[q, byte(q)], [q + ' (\\ddd)', c.maHoa(q)]]);
const di = d => {
  for (const e of c.fs.readdirSync(d, { withFileTypes: true })) {
    const p = c.path.join(d, e.name);
    if (e.isDirectory()) di(p);
    else if (/\.(lua|txt|ini)$/i.test(e.name)) {
      const s = c.doc(p);
      for (const [q, b] of mau) { const k = s.indexOf(b); if (k >= 0) console.log(q + '  ->  ' + c.path.relative(c.SV, p) + ':' + s.slice(0, k).split('\n').length); }
    }
  }
};
di(c.path.join(c.SV, 'Public'));
di(c.path.join(c.SV, 'Server', 'Config'));
