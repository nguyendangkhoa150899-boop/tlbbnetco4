// 05/10: túi đồ boss cho Túc Cầu (efuben_cuju 402040, boss cuối Tôn Mỹ Mỹ 3720-3729 / 33720-33729).
//  - roimap.lua (ASCII, LF): thêm ID vào x950001_TB_g_Boss
//  - efuben_cuju.lua (CRLF, có byte VISCII/GBK): dòng đầu x402040_OnDie gọi TB_Ghi (boss là quái DUY NHẤT tạo bằng script 402040)
// Bot: tuiboss.js HD.tuccau + gan('tuccau', ...). node tools/phieu-boss/tui-tuccau-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '../../server/Public/Data/Script/');
const ghi = process.argv.includes('--ghi');
const loi = m => { console.error('LOI: ' + m); process.exit(1); };
const ids = []; for (let i = 3720; i <= 3729; i++) ids.push(i); for (let i = 33720; i <= 33729; i++) ids.push(i);

// roimap.lua
const fR = S + 'NetCo4/roimap.lua';
let r = fs.readFileSync(fR, 'latin1');
if (r.includes('3720, 3721')) loi('roimap da co Tuc Cau');
const moc = r.split('\n').findIndex(l => l.startsWith('x950001_TB_Them( { 12138,'));
if (moc < 0) loi('khong thay dong Lau Lan Tam Bao');
const Lr = r.split('\n');
Lr.splice(moc + 1, 0, `x950001_TB_Them( { ${ids.join(', ')} } )  -- [05/10] Tuc Cau: Ton My My (boss cuoi efuben_cuju 402040, OnDie goi TB_Ghi)`);
const r2 = Lr.join('\n');

// efuben_cuju.lua
const fC = S + 'event/fuben/efuben_cuju.lua';
const c = fs.readFileSync(fC, 'latin1');
const Lc = c.split('\r\n');
const iDie = Lc.findIndex(l => l.startsWith('function x402040_OnDie(sceneId, objId, killerId)'));
if (iDie < 0) loi('khong thay x402040_OnDie');
if (Lc[iDie + 1].includes('TB_Ghi')) loi('da co TB_Ghi');
Lc.splice(iDie + 1, 0, '\tCallScriptFunction( 950001, "TB_Ghi", sceneId, objId, killerId )   -- [NetCo4 05/10] tui do boss Tuc Cau (roimap.lua, chi ghi khi ID co trong danh sach)');
const c2 = Lc.join('\r\n');
console.log('roimap: them dong sau dong', moc + 1, '| efuben_cuju: them dong', iDie + 2);
if (ghi) { fs.writeFileSync(fR, r2, 'latin1'); fs.writeFileSync(fC, c2, 'latin1'); console.log('DA GHI'); }
