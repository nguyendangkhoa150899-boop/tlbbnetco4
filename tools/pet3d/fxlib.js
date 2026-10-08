// Doc script van ban cua Ogre/Fairy (all.effect, all.particle): chi muc dinh nghia cap ngoai cung + lay than khoi { }.
// Dinh nghia: dong "<tu khoa> <ten>" hoac "<ten>" (he hat trong all.particle khong co tu khoa) roi dong "{".
// all.material co ngoac lech -> dung do chuoi "material <ten>" truc tiep (xem khoiMat trong dungall.js).
function than(S, j) { let d = 0, k = j; for (; k < S.length; k++) { if (S[k] === '{') d++; else if (S[k] === '}' && --d === 0) break; } return S.slice(j, k + 1); }
function chiMuc(S) {
  const M = new Map(); const L = S.split('\n'); let o = 0, d = 0;
  for (let i = 0; i < L.length; i++) {
    const t = L[i].trim();
    if (d === 0 && t && !/[{}]/.test(t) && !t.startsWith('//')) {
      let j = i + 1, oj = o + L[i].length + 1; while (j < L.length && !L[j].trim()) { oj += L[j].length + 1; j++; }
      if (j < L.length && L[j].trim().startsWith('{')) M.set(t.replace(/^(effect|particle_system|system)\s+/, ''), oj + L[j].indexOf('{'));
    }
    for (const c of L[i]) { if (c === '{') d++; else if (c === '}') d--; }
    o += L[i].length + 1;
  }
  return M;
}
module.exports = { chiMuc, than };
