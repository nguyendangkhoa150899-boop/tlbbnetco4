// 07/10 (chủ server): ĐỘI BOT 6 "người giả" - thử ở VÔ LƯỢNG SƠN (wuliang_monster.ini, scene 6/73/74; lúc đầu định Hậu Hoa Viên newbie_2): 1 Nga My + 2 Cái Bang + 1 Tiêu Dao + 2 Thiếu Lâm.
// Là quái (MonsterAttrExTable) đội tên người, đứng 1 cụm, đánh người chơi tới gần, gọi nhau; Nga My hồi máu đồng đội qua Lua AI
// (NetCo4/botdoi.lua, 950002, kiểu ai_hadaba.lua). Không exp, không rơi đồ (ID không có trong MonsterDropBoxs), chết 3 phút mọc lại (ini).
// Sinh ra / sửa: 6 dòng MonsterAttrExTable 64601-64606 (chèn sau 64563, giữ thứ tự tăng), 6 điểm trong Public/Scene/<INI> (đổi hằng INI + GOC để dời đội; ini cũ được dọn),
// đăng ký Script.dat 950002 + AIScript.dat 346-349, viết 4 file .ai. Chạy lại = cập nhật dòng/điểm (idempotent).
// Chỉ số là ƯỚC LƯỢNG (chưa có số đo người chơi) -> chỉnh trong bảng BOT rồi chạy lại; trong game GM gõ !!RELOADMONSTERATTR (không cần restart).
// Lần đầu CẦN restart (ini + .ai + Script.dat). node tools/botdoi-07-10.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..', 'server');
const ghi = process.argv.includes('--ghi');
const VM = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const viscii = (s) => [...s].map((c) => { const b = c.charCodeAt(0); if (b < 128) return c; if (!(c in VM)) throw new Error('VISCII thieu ky tu ' + c); return String.fromCharCode(VM[c]); }).join('');

// ---- đội bot: tên hiển thị, phái, mẫu ngoại hình lấy từ quái "donor" (cột 44-50), file AI, chỉ số ----
//  Mẫu: 9546 Lý Thu Thủy (nữ), 13456 Ngô Dụng, 13537 Võ Tòng, 13465 Lộ Quân Dật, 11539 Hòa thượng, 13483 Quan Thắng.
//  hp / vlck / mpck / vlpn / ptpn / trung / ne / hieuy  (cột 19 / 15 / 17 / 16 / 18 / 23 / 24 / 25-26)
const BOT = [
  { id: 64601, ten: 'Chu Chỉ Nhược', phai: 'Nga My', donor: 9546, gioi: 1, ai: 349, x: 0, z: 0, hp: 240000, vlck: 6000, mpck: 26000, vlpn: 16000, ptpn: 20000, trung: 11000, ne: 2400, hieuy: 150 },
  { id: 64602, ten: 'Kiều Phong', phai: 'Cái Bang', donor: 13456, gioi: 0, ai: 347, x: 2, z: -1.5, hp: 300000, vlck: 36000, mpck: 6000, vlpn: 20000, ptpn: 14000, trung: 12000, ne: 2800, hieuy: 300 },
  { id: 64603, ten: 'Hồng Thất Công', phai: 'Cái Bang', donor: 13537, gioi: 0, ai: 347, x: -2, z: -1.5, hp: 300000, vlck: 36000, mpck: 6000, vlpn: 20000, ptpn: 14000, trung: 12000, ne: 2800, hieuy: 300 },
  { id: 64604, ten: 'Vô Nhai Tử', phai: 'Tiêu Dao', donor: 13465, gioi: 0, ai: 348, x: 0, z: 2, hp: 220000, vlck: 6000, mpck: 36000, vlpn: 14000, ptpn: 20000, trung: 11500, ne: 2600, hieuy: 250 },
  { id: 64605, ten: 'Huyền Từ', phai: 'Thiếu Lâm', donor: 11539, gioi: 0, ai: 346, x: 3, z: 1, hp: 380000, vlck: 28000, mpck: 6000, vlpn: 30000, ptpn: 22000, trung: 11000, ne: 2200, hieuy: 150 },
  { id: 64606, ten: 'Huyền Khổ', phai: 'Thiếu Lâm', donor: 13483, gioi: 0, ai: 346, x: -3, z: 1, hp: 380000, vlck: 28000, mpck: 6000, vlpn: 30000, ptpn: 22000, trung: 11000, ne: 2200, hieuy: 150 },
];
const CAP = 89, MP = 60000, BASE_AI = 21 /* chủ động, không đi lung tung, quét 10m, đuổi 60m, có Lua, gọi đồng bọn */, SCRIPT = 950002;
const HOI_SINH_MS = 180000, GROUP = 9502, TEMPLATE = '13465', SAU = '64563';
const INI = 'wuliang_monster.ini', GOC = { x: 176, z: 172 };   // vị trí đội = GOC + lệch (x, z) của từng bot; dời đội: đổi 2 hằng này
const INI_CU = ['newbie_2_monster.ini'];   // ini từng chứa bot -> dọn sạch khối bot

