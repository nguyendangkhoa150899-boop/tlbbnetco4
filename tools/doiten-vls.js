// Đổi TÊN quái Võ Ý ở Vô Lượng Sơn (wuliang_monster.ini) theo DataID, chỉ trong file này (Kiếm Các cũng dùng DataID 900-909 -> không đụng bảng chung).
// Ghi tên vào dòng name= của từng điểm (type=<DataID>, script_id=999998), mã VISCII. Tên rỗng = trả về tên bảng MonsterAttrExTable.
// Cần restart game (ini chỉ nạp lúc bật). node tools/doiten-vls.js <DataID,DataID...> "<tên mới>" [--ghi]
//   vd 05/10: node tools/doiten-vls.js 900,901 "Minh Hân" --ghi   (Cao Sơn Bạch Viên -> Minh Hân)
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Scene/wuliang_monster.ini');
const vis = JSON.parse(fs.readFileSync(path.join(__dirname, 'viscii-map.json'), 'utf8'));
const a = process.argv.slice(2).filter((x) => x !== '--ghi'), ghi = process.argv.includes('--ghi');
const ids = new Set(String(a[0] || '').split(',').filter((x) => /^\d+$/.test(x)));
const ten = String(a[1] === undefined ? '' : a[1]).normalize('NFC');
if (!ids.size || a.length < 2) { console.error('Dung: node tools/doiten-vls.js <DataID,...> "<ten moi>" [--ghi]'); process.exit(1); }
let ma = '';
for (const ch of ten) { const c = ch.charCodeAt(0); if (c < 128) { ma += ch; continue; } if (vis[ch] === undefined) { console.error('LOI: ky tu khong co trong VISCII: ' + ch); process.exit(1); } ma += String.fromCharCode(vis[ch]); }
if (Buffer.byteLength(ma, 'latin1') > 30) { console.error('LOI: ten dai ' + ma.length + ' byte (toi da 30)'); process.exit(1); }
const raw = fs.readFileSync(F, 'latin1');
const EOL = raw.includes('\r\n') ? '\r\n' : '\n';
const L = raw.split(EOL);
let khoi = null, nDoi = 0, nKhoi = 0;
const xong = () => {
  if (!khoi || !ids.has(khoi.type) || khoi.script !== '999998') return;
  nKhoi++;
  if (khoi.iName < 0) { console.error('LOI: khoi ' + khoi.ten + ' khong co dong name='); process.exit(1); }
  const moi = 'name=' + ma;
  if (L[khoi.iName] !== moi) { L[khoi.iName] = moi; nDoi++; }
};
for (let i = 0; i < L.length; i++) {
  const h = L[i].match(/^\[(.+)\]\s*$/);
  if (h) { xong(); khoi = { ten: h[1], type: null, script: null, iName: -1 }; continue; }
  if (!khoi) continue;
  let m;
  if ((m = L[i].match(/^type=(\d+)\s*$/))) khoi.type = m[1];
  if ((m = L[i].match(/^script_id\s*=\s*(-?\d+)/))) khoi.script = m[1];
  if (/^name=/.test(L[i])) khoi.iName = i;
}
xong();
console.log('DataID', [...ids].join(','), '| diem quai:', nKhoi, '| doi:', nDoi, '| ten moi: "' + ten + '" (' + ma.length + ' byte VISCII)');
if (!nKhoi) { console.error('LOI: khong thay diem quai nao'); process.exit(1); }
if (ghi) { fs.writeFileSync(F, L.join(EOL), 'latin1'); console.log('DA GHI'); }
