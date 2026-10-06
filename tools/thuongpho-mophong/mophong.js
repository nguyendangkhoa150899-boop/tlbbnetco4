// 06/10: MO PHONG THUONG PHO end-to-end (docs/THUONG-PHO.md): CDK.lua that chay bang fengari + shim Lua 4 + API game gia,
// noi voi BotDoMin/thuongpho.js that. 39 ca (gui, khoa, tui day, khong phat trung, hoan, tat khan cap...).
// Chay: npm i fengari && node tools/thuongpho-mophong/mophong.js "<duong dan BotDoMin>"   (CHONG_BAT_KE=1 = gia dinh engine chong ca do khac khoa)
// Mo phong Thuong Pho end-to-end: CDK.lua that (fengari, shim Lua 4 + API game gia) + thuongpho.js that, chung 1 thu muc.
const fs = require('fs'), path = require('path');
const { lua, lauxlib, lualib, to_luastring, to_jsstring } = require('fengari');   // npm i fengari (trong thu muc nay hoac global)
const SP = path.join(require('os').tmpdir(), 'thuongpho-mophong');
const ROOT = path.join(SP, 'root');
const SERVER = path.join(ROOT, 'home/tlbb/Server');
const WEB = path.join(SERVER, 'txt/NetCo4Web');
fs.rmSync(WEB, { recursive: true, force: true });
fs.mkdirSync(WEB, { recursive: true });
process.env.TLBB_ROOT = ROOT;
const REPO = path.join(__dirname, '..', '..');
const BOT = process.env.BOT_DIR || process.argv[2];   // thu muc BotDoMin cua repo bot bialk
if (!BOT) { console.error('Dung: node mophong.js <duong dan BotDoMin>  (hoac BOT_DIR=...)'); process.exit(2); }
// game gia: <tmp>/root/home/tlbb/Public -> server/Public cua repo (junction), Server/txt/NetCo4Web lam thu muc cau
fs.mkdirSync(path.join(ROOT, 'home/tlbb'), { recursive: true });
if (!fs.existsSync(path.join(ROOT, 'home/tlbb/Public'))) fs.symlinkSync(path.join(REPO, 'server/Public'), path.join(ROOT, 'home/tlbb/Public'), 'junction');

let pass = 0, fail = 0;
function ok(c, m) { if (c) { pass++; console.log('  ✓ ' + m); } else { fail++; console.log('  ✗ ' + m); } }

// ---------- bot ----------
const db = { u1: { name: 'Tester', tlbbGuid: '1010100099', ingameName: 'NhanVatTest' } };
const LOG = [];
const TP = require(BOT + '/thuongpho.js')({ db: () => db, getUserData: (u) => db[u] || (db[u] = {}), saveDbNow() { }, writeLog: (a, b) => LOG.push(b), icon: () => null, items: () => [] });
console.log('so mon duoc chuyen:', TP.napCho());

// ---------- Lua ----------
const L = lauxlib.luaL_newstate(); lualib.luaL_openlibs(L);
const H = {}; let hid = 0;
const P = (p) => path.join(SERVER, p);
function reg(n, f) { lua.lua_pushjsfunction(L, f); lua.lua_setglobal(L, to_luastring(n)); }
reg('openfile', (L) => {
  const p = to_jsstring(lauxlib.luaL_checkstring(L, 1)), m = to_jsstring(lauxlib.luaL_checkstring(L, 2));
  const f = P(p);
  if (m === 'r') { if (!fs.existsSync(f)) { lua.lua_pushnil(L); return 1; } H[++hid] = { m, lines: fs.readFileSync(f, 'latin1').split('\n').filter((x, i, a) => !(i === a.length - 1 && x === '')), i: 0 }; }
  else { if (!fs.existsSync(path.dirname(f))) { lua.lua_pushnil(L); return 1; } H[++hid] = { m, f, buf: '' }; }
  lua.lua_pushinteger(L, hid); return 1;
});
reg('read', (L) => { const h = H[lua.lua_tointeger(L, 1)]; if (!h || h.i >= h.lines.length) { lua.lua_pushnil(L); return 1; } lua.lua_pushstring(L, to_luastring(h.lines[h.i++])); return 1; });
reg('write', (L) => { const h = H[lua.lua_tointeger(L, 1)]; h.buf += to_jsstring(lua.lua_tostring(L, 2)); return 0; });
reg('closefile', (L) => { const h = H[lua.lua_tointeger(L, 1)]; if (h && h.m === 'w') fs.writeFileSync(h.f, h.buf, 'latin1'); if (h && h.m === 'a') fs.appendFileSync(h.f, h.buf, 'latin1'); return 0; });
function run(code, ten) { if (lauxlib.luaL_loadbuffer(L, code, null, to_luastring(ten)) !== lua.LUA_OK || lua.lua_pcall(L, 0, 0, 0) !== lua.LUA_OK) throw new Error(ten + ': ' + to_jsstring(lua.lua_tostring(L, -1))); }

