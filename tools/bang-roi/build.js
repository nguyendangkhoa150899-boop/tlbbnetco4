// Dung du lieu bang roi NetCo4 tu repo (giong file tren VPS) -> data.json
const fs = require('fs'), path = require('path');
const R = path.join(__dirname, '../../server/').replace(/\\/g, '/');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, '../viscii-map.json'), 'utf8'));
const rv = {}; for (const k in vis) rv[vis[k]] = k;
const dec = b => { let s = ''; for (const c of b) s += c < 128 ? String.fromCharCode(c) : (rv[c] || '?'); return s; };
const gbk = new TextDecoder('gbk');
const lines = f => fs.readFileSync(R + f, 'latin1').split(/\r?\n/);
const raw = s => Buffer.from(s, 'latin1');

// ---- vat pham
const items = {};          // id -> [ten, loai, cap]
for (const l of lines('Public/Config/CommonItem.txt')) { const c = l.split('\t'); if (/^\d{8}$/.test(c[0])) items[c[0]] = [dec(raw(c[6] || '')).trim(), 'v', 0]; }
for (const l of lines('Public/Config/GemInfo.txt')) { const c = l.split('\t'); if (/^\d{8}$/.test(c[0])) items[c[0]] = [dec(raw(c[7] || '')).trim(), 'g', +c[2]]; }
for (const l of lines('Public/Config/EquipBase.txt')) { const c = l.split('\t'); if (/^\d{8}$/.test(c[0]) && !items[c[0]]) items[c[0]] = [gbk.decode(raw(c[10] || '')).trim(), 'e', +c[11] || 0]; }

// ---- hop roi
const box = {};
for (const l of lines('Server/Config/DropBoxContent.txt')) { const c = l.split('\t'); if (!/^\d+$/.test(c[0])) continue;
  const it = []; for (let i = 4; i < c.length; i += 2) if (+c[i] > 0) it.push(+c[i]); box[c[0]] = [+c[1], it]; }

// ---- quai
const MA = {};
for (const l of lines('Public/Config/MonsterAttrExTable.txt')) { const c = l.split('\t'); if (/^\d+$/.test(c[0])) MA[c[0]] = [dec(raw(c[1] || '')).trim(), +c[3]]; }
const MD = {};
for (const l of lines('Server/Config/MonsterDropBoxs.txt')) { const c = l.split('\t'); if (!/^\d+$/.test(c[0])) continue;
  MD[c[0]] = [+c[1], c.slice(3).map(Number).filter(v => v > 0 && box[v])]; }

// ---- giam roi theo chenh cap
const att = {};
for (const l of lines('Server/Config/DropAttenuation.txt')) { const c = l.split('\t'); if (/^-?\d+$/.test(c[0])) att[c[0]] = +c[1]; }

// ---- ban do: SceneInfo [sceneN] name/file -> <file>_monster.ini
const sceneByIni = {}; // ini -> [ten ban do]
{ let cur = null; const add = () => { if (cur && cur.file) { const ini = cur.file.replace(/\.scn$/i, '') + '_monster.ini'; (sceneByIni[ini] = sceneByIni[ini] || []).push({ id: cur.id, name: cur.name }); } };
  for (const l0 of lines('Public/Config/SceneInfo.ini')) { const l = l0.replace(/;.*$/, '').trim();
    const m = l.match(/^\[scene(\d+)\]$/); if (m) { add(); cur = { id: +m[1] }; continue; }
    if (!cur) continue; const kv = l.match(/^(\w+)=(.*)$/); if (!kv) continue;
    if (kv[1] === 'name') cur.name = dec(raw(kv[2])).trim(); if (kv[1] === 'file') cur.file = kv[2].trim(); }
  add(); }

