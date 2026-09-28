// Viet hoa ten trang bi (EquipBase.txt chi co ten tieng Trung, client tu dich phia no).
// Phien am Han-Viet tung chu theo tools/hanviet-map.json, loai trang bi dich nghia, kem cap va quy tac khoa.
//
//   node tools/viet-hoa-trang-bi.js
//       -> docs/vat-pham/ten-viet.tsv (panel dung de hien/tim ten) + cap nhat dong "Trang bi" trong tat-ca-vat-pham.csv
//   node tools/viet-hoa-trang-bi.js --tao-bang <thu muc>
//       -> tao lai tools/hanviet-map.json. <thu muc> chua: hanvietData.js
//          (raw.githubusercontent.com/ph0ngp/hanviet-pinyin-words/main/src/hanvietData.js), Unihan_Readings.txt va
//          Unihan_Variants.txt (giai nen tu unicode.org/Public/UCD/latest/ucd/Unihan.zip)
//
// Ten tao ra la phien am may, co the khac ten client hien (vd 带 -> "Doi" chu khong phai "Dai"). Tim theo ID cho chac.
const fs = require("fs")
const path = require("path")

const REPO = path.join(__dirname, "..")
const EQUIP = path.join(REPO, "server/Public/Config/EquipBase.txt")
const RULE = path.join(REPO, "server/Public/Config/ItemRule.txt")
const TRANGBI = path.join(REPO, "docs/vat-pham/trang-bi.tsv")
const MAP = path.join(__dirname, "hanviet-map.json")
const OUT = path.join(REPO, "docs/vat-pham/ten-viet.tsv")
const CSV = path.join(REPO, "docs/vat-pham/tat-ca-vat-pham.csv")
const CJK = /[㐀-鿿豈-﫿]/

// Cum tu ma game dung am khac am pho bien cua tung chu (ghi y nguyen, khong viet hoa lai)
const CUM = { "重楼": "Trùng Lâu", "无相": "Vô Tướng", "未使用": "(chưa dùng)" }
// Sua am cua nguon du lieu (hanvietData ghi am Nom)
const SUA = { "丝": "ti" }
// Loai trang bi: dich nghia
const LOAI = {
  "帽子": "Mũ", "鞋": "Giày", "手套": "Bao tay", "衣服": "Áo", "护腕": "Hộ uyển", "护肩": "Hộ kiên",
  "单短类": "Đoản binh", "环类": "Hoàn", "双短类": "Song đoản", "枪棒类": "Thương bổng", "扇类": "Quạt",
  "刀斧类": "Đao phủ", "戒指": "Nhẫn", "腰带": "Đai lưng", "项链": "Dây chuyền", "护符": "Hộ phù",
  "长杖类": "Trượng", "弩类": "Nỏ", "坐骑": "Tọa kỵ", "时装": "Thời trang", "暗器": "Ám khí",
  "豪侠印": "Hào hiệp ấn", "武魂": "Võ hồn", "幻饰武器": "Huyễn sức vũ khí", "行囊": "Hành nang",
  "格箱": "Cách tương", "龙纹": "Long văn", "帮会令牌": "Lệnh bài bang", "工具": "Công cụ",
  "蒲扇": "Quạt", "芭蕉扇": "Quạt", "玄铁扇": "Quạt", "宫扇": "Quạt", "预留2": "Dự phòng",
}

const lines = f => fs.readFileSync(f, "utf8").split(/\r?\n/)
const gbk = f => new TextDecoder("gbk").decode(fs.readFileSync(f)).split(/\r?\n/)