// ---- 4 file .ai: skill = ID SkillData bậc 12 (tâm pháp 12), như các .ai gốc dùng thẳng ID SkillData ----
const S = (id, pct, pri) => `if(AIS_GetAIState()=SATTACK&AIS_Rand()<${pct}&AIS_IsCanSkill(${id})=1){AIS_ToSkill(${id});AIS_SetTimes(-1);AIS_SetPRI(${pri});};`;
const AI = {
  346: { ten: 'Thieu Lam', dong: [S(292, 60, 33), S(316, 35, 34), S(460, 25, 34), S(496, 30, 35), S(304, 20, 36), S(340, 15, 37)] },   // Phục Hổ Quyền, Đại Lực Kim Cương Chưởng, Nhất Phách Lưỡng Tán, Như Lai Thần Chưởng, Kim Cương Phục Ma Khuyên (AoE), Niêm Hoa Chỉ (tán công)
  347: { ten: 'Cai Bang', dong: [S(1012, 60, 33), S(1036, 35, 34), S(1084, 30, 35), S(1216, 30, 35), S(1060, 25, 34), S(1180, 25, 34), S(1024, 20, 36), S(1288, 20, 36)] },   // Bàn Long Kích, Xung Trận Trảm Tướng, Phi Long Tại Thiên, Kháng Long Hữu Hối, Tuyết Nê Hồng Trảo, Chấn Kinh Bách Lý, Thiên Lý Hoành Hành (AoE), Bổng Đả Cẩu Đầu
  348: { ten: 'Tieu Dao', dong: [S(3172, 60, 33), S(3196, 35, 34), S(3316, 30, 35), S(3340, 30, 35), S(3376, 25, 34), S(3412, 25, 34), S(3400, 20, 36), S(3220, 20, 37), S(3464, 15, 38)] },   // Lạc Anh Kiếm, Đàn Chỉ Thần Công, Tiêu Tương Dạ Vũ, Khê Sơn Hành Lữ, Bài Sơn Đảo Hải, Côn Dược Bắc Minh, Kinh Đào Hãi Lãng (AoE), Họa Địa Vi Lao (vây), Tử Vụ Nhiễu Tâm (khống chế)
  349: { ten: 'Nga My', dong: [S(1732, 60, 33), S(1756, 35, 34), S(1768, 30, 35), S(1972, 30, 35), S(1780, 20, 36), 'if(AIS_GetHP()<40&AIS_IsCanSkill(2008)=1){AIS_ToSkill(2008);AIS_SetTimes(-1);AIS_SetPRI(50);};'] },   // Điêu Thuyền Bái Nguyệt, Tây Tử Phủng Tâm, Kim Đỉnh Miên Chưởng, Cửu Âm Thần Trảo, Nguyệt Lạc Tây Sơn (AoE); <40% máu tự Thanh Tâm Phổ Thiện Chú (hồi đồng đội do Lua)
};
const aiText = (n) => ['; NetCo4 07/10: bot doi Hau Hoa Vien - ' + AI[n].ten + ' (ID SkillData bac 12). Hoi mau dong doi: NetCo4/botdoi.lua', '[common]', '[commonend]', '[skill]',
  '0:if(AIS_IsCanSkill(0)=1){AIS_ToSkill(0);AIS_SetTimes(-1);AIS_SetPRI(30);};', ...AI[n].dong.map((d, i) => (i + 1) + ':' + d), '[skillend]', '[beskill]', '[beskillend]', '[damage]', '[damageend]', '[dead]', '[deadend]', ''].join('\r\n');