// API game gia (Lua): tui 0..29 Dao cu, 30..59 Nguyen lieu. Mon 5xxxxxxx / 20xxxxxx vao Nguyen lieu.
run(to_luastring(`
getn = function(t) return #t end
tinsert = table.insert
strfind = string.find
floor = math.floor
random = math.random
BAG = {}
STACK = { [20501001] = 200, [30505107] = 99, [30900006] = 1 }   -- dung cot so chong cua CommonItem
CHONG_BAT_KE = ${process.env.CHONG_BAT_KE === '1' ? 'true' : 'false'}   -- engine chong ca do khac trang thai khoa?
FAIL_SAU = nil   -- TryRecieveItem loi sau n lan (mo phong loi giua chung)
TIPS = {}
TEXT = {}
NUM = {}
function laNL(id) return id >= 50000000 or (id >= 20000000 and id < 30000000) end
function LuaFnGetMaterialStartBagPos() return 30 end
function LuaFnGetMaterialEndBagPos() return 59 end
function LuaFnGetGUID() return 1010100099 end
function LuaFnGetCurrentTime() return os.time() end
function LuaFnGetItemTableIndexByIndex(s, u, p) local o = BAG[p] if o then return o.id end return -1 end
function LuaFnGetItemCountInBagPos(s, u, p) local o = BAG[p] if o then return o.n end return 0 end
function LuaFnGetItemBindStatus(s, u, p) local o = BAG[p] if o and o.bind then return 1 end return 0 end
function LuaFnIsItemAvailable(s, u, p) local o = BAG[p] if o and o.mk then return 0 end return 1 end
function LuaFnIsItemLocked(s, u, p) local o = BAG[p] if o and o.lock then return 1 end return 0 end
function GetBagItemParam(s, u, p, off, ty) local o = BAG[p] if o and o.par then return o.par[off/4 + 1] or 0 end return 0 end
function LuaFnEraseItem(s, u, p) BAG[p] = nil return 1 end
function LuaFnItemBind(s, u, p) if BAG[p] then BAG[p].bind = true end return 1 end
function dem(a, b) local n = 0 for p = a, b do if BAG[p] == nil then n = n + 1 end end return n end
function LuaFnGetPropertyBagSpace() return dem(0, 29) end
function LuaFnGetMaterialBagSpace() return dem(30, 59) end
NHAN_LAN = 0
function TryRecieveItem(s, u, id, q)
  if FAIL_SAU and NHAN_LAN >= FAIL_SAU then return -1 end
  NHAN_LAN = NHAN_LAN + 1
  local a, b = 0, 29
  if laNL(id) then a, b = 30, 59 end
  local st = STACK[id] or 1
  for p = a, b do local o = BAG[p] if o and o.id == id and o.n < st and (CHONG_BAT_KE or not o.bind) then o.n = o.n + 1 return p end end
  for p = a, b do if BAG[p] == nil then BAG[p] = { id = id, n = 1 } return p end end
  return -1
end
function BeginEvent() TEXT = {} NUM = {} end
function AddText(s, t) table.insert(TEXT, t) end
function AddNumText(s, sid, t, a, k) table.insert(NUM, k .. ':' .. t) end
function EndEvent() end
function DispatchEventList() end
function DispatchMissionTips() end
function YuanBao() return 0 end
`), 'api');
// x999999_Tips goi BeginEvent/AddText -> ghi lai tip
run(fs.readFileSync(REPO + '/server/Public/Data/Script/CDK/CDK.lua'), 'CDK.lua');
run(to_luastring(`local cu = x999999_Tips
x999999_Tips = function(s, u, m) table.insert(TIPS, m) end`), 'tips');
const M = JSON.parse(fs.readFileSync(REPO + '/tools/viscii-map.json', 'utf8')); const R = {}; for (const k in M) R[M[k]] = k;
const viet = (s) => String(s).replace(/[\x80-\xff]/g, (c) => R[c.charCodeAt(0)] || '?');
function lget(expr) { run(to_luastring('__R = ' + expr), 'get'); lua.lua_getglobal(L, to_luastring('__R')); const t = lua.lua_type(L, -1); let v = null; if (t === lua.LUA_TNUMBER) v = lua.lua_tonumber(L, -1); else if (t === lua.LUA_TSTRING) v = Buffer.from(lua.lua_tostring(L, -1)).toString('latin1'); lua.lua_pop(L, 1); return v; }
function tips() { const n = lget('#TIPS'); const out = []; for (let i = 1; i <= n; i++) out.push(viet(lget('TIPS[' + i + ']'))); run(to_luastring('TIPS = {}'), 'c'); return out; }
function texts() { const n = lget('#TEXT'); const o = []; for (let i = 1; i <= n; i++) o.push(viet(lget('TEXT[' + i + ']'))); const m = lget('#NUM'); for (let i = 1; i <= m; i++) o.push('[nut] ' + viet(lget('NUM[' + i + ']'))); return o; }
function bag() { const o = []; for (let p = 0; p < 60; p++) { const id = lget('BAG[' + p + '] and BAG[' + p + '].id'); if (id) o.push({ p, id, n: lget('BAG[' + p + '].n'), b: lget('BAG[' + p + '].bind and 1 or 0') }); } return o; }
const tong = (id, b) => bag().filter(x => x.id === id && (b === undefined || x.b === b)).reduce((t, x) => t + x.n, 0);