const TEN0 = { efuben_cuju:'Túc Cầu', ebingshen:'Binh Thánh Kỳ Trận (lớn)', ebingshensmall:'Binh Thánh Kỳ Trận (nhỏ)', shengsileitai:'Sinh Tử Lôi Đài (Sát Tinh)', epiaomiaofeng:'Phiêu Miểu Phong (khiêu chiến)', epiaomiaofeng_small:'Phiêu Miểu Phong (thường)', yanziwu_1:'Yến Tử Ổ', esijuezhuang:'Tứ Tuyệt Trang', eshaoshi:'Thiếu Thất Sơn', seek_treasure:'Lâu Lan Tầm Bảo', efuben_jiaofei:'Tiễu Phỉ', eGodFireTransfer_fuben:'Thần Hỏa' };
// ---- pho ban: script nap file quai rieng; ten lay tu g_CopySceneName
const iniFiles = fs.readdirSync(R + 'Public/Scene').filter(f => /_monster.*\.ini$/i.test(f));
const fubenByIni = {}; // ini -> Set(ten pho ban)
const fubenScript = {}; // file script -> ten
function walk(d) { for (const f of fs.readdirSync(d)) { const p = path.join(d, f); const st = fs.statSync(p);
  if (st.isDirectory()) walk(p); else if (/\.lua$/i.test(f)) { const b = fs.readFileSync(p); const s = b.toString('latin1');
    const loads = [...s.matchAll(/LuaFnSetSceneLoad_Monster\(\s*sceneId\s*,\s*"([^"]+)"/g)].map(m => m[1]); if (!loads.length) continue;
    let nm = (s.match(/_g_CopySceneName\s*=\s*"([^"]*)"/) || [])[1];
    nm = TEN0[path.basename(f, '.lua')] || (nm ? (/[A-Za-z]/.test(nm) ? dec(raw(nm)).trim() : gbk.decode(raw(nm)).trim()) : path.basename(f, '.lua')); fubenScript[p] = nm;
    for (const ld of loads) { const hit = ld.endsWith('.ini') ? iniFiles.filter(x => x.toLowerCase() === ld.toLowerCase()) : iniFiles.filter(x => x.toLowerCase().startsWith(ld.toLowerCase()));
      for (const h of hit) (fubenByIni[h] = fubenByIni[h] || new Set()).add(nm); } } } }
walk(R + 'Public/Data/Script');

// ---- roi theo ban do (NetCo4/roimap.lua x950001_g_Roi): sceneId -> [itemId, %]
const roi = {};
{ const s = fs.readFileSync(R + 'Public/Data/Script/NetCo4/roimap.lua', 'latin1');
  const a0 = s.indexOf('x950001_g_Roi = {'); const blk = s.slice(a0, s.indexOf('\n}', a0) + 2);
  for (const m of blk.matchAll(/\[(\d+)\]\s*=\s*\{\s*(\d+)\s*,\s*(\d+)\s*\}/g)) roi[m[1]] = [+m[2], +m[3]]; }

// ---- ten de doc cho cac pho ban quen (theo ten file script / thu muc)
const TEN = { efuben_cuju:'Túc Cầu', ebingshen:'Binh Thánh Kỳ Trận (lớn)', ebingshensmall:'Binh Thánh Kỳ Trận (nhỏ)', shengsileitai:'Sinh Tử Lôi Đài (Sát Tinh)',
  epiaomiaofeng:'Phiêu Miểu Phong (khiêu chiến)', epiaomiaofeng_small:'Phiêu Miểu Phong (thường)', yanziwu_1:'Yến Tử Ổ', esijuezhuang:'Tứ Tuyệt Trang', eshaoshi:'Thiếu Thất Sơn',
  seek_treasure:'Lâu Lan Tầm Bảo', efuben_jiaofei:'Tiễu Phỉ', eGodFireTransfer_fuben:'Thần Hỏa' };
const tenFile = f => TEN[path.basename(f, '.lua')];
// quai do script pho ban goi ra (DataID=..., bang *MonsterId*/*Boss*Id = {...}) -> gan theo thu muc
const scriptMon = {}; // monsterId -> Set(ten)
// chi script da dang ky trong Script.dat
const dangKy = new Set();
for (const l of fs.readFileSync(R + 'Public/Data/Script.dat', 'latin1').split(/\r?\n/)) { const m = l.match(/^\d+=(.+)$/); if (m) dangKy.add(path.normalize(R + 'Public/Data/Script/' + m[1].trim().replace(/\\/g, '/')).toLowerCase()); }
function docQuai(p, label) {
  const t = fs.readFileSync(p, 'latin1').replace(/--[^\n]*/g, '');
  const them = id => (scriptMon[id] = scriptMon[id] || new Set()).add(label);
  for (const m of t.matchAll(/DataID\s*=\s*(\d+)/g)) them(m[1]);
  for (const m of t.matchAll(/_g_\w*(?:Monster|Boss|BOSS|Create)\w*\s*=\s*\{([^}]*)\}/g)) for (const n of m[1].matchAll(/\b(\d{3,6})\b/g)) them(n[1]);
  for (const m of t.matchAll(/_g_\w*(?:Monster|Boss|BOSS|Create)\w*Id\s*=\s*(\d{3,6})\b/g)) them(m[1]);
}
function luaTrong(dir) { const out = []; for (const f of fs.readdirSync(dir)) { const p = path.join(dir, f); if (fs.statSync(p).isDirectory()) out.push(...luaTrong(p)); else if (/\.lua$/i.test(f)) out.push(p); } return out; }
// thu muc chi co 1 pho ban -> quet ca thu muc; nhieu pho ban chung thu muc -> chi file cung tien to
const fbDangKy = Object.entries(fubenScript).filter(([f]) => dangKy.has(path.normalize(f).toLowerCase()));
const demDir = {}; for (const [f] of fbDangKy) demDir[path.dirname(f)] = (demDir[path.dirname(f)] || 0) + 1;
for (const [f, lab] of fbDangKy) { const dir = path.dirname(f), base = path.basename(f, '.lua').toLowerCase();
  const ds = demDir[dir] === 1 ? luaTrong(dir) : fs.readdirSync(dir).filter(x => /\.lua$/i.test(x) && x.toLowerCase().startsWith(base)).map(x => path.join(dir, x));
  for (const p of ds) docQuai(p, lab); }


