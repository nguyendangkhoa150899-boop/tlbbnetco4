// 05/10 (chủ server): Kỳ Cuộc thường (Cờ 12h, efuben_1_zhenlong_huodong.lua 401001) mở 24/24, vẫn 1 lượt/ngày (MD_LAST_QIJU_DAY, ngày lịch).
//  - khung 1: 11:30-14:30 -> 00:00-24:00 (khung 2 20:30-22:00 nằm gọn trong, giữ nguyên). IsActivityOpen dùng ở cả lúc vào
//    lẫn mỗi tick trong phó bản -> 00:00 vẫn trong khung nên qua nửa đêm phó bản không bị đóng.
//  - tắt câu "Phó bản hiện tại X giờ Y phút sau sẽ đóng" (tick 2) khi mở cả ngày (sẽ báo sai, đếm tới nửa đêm).
// Sửa theo byte (latin1), giữ CRLF. node tools/kycuoc-24h-05-10.js [--ghi]
const fs = require('fs'), path = require('path');
const F = path.join(__dirname, '../server/Public/Data/Script/event/fuben/efuben_1_zhenlong_huodong.lua');
const ghi = process.argv.includes('--ghi');
const loi = m => { console.error('LOI: ' + m); process.exit(1); };
const L = fs.readFileSync(F, 'latin1').split('\r\n');
const mot = (s) => { const ds = L.map((l, i) => l.includes(s) ? i : -1).filter(i => i >= 0); if (ds.length !== 1) loi(`"${s}" xuat hien ${ds.length} lan`); return ds[0]; };
const a = mot('x401001_g_beginTime1 = 11 * 60 + 30;');
L[a] = 'x401001_g_beginTime1 = 0;   -- [NetCo4 05/10] mo 24/24 (cu 11:30); van 1 luot/ngay (MD_LAST_QIJU_DAY)';
const b = mot('x401001_g_endTime1 = 14 * 60 + 30;');
L[b] = 'x401001_g_endTime1 = 24 * 60;   -- [NetCo4 05/10] cu 14:30. Khung 2 (20:30-22:00) nam trong khung 1, giu nguyen';
const c = mot('		if tempTimes > 0 then');
L[c] = L[c].replace('if tempTimes > 0 then', 'if tempTimes > 0 and x401001_g_endTime1 < 24 * 60 then   -- [NetCo4 05/10] mo ca ngay: khong bao "sau X gio se dong"');
console.log('dong', a + 1, b + 1, c + 1);
if (ghi) { fs.writeFileSync(F, L.join('\r\n'), 'latin1'); console.log('DA GHI'); }
