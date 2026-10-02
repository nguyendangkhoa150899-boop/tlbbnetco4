// Dat mau boss = HE_SO x mau GOC (truoc commit da6cce6 giam 35%), chi o nhung o da6cce6 da doi
// (cot 19 HP, cot 59 MaxHP, dem tu 0) va hien van giu gia tri cua da6cce6 (o bi sua sau do thi bo qua, in ra).
// Dung: node tools/mau-boss.js 0.8      (chay o goc repo; doc/ghi server/Public/Config/MonsterAttrExTable.txt)
// Ngay mo: neu merge mo-server bi xung dot o file nay -> lay ban cua main roi chay lai lenh tren.
const { execSync } = require("child_process"); const fs = require("fs");
const HE_SO = +process.argv[2]; if (!(HE_SO > 0 && HE_SO <= 1)) { console.error("he so 0-1, vd 0.8"); process.exit(1); }
const P = "server/Public/Config/MonsterAttrExTable.txt";
const rd = r => execSync("git show " + r + ":" + P, { maxBuffer: 1e9, encoding: "latin1" }).split(/\r?\n/);
const map = L => { const m = {}; for (const l of L) { const c = l.split("\t"); if (/^\d+$/.test(c[0])) m[c[0]] = c; } return m; };
const G = map(rd("da6cce6~1")), R = map(rd("da6cce6"));   // ~1, khong dung ^ (cmd.exe nuot ^)
const raw = fs.readFileSync(P, "latin1"); const cnt = (s, re) => (s.match(re) || []).length;
let o = 0, d = 0; const skip = [];
const out = raw.split("\n").map(l => {
  const c = l.replace(/\r$/, "").split("\t"); const id = c[0]; if (!G[id] || !R[id]) return l; let ch = false;
  for (const k of [19, 59]) {
    if (G[id][k] === R[id][k]) continue;
    if (c[k] !== R[id][k] && c[k] !== String(Math.floor(+G[id][k] * HE_SO))) { skip.push(id + "@" + k); continue; }
    const v = String(Math.floor(+G[id][k] * HE_SO)); if (c[k] !== v) { c[k] = v; o++; ch = true; }
  }
  if (ch) d++; return ch ? c.join("\t") + (l.endsWith("\r") ? "\r" : "") : l;
}).join("\n");
fs.writeFileSync(P, out, "latin1");
console.log("doi", o, "o /", d, "dong; bo qua", skip.length, skip.slice(0, 10).join(" "));
console.log("byte>127", cnt(raw, /[\x80-\xff]/g), "->", cnt(out, /[\x80-\xff]/g), "CR", cnt(raw, /\r/g), "->", cnt(out, /\r/g));
