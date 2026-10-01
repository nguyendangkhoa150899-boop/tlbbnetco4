// Dung lai trang Bang Roi: node tools/bang-roi/lam.js  -> tools/bang-roi/bang-roi.html (khong commit file html, dang len Artifact)
const fs = require('fs'), path = require('path'), cp = require('child_process');
cp.execFileSync(process.execPath, [path.join(__dirname, 'build.js')], { stdio: 'inherit' });
const d = fs.readFileSync(path.join(__dirname, 'data.json'), 'utf8').replace(/</g, '\u003c');
let h = fs.readFileSync(path.join(__dirname, 'khung.html'), 'utf8');
h = h.replace('<div><b>Chưa có trong trang:</b> đồ boss tự rơi bằng script riêng', '<div><b>Túc Cầu:</b> mọi quả túc cầu rơi Tử Vi Linh Phách 30% mỗi người (script, từ 02/10), boss Tôn Mỹ Mỹ rơi theo bảng.</div>\n    <div><b>Chưa có trong trang:</b> đồ boss tự rơi bằng script riêng');
fs.writeFileSync(path.join(__dirname, 'bang-roi.html'), h.replace('/*DATA*/', () => d));
console.log('xong:', path.join(__dirname, 'bang-roi.html'));