// ---------- KICH BAN ----------
console.log('\n[1] Tui ban dau');
run(to_luastring(`BAG = {
  [0] = { id = 30505107, n = 7 },                         -- duoc, chong 10
  [1] = { id = 30008038, n = 1 },                         -- Tu Bao Bon: script ghi tham so -> ngoai danh sach
  [2] = { id = 30900006, n = 3, bind = true },            -- duoc, CO DINH
  [3] = { id = 38000446, n = 1, par = { 0, 5000, 0 } },   -- tham so rieng khac 0 -> giu lai
  [4] = { id = 30505107, n = 2, mk = true },              -- khoa mat khau -> giu lai
  [5] = { id = 10157001, n = 1 },                         -- Long Van (trang bi) -> ngoai danh sach
  [6] = { id = 30505107, n = 4, bind = true },            -- cung ID nhung CO DINH -> chong rieng
  [30] = { id = 50601001, n = 1 },
  [31] = { id = 50601001, n = 1, bind = true },
  [32] = { id = 20501001, n = 20 },
  [33] = { id = 20501001, n = 5, lock = true },           -- dang khoa (giao dich) -> giu lai
}`), 'bag');
console.log(bag().map(x => `${x.p}:${x.id}x${x.n}${x.b ? 'K' : ''}`).join(' '));

console.log('\n[2] NPC hoi chuyen Dao cu');
run(to_luastring('x999999_HoiTP(0, 1, 2, 1)'), 'hoi1'); const t1 = texts(); t1.forEach(x => console.log('   ' + x));
ok(t1.some(x => /Sẽ chuyển: 3 ô \(14 món\), trong đó 2 ô cố định/.test(x)), 'dem dung 3 o / 14 mon / 2 o co dinh');
ok(t1.some(x => /2 ô không chuyển được.*1 ô có thuộc tính riêng, 1 ô đang khóa/.test(x)), 'dem dung o bi giu lai');
ok(t1.some(x => /^\[nut\] 92:/.test(x)), 'nut xac nhan = 92');

