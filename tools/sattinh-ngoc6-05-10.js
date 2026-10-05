// 05/10 (chủ server): Sát Tinh (Sinh Tử Lôi Đài) MỖI boss rơi ngọc cấp 6, tỉ lệ đặt ở roithem.txt trên VPS (khóa "sattinh").
// Chèn 1 dòng ASCII vào x892009_OnDie (obj/shengsi/shengsileitai.lua): 12 boss đều chết qua hàm này (NPC Khô Vinh dùng chung
// script nhưng là NPC, không chết). Rơi qua script = mỗi thành viên đứng gần roll riêng, KHÔNG giảm theo chênh cấp (boss 120).
// Lua -> có hiệu lực sau cap-nhat, không cần restart. node tools/sattinh-ngoc6-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/obj/shengsi/shengsileitai.lua');
const ghi = process.argv.includes('--ghi');
const s = fs.readFileSync(F, 'latin1');
const moc = 'CallScriptFunction(  501000,  "OnDie",  sceneId,  objId,  killerId)';
const i = s.indexOf(moc);
if (i < 0 || s.indexOf(moc, i + 1) >= 0) { console.error('LOI: khong thay dung 1 moc'); process.exit(1); }
if (s.includes('"sattinh"')) { console.error('LOI: da sua roi'); process.exit(1); }
if (s.lastIndexOf('function  x892009_OnDie(', i) < 0 || s.lastIndexOf('function', i) !== s.lastIndexOf('function  x892009_OnDie(', i)) { console.error('LOI: moc khong nam trong x892009_OnDie'); process.exit(1); }
const het = s.indexOf('\n', i), eol = s[het - 1] === '\r' ? '\r\n' : '\n';
const dong = 'CallScriptFunction( 950001, "RoiCfg", sceneId, objId, killerId, "sattinh" )   -- [NetCo4 05/10] Sat Tinh: moi boss roll ngoc 6, ti le o roithem.txt (dong "sattinh"), moi thanh vien rieng';
const moi = s.slice(0, het + 1) + dong + eol + s.slice(het + 1);
console.log('chen sau byte', het, '| xuong dong', JSON.stringify(eol));
if (ghi) { fs.writeFileSync(F, moi, 'latin1'); console.log('DA GHI'); }
