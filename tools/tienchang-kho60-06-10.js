// 06/10 22:3x: KHO TOI DA 60 O (nhu ban goc). Rương 4 (ô 61-80) KHÔNG dùng được: bialk 1010100017 kéo đồ vào rương 4 bị đá
// (Player_AtServer::onExecutePacketException 21:56:01, đăng nhập lại vẫn bị 22:30:19) -> engine thật sự chỉ chịu 60 ô; bản gốc tắt mức 80 là có lý do.
// 1) oluoyang_qianzhuang.lua: tắt mức 60->80, câu "tối đa 80 ô" -> "60 ô".
// 2) Trước MỌI BankBegin (NPC Lạc Dương, Tô Châu, 3 file shengjjll mở kho từ xa): kho > 60 -> EnableBankRentIndex(5)
//    (engine: chỉ số 5 + kho <= 80 -> đặt kho = 60, lỗi engine dùng làm lệnh thu kho) + báo. Rương 4 chưa từng cất được món nào.
// Byte-level latin1, giữ xuống dòng từng dòng. Lua. node tools/tienchang-kho60-06-10.js [--ghi]
const fs = require('fs'), path = require('path');
const S = path.join(__dirname, '../server/Public/Data/Script/');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const lua = (t) => [...t.normalize('NFC')].map((ch) => { const c = ch.charCodeAt(0); if (c < 128) return ch; if (vis[ch] === undefined) throw new Error('VISCII: ' + ch); return '\\' + vis[ch]; }).join('');
const ghi = process.argv.includes('--ghi');
const MSG = lua('Rương thứ 4 bị lỗi engine, kho đã trở về 60 ô (đồ không mất). Liên hệ admin để được hoàn tiền rương 4.');
const GUARD = 'if GetBankRentIndex(sceneId, selfId) > 60 then EnableBankRentIndex(sceneId, selfId, 5) BeginEvent(sceneId) AddText(sceneId, "' + MSG + '") EndEvent(sceneId) DispatchMissionTips(sceneId, selfId) end   -- [NetCo4 06/10] kho toi da 60: thu ruong 4 (o 61-80 lam server da nguoi choi)';
const sua = {};
const doc = (f) => (sua[f] = sua[f] || fs.readFileSync(S + f, 'latin1'));
// 1) bảng mua rương
const Q = 'obj/luoyang/oluoyang_qianzhuang.lua';
let q = doc(Q);
const thay = (a, b) => { if (q.split(a).length !== 2) { console.error('LOI: ' + a); process.exit(1); } q = q.replace(a, b); };
thay('\t\t\t{Capacity=40,Cost=100000},', '\t\t\t{Capacity=40,Cost=100000}');
thay('\t\t\t{Capacity=60,Cost=200000}    -- [NetCo4 06/10] mo lai (goc bi comment): 60 -> 80 o', '\t\t\t--{Capacity=60,Cost=200000}  -- [NetCo4 06/10] TAT LAI: o 61-80 lam server da nguoi choi (engine chi chiu 60 o)');
const c80 = lua('Kho của các hạ đã mở tối đa (80 ô), không thể mua thêm rương.'), c60 = lua('Kho của các hạ đã mở tối đa (60 ô), không thể mua thêm rương.');
if (q.split(c80).length !== 3) { console.error('LOI: cau 80 o'); process.exit(1); }
q = q.split(c80).join(c60).split('-- [NetCo4 06/10] da toi da 80 o:').join('-- [NetCo4 06/10] da toi da 60 o:');
sua[Q] = q;
// 2) chèn guard trước mọi dòng BankBegin(
let n = 0;
for (const f of [Q, 'obj/suzhou/osuzhou_bank.lua', 'event/prize/1shengjjll.lua', 'event/prize/9shengjjll.lua', 'event/prize/shengjjll.lua']) {
  const L = doc(f).split('\n');
  for (let i = L.length - 1; i >= 0; i--) {
    if (!/BankBegin\(/.test(L[i]) || /^\s*--/.test(L[i])) continue;
    const thut = L[i].match(/^\s*/)[0], eol = L[i].endsWith('\r') ? '\r' : '';
    L.splice(i, 0, thut + GUARD + eol); n++;
  }
  sua[f] = L.join('\n');
}
console.log('chen guard', n, 'cho');
if (ghi) { for (const f of Object.keys(sua)) fs.writeFileSync(S + f, sua[f], 'latin1'); console.log('DA GHI', Object.keys(sua).length, 'file'); }
