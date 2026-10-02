// Quet nhanh script boss / pho ban theo cac loai loi DA GAP THAT o server nay (docs/BOSS-PHO-BAN.md muc "Loai loi").
// Chi la goi y: moi dong canh bao phai mo code ra xem lai, khong sua theo may.
//   node tools/soat-boss/soat.js <ID script | duong dan> [...]
//   node tools/soat-boss/soat.js 894000 894001 894004 894007
const c = require('./_chung');
const args = process.argv.slice(2);
if (!args.length) { console.log('cach dung: node tools/soat-boss/soat.js <ID script | duong dan> [...]'); process.exit(1); }
const Q = c.quai(), R = c.roi(), HU = c.hieuUng(), SD = c.scriptDat(), AI = c.aiDat();
const NGHI_HU = /治疗|回血|恢复|回春|无敌|灵芝|满血/;
const HU_LEN = { 6446: 'server cu dung thay buff boss (hoi 50%)', 6781: 'server cu dung thay buff cuong bao (hoi 30%)' };
const fmtSai = /%(?![-+ #0]*\d*(?:\.\d+)?[diouxXeEfgGqsc%])/;

// bo chu thich (khong cat trong chuoi)
const boCT = l => { let q = false; for (let k = 0; k < l.length - 1; k++) { const ch = l[k]; if (ch === '\\' && q) { k++; continue; } if (ch === '"') q = !q; else if (!q && ch === '-' && l[k + 1] === '-') return l.slice(0, k); } return l; };
const chuoiRaw = s => s.replace(/\\(\d{1,3})/g, (a, d) => String.fromCharCode(+d));

for (const x of args) {
  const p = c.timScript(x);
  const raw = c.doc(p);
  const L = raw.split('\n').map(l => l.replace(/\r$/, ''));
  const code = L.map(boCT);
  const all = code.join('\n');
  const noStr = all.replace(/"(?:\\.|[^"\\\n])*"/g, '""');
  const out = [];
  const add = (muc, s) => out.push('  [' + muc + '] ' + s);

  // 1. ham goi ma khong dinh nghia (trong cung file)
  const def = new Set([...noStr.matchAll(/function\s+(x\d+_\w+)/g)].map(m => m[1]));
  const id = def.size ? [...def][0].split('_')[0] : null;
  if (id) { const thieu = new Set(); for (const m of noStr.matchAll(/\b(x\d+_\w+)\s*\(/g)) if (m[1].startsWith(id + '_') && !def.has(m[1])) thieu.add(m[1]); if (thieu.size) add('NANG', 'goi ham khong co trong file (file bi cat cut?): ' + [...thieu].join(', ')); }
  // file ket thuc
  const cuoi = code.filter(l => l.trim()).slice(-1)[0] || '';
  if (!/^\s*end\b/.test(cuoi)) add('NGHI', 'dong code cuoi khong phai "end": ' + c.viscii(cuoi).trim().slice(0, 60));

  // 2. cap toi da 119
  code.forEach((l, i) => {
    if (/PlayerMaxLevel\s*\/\s*10/.test(l) && !/floor\s*\(\s*PlayerMaxLevel\s*\/\s*10/.test(l)) add('NANG', (i + 1) + ': PlayerMaxLevel/10 khong floor -> 11.9 -> bang[...] = nil (doi cap 119): ' + l.trim().slice(0, 90));
    if (/^\s*iniLevel\s*=\s*PlayerMaxLevel\s*;?\s*$/.test(l)) add('NANG?', (i + 1) + ': iniLevel = PlayerMaxLevel (119) -> neu sau do /10 lam chi so bang thi nil. Xem cho dung iniLevel/10');
  });

  // 3. ID quai: bang so 4-5 chu so trong LuaFnCreateMonster / bang *Boss*/*Monster*/*ID*
  const ids = new Set();
  for (const m of noStr.matchAll(/LuaFnCreateMonster\(\s*\w+\s*,\s*(\d{3,5})\s*,/g)) ids.add(m[1]);
  for (const m of noStr.matchAll(/(?:DataID|MonsterID|BossID|MstID)\s*=\s*(\d{3,5})\b/gi)) ids.add(m[1]);
  for (const m of noStr.matchAll(/_\w*(?:Monster|Boss|BOSS|Mst|XiaoBing|Guai|guai|ID)\w*\s*=\s*\{([^}]*)\}/g)) for (const n of m[1].match(/\b\d{4,5}\b/g) || []) ids.add(n);
  const khong = [...ids].filter(i => !Q[i]);
  if (khong.length) add('NANG', 'ID quai khong co trong MonsterAttrExTable: ' + khong.join(','));
  const boss = [...ids].filter(i => Q[i]);
  // 4. script / AI gan cho quai
  for (const m of noStr.matchAll(/LuaFnCreateMonster\(\s*\w+\s*,[^,]+,[^,]+,[^,]+,[^,]+,\s*(-?\d+)\s*,\s*(-?\d+)\s*\)/g)) {
    if (+m[1] > 0 && !AI[m[1]]) add('NANG', 'AI ' + m[1] + ' khong co trong AIScript.dat');
    if (+m[2] > 0 && !SD[String(+m[2])]) add('NANG', 'script quai ' + m[2] + ' khong dang ky trong Script.dat');
  }
  for (const m of noStr.matchAll(/ScriptID\s*=\s*(\d+)/g)) if (!SD[String(+m[1])]) add('NANG', 'ScriptID ' + m[1] + ' khong dang ky trong Script.dat');
  for (const m of noStr.matchAll(/CallScriptFunction\(\s*\(?\s*(\d+)\s*\)?\s*,/g)) if (!SD[String(+m[1])]) add('NANG', 'CallScriptFunction(' + m[1] + ') - script khong dang ky');

  // 5. hieu ung
  const hu = new Set();
  for (const m of noStr.matchAll(/SendSpecificImpactToUnit\([^)]*?,\s*(\d{2,5})\s*,\s*\d+\s*\)/g)) hu.add(m[1]);
  for (const m of noStr.matchAll(/_\w*(?:Buff|Impact|BUFF)\w*\s*=\s*\{?\s*([\d,\s]+)\}?/g)) for (const n of m[1].match(/\b\d{2,5}\b/g) || []) hu.add(n);
  for (const h of hu) { if (HU_LEN[h]) add('NANG', 'hieu ung ' + h + ' = ' + HU_LEN[h] + ' (' + (HU[h] || '') + ')'); else if (NGHI_HU.test(HU[h] || '')) add('NGHI', 'hieu ung hoi mau / bat tu ' + h + ' ' + HU[h] + ' - xem ai nhan, may lan'); }

  // 6. GetMonsterCount ma ham khong kiem con song
  const ham = all.split(/\n(?=\s*function\s)/);
  for (const h of ham) if (/GetMonsterCount\s*\(/.test(h) && /==\s*0|<=\s*0|<\s*1|count\s*==|Count\s*==/.test(h) && !/IsCharacterLiving/.test(h)) { const t = (h.match(/function\s+(\S+?)\s*\(/) || [])[1]; add('NGHI', 'ham ' + t + ': dem GetMonsterCount (ca xac chet) ma khong kiem LuaFnIsCharacterLiving'); }

  // 7. chuoi hien cho nguoi choi: tieng Trung, qua 254 byte, format sai %
  code.forEach((l, i) => {
    for (const m of l.matchAll(/"((?:\\.|[^"\\])*)"/g)) {
      const s = chuoiRaw(m[1]);
      const hiB = [...s].filter(ch => ch.charCodeAt(0) > 127).length;
      // GBK: nhieu cap byte >= 0x81 lien nhau, it chu Latin
      const gb = (s.match(/[\x81-\xfe][\x40-\xfe]/g) || []).length, la = (s.match(/[A-Za-z]/g) || []).length;
      if (hiB >= 4 && gb * 2 >= hiB * 0.9 && la < s.length * 0.25) add('VUA', (i + 1) + ': chuoi tieng Trung (client hien chu rac): ' + c.gbk(s).slice(0, 40));
      if (s.length > 254 && /AddText|AddNumText|Tip|format|NpcChat|BroadMsg|Msg2Player/.test(l)) add('VUA', (i + 1) + ': chuoi ' + s.length + ' byte > 254 -> client cat mat: ' + c.viscii(s).slice(0, 50));
    }
    const fm = l.match(/\bformat\s*\(\s*"((?:\\.|[^"\\])*)"/);
    if (fm && fmtSai.test(fm[1].replace(/%%/g, ''))) add('NANG', (i + 1) + ': format() co "%" khong hop le -> loi "invalid option in format", ham dung giua chung: ' + c.viscii(fm[1]).slice(0, 60));
  });

  // 8. tui boss
  const tb = code.map((l, i) => /TB_Ghi/.test(l) ? i + 1 : 0).filter(Boolean);

  console.log('\n=== ' + c.path.relative(c.SCRIPT, p) + (id ? '  (' + id + ')' : '') + '  ' + L.length + ' dong, ' + def.size + ' ham' + (tb.length ? '  | goi tui boss o dong ' + tb.join(',') : ''));
  if (boss.length) {
    const nhom = {}; for (const i of boss) { const k = Q[i].ten; (nhom[k] = nhom[k] || []).push(i + (R[i] && R[i].length ? '' : '*')); }
    console.log('  quai: ' + Object.entries(nhom).map(([k, v]) => k + ' ' + (v.length > 4 ? v[0] + '..' + v[v.length - 1] + ' (' + v.length + ')' : v.join(','))).join(' | ') + '   (* = khong co hop roi)');
  }
  console.log(out.length ? out.join('\n') : '  khong thay dau hieu loi da biet');
}
