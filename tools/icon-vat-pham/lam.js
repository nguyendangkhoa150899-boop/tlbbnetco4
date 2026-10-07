// 02/10: ICON VẬT PHẨM cho web (vòng quay, shop, rương...).
//   node tools/icon-vat-pham/lam.js <thư mục client "Thien Long Gate"> <thư mục ra>
// Đọc tên icon từ bảng server: CommonItem cột 5, GemInfo cột 5, EquipBase/EquipBase111 cột 21 ("图标"), dạng "<Bộ>_<số>".
// Lấy đúng các tấm "Icons/<Bộ>.jpg|png" trong client Data/Material.axp. Gói AXPK: header 40 byte (offset 16 = bảng block,
// 20 = số block), block 12 byte (offset, size, cờ), block CUỐI là file "(list)" dạng "tên|sizeHex|crcHex".
// Cột crc KHÔNG phải CRC32 chuẩn và bảng hash không phải kiểu MPQ -> khớp tên -> block bằng KÍCH THƯỚC.
// Mỗi tấm là lưới ô 64px (256x256 = 4x4), số đánh từ 1 theo hàng.
// Ra: <ra>/sheet/*.jpg|png (chép lên VPS /opt/minigame/itemicon/) + <ra>/itemicons.json (bot BotDoMin/data/itemicons.json).
const fs = require('fs'), path = require('path');
const [, , CLIENT, OUT] = process.argv;
if (!CLIENT || !OUT) { console.error('cach dung: node lam.js <client> <ra>'); process.exit(1); }
const CFG = path.join(__dirname, '../../server/Public/Config/');

// 1) tên icon theo ID
const icon = {};
function doc(file, col) {
  for (const l of fs.readFileSync(CFG + file, 'latin1').split(/\r?\n/)) {
    const c = l.split('\t');
    if (!/^\d{8}$/.test(c[0])) continue;
    const v = (c[col] || '').trim();
    if (/^[A-Za-z0-9_]+_\d+$/.test(v) && !icon[c[0]]) icon[c[0]] = v;
  }
}
doc('CommonItem.txt', 5); doc('GemInfo.txt', 5); doc('EquipBase.txt', 21); doc('EquipBase111.txt', 21);
const can = new Set(Object.values(icon).map((v) => v.replace(/_\d+$/, '')));

// 2) đọc gói Material.axp
const fd = fs.openSync(path.join(CLIENT, 'Data/Material.axp'), 'r');
const hdr = Buffer.alloc(40); fs.readSync(fd, hdr, 0, 40, 0);
if (hdr.toString('latin1', 0, 4) !== 'AXPK') throw new Error('khong phai goi AXPK');
const blockOff = hdr.readUInt32LE(16), blockCnt = hdr.readUInt32LE(20);
const bt = Buffer.alloc(blockCnt * 12); fs.readSync(fd, bt, 0, bt.length, blockOff);
const bySize = new Map();
for (let i = 0; i < blockCnt; i++) {
  const b = { off: bt.readUInt32LE(i * 12), size: bt.readUInt32LE(i * 12 + 4) };
  if (!bySize.has(b.size)) bySize.set(b.size, []);
  bySize.get(b.size).push(b);
}
const last = { off: bt.readUInt32LE((blockCnt - 1) * 12), size: bt.readUInt32LE((blockCnt - 1) * 12 + 4) };
const lb = Buffer.alloc(last.size); fs.readSync(fd, lb, 0, last.size, last.off);
const files = new Map();
for (const l of lb.toString('latin1').split(/\r?\n/)) { const c = l.split('|'); if (c.length >= 3 && /^[0-9A-F]{8}$/i.test(c[1])) files.set(c[0].toLowerCase(), c); }

