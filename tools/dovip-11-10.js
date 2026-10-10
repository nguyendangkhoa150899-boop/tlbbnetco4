// 11/10 (chu server): EVENT DOI DO VIP o NPC doi Trung Lau (MyNew/doitrunglau2.lua 111998).
//  - Do THU (Mu / Ao / Bao tay / Giay / Dai / Ho kien): 1000 Mien Bo cap 8 (20501008) / mon.
//  - Do CONG (Nhan / Hang lien / Ho phu / Ho uyen): chon 1 thuoc tinh (Bang / Hoa / Huyen / Doc) = 1000 Bi Ngan cap 8 (20502008),
//    du 4 thuoc tinh = 2000 Bi Ngan. Moi bien the 1 ma rieng (dong thuoc tinh gan theo ma).
//  - Chi so CO DINH theo bang chu server (Do Cong VIP / Do Thu VIP / Hang Lien VIP / Y Phuc VIP), 9 sao (quy tac 9, khong rand):
//    he so cap 9 = x1.8 -> 300 thuoc tinh ra 301, 70 khang ra 71 (chu server chon "lech len"); moi dong khac dung y bang.
//  - 26 ma muon tu danh sach chi-GM (khong nguon, chua ai giu 11/10), doan gia tri rieng 4401-4426 (< 4501 cua Custom Trung Lau).
//  - Phat ra KHOA. Can cap-nhat + RESTART (EquipBase / ItemSegValue). Rollback: tag truoc-dovip-11-10.
//   node tools/dovip-11-10.js [--ghi]
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '..', 'server');
const GHI = process.argv.includes('--ghi'); let loi = 0;
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const enc = (s) => Buffer.from([...s].map((ch) => { const c = ch.charCodeAt(0); if (c < 128) return c; if (vis[ch] === undefined) throw new Error('VISCII thieu ' + ch); return vis[ch]; })).toString('latin1');
const doc = (f) => fs.readFileSync(path.join(R, f), 'latin1');
const ghi = (f, s) => { if (GHI && !loi) fs.writeFileSync(path.join(R, f), s, 'latin1'); };

// ---- chi so (enum dong k: EquipBase cot k+32, ItemSegValue cot k+1)
const SL = 0, BANG = 6, KBANG = 7, HOA = 9, KHOA = 10, HUYEN = 12, KHUYEN = 13, DOC = 15, KDOC = 16, NGCONG = 19, NGTHU = 22,
  NOICONG = 26, NOITHU = 29, CHXAC = 35, NE = 36, HOICONG = 37, CUONG = 42, NOILUC = 43, THE = 44, TRI = 45, THANPHAP = 46, KCM = 47, TCTT = 48;
const CONG = { [SL]: 18000, [NGCONG]: 3500, [NOICONG]: 3500, [CHXAC]: 2500, [CUONG]: 230, [NOILUC]: 230, [HOICONG]: 25, [THE]: 165, [TRI]: 165, [THANPHAP]: 105, [TCTT]: 60 };
const HL = { ...CONG, [NE]: 500 };
const THU = { [SL]: 18000, [NGTHU]: 3500, [NOITHU]: 3500, [NE]: 500, [CUONG]: 230, [NOILUC]: 230, [THE]: 165, [TRI]: 165, [THANPHAP]: 105, [KCM]: 25, [TCTT]: 60 };
const AO = { ...THU, [KBANG]: 70, [KHOA]: 70, [KHUYEN]: 70, [KDOC]: 70 };
const TT = [BANG, HOA, HUYEN, DOC];
const them = (a, ds) => { const o = { ...a }; for (const k of ds) o[k] = 300; return o; };
// bien the do cong: Bang, Hoa, Huyen, Doc, 4 thuoc tinh
const bt = (goc, ids) => ids.map((id, i) => ({ id, dong: them(goc, i < 4 ? [TT[i]] : TT) }));
const MON = [
  { id: '10410081', dong: THU }, { id: '10413082', dong: AO }, { id: '10412079', dong: THU }, { id: '10411087', dong: THU },
  { id: '10421077', dong: THU }, { id: '10420021', dong: THU },
  ...bt(CONG, ['10422120', '10422119', '10422118', '10422117', '10522000']),
  ...bt(HL, ['10420079', '10420078', '10420077', '10420076', '10420075']),
  ...bt(CONG, ['10423045', '10423044', '10423043', '10423042', '10523000']),
  ...bt(CONG, ['10414044', '10414043', '10414042', '10414041', '10514000']),
];
const CAP = 9, SEG0 = 4401;