// boss cuoi cac hoat dong (theo danh sach tui boss trong NetCo4/roimap.lua) -> ten hoat dong + co boss
const HD = [
  ['Liên Hoàn Q Tô Châu (boss cuối)', [[4130,4139],[34130,34139]]], ['Liên Hoàn Q Lâu Lan / Viêm Ma Sơn (boss đợt 5)', [[13220,13229]]],
  ['Yến Tử Ổ', [[9430,9439],[39430,39432]]], ['Binh Thánh Kỳ Trận', [[15175,15175],[15073,15073]]], ['Tứ Tuyệt Trang', [[14145,14145]]],
  ['Phiêu Miểu Phong', [[9666,9666],[9546,9546]]], ['Sinh Tử Lôi Đài (Sát Tinh)', [[13456,13456]]], ['Thiếu Thất Sơn', [[14234,14234]]],
  ['Thánh Thú Sơn (Long Quy)', [[11353,11353]]], ['Lâu Lan Tầm Bảo', [[12138,12146]]], ['Ác Tặc Tạo Phản', [[473,473]]], ['Ác Bá (nhiệm vụ thành thị)', [[1910,1919]]],
  ['Kỳ Cuộc (Cờ 12h)', [[1850,1859],[31850,31859],[12040,12049],[42040,42049],[12090,12099],[42090,42099]]] ];
const bossTui = new Set();
for (const [lab, ds] of HD) for (const [a, b] of ds) for (let id = a; id <= b; id++) { bossTui.add(String(id)); (scriptMon[id] = scriptMon[id] || new Set()).add(lab); }

// ---- diem spawn
const maps = []; const mapIdx = {};
const spawn = {}; // monsterId -> [[mapIdx, so diem, hoi sinh giay, co script roi theo map]]
for (const f of iniFiles) {
  const sc = sceneByIni[f], fb = fubenByIni[f];
  let label, kind, sceneIds = [];
  if (sc) { const names = [...new Set(sc.map(x => x.name))]; label = names[0] + (names.length > 1 ? ' (+' + (names.length - 1) + ' bản)' : ''); kind = 'map'; sceneIds = sc.map(x => x.id); }
  else if (fb) { label = [...fb].join(' / '); kind = 'fb'; }
  else continue; // file khong ai dung
  const txt = fs.readFileSync(R + 'Public/Scene/' + f, 'latin1').split(/\r?\n/);
  const by = {}; let cur = null;
  const flush = () => { if (!cur || !cur.type) return; const k = cur.type; by[k] = by[k] || { n: 0, rs: [], scr: new Set() }; by[k].n++; by[k].rs.push(+cur.respawn_time || 0); by[k].scr.add(cur.script_id); };
  for (const l of txt) { if (/^\[monster/.test(l)) { flush(); cur = {}; continue; } const m = l.match(/^(\w+)=(.*)$/); if (m && cur) cur[m[1]] = m[2].trim(); }
  flush();
  const key = kind + ':' + label;
  if (!(key in mapIdx)) { mapIdx[key] = maps.length; maps.push([label, kind, f]); }
  const mi = mapIdx[key];
  for (const t in by) { const x = by[t]; const rsMin = Math.min(...x.rs), rsMax = Math.max(...x.rs);
    let r = null; if (x.scr.has('950001')) for (const id of sceneIds) if (roi[id]) { r = roi[id]; break; }
    (spawn[t] = spawn[t] || []).push([mi, x.n, Math.round(rsMin / 1000), Math.round(rsMax / 1000), r]); }
}

for (const id in scriptMon) for (const lab of scriptMon[id]) { if (!MA[id] || !MD[id] || !MD[id][1].length) continue; const key = 'sc:' + lab; if (!(key in mapIdx)) { mapIdx[key] = maps.length; maps.push([lab, 'sc', '']); }
  const mi = mapIdx[key]; const sp = (spawn[id] = spawn[id] || []); if (!sp.some(x => x[0] === mi)) sp.push([mi, 0, 0, 0, null]); }
// qua tuc cau (script 402045 -> roimap RoiDo Tu Vi Linh Phach 50%): ID lay tu efuben_cuju.lua
{ const t = fs.readFileSync(R + 'Public/Data/Script/event/fuben/efuben_cuju.lua', 'latin1');
  const ids = new Set();
  for (const v of ['SmallMonsterId_1', 'SmallMonsterId_2', 'SmallMonsterId_3', 'MiddleMonsterId']) { const m = t.match(new RegExp('x402040_g_' + v + '\s*=\s*\{([^}]*)\}')); if (m) for (const n of m[1].match(/\d+/g)) ids.add(n); }
  const big = t.match(/x402040_g_BigFootBall\s*=\s*\{([^}]*)\}/); if (big) for (const n of big[1].match(/\d+/g)) for (let k = 0; k < 10; k++) ids.add(String(+n + k));
  const key = 'sc:Túc Cầu'; if (!(key in mapIdx)) { mapIdx[key] = maps.length; maps.push(['Túc Cầu', 'sc', '']); }
  for (const id of ids) if (MA[id]) (spawn[id] = spawn[id] || []).push([mapIdx[key], 0, 0, 0, [30600084, 30]]); }