// 3 tấm trùng cỡ với file khác, đã xem tận mắt 02/10 (ứng viên kia: playerhouse6 = đồ nhà,
// CommonNPCHeader28 = chân dung NPC, common/KVKBLYFH_2.png)
const CHON = { 'icons/medicine4.jpg': 1450471778, 'icons/ore.jpg': 1454203216, 'icons/circulartasktool45.jpg': 1404092482 };
const trung = [];
const docBlock = (b, size) => { const buf = Buffer.alloc(size); fs.readSync(fd, buf, 0, size, b.off); return buf; };
function lay(name) {
  const r = files.get(name.toLowerCase()); if (!r) return null;
  const size = parseInt(r[1], 16);
  const cand = bySize.get(size) || [];
  if (!cand.length) return null;
  const ep = CHON[name.toLowerCase()];
  if (ep !== undefined) { const b = cand.find((x) => x.off === ep); if (b) return docBlock(b, size); }
  const bufs = cand.map((b) => docBlock(b, size));
  if (bufs.every((x) => x.equals(bufs[0]))) return bufs[0];
  trung.push(name + ' (' + cand.length + ' block cùng cỡ)');
  return null;
}
function kichThuoc(b) {   // jpg / png -> [w, h]
  if (b[0] === 0x89 && b[1] === 0x50) return [b.readUInt32BE(16), b.readUInt32BE(20)];
  let i = 2;
  while (i < b.length - 9) {
    if (b[i] !== 0xFF) { i++; continue; }
    const m = b[i + 1];
    if (m >= 0xC0 && m <= 0xCF && m !== 0xC4 && m !== 0xC8 && m !== 0xCC) return [b.readUInt16BE(i + 7), b.readUInt16BE(i + 5)];
    i += 2 + b.readUInt16BE(i + 2);
  }
  return null;
}

// 07/10: phần lớn tấm là lưới ô 64px (4x4), nhưng 13 tấm chân dung (pet / NPC) là ô 48px, 5x5 = 25 ô (240px, dư dải đen 16px
// mép phải + dưới). Trước đây coi mọi tấm là 64px -> trứng pet bị cắt sai hình và ô 17-25 bị loại (vd Tề Thiên PetHeader7_25).
// Xác định bằng cách đo độ nhô chênh màu ở đường ranh 48 vs 64px trên ảnh (gấp 3-4 lần) + xem mắt; Xiezi_Ride / EquipAmulet2
// đo không rõ (viền ô thụt 2px) nhưng xem ảnh là 64px. Ghi ô 48 ở cột thứ 4 của sets: [file, w, h, 48].
const O48 = new Set(['PetHeader1', 'PetHeader3', 'PetHeader4', 'PetHeader5', 'PetHeader6', 'PetHeader7', 'PetHeader8',
  'CommonNPCHeader11', 'CommonNPCHeader14', 'CommonNPCHeader17', 'FightNPCHeader3', 'FightNPCHeader8', 'haiwaizhuanyong1']);
// 3) chép tấm
fs.mkdirSync(path.join(OUT, 'sheet'), { recursive: true });
const sets = {}, thieu = [];
for (const bo of can) {
  let buf = null, ext = '';
  for (const e of ['jpg', 'png']) { buf = lay('Icons/' + bo + '.' + e); if (buf) { ext = e; break; } }
  if (!buf) { thieu.push(bo); continue; }
  const wh = kichThuoc(buf); if (!wh) { thieu.push(bo + '(khong doc duoc kich thuoc)'); continue; }
  const file = bo + '.' + ext;
  fs.writeFileSync(path.join(OUT, 'sheet', file), buf);
  sets[bo] = O48.has(bo) ? [file, wh[0], wh[1], 48] : [file, wh[0], wh[1]];
}
// 4) chỉ mục: món trỏ số ô lớn hơn số ô của tấm là tham chiếu hỏng sẵn trong game -> không có hình
const items = {}; let co = 0, hong = 0;
for (const [id, v] of Object.entries(icon)) {
  const m = v.match(/^(.+)_(\d+)$/); const s = sets[m[1]]; if (!s) continue;
  const o = s[3] || 64;
  if (+m[2] > Math.floor(s[1] / o) * Math.floor(s[2] / o)) { hong++; continue; }
  items[id] = [m[1], +m[2]]; co++;
}
fs.writeFileSync(path.join(OUT, 'itemicons.json'), JSON.stringify({ v: 1, cell: 64, sets, items }));
let tong = 0; for (const f of fs.readdirSync(path.join(OUT, 'sheet'))) tong += fs.statSync(path.join(OUT, 'sheet', f)).size;
console.log('vat pham co ten icon:', Object.keys(icon).length, '| co hinh:', co, '| tham chieu hong:', hong, '| bo icon:', Object.keys(sets).length,
  '| thieu bo:', thieu.length, '| dung luong:', (tong / 1e6).toFixed(1), 'MB');
if (thieu.length) console.log('thieu:', thieu.join(', '));
if (trung.length) console.log('trung kich thuoc (bo qua):', trung.join(', '));
