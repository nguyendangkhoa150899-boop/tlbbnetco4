// 06/10: bang ti le cap pham chat do che 80-99 theo cap vat lieu. Chay: node tools/tile-che.js (doc server/ cua repo).
// Ti le cap pham chat + so dong cua do che 80-99 theo cap vat lieu (ItemSegQuality "N级材料三精_<diem>" -> ItemSegAffect)
const fs = require('fs');
const S = require('path').join(__dirname, '..', 'server') + '/';
const td = new TextDecoder('gbk');
const rows = (f) => { const o = {}; for (const l of fs.readFileSync(S + f, 'latin1').split(/\r?\n/)) { const c = l.split('\t'); if (/^\d+$/.test(c[0] || '')) o[c[0]] = c; } return o; };
const H = td.decode(fs.readFileSync(S + 'Server/Config/ItemSegQuality.txt')).split(/\r?\n/)[1].split('\t');
const col = (lv, diem) => H.findIndex((h) => h.startsWith((38 + (lv - 1) * 19 + diem) + '-' + lv + '级材料三精_' + String(diem).padStart(2, '0')));
const sq = rows('Server/Config/ItemSegQuality.txt'), sa = rows('Server/Config/ItemSegAffect.txt');
const eb = rows('Public/Config/EquipBase.txt'), ic = rows('Public/Config/ItemCompound.txt');
const VT = { 0: 'Vũ khí', 1: 'Mũ', 2: 'Áo', 3: 'Bao tay', 4: 'Giày', 5: 'Đai', 6: 'Nhẫn', 7: 'Dây chuyền', 12: 'Hộ phù', 14: 'Hộ uyển', 15: 'Hộ kiên' };
const kiemCot = col(8, 0); if (kiemCot < 0) throw new Error('khong thay cot 8级材料三精_00');
// mon che 80-99
const mon = new Map();
for (const c of Object.values(ic)) { const e = eb[c[2]]; if (!e) continue; const lv = +e[11]; if (lv >= 80 && lv <= 99) mon.set(c[2], e); }
console.log('mon che 80-99:', mon.size, '| cot cap8 diem00 =', kiemCot, H[kiemCot]);
// tong hop theo (vi tri, quy tac, cap vat lieu) -> phan bo 9 cap
const nhom = new Map();
for (const [id, e] of mon) {
  const diem = +e[5], quyTac = e[90];
  const k = VT[diem] || ('vt' + diem);
  if (!nhom.has(k)) nhom.set(k, { ids: [], quyTac: new Set(), dong: new Set() });
  const g = nhom.get(k); g.ids.push(id); g.quyTac.add(quyTac); g.dong.add(e[92] + '-' + e[93]);
}
const pb = (quyTac, diem, lv) => { const r = sq[quyTac]; if (!r) return null; const code = r[col(lv, diem)]; const a = sa[code]; if (!a) return { code, w: null }; const t = +a[1]; return { code, w: a.slice(2, 11).map((x) => +x / t * 100) }; };
for (const [k, g] of nhom) {
  console.log(`\n== ${k}: ${g.ids.length} món | quy tắc cột 90: ${[...g.quyTac].join(',')} | số dòng min-max: ${[...g.dong].join(', ')}`);
  const diem = +eb[g.ids[0]][5];
  for (const q of g.quyTac) for (const lv of [1, 4, 6, 7, 8]) {
    const p = pb(q, diem, lv); if (!p) continue;
    console.log(`  quy tắc ${q} · vật liệu cấp ${lv} (mã ${p.code}): ` + (p.w ? p.w.map((x, i) => x ? `C${i + 1} ${x.toFixed(1)}%` : '').filter(Boolean).join('  ') : 'không có mã'));
  }
}
