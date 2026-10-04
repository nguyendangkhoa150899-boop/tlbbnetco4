// 04/10: phieu boss pho ban theo chot cua chu server.
//  - boss pho ban cap < 100: dung 1 phieu 1000 / lan ha (BV = 2*Mv -> X = 1.0 khi chenh cap <= 10)
//  - Q To Chau / Q Lau Lan: don 3 phieu vao boss cuoi (BV 48 -> X 2.5 -> 3)
//  - Sat Tinh: don 5 phieu vao Ngo Vinh 13456, canh cho nguoi cap 89 (x0,2): BV 5 -> X 4.8 -> 5; 10 boss con lai bo phieu
//  - boss >= 100 va boss the gioi: khong dung
// Hop phieu dat o DID1 (tui boss toi da 10 mon). Chay: node suaphieu.js [--ghi]
const fs = require('fs');
const R = 'C:/Users/Bia/tlbbnetco4/server/Server/Config/';
const F_MDB = R + 'MonsterDropBoxs.txt', F_DBC = R + 'DropBoxContent.txt';
const PH = new Set(['39910001', '39910002', '39910003', '39910004', '39910005', '39910006']);
const VAT = '20310113';   // Han Bang Tinh Tiet (mon nguyen lieu con lai cua hop 90002)

// ---- hop moi ----
const HOP_MOI = [
  ['90043', 120, '39910001'],   // 1 phieu, Mv 60
  ['90044', 200, '39910001'],   // 1 phieu, Mv 100
  ['90045', 160, '39910001'],   // 1 phieu, Mv 80
  ['90046', 48, '39910001'],    // 3 phieu, Mv 60 (Q boss cuoi)
  ['90047', 5, '39910001'],     // 5 phieu, Mv 60, cap 120 vs nguoi 89 (Ngo Vinh)
  ['90048', 120, VAT],          // thay 90002 cho dong Mv 60 (giu ky vong 1 Han Bang)
  ['90049', 200, VAT],          // thay 90002 cho dong Mv 100
];
const r = (a, b) => { const o = []; for (let i = a; i <= b; i++) o.push(String(i)); return o; };
// [danh sach ID, Mv phai dung, hop phieu moi (null = chi bo phieu), thay 90002 bang]
const KE = [
  [['9540', '9541', '9543', '9546', '9547', '9548', '9549', '9550', '9551', '9660', '9661', '9663', '9666'], 60, '90043', '90048', 'PMF Mv60'],
  [['9552', '9667', '9668', '9669', '9670', '9671', '9672'], 100, '90044', '90049', 'PMF Mv100'],
  [[...r(9320, 9328), ...r(9380, 9388), ...r(9430, 9438)], 60, '90043', null, 'Yen Tu O cap 10-90'],
  [['43970', '43971', '43973', '43975'], 80, '90045', null, 'Lang Huyen thuong cap 90'],
  [r(1851, 1858), 80, '90045', null, 'Ky Cuoc cap 24-94 (bo 1850: _pingpan_55 dat 13 con)'],
  [r(3720, 3728), 80, '90045', null, 'Tuc Cau cap 10-90'],
  [r(12138, 12140), 80, '90045', null, 'Lau Lan Tam Bao cap 79-94'],
  [r(4130, 4138), 60, '90046', null, 'Q To Chau boss cuoi cap 13-93'],
  [r(13260, 13264), 60, '90046', null, 'Q Lau Lan boss cuoi cap 78-98'],
  [['13456'], 60, '90047', null, 'Sat Tinh Ngo Vinh'],
  [['13447', '13465', '13474', '13483', '13492', '13501', '13510', '13519', '13528', '13537'], 60, null, null, 'Sat Tinh 10 boss khac: bo phieu'],
];

const ghi = process.argv.includes('--ghi');
const dbcRaw = fs.readFileSync(F_DBC, 'latin1'), mdbRaw = fs.readFileSync(F_MDB, 'latin1');
const EOL = s => s.includes('\r\n') ? '\r\n' : '\n';
const E1 = EOL(dbcRaw), E2 = EOL(mdbRaw); console.log('EOL', JSON.stringify(E1), JSON.stringify(E2));
const dbcL = dbcRaw.split(E1), mdbL = mdbRaw.split(E2);
const loi = m => { console.error('LOI: ' + m); process.exit(1); };