// diem server (T <= 0 -> khong rand): ceil(float(V*Rate) * 0.01f)
const f01 = Math.fround(0.01);
const diem = (v, r) => Math.ceil(Math.fround(Math.fround(v * r) * f01));
// V cho ra dung x; khong duoc thi V nho nhat ra > x ("lech len")
function vCho(x, r) { let v = Math.max(1, Math.floor((x * 100) / r) - 2); while (diem(v, r) < x) v++; return v; }

// 1. EquipBase + ItemSegValue
{
  const rate = {}; for (const l of doc('Server/Config/ItemSegRate.txt').split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) rate[c[0]] = c.slice(1, 59).map(Number); }
  const rr = rate[String(CAP)];
  const fEB = 'Public/Config/EquipBase.txt', gocEB = doc(fEB), LE = gocEB.split('\n');
  const fSV = 'Public/Config/ItemSegValue.txt', gocSV = doc(fSV);
  const eolSV = gocSV.includes('\r\n') ? '\r\n' : '\n'; const LS = gocSV.split(eolSV);
  const sv = new Map(LS.map((l) => [l.split('\t')[0], l]));
  if ([...sv.keys()].some((k) => /^\d+$/.test(k) && +k >= SEG0)) { console.log('LOI: ItemSegValue da co doan >= ' + SEG0); loi++; }
  const moiSV = []; let n = 0; const bao = [];
  MON.forEach((m, i) => {
    const j = LE.findIndex((l) => l.startsWith(m.id + '\t')); if (j < 0) { console.log('LOI: khong co ' + m.id); loi++; return; }
    const cr = LE[j].endsWith('\r') ? '\r' : ''; const c = LE[j].replace(/\r$/, '').split('\t');
    const ks = Object.keys(m.dong).map(Number);
    if (ks.length > 16) { console.log('LOI: ' + m.id + ' qua 16 dong'); loi++; }
    const seg = String(SEG0 + i);
    const s = (sv.get(c[91]) || '').split('\t'); if (s.length < 59) { console.log('LOI: doan goc ' + c[91] + ' cua ' + m.id); loi++; return; }
    s[0] = seg; const ra = [];
    for (const k of ks) { const v = vCho(m.dong[k], rr[k]); s[k + 1] = String(v); const d = diem(v, rr[k]); if (d !== m.dong[k]) ra.push(k + ':' + m.dong[k] + '->' + d); }
    for (let k = 0; k < 58; k++) c[k + 32] = ks.includes(k) ? '1' : '-1';
    c[90] = String(CAP); c[91] = seg; c[92] = c[93] = String(ks.length); c[100] = '-1';
    LE[j] = c.join('\t') + cr; moiSV.push(s.join('\t')); n++;
    bao.push(m.id + ' doan ' + seg + ' ' + ks.length + ' dong' + (ra.length ? ' (lech: ' + ra.join(', ') + ')' : ''));
  });
  // chen doan moi ngay sau dong du lieu cuoi (4400)
  let cuoi = LS.length; while (cuoi > 0 && !/^\d+\t/.test(LS[cuoi - 1])) cuoi--;
  LS.splice(cuoi, 0, ...moiSV);
  console.log('EquipBase: ' + n + ' ma'); bao.forEach((b) => console.log('  ' + b));
  ghi(fEB, LE.join('\n')); ghi(fSV, LS.join(eolSV));
}