console.log('\n[3] Chuyen Dao cu + Nguyen lieu');
run(to_luastring('x999999_ChuyenTP(0, 1, 2, 1)'), 'c1'); console.log('   tip:', tips().join(' | '));
run(to_luastring('x999999_ChuyenTP(0, 1, 2, 2)'), 'c2'); console.log('   tip:', tips().join(' | '));
const b3 = bag(); console.log('   tui con:', b3.map(x => `${x.p}:${x.id}x${x.n}${x.b ? 'K' : ''}`).join(' '));
ok(b3.map(x => x.p).join(',') === '1,3,4,5,33', 'chi con lai cac o bi giu (1,3,4,5,33)');
const phieu = fs.readdirSync(path.join(WEB, 'outtp')).filter(f => f.endsWith('.txt'));
ok(phieu.length === 2, '2 phieu outtp');

console.log('\n[4] Bot doc phieu -> kho');
TP.pollPhieu();
let s = TP.state('u1');
console.log('   kho:', s.kho.map(x => `${x.id}${x.k ? 'K' : ''}x${x.n}`).join(' '));
const kq = (id, k) => (s.kho.find(x => x.id === id && x.k === k) || {}).n || 0;
ok(kq('30505107', 0) === 7 && kq('30505107', 1) === 4 && kq('30900006', 1) === 3, 'kho Dao cu dung (khoa tach chong)');
ok(kq('50601001', 0) === 1 && kq('50601001', 1) === 1 && kq('20501001', 0) === 20, 'kho Nguyen lieu dung');
TP.pollPhieu(); s = TP.state('u1');
ok(kq('30505107', 0) === 7, 'doc phieu lan 2 KHONG cong trung');
ok(fs.readdirSync(path.join(WEB, 'outtp')).filter(f => f.endsWith('.txt')).length === 0, 'phieu da chuyen sang xong/');

console.log('\n[5] Rut: kiem tra chan sai');
ok(!!TP.rut('u1', [{ id: '30505107', k: 0, n: 8 }]).error, 'rut qua so co -> loi');
ok(!!TP.rut('u1', [{ id: '30008038', k: 0, n: 1 }]).error, 'rut mon khong co -> loi');
ok(!!TP.rut('u1', [{ id: '30505107', k: 1, n: 5 }]).error, 'rut khoa qua so -> loi');
ok(!!TP.rut('u2', [{ id: '30505107', k: 0, n: 1 }]).error, 'nguoi chua lien ket -> loi');

console.log('\n[6] Rut hop le, tui DAY');
let r = TP.rut('u1', [{ id: '30505107', k: 0, n: 7 }, { id: '30505107', k: 1, n: 4 }, { id: '30900006', k: 1, n: 3 }, { id: '50601001', k: 1, n: 1 }, { id: '20501001', k: 0, n: 20 }]);
console.log('   ', r.error || r.message);
s = TP.state('u1'); ok(s.kho.length === 1 && kq('50601001', 0) === 1, 'kho chi con ngoc 6 khong khoa');
console.log('   lenh cho:', s.cho.map(x => `${x.id}${x.k ? 'K' : ''}x${x.n}`).join(' '));
run(to_luastring('for p = 0, 59 do if BAG[p] == nil then BAG[p] = { id = 99999999, n = 1 } end end'), 'day');
run(to_luastring('x999999_NhanTP(0, 1)'), 'n0'); console.log('   tip:', tips().join(' | '));
ok(tong(30505107) === 2 && tong(30900006) === 0, 'tui day -> khong phat gi');
ok(TP.state('u1').cho.length === s.cho.length, 'lenh van cho nguyen');

