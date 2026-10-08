// Tach cac goi AXPK GIAU trong OgreMain.dll (Config.axp, Interface.axp - client khong co file nay tren dia, OgreMain
// (Themida) tu giai nen vao RAM luc chay). Dau vao = anh OgreMain chep tu RAM game (dumpmod.ps1). Ra img/goiN.axp.
//   node tachgoi.js <img/OgreMain.dll_<base>.img>
// Goi co CharModelEx.txt / MonsterAttrExTable.txt / PetAttrTable.txt (client) la Config (lan 08/10: goi thu 2, ~145 MB).
const fs = require('fs'), path = require('path'); const { mo } = require('./trich.js');
const [, , ANH] = process.argv; if (!ANH) { console.log('node tachgoi.js <anh OgreMain.img>'); process.exit(1); }
const b = fs.readFileSync(ANH); const RA = path.join(__dirname, 'img'); fs.mkdirSync(RA, { recursive: true });
let i = -1, k = 0;
while ((i = b.indexOf('AXPK', i + 1)) >= 0) {
  const ho = b.readUInt32LE(i + 12), bo = b.readUInt32LE(i + 16), bc = b.readUInt32LE(i + 20);
  if (ho !== 0x28 || bo !== 0x28 + 32768 * 12 || !bc || bc > 200000) continue;   // dau goi that (bang bam 32768 o)
  let het = 0; for (let j = 0; j < bc; j++) { const o = b.readUInt32LE(i + bo + j * 12), n = b.readUInt32LE(i + bo + j * 12 + 4); het = Math.max(het, o + n); }
  const f = path.join(RA, 'goi' + ++k + '.axp'); fs.writeFileSync(f, b.subarray(i, i + het));
  const A = mo(f); const co = A.ds.filter((x) => /^CharModelEx\.txt$/i.test(x.ten)).length;
  console.log(path.basename(f), bc, 'khoi', (het / 1048576).toFixed(1) + ' MB', A.ds.length, 'file', co ? '<- Config (co CharModelEx.txt)' : '');
}
