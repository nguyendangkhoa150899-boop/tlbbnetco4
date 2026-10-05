// 05/10 (chủ server): nội tức Võ Ý ×3 khi farm ở Vô Lượng Sơn (scene 6/73/74) -> (770 + 10×cấp) × 12 = 9.360-10.440/con.
// Script 999998 (MyNew/guaiwu_die.lua) còn gắn cho Thông Thiên Tháp (1.609 điểm), Mai Nha, Vân Phù -> các nơi đó giữ nguyên ×4.
// Chèn 1 dòng ASCII ngay sau dòng "local Neixi =", giữ đúng kiểu xuống dòng của dòng đó. node tools/voy-x3-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/MyNew/guaiwu_die.lua');
const ghi = process.argv.includes('--ghi');
const s = fs.readFileSync(F, 'latin1');
const moc = 'local Neixi = (770 + GuaiLev*10) * 4';
const i = s.indexOf(moc); if (i < 0 || s.indexOf(moc, i + 1) >= 0) { console.error('LOI: khong thay dung 1 dong Neixi'); process.exit(1); }
if (s.includes('Neixi = Neixi * 3')) { console.error('LOI: da co x3'); process.exit(1); }
const het = s.indexOf('\n', i); const eol = s[het - 1] === '\r' ? '\r\n' : '\n';
const dong = '        if sceneId == 6 or sceneId == 73 or sceneId == 74 then Neixi = Neixi * 3 end   -- [NetCo4 05/10] Vo Luong Son x3 noi tuc (chu server): 9.360-10.440/con; noi khac giu x4';
const moi = s.slice(0, het + 1) + dong + eol + s.slice(het + 1);
console.log('chen sau byte', het, '| xuong dong', JSON.stringify(eol));
if (ghi) { fs.writeFileSync(F, moi, 'latin1'); console.log('DA GHI'); }
