// Dời 1 NPC / quái trong <ban do>_monster.ini theo guid (sửa pos_x, pos_z, tùy chọn dir). Byte-level (latin1), giữ kiểu xuống dòng. Cần restart game.
// node tools/doi-cho-npc.js <file ini trong server/Public/Scene> <guid> <x> <z> [dir] [--ghi]
//   05/10: node tools/doi-cho-npc.js luoyang_monster.ini 4062858 210 330 --ghi   (Kiều Phục Thịnh 330,299 -> 210,330)
const fs = require('fs'), path = require('path');
const a = process.argv.slice(2).filter((x) => x !== '--ghi'), ghi = process.argv.includes('--ghi');
const [file, guid, x, z, dir] = a;
if (!file || !/^\d+$/.test(guid || '') || !/^\d+(\.\d+)?$/.test(x || '') || !/^\d+(\.\d+)?$/.test(z || '') || (dir !== undefined && !/^\d+$/.test(dir))) { console.error('Dung: node tools/doi-cho-npc.js <file.ini> <guid> <x> <z> [dir] [--ghi]'); process.exit(1); }
const F = path.join(__dirname, '../server/Public/Scene', path.basename(file));
const raw = fs.readFileSync(F, 'latin1'), EOL = raw.includes('\r\n') ? '\r\n' : '\n', L = raw.split(EOL);
let bat = -1, het = L.length;
for (let i = 0; i < L.length; i++) if (L[i].trim() === 'guid=' + guid) { for (let j = i; j >= 0; j--) if (/^\[/.test(L[j])) { bat = j; break; } break; }
if (bat < 0) { console.error('LOI: khong thay guid ' + guid); process.exit(1); }
for (let i = bat + 1; i < L.length; i++) if (/^\[/.test(L[i])) { het = i; break; }
if (L.filter((l) => l.trim() === 'guid=' + guid).length !== 1) { console.error('LOI: guid ' + guid + ' xuat hien nhieu lan'); process.exit(1); }
const doi = { pos_x: x, pos_z: z }; if (dir !== undefined) doi.dir = dir;
for (const k of Object.keys(doi)) {
  const i = L.slice(bat, het).findIndex((l) => new RegExp('^' + k + '\\s*=').test(l));
  if (i < 0) { console.error('LOI: khoi ' + L[bat] + ' khong co ' + k); process.exit(1); }
  console.log(L[bat] + ' ' + L[bat + i] + ' -> ' + k + '=' + doi[k]);
  L[bat + i] = k + '=' + doi[k];
}
if (ghi) { fs.writeFileSync(F, L.join(EOL), 'latin1'); console.log('DA GHI'); }