const tuiStr = () => bag().filter(x => x.id !== 99999999).map(x => `${x.p}:${x.id}x${x.n}${x.b ? 'K' : ''}`).join(' ');
console.log('\n[7a] Don 1 o Dao cu');
run(to_luastring('BAG[10] = nil'), 'x');
run(to_luastring('x999999_NhanTP(0, 1)'), 'n1'); console.log('   tip:', tips().join(' | '));
console.log('   tui:', tuiStr());
ok(tong(30505107, 1) === 0, 'do CO DINH 30505107 CHUA phat (con chong khong khoa chua day o 4)');
ok(lget('BAG[4].bind and 1 or 0') === 0, 'chong khong khoa cua nguoi choi (o 4) KHONG bi khoa oan');
console.log('\n[7b] Don het tui');
run(to_luastring('for p = 0, 59 do if BAG[p] and BAG[p].id == 99999999 then BAG[p] = nil end end'), 'don');
run(to_luastring('x999999_NhanTP(0, 1)'), 'n2'); const t7b = tips(); console.log('   tip:', t7b.join(' | '));
console.log('   tui:', tuiStr());
ok(tong(30900006, 1) === 3, '30900006 x3 CO DINH');
ok(tong(50601001, 1) === 1 && tong(50601001, 0) === 0, 'ngoc 6 co dinh ve co dinh');
ok(tong(20501001, 0) === 20 + 5, '20501001 x20 (+5 cu)');
ok(tong(30505107, 0) === 7 + 2 && lget('BAG[4].bind and 1 or 0') === 0, '30505107 khong khoa = 9, van KHONG khoa');
ok(t7b.some(x => /lệnh đồ cố định đang chờ/.test(x)), 'bao nguoi choi cat chong khong co dinh');
console.log('\n[7c] Nguoi choi cat chong o 4 vao ruong -> nhan do co dinh');
run(to_luastring('BAG[4] = nil'), 'cat');
run(to_luastring('x999999_NhanTP(0, 1)'), 'n3'); console.log('   tip:', tips().join(' | '));
console.log('   tui:', tuiStr());
ok(tong(30505107, 1) === 4 && bag().filter(x => x.id === 30505107 && x.b).length === 1, '30505107 x4 CO DINH, gon 1 o');
run(to_luastring('x999999_NhanTP(0, 1)'), 'n4'); console.log('   tip lan nua:', tips().join(' | ') || '(khong co)');
ok(tong(30505107) === 4 && tong(20501001) === 25 && tong(30900006) === 3, 'goi NhanTP lan nua KHONG phat trung');
TP.donTpin(); ok((fs.existsSync(path.join(WEB, '1010100099.tpin')) ? fs.readFileSync(path.join(WEB, '1010100099.tpin'), 'utf8').trim() : '') === '', 'bot don .tpin sau khi game nhan');
ok(TP.state('u1').cho.length === 0, 'web: het lenh cho');

console.log('\n[7d] Chot chan: so chong bot biet (99) NHO hon engine that (200) -> kiem "chua day" bi lua');
run(to_luastring('STACK[30505107] = 200 BAG[20] = { id = 30505107, n = 150 }'), 'lua');
run(to_luastring('x999999_ChuyenTP(0, 1, 2, 1)'), 'c5'); tips(); TP.pollPhieu();
run(to_luastring('BAG[20] = { id = 30505107, n = 150 }'), 'lai');   // nguoi choi lai co chong 150 khong khoa
r = TP.rut('u1', [{ id: '30505107', k: 1, n: 4 }]); console.log('   ', r.error || r.message);
run(to_luastring('x999999_NhanTP(0, 1)'), 'n5'); console.log('   tip:', tips().join(' | '));
console.log('   tui:', tuiStr());
ok(lget('BAG[20].bind and 1 or 0') === 0, 'chong 150+ cua nguoi choi KHONG bi khoa (chot chan o cu)');
run(to_luastring('STACK[30505107] = 99'), 'tra');

console.log('\n[8] Phat loi giua chung -> HOAN ve kho');
// chuyen 20501001 x25 ra lai roi rut, cho TryRecieveItem loi sau 10 cai
run(to_luastring('BAG[33].lock = nil x999999_ChuyenTP(0, 1, 2, 2)'), 'c3'); tips(); TP.pollPhieu();
s = TP.state('u1'); console.log('   kho:', s.kho.map(x => `${x.id}${x.k ? 'K' : ''}x${x.n}`).join(' '));
r = TP.rut('u1', [{ id: '20501001', k: 0, n: 25 }]); console.log('   ', r.error || r.message);
run(to_luastring('NHAN_LAN = 0 FAIL_SAU = 10'), 'f');
run(to_luastring('x999999_NhanTP(0, 1)'), 'n4'); console.log('   tip:', tips().join(' | '));
run(to_luastring('FAIL_SAU = nil'), 'f2');
TP.pollPhieu(); s = TP.state('u1');
console.log('   kho sau hoan:', s.kho.map(x => `${x.id}${x.k ? 'K' : ''}x${x.n}`).join(' '), '| nk:', s.nk[0] && s.nk[0].loai);
ok(tong(20501001) + kq('20501001', 0) === 25, 'tong trong tui + kho = 25 (khong mat, khong du)');
ok(s.nk[0] && s.nk[0].loai === 'hoan', 'nhat ky ghi Game hoan ve');

