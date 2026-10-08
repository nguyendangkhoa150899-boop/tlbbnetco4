// Xem thu ket qua dungall.js tren may: node xem.js -> http://127.0.0.1:8091/xem.html?t=<ma trung> (chi 127.0.0.1)
// /p3.js = bo xem dung chung lay tu repo bot (BotDoMin/pet3d.client.js, canh ghepngoc.js trong duongdan.js)
const http = require('http'), fs = require('fs'), path = require('path'); const P = require('./duongdan.js');
const RA = path.join(__dirname, 'ra', 'pet3d'), P3 = path.join(path.dirname(P.GHEPNGOC_JS), 'pet3d.client.js');
http.createServer((q, r) => {
  const p = decodeURIComponent(q.url.split('?')[0]);
  const f = p === '/xem.html' || p === '/' ? path.join(__dirname, 'xem.html') : p === '/p3.js' ? P3 : path.join(RA, path.normalize(p.replace(/^\/p\//, '/')));
  if (!([path.join(__dirname, 'xem.html'), P3].includes(f) || f.startsWith(RA)) || !fs.existsSync(f) || fs.statSync(f).isDirectory()) { r.writeHead(404); return r.end('404'); }
  r.writeHead(200, { 'Content-Type': f.endsWith('.html') ? 'text/html; charset=utf-8' : f.endsWith('.js') ? 'application/javascript; charset=utf-8' : f.endsWith('.json') ? 'application/json' : 'application/octet-stream', 'Cache-Control': 'no-store' });
  fs.createReadStream(f).pipe(r);
}).listen(8091, '127.0.0.1', () => console.log('http://127.0.0.1:8091/xem.html?t=30309847'));