const cnt = (s, re) => (s.match(re) || []).length;
const doi = [];
function luu(f, cu, moi) { if (cu === moi) return; doi.push(path.relative(R, f) + ' (' + cnt(cu, /\n/g) + ' -> ' + cnt(moi, /\n/g) + ' dong)'); if (ghi) fs.writeFileSync(f, moi, 'latin1'); }

// 1) MonsterAttrExTable
{
  const F = path.join(R, 'Public/Config/MonsterAttrExTable.txt');
  const raw = fs.readFileSync(F, 'latin1'); const L = raw.split('\n');
  const tim = (id) => L.findIndex((l) => l.startsWith(id + '\t'));
  const tpl = L[tim(TEMPLATE)]; if (!tpl) throw new Error('khong thay dong mau ' + TEMPLATE);
  const cr = tpl.endsWith('\r');
  const dongCua = (b) => {
    const c = (cr ? tpl.slice(0, -1) : tpl).split('\t');
    const d = L[tim(b.donor)]; if (!d) throw new Error('khong thay donor ' + b.donor);
    const dc = d.replace(/\r$/, '').split('\t');
    c[0] = String(b.id); c[1] = viscii(b.ten); c[2] = String(b.gioi); c[3] = String(CAP); c[4] = '0'; c[7] = String(BASE_AI); c[8] = '-1'; c[9] = '9'; c[14] = '0';
    c[15] = String(b.vlck); c[16] = String(b.vlpn); c[17] = String(b.mpck); c[18] = String(b.ptpn); c[19] = String(b.hp); c[20] = String(MP); c[21] = '0'; c[22] = '0';
    c[23] = String(b.trung); c[24] = String(b.ne); c[25] = String(b.hieuy); c[26] = String(b.hieuy); c[27] = '3500'; c[28] = '800';
    for (let k = 44; k <= 50; k++) c[k] = dc[k];   // ngoại hình, hiện tên, hướng, cao tên, cỡ chọn, bóng, chân dung
    c[53] = String(CAP); c[54] = '0'; c[55] = String(b.vlck); c[56] = String(b.vlpn); c[57] = String(b.mpck); c[58] = String(b.ptpn); c[59] = String(b.hp);
    c[60] = '0'; c[61] = '28'; c[62] = '10'; c[63] = '0'; c[65] = '2'; c[66] = '1';
    return c.join('\t') + (cr ? '\r' : '');
  };
  const rows = BOT.map(dongCua);
  const co = BOT.map((b) => tim(b.id));
  if (co.every((i) => i >= 0)) { co.forEach((i, k) => { L[i] = rows[k]; }); }
  else if (co.every((i) => i < 0)) { const i = tim(SAU); if (i < 0) throw new Error('khong thay ' + SAU); const sau = L[i + 1].split('\t')[0]; if (/^\d+$/.test(sau) && +sau < 64606) throw new Error('dong sau ' + SAU + ' la ' + sau); L.splice(i + 1, 0, ...rows); }
  else throw new Error('bang dang co 1 phan bot - kiem tay');
  for (const b of BOT) console.log(b.id, b.ten, '|', b.phai, '| HP', b.hp, 'VLCK', b.vlck, 'MPCK', b.mpck, 'VLPN', b.vlpn, 'PTPN', b.ptpn, '| mau', L[tim(b.id)].split('\t')[44]);
  const out = L.join('\n');
  const dem = (s) => cnt(s, /[\x80-\xff]/g);
  console.log('MonsterAttrExTable byte>127', dem(raw), '->', dem(out), '(them', dem(out) - dem(raw), 'cua ten VISCII) CR', cnt(raw, /\r/g), '->', cnt(out, /\r/g));
  luu(F, raw, out);
}
// 2) ini bản đồ: dọn khối bot khỏi ini cũ, rồi ghi vào INI
const reBot = (nl) => new RegExp('(' + nl + ')?\\[monster\\d+\\]' + nl + 'guid=950002\\d+' + nl + '(?:(?!\\[monster)[^\\n]*' + nl + ')*', 'g');
for (const ten of INI_CU) {
  const F = path.join(R, 'Public/Scene/' + ten); if (!fs.existsSync(F)) continue;
  const raw = fs.readFileSync(F, 'latin1'); const nl = raw.includes('\r\n') ? '\r\n' : '\n';
  let t2 = raw.replace(reBot(nl), ''); if (t2 === raw) continue;
  t2 = t2.replace(/\s*$/, '') + nl; const dem = (t2.match(/^\[monster\d+\]/gm) || []).length; t2 = t2.replace(/monstercount=\d+/, 'monstercount=' + dem);
  console.log('don bot khoi ' + ten + ' -> monstercount=' + dem); luu(F, raw, t2);
}
{
  const F = path.join(R, 'Public/Scene/' + INI);
  const raw = fs.readFileSync(F, 'latin1'); const nl = raw.includes('\r\n') ? '\r\n' : '\n';
  let t = raw;
  const khoi = (b, k) => ['[monster' + k + ']', 'guid=' + (95000200 + k - 71), 'type=' + b.id, 'name=', 'title=', 'pos_x=' + (GOC.x + b.x), 'pos_z=' + (GOC.z + b.z), 'dir=27', 'script_id=' + SCRIPT, 'respawn_time=' + HOI_SINH_MS,
    'group_id=' + GROUP, 'team_id=' + GROUP, 'base_ai=' + BASE_AI, 'ai_file=' + b.ai, 'patrol_id=-1', 'shop0=-1', 'shop1=-1', 'shop2=-1', 'shop3=-1', 'ReputationID=-1', ''].join(nl);
  // bỏ khối bot cũ (nếu có) rồi nối lại từ đầu -> chạy lại là cập nhật
  t = t.replace(reBot(nl), '');
  t = t.replace(/\s*$/, '') + nl;
  const dem0 = (t.match(/^\[monster\d+\]/gm) || []).length;
  const blocks = BOT.map((b, i) => khoi(b, dem0 + i)).join(nl);
  t = t + nl + blocks;
  t = t.replace(/monstercount=\d+/, 'monstercount=' + (dem0 + BOT.length));
  if ((t.match(/^\[monster\d+\]/gm) || []).length !== dem0 + BOT.length) throw new Error('dem khoi ini sai');
  console.log('ini: ' + dem0 + ' diem co san + ' + BOT.length + ' bot, monstercount=' + (dem0 + BOT.length) + ', doi quanh (' + GOC.x + ', ' + GOC.z + ') trong ' + INI);
  luu(F, raw, t);
}
// 3) Script.dat + AIScript.dat
{
  const F = path.join(R, 'Public/Data/Script.dat'); const raw = fs.readFileSync(F, 'latin1');
  const dong = SCRIPT + '=\\NetCo4\\botdoi.lua';
  if (!raw.includes(dong)) luu(F, raw, raw.replace(/\s*$/, '') + '\r\n' + dong + '\r\n'); else console.log('Script.dat da co ' + SCRIPT);
  const F2 = path.join(R, 'Public/Data/AIScript.dat'); const raw2 = fs.readFileSync(F2, 'latin1');
  let t2 = raw2.replace(/\s*$/, '') + '\r\n';
  for (const n of Object.keys(AI)) { const d = n + '=script' + n + '.ai =NetCo4 bot ' + AI[n].ten; if (!raw2.includes(n + '=script' + n + '.ai')) t2 += d + '\r\n'; }
  if (t2 !== raw2) luu(F2, raw2, t2); else console.log('AIScript.dat da co 346-349');
}
// 4) .ai
for (const n of Object.keys(AI)) {
  const F = path.join(R, 'Public/Data/AIScript/script' + n + '.ai');
  const cu = fs.existsSync(F) ? fs.readFileSync(F, 'latin1') : '';
  if (cu && !cu.includes('NetCo4 07/10: bot doi')) throw new Error('script' + n + '.ai da ton tai va KHONG phai cua bot');
  luu(F, cu, aiText(n));
}
console.log(doi.length ? (ghi ? 'DA GHI:\n  ' : 'SE DOI:\n  ') + doi.join('\n  ') : 'khong co gi doi');
if (!fs.existsSync(path.join(R, 'Public/Data/Script/NetCo4/botdoi.lua'))) console.log('CHU Y: chua co NetCo4/botdoi.lua');