// ---- DropBoxContent: chen hop moi sau 90042 ----
const box = {};
dbcL.forEach(l => { const c = l.split('\t'); if (/^\d+$/.test(c[0])) { const it = []; for (let i = 4; i < c.length; i += 2) if (c[i] && c[i] !== '-1') it.push(c[i]); box[c[0]] = { bv: +c[1], it }; } });
for (const [id] of HOP_MOI) if (box[id]) loi('hop ' + id + ' da ton tai');
const mau = dbcL.find(l => l.startsWith('90001\t')).split('\t');
if (mau[4] !== '39910001' || mau.slice(5).some(x => x !== '-1')) loi('mau 90001 khong nhu ky vong');
const iCuoi = dbcL.findIndex(l => l.startsWith('90042\t'));
if (iCuoi < 0) loi('khong thay 90042');
const dongMoi = HOP_MOI.map(([id, bv, it]) => { const c = mau.slice(); c[0] = id; c[1] = String(bv); c[4] = it; return c.join('\t'); });
const dbcMoi = [...dbcL.slice(0, iCuoi + 1), ...dongMoi, ...dbcL.slice(iCuoi + 1)];
HOP_MOI.forEach(([id, bv, it]) => box[id] = { bv, it: [it] });
const laPhieu = b => box[b] && box[b].it.length > 0 && box[b].it.every(x => PH.has(x));

// ---- MonsterDropBoxs ----
const idx = {}; mdbL.forEach((l, i) => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { if (idx[id] !== undefined) loi('trung dong ' + id); idx[id] = i; } });
const bao = [];
for (const [ids, mv, hopP, thay90002, nhan] of KE) {
  for (const id of ids) {
    const i = idx[id]; if (i === undefined) loi('khong co dong ' + id);
    const c = mdbL[i].split('\t');
    if (+c[1] !== mv) loi(`${id} Mv ${c[1]} khac ${mv}`);
    const cu = c.slice(3), nCot = cu.length;
    const coHop = cu.filter(b => b && b !== '-1');
    if (coHop.some(b => !box[b])) loi(id + ' tro toi hop khong ton tai');
    let giu = coHop.filter(b => !laPhieu(b));
    if (giu.includes('90002')) { if (!thay90002) loi(id + ' co 90002 nhung khong co hop thay'); giu = giu.map(b => b === '90002' ? thay90002 : b); }
    if (giu.some(b => box[b].it.some(x => PH.has(x)))) loi(id + ' con hop tron phieu: ' + giu.filter(b => box[b].it.some(x => PH.has(x))));
    const moi = hopP ? [hopP, ...giu] : giu;
    if (moi.length > 20) loi(id + ' qua 20 hop');
    while (moi.length < nCot) moi.push('-1');
    const dong = [...c.slice(0, 3), ...moi].join('\t');
    bao.push([nhan, id, coHop.filter(laPhieu).join('+') || '-', coHop.includes('90002') ? '90002->' + thay90002 : '', hopP || 'BO', cu.length === moi.length ? '' : 'COT!']);
    mdbL[i] = dong;
  }
}
// ---- kiem: thu tu ID tang dan ----
const kiemThuTu = (L, ten) => { let truoc = -1; L.forEach(l => { const id = l.split('\t')[0]; if (/^\d+$/.test(id)) { if (+id <= truoc) loi(ten + ' sai thu tu tai ' + id); truoc = +id; } }); };
kiemThuTu(dbcMoi, 'DropBoxContent'); kiemThuTu(mdbL, 'MonsterDropBoxs');
let nhom = ''; for (const b of bao) { if (b[0] !== nhom) { nhom = b[0]; console.log('## ' + nhom); } console.log('  ' + b.slice(1).join('\t')); }
console.log('so dong quai sua:', bao.length, '| hop moi:', HOP_MOI.length);
if (ghi) {
  fs.writeFileSync(F_DBC, dbcMoi.join(E1), 'latin1');
  fs.writeFileSync(F_MDB, mdbL.join(E2), 'latin1');
  console.log('DA GHI');
}
