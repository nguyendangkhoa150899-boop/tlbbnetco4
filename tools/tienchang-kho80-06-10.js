// 06/10 tối: SỬA LẠI tools/tienchang-kho-06-10.js - engine KHÔNG có rương 5.
// Dịch ngược đầy đủ LuaFnEnableBankRentIndex (Server 0x8253254): chỉ số 2: <=20 -> 40 | 3: <=40 -> 60 | 4: <=60 -> 80 | 5: <=80 -> 60 (!!)
// (lỗi sẵn trong binary: nhánh 5 push 0x3c thay vì 0x64). Mua rương 5 làm kho CO từ 80 về 60 -> rương 4 biến mất, bắt mua lại.
// -> tắt lại mức 80->100 (tối đa 80 ô), câu báo "100 ô" -> "80 ô". Lua. node tools/tienchang-kho80-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/obj/luoyang/oluoyang_qianzhuang.lua');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const lua = (t) => [...t.normalize('NFC')].map((ch) => { const c = ch.charCodeAt(0); if (c < 128) return ch; return '\\' + vis[ch]; }).join('');
const ghi = process.argv.includes('--ghi');
let s = fs.readFileSync(F, 'latin1');
const doi = [
  ['\t\t\t{Capacity=60,Cost=200000},   -- [NetCo4 06/10] mo lai (goc bi comment)', '\t\t\t{Capacity=60,Cost=200000}    -- [NetCo4 06/10] mo lai (goc bi comment): 60 -> 80 o'],
  ['\t\t\t{Capacity=80,Cost=400000}    -- [NetCo4 06/10] mo lai; engine toi da chi so 5 = 100 o', '\t\t\t--{Capacity=80,Cost=400000}  -- [NetCo4 06/10] TAT: engine EnableBankRentIndex(5) dat kho = 60 (loi binary) -> mat ruong 4. Toi da 80 o'],
];
for (const [a, b] of doi) { if (s.split(a).length !== 2) { console.error('LOI: khong thay: ' + a); process.exit(1); } s = s.replace(a, b); }
const cu = lua('Kho của các hạ đã mở tối đa (100 ô), không thể mua thêm rương.'), moi = lua('Kho của các hạ đã mở tối đa (80 ô), không thể mua thêm rương.');
if (s.split(cu).length !== 3) { console.error('LOI: mong 2 cau bao 100 o'); process.exit(1); }
s = s.split(cu).join(moi);
s = s.split('-- [NetCo4 06/10] da toi da 100 o:').join('-- [NetCo4 06/10] da toi da 80 o:');
console.log('ok');
if (ghi) { fs.writeFileSync(F, s, 'latin1'); console.log('DA GHI'); }