console.log('\n[9] Tat Thuong Pho -> NPC khong xoa gi');
TP.setCfg({ tat: true });
const truoc = JSON.stringify(bag());
run(to_luastring('x999999_ChuyenTP(0, 1, 2, 2)'), 'c4'); console.log('   tip:', tips().join(' | '));
ok(JSON.stringify(bag()) === truoc, 'tui khong doi');
ok(!!TP.rut('u1', [{ id: '50601001', k: 0, n: 1 }]).error, 'web rut bi chan');
TP.setCfg({ tat: false });

console.log('\n[11] Lich su: gop so luong + trang thai lan rut');
run(to_luastring('for p = 30, 59 do BAG[p] = nil end BAG[40] = { id = 20501001, n = 200 } BAG[41] = { id = 20501001, n = 200 } BAG[42] = { id = 20501001, n = 50 }'), 'mb');
run(to_luastring('x999999_ChuyenTP(0, 1, 2, 2)'), 'c7'); tips(); TP.pollPhieu();
let nk = TP.state('u1').nk;
console.log('   gui:', JSON.stringify(nk[0].ds.map(x => x.id + 'x' + x.n)));
ok(nk[0].loai === 'gui' && nk[0].ds.length === 1 && nk[0].ds[0].n === 450, 'gui 3 o Mien Bo -> lich su 1 dong x450');
r = TP.rut('u1', [{ id: '20501001', k: 0, n: 450 }, { id: '50601001', k: 0, n: 1 }]); console.log('   ', r.error || r.message);
nk = TP.state('u1').nk;
ok(nk[0].loai === 'rut' && nk[0].ds.find(x => x.id === '20501001').n === 450 && nk[0].tt === 'cho', 'rut x450 + 1 ngoc -> 1 dong lich su, Dang cho');
run(to_luastring('for p = 30, 59 do if BAG[p] == nil then BAG[p] = { id = 99999999, n = 1 } end end BAG[58] = nil'), 'gan day');   // con dung 1 o
run(to_luastring('x999999_NhanTP(0, 1)'), 'n6'); tips();
nk = TP.state('u1').nk; console.log('   tt sau khi nhan 1 phan:', nk[0].tt);
ok(nk[0].tt === 'motphan', 'tui chi du cho 1 dong -> Nhan mot phan');
run(to_luastring('for p = 30, 59 do if BAG[p] and BAG[p].id == 99999999 then BAG[p] = nil end end'), 'don2');
run(to_luastring('x999999_NhanTP(0, 1)'), 'n7'); tips();
nk = TP.state('u1').nk; console.log('   tt sau khi nhan het:', nk[0].tt);
ok(nk[0].tt === 'xong', 'nhan het -> Da vao game');

console.log('\n[10] Tat khan cap bang file thuongpho-tat');
fs.writeFileSync(path.join(WEB, 'thuongpho-tat'), '');
TP.pollPhieu();
const truoc10 = JSON.stringify(bag());
run(to_luastring('x999999_ChuyenTP(0, 1, 2, 2)'), 'c6'); console.log('   tip:', tips().join(' | '));
ok(JSON.stringify(bag()) === truoc10, 'NPC khong xoa gi khi co file tat');
ok(!!TP.rut('u1', [{ id: '50601001', k: 0, n: 1 }]).error && TP.state('u1').tat === true, 'web khoa rut + bao tat');
fs.unlinkSync(path.join(WEB, 'thuongpho-tat'));
TP.pollPhieu();
run(to_luastring('x999999_HoiTP(0, 1, 2, 2)'), 'h7');
ok(texts().some(x => /Sẽ chuyển/.test(x)), 'xoa file -> mo lai trong 1 vong doc phieu');

console.log(`\nKET QUA: ${pass} dat, ${fail} truot`);
process.exit(fail ? 1 : 0);