function taoBang(dir) {
  const HV = JSON.parse(fs.readFileSync(path.join(dir, "hanvietData.js"), "utf8")
    .replace(/^export const hanvietData = /, "").replace(/;\s*$/, ""))
  const cp = u => String.fromCodePoint(parseInt(u.slice(2), 16))
  const UVN = {}, TRAD = {}, MAND = {}
  for (const l of lines(path.join(dir, "Unihan_Readings.txt"))) {
    const c = l.split("\t")
    if (!c[0].startsWith("U+")) continue
    if (c[1] === "kVietnamese") UVN[cp(c[0])] = c[2].trim().split(/\s+/)
    if (c[1] === "kMandarin") MAND[cp(c[0])] = c[2].trim().split(/\s+/)[0]
  }
  for (const l of lines(path.join(dir, "Unihan_Variants.txt"))) {
    const c = l.split("\t")
    if (c[0].startsWith("U+") && c[1] === "kTraditionalVariant") TRAD[cp(c[0])] = c[2].trim().split(/\s+/).map(cp)
  }
  const TONE = { "ā": "a1", "á": "a2", "ǎ": "a3", "à": "a4", "ē": "e1", "é": "e2", "ě": "e3", "è": "e4", "ī": "i1", "í": "i2",
    "ǐ": "i3", "ì": "i4", "ō": "o1", "ó": "o2", "ǒ": "o3", "ò": "o4", "ū": "u1", "ú": "u2", "ǔ": "u3", "ù": "u4",
    "ǖ": "v1", "ǘ": "v2", "ǚ": "v3", "ǜ": "v4", "ü": "v0" }
  const so = p => { // "zhòng" -> "zhong4"
    if (!p) return null
    let t = 5, o = ""
    for (const ch of p) { if (TONE[ch]) { o += TONE[ch][0]; if (TONE[ch][1] !== "0") t = +TONE[ch][1] } else o += ch }
    return o.replace(/v/g, "u:") + t
  }
  const tra = (e, p) => { // hanvietData: { pinyin: [am...] } hoac { "*": [am...] }
    if (!e) return null
    if (e["*"] && e["*"].length) return e["*"][0]
    const n = so(p)
    if (n) for (const k of [n, n.replace("u:", "v"), n.replace("u:", "u")]) if (e[k] && e[k].length) return e[k][0]
    for (const k in e) if (e[k].length) return e[k][0]
    return null
  }
  const duPhong = []
  const doc = ch => {
    let r = tra(HV[ch], MAND[ch])
    if (r) return r
    for (const t of TRAD[ch] || []) { r = tra(HV[t], MAND[t] || MAND[ch]); if (r) return r }
    r = UVN[ch] ? UVN[ch][0] : (TRAD[ch] || []).map(t => UVN[t] && UVN[t][0]).find(x => x)
    if (r) duPhong.push(ch + "=" + r)
    return r || null
  }
  // Lay chu tu trang-bi.tsv (ten da giai ma dung), khong doc EquipBase.txt bang GBK (co dong VISCII)
  const chu = new Set()
  for (const l of lines(TRANGBI)) {
    const c = l.split("\t")
    if (/^\d+$/.test(c[0])) for (const ch of (c[1] || "") + (c[2] || "")) if (CJK.test(ch)) chu.add(ch)
  }
  const m = { "_nguon": JSON.parse(fs.readFileSync(MAP, "utf8"))._nguon }
  const thieu = []
  for (const ch of [...chu].sort()) { const r = doc(ch); if (r) m[ch] = r; else thieu.push(ch) }
  fs.writeFileSync(MAP, JSON.stringify(m).replace(/,"/g, ",\n\"") + "\n")
  console.log("hanviet-map.json: %d chu, thieu %d: %s", Object.keys(m).length - 1, thieu.length, thieu.join(""))
  console.log("lay tu Unihan kVietnamese (co the la am Nom, nen xem lai): %s", duPhong.join(" "))
}