// [03/10] roi qua script tung rieng tung nguoi: Q To Chau (1130) / Q Lau Lan (1129) + quai ai 3 (roimap g_RoiPhoBan):
// moi quai 30% Cuu Thien Ngoc Toai + 10% Mien Bo 6 / Bi Ngan 6 (boc 1 -> ghi 5% + 5%); Ky Cuoc (RoiCfg, roithem.txt tren VPS
// 03/10): moi quan co 20% Tu Vi Linh Phach (+ 1,75% ngoc cap 6 ghi o phan chu thich). Sua ty le o day khi doi cau hinh.
{ const dai = (a, b) => { const o = []; for (let i = a; i <= b; i++) o.push(String(i), String(i + 30000)); return o; };
  const them = (lab, ids, ds) => { const key = 'sc:' + lab; if (!(key in mapIdx)) { mapIdx[key] = maps.length; maps.push([lab, 'sc', '']); }
    for (const id of ids) if (MA[id]) for (const r of ds) (spawn[id] = spawn[id] || []).push([mapIdx[key], 0, 0, 0, r]); };
  const Q = [[20800034, 30], [20501006, 5], [20502006, 5]];
  them('Q Tô Châu', dai(4060, 4169), Q);
  them('Q Lâu Lan', dai(13000, 13269), Q);
  them('Kỳ Cuộc', [...dai(1770, 1809), ...dai(12000, 12039), ...dai(12050, 12089)], [[30600084, 20]]); }

// ---- ghep: chi quai co dong roi (co it nhat 1 hop) hoac co diem spawn
const mons = []; const usedBox = new Set(), usedItem = new Set();
for (const id of new Set([...Object.keys(MD), ...Object.keys(spawn)])) {
  const ma = MA[id]; if (!ma) continue;
  const md = MD[id] || [0, []]; const sp = spawn[id] || [];
  const hasScript = sp.some(s => s[4]);
  if (!md[1].length && !sp.length) continue;
  md[1].forEach(b => usedBox.add(b)); sp.forEach(s => { if (s[4]) usedItem.add(s[4][0]); });
  const boss = bossTui.has(id) || sp.some(x => x[2] >= 1800) || (sp.length > 0 && sp.every(x => maps[x[0]][1] === "sc") && md[0] >= 60) ? 1 : 0;
  mons.push([+id, ma[0], ma[1], md[0], md[1], sp, boss]);
}
mons.sort((a, b) => a[0] - b[0]);
const boxes = {}; for (const b of usedBox) { boxes[b] = box[b]; box[b][1].forEach(i => usedItem.add(i)); }
const it = {}; for (const i of usedItem) it[i] = items[i] || ['#' + i, '?', 0];
const out = { built: new Date().toISOString(), dropParam: 2.0, att, maps, mons, boxes, items: it };
fs.writeFileSync(path.join(__dirname, 'data.json'), JSON.stringify(out));
console.log('quai', mons.length, '| hop', Object.keys(boxes).length, '| vat pham', Object.keys(it).length, '| ban do', maps.length,
  '| co spawn', mons.filter(m => m[5].length).length, '| kb', Math.round(fs.statSync(path.join(__dirname, 'data.json')).size / 1024));
console.log('roi theo map:', JSON.stringify(roi));
