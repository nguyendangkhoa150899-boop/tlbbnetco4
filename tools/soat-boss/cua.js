// Danh sach phu ban cua NPC truyen tong (obj/luoyang/xiezi_fubenchuan.lua, script 000201) -> diem den -> NPC vao cua gan do -> script.
// Dung khi can biet "phu ban X bat dau tu script nao".
//   node tools/soat-boss/cua.js
const c = require('./_chung');
const npcFile = c.path.join(c.SCRIPT, 'obj/luoyang/xiezi_fubenchuan.lua');
const L = c.doc(npcFile).split('\n');
// AddNumText(..., "[=75 cap ] Ten", 10, 415) ... "if GetNumText() == 415" ... TransferFunc(sceneId, selfId, scene, x, z, cap)
const ten = {}; for (const l of L) { const m = l.match(/AddNumText\([^"]*"([^"]*)"\s*,\s*\d+\s*,\s*(\d+)\s*\)/); if (m) ten[m[2]] = c.viscii(m[1]).replace(/\s+/g, ' ').trim(); }
const den = {}; let cur = null;
for (const l of L) { const m = l.match(/GetNumText\(\)\s*==\s*(\d+)/); if (m) cur = m[1]; const t = l.match(/TransferFunc"\s*,\s*sceneId\s*,\s*selfId\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)/); if (t && cur) { den[cur] = [+t[1], +t[2], +t[3]]; cur = null; } }
const si = c.doc(c.path.join(c.SV, 'Public/Config/SceneInfo.ini'));
const scn = {}; for (const m of si.matchAll(/\[scene(\d+)\][^\[]*?file=(\S+)\.scn/g)) scn[m[1]] = m[2];
const sd = c.scriptDat();
const cache = {};
function npc(s) {
  if (cache[s]) return cache[s];
  const out = [];
  const dir = c.path.join(c.SV, 'Public/Scene');
  for (const f of c.fs.readdirSync(dir).filter(f => f.toLowerCase() === (scn[s] || '').toLowerCase() + '_monster.ini')) {
    for (const b of c.doc(c.path.join(dir, f)).split(/\r?\n(?=\[monster)/)) {
      const g = k => (b.match(new RegExp('^' + k + '=(.*)$', 'm')) || [])[1];
      const sid = (g('script_id') || '').trim(); if (!sid || sid === '-1') continue;
      out.push({ ten: c.viscii(g('name') || '').trim(), title: c.viscii(g('title') || '').trim(), x: +g('pos_x'), z: +g('pos_z'), sid: sid.replace(/^0+/, ''), type: g('type') });
    }
  }
  return cache[s] = out;
}
for (const k of Object.keys(ten)) {
  if (!den[k]) continue;
  const [s, x, z] = den[k];
  const gan = npc(s).map(n => ({ ...n, d: Math.hypot(n.x - x, n.z - z) })).filter(n => n.d <= 9).sort((a, b) => a.d - b.d).slice(0, 3);
  console.log('\n## ' + ten[k] + '   (scene ' + s + ' ' + (scn[s] || '?') + ' ' + x + ',' + z + ')');
  for (const n of gan) console.log('   ' + n.d.toFixed(1).padStart(4) + '  ' + n.ten + (n.title ? ' [' + n.title + ']' : '') + '  type ' + n.type + '  script ' + n.sid + ' = ' + (sd[n.sid] || 'KHONG DANG KY'));
}
