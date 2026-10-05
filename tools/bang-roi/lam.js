// Dung lai trang Bang Roi: node tools/bang-roi/lam.js
//   -> tools/bang-roi/bang-roi.html  (ban dang len Artifact, khong co <head>)
//   -> tools/bang-roi/web/index.html (ban day du cho https://netco4.click/, chep len VPS /var/www/netco4/index.html)
// Hai file nay khong commit (.gitignore).
const fs = require('fs'), path = require('path'), cp = require('child_process');
cp.execFileSync(process.execPath, [path.join(__dirname, 'build.js')], { stdio: 'inherit' });
const d = fs.readFileSync(path.join(__dirname, 'data.json'), 'utf8').replace(/</g, '\\u003c');
let h = fs.readFileSync(path.join(__dirname, 'khung.html'), 'utf8');
h = h.replace('/*DATA*/', () => d);
fs.writeFileSync(path.join(__dirname, 'bang-roi.html'), h);

const head = [
  '<!doctype html>',
  '<html lang="vi">',
  '<head>',
  '<meta charset="utf-8">',
  '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">',
  '<meta name="description" content="Tra cứu quái và boss server NetCo4 rơi món gì, tỉ lệ bao nhiêu.">',
  '<style>*,*::before,*::after{box-sizing:border-box}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>',
  ''].join('\n');
fs.mkdirSync(path.join(__dirname, 'web'), { recursive: true });
fs.writeFileSync(path.join(__dirname, 'web', 'index.html'), head + h + '\n</html>\n');
// 05/10: portal admin/mod (tab 📊 Bảng rơi của bot) đọc file này -> chép lên VPS /var/www/netco4/data.json cùng index.html
fs.copyFileSync(path.join(__dirname, 'data.json'), path.join(__dirname, 'web', 'data.json'));
console.log('xong:', path.join(__dirname, 'bang-roi.html'), '+', path.join(__dirname, 'web', 'index.html'));