function vietHoa() {
  const M = JSON.parse(fs.readFileSync(MAP, "utf8"))
  const hoa = s => s.charAt(0).toUpperCase() + s.slice(1)
  const thieu = new Set()
  const ten = zh => { // "#cFF0000真·重楼甲" -> "Chân-Trùng Lâu Giáp"
    const s = zh.replace(/#c[0-9A-Fa-f]{6}/g, "")
    const out = []
    let run = "" // cum ky tu khong phai chu Han (so, chu Latin, tieng Viet) giu nguyen
    const day = () => { if (run.trim()) out.push(run.trim()); run = "" }
    for (let i = 0; i < s.length;) {
      const cum = Object.keys(CUM).find(k => s.startsWith(k, i))
      if (cum) { day(); out.push(CUM[cum]); i += cum.length; continue }
      const ch = String.fromCodePoint(s.codePointAt(i))
      i += ch.length
      const am = SUA[ch] || M[ch]
      if (CJK.test(ch)) { day(); if (am) out.push(hoa(am)); else { out.push(ch); thieu.add(ch) } }
      else if (ch === "·") { day(); out.push("-") }
      else run += ch === "：" ? ":" : ch
    }
    day()
    return out.join(" ").replace(/ ?- ?/g, "-").replace(/ :/g, ":")
  }
  // ItemRule.txt: cot 5 交易, 7 拾取绑定, 8 装备绑定
  const khoa = {}
  for (const l of gbk(RULE)) {
    const c = l.split("\t")
    if (/^\d+$/.test(c[0])) khoa[c[0]] = c[7] === "1" ? "khóa" : c[8] === "1" ? "khóa khi mặc" : c[5] === "0" ? "không giao dịch" : "giao dịch được"
  }
  // Ten/loai lay tu trang-bi.tsv (da giai ma dung: co dong server cu Viet hoa bang VISCII, doc nham GBK ra chu rac).
  // EquipBase.txt chi lay cot so: 8 quy tac, 12 cap
  const eb = {}
  for (const l of fs.readFileSync(EQUIP, "latin1").split(/\r?\n/)) { const c = l.split("\t"); if (/^\d{8}$/.test(c[0])) eb[c[0]] = c }
  const rows = {}
  for (const l of lines(TRANGBI)) {
    const c = l.split("\t")
    if (!/^\d+$/.test(c[0])) continue
    const e = eb[c[0]] || [], lz = c[2] || ""
    rows[c[0]] = { ten: ten(c[1]), loai: LOAI[lz] || (CJK.test(lz) ? ten(lz) : lz), cap: e[11] || "", khoa: khoa[e[7]] || "", goc: c[1].replace(/#c[0-9A-Fa-f]{6}/g, "") }
  }
  const out = ["# Ten tieng Viet cho trang bi (trang-bi.tsv chi co ten tieng Trung). Tao bang tools/viet-hoa-trang-bi.js, dung chinh sua tay.",
    "# Ten = phien am Han-Viet may, co the khac ten client hien. Cot: ID, Ten, Loai, Cap, Khoa, Ten goc"]
  for (const [id, r] of Object.entries(rows)) out.push([id, r.ten, r.loai, r.cap, r.khoa, r.goc].join("\t"))
  fs.writeFileSync(OUT, out.join("\n") + "\n")

  // tat-ca-vat-pham.csv (mo bang Excel): dong Trang bi -> ten Viet, cot 4 = "Loai, cap X, khoa - ten goc"
  const q = s => /[",\n]/.test(s) ? '"' + s.replace(/"/g, '""') + '"' : s
  const raw = fs.readFileSync(CSV, "utf8")
  const nl = raw.includes("\r\n") ? "\r\n" : "\n"
  let doi = 0
  const csv = raw.split(/\r?\n/).map(l => {
    const m = l.match(/^(\d{8}),/)
    if (!m || !rows[m[1]] || !/,Trang bi,/.test(l)) return l
    const r = rows[m[1]]
    doi++
    return [m[1], q(r.ten), "Trang bi", q(`${r.loai}, cấp ${r.cap}, ${r.khoa} - ${r.goc}`)].join(",")
  })
  fs.writeFileSync(CSV, csv.join(nl))
  console.log("ten-viet.tsv: %d trang bi | tat-ca-vat-pham.csv: doi %d dong | chu chua co am: %s", Object.keys(rows).length, doi, [...thieu].join("") || "khong")
}

if (process.argv[2] === "--tao-bang") taoBang(process.argv[3])
else vietHoa()