// 2. NPC doi Trung Lau: menu Doi Do VIP
{
  const f = 'Public/Data/Script/MyNew/doitrunglau2.lua'; const goc = doc(f); let s = goc;
  const N = goc.includes('\r\n') ? '\r\n' : '\n';
  const thay = (cu, moi, ten) => { const k = s.split(cu).length - 1; if (k !== 1) { console.log('LOI NPC ' + ten + ': neo ' + k + ' lan'); loi++; return; } s = s.replace(cu, () => moi); };
  const T = (x) => enc(x);
  // a. muc menu chinh (truoc "Roi di")
  thay('\t \t AddNumText(  sceneId,  x111998_g_ScriptId,  " R' + enc('ời đi') + '",  0,  0  )',
    '\t \t AddNumText(  sceneId,  x111998_g_ScriptId,  "#cFF0000 ' + T('Đổi Đồ VIP') + '",  6,  20000  )   -- [NetCo4 11/10] event doi do VIP' + N +
    '\t \t AddNumText(  sceneId,  x111998_g_ScriptId,  " R' + enc('ời đi') + '",  0,  0  )', 'menu');
  // b. OnEventRequest: menu VIP (so 20000-20999) truoc moi nhanh cu
  thay('\t local  nNumText  =  GetNumText()' + N,
    '\t local  nNumText  =  GetNumText()' + N +
    '\t if nNumText >= 20000 and nNumText < 21000 then   -- [NetCo4 11/10] event doi do VIP' + N +
    '\t \t x111998_VipMenu( sceneId, selfId, targetId, nNumText )' + N +
    '\t \t return' + N +
    '\t end' + N, 'event');
  // c. OnMissionSubmit: ma VIP -> nop doi
  thay('function  x111998_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )' + N,
    'function  x111998_OnMissionSubmit(  sceneId,  selfId,  targetId,  missionScriptId,  selectRadioId  )' + N +
    '\t if x111998_VipNop( sceneId, selfId, selectRadioId ) == 1 then   -- [NetCo4 11/10] event doi do VIP' + N +
    '\t \t return' + N +
    '\t end' + N, 'submit');
  // d. bang + ham VIP o cuoi file
  const q = (x) => '"' + T(x) + '"';
  const L = [
    '',
    '--**********************************',
    '-- [NetCo4 11/10] EVENT DOI DO VIP (tools/dovip-11-10.js). Chi so co dinh trong EquipBase / ItemSegValue (doan 4401-4426).',
    '-- Thu: 1000 Mien Bo cap 8 (20501008). Cong: 1 thuoc tinh = 1000 Bi Ngan cap 8 (20502008), 4 thuoc tinh = 2000. Phat ra KHOA.',
    '-- Menu: 20000 danh sach o -> 20100+i (thu i) | 20200+j (cong j -> chon thuoc tinh) -> 20300+j*10+e -> bang Tra (OnMissionSubmit).',
    '--**********************************',
    'x111998_g_VipMienBo = 20501008',
    'x111998_g_VipBiNgan = 20502008',
    'x111998_g_VipThu = {',
    '\t{ o = ' + q('Mũ') + ', id = 10410081 }, { o = ' + q('Áo') + ', id = 10413082 }, { o = ' + q('Bao Tay') + ', id = 10412079 },',
    '\t{ o = ' + q('Giày') + ', id = 10411087 }, { o = ' + q('Đai') + ', id = 10421077 }, { o = ' + q('Hộ Kiên') + ', id = 10420021 },',
    '}',
    '-- moi o cong: Bang, Hoa, Huyen, Doc, 4 thuoc tinh',
    'x111998_g_VipCong = {',
    '\t{ o = ' + q('Nhẫn') + ', ids = { 10422120, 10422119, 10422118, 10422117, 10522000 } },',
    '\t{ o = ' + q('Hạng Liên') + ', ids = { 10420079, 10420078, 10420077, 10420076, 10420075 } },',
    '\t{ o = ' + q('Hộ Phù') + ', ids = { 10423045, 10423044, 10423043, 10423042, 10523000 } },',
    '\t{ o = ' + q('Hộ Uyển') + ', ids = { 10414044, 10414043, 10414042, 10414041, 10514000 } },',
    '}',
    'x111998_g_VipTT = { ' + q('Băng Công') + ', ' + q('Hỏa Công') + ', ' + q('Huyền Công') + ', ' + q('Độc Công') + ', ' + q('Đủ 4 Thuộc Tính') + ' }',
    '',
    'function x111998_VipTip( sceneId, selfId, str )',
    '\tBeginEvent( sceneId )',
    '\t\tAddText( sceneId, str )',
    '\tEndEvent( sceneId )',
    '\tDispatchMissionTips( sceneId, selfId )',
    'end',
    '',
    '-- ma VIP -> nguyen lieu, so luong, ten (nil neu khong phai ma VIP)',
    'function x111998_VipGia( id )',
    '\tfor i, v in x111998_g_VipThu do',
    '\t\tif v.id == id then',
    '\t\t\treturn x111998_g_VipMienBo, 1000, ' + q('Miên Bố cấp 8') + '',
    '\t\tend',
    '\tend',
    '\tfor i, v in x111998_g_VipCong do',
    '\t\tfor e = 1, 5 do',
    '\t\t\tif v.ids[e] == id then',
    '\t\t\t\tif e == 5 then',
    '\t\t\t\t\treturn x111998_g_VipBiNgan, 2000, ' + q('Bí Ngân cấp 8') + '',
    '\t\t\t\tend',
    '\t\t\t\treturn x111998_g_VipBiNgan, 1000, ' + q('Bí Ngân cấp 8') + '',
    '\t\t\tend',
    '\t\tend',
    '\tend',
    '\treturn nil, 0, ""',
    'end',
    '',
    '-- bang Tra: hien mon + gia',
    'function x111998_VipBang( sceneId, selfId, targetId, id, tieude )',
    '\tlocal nl, sl, ten = x111998_VipGia( id )',
    '\tBeginEvent( sceneId )',
    '\t\tAddText( sceneId, "#Y" .. tieude )',
    '\t\tAddText( sceneId, ' + q('Đổi món này cần #Y') + ' .. sl .. " " .. ten .. ' + q('#W. Chỉ số cố định 9 sao, đổi ra là khóa.') + ' )',
    '\t\tAddRadioItemBonus( sceneId, id, 4 )',
    '\tEndEvent( sceneId )',
    '\tDispatchMissionContinueInfo( sceneId, selfId, targetId, x111998_g_ScriptId, 0 )',
    'end',
    '',
    'function x111998_VipMenu( sceneId, selfId, targetId, n )',
    '\tif n == 20000 then',
    '\t\tBeginEvent( sceneId )',
    '\t\t\tAddText( sceneId, ' + q('    Đồ VIP chỉ số cố định 9 sao. #YĐồ thủ#W: 1000 Miên Bố cấp 8. #YĐồ công#W: chọn 1 thuộc tính = 1000 Bí Ngân cấp 8, đủ 4 thuộc tính = 2000 Bí Ngân cấp 8.') + ' )',
    '\t\t\tfor i, v in x111998_g_VipThu do',
    '\t\t\t\tAddNumText( sceneId, x111998_g_ScriptId, ' + q('#G[Thủ] ') + ' .. v.o .. " VIP", 6, 20100 + i )',
    '\t\t\tend',
    '\t\t\tfor j, v in x111998_g_VipCong do',
    '\t\t\t\tAddNumText( sceneId, x111998_g_ScriptId, ' + q('#cFF0000[Công] ') + ' .. v.o .. " VIP", 6, 20200 + j )',
    '\t\t\tend',
    '\t\t\tAddNumText( sceneId, x111998_g_ScriptId, ' + q(' Rời Đi') + ', 0, 0 )',
    '\t\tEndEvent( sceneId )',
    '\t\tDispatchEventList( sceneId, selfId, targetId )',
    '\t\treturn',
    '\tend',
    '\tif n > 20100 and n <= 20100 + getn( x111998_g_VipThu ) then',
    '\t\tlocal v = x111998_g_VipThu[ n - 20100 ]',
    '\t\tx111998_VipBang( sceneId, selfId, targetId, v.id, v.o .. " VIP" )',
    '\t\treturn',
    '\tend',
    '\tif n > 20200 and n <= 20200 + getn( x111998_g_VipCong ) then',
    '\t\tlocal j = n - 20200',
    '\t\tlocal v = x111998_g_VipCong[ j ]',
    '\t\tBeginEvent( sceneId )',
    '\t\t\tAddText( sceneId, "#Y" .. v.o .. ' + q(' VIP#W: chọn thuộc tính (1 thuộc tính = 1000 Bí Ngân cấp 8, đủ 4 = 2000).') + ' )',
    '\t\t\tfor e = 1, 5 do',
    '\t\t\t\tAddNumText( sceneId, x111998_g_ScriptId, "#G" .. x111998_g_VipTT[ e ], 6, 20300 + j * 10 + e )',
    '\t\t\tend',
    '\t\t\tAddNumText( sceneId, x111998_g_ScriptId, ' + q(' Trở về') + ', 6, 20000 )',
    '\t\tEndEvent( sceneId )',
    '\t\tDispatchEventList( sceneId, selfId, targetId )',
    '\t\treturn',
    '\tend',
    '\tif n > 20300 and n < 20400 then',
    '\t\tlocal j = floor( ( n - 20300 ) / 10 )',
    '\t\tlocal e = mod( n - 20300, 10 )',
    '\t\tlocal v = x111998_g_VipCong[ j ]',
    '\t\tif v ~= nil and e >= 1 and e <= 5 then',
    '\t\t\tx111998_VipBang( sceneId, selfId, targetId, v.ids[ e ], v.o .. " VIP - " .. x111998_g_VipTT[ e ] )',
    '\t\tend',
    '\t\treturn',
    '\tend',
    'end',
    '',
    '-- bam Tra: 1 = da xu ly (ma VIP), 0 = khong phai ma VIP',
    'function x111998_VipNop( sceneId, selfId, id )',
    '\tlocal nl, sl, ten = x111998_VipGia( id )',
    '\tif nl == nil then',
    '\t\treturn 0',
    '\tend',
    '\tif LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then',
    '\t\tx111998_VipTip( sceneId, selfId, ' + q('Túi đạo cụ cần ít nhất 1 ô trống') + ' )',
    '\t\treturn 1',
    '\tend',
    '\tif LuaFnGetAvailableItemCount( sceneId, selfId, nl ) < sl then',
    '\t\tx111998_VipTip( sceneId, selfId, ' + q('Không đủ ') + ' .. sl .. " " .. ten )',
    '\t\treturn 1',
    '\tend',
    '\tlocal pos = TryRecieveItem( sceneId, selfId, id, 1 )',
    '\tif pos == nil or pos < 0 then',
    '\t\tx111998_VipTip( sceneId, selfId, ' + q('Túi đầy, không nhận được đồ') + ' )',
    '\t\treturn 1',
    '\tend',
    '\tif LuaFnDelAvailableItem( sceneId, selfId, nl, sl ) ~= 1 then',
    '\t\tLuaFnEraseItem( sceneId, selfId, pos )',
    '\t\tx111998_VipTip( sceneId, selfId, ' + q('Trừ nguyên liệu thất bại, chưa đổi') + ' )',
    '\t\treturn 1',
    '\tend',
    '\tLuaFnItemBind( sceneId, selfId, pos )',
    '\tx111998_VipTip( sceneId, selfId, ' + q('Đổi đồ VIP thành công') + ' )',
    '\tLuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 148, 0 )',
    '\treturn 1',
    'end',
    ''];
  if (!/end\s*$/.test(s)) { console.log('LOI NPC: cuoi file khong phai end'); loi++; }
  s = s.replace(/\s*$/, '') + N + L.join(N);
  console.log('NPC doitrunglau2.lua: +' + (Buffer.byteLength(s, 'latin1') - Buffer.byteLength(goc, 'latin1')) + ' byte');
  ghi(f, s);
}
console.log(loi ? 'CO LOI - khong ghi' : GHI ? 'DA GHI' : 'chay thu OK (them --ghi de ghi)'); process.exit(loi ? 1 : 0);
