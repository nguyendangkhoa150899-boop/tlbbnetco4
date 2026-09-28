#!/usr/bin/env python3
"""NetCo4 admin panel: tai khoan, phat qua, GM, trang thai server.

Chi nghe 127.0.0.1:8088 tren VPS. Mo tu may nha qua SSH tunnel (panel/mo-panel.cmd).
Khong can cai them goi (chi dung thu vien chuan Python 3).

Phat qua: ghi hang doi Server/txt/NetCo4Qua/<GUID>.txt; script Lua 950000
(Public/Data/Script/NetCo4/quatang.lua) phat khi nhan vat dang nhap.
"""
import html
import json
import os
import re
import secrets
import subprocess
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, urlencode, urlparse

HOST, PORT = "127.0.0.1", 8088
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEPLOY = os.path.join(REPO, "deploy")
ROOT = "/opt/tlbb-root"
GAME = ROOT + "/home/tlbb"
QUEUE = GAME + "/Server/txt/NetCo4Qua"
GMLIST = GAME + "/Server/Config/GMList.ini"
MYSQL = "/usr/local/mysql5.0.45/bin/mysql"
LOG = "/opt/tlbb-backup/panel.log"
TOKEN = secrets.token_urlsafe(24)  # doi moi lan khoi dong panel (chong CSRF)


def load_env(path):
    env = {}
    if os.path.exists(path):
        for line in open(path, encoding="utf-8"):
            m = re.match(r'^([A-Z_]+)="?([^"\n]*)"?', line.strip())
            if m:
                env[m.group(1)] = m.group(2)
    return env


SECRETS = load_env(os.path.join(DEPLOY, "secrets.env"))
REV = {v: k for k, v in json.load(open(os.path.join(REPO, "tools", "viscii-map.json"), encoding="utf-8")).items()}


def viscii(b: bytes) -> str:
    return "".join(REV.get(x, chr(x)) for x in b)


def audit(msg):
    with open(LOG, "a", encoding="utf-8") as f:
        f.write(time.strftime("%Y-%m-%d %H:%M:%S ") + msg + "\n")


def sql(query):
    """Chay SQL bang mysql trong chroot. Moi gia tri dua vao query PHAI da duoc kiem tra bang regex."""
    p = subprocess.run(
        ["chroot", ROOT, MYSQL, "-uroot", "-p" + SECRETS.get("MYSQL_ROOT_PASS", ""), "-N", "-B", "-e", query],
        capture_output=True, timeout=20)
    if p.returncode != 0:
        raise RuntimeError(p.stderr.decode("utf-8", "replace").strip())
    return [row.split(b"\t") for row in p.stdout.split(b"\n") if row]


def running(name):
    return subprocess.run(["pgrep", "-x", name], capture_output=True).returncode == 0


def online_count():
    p = subprocess.run(["ss", "-Htn", "state", "established", "( sport = :3731 )"], capture_output=True, text=True)
    return len([l for l in p.stdout.splitlines() if l.strip()])


# ---------------------------------------------------------------- vat pham
ITEMS = []
for fn, kind in [("vat-pham-thuong.tsv", "Vat pham"), ("ngoc-bao-thach.tsv", "Ngoc"), ("trang-bi.tsv", "Trang bi")]:
    path = os.path.join(REPO, "docs", "vat-pham", fn)
    if os.path.exists(path):
        for line in open(path, encoding="utf-8"):
            if line.startswith("#"):
                continue
            c = line.rstrip("\n").split("\t")
            if len(c) >= 2 and c[0].isdigit():
                ITEMS.append((c[0], c[1], kind))
ITEM_NAME = {i: n for i, n, _ in ITEMS}


# ---------------------------------------------------------------- hanh dong
RE_ACC = re.compile(r"^[a-z0-9_]{3,20}$")
RE_PASS = re.compile(r"^[A-Za-z0-9_@.!-]{6,32}$")
RE_INT = re.compile(r"^\d{1,10}$")


def accounts():
    # is_online do billing ghi khi dang nhap / thoat (crash server co the de lai gia tri cu)
    return [(r[0].decode(), r[1].decode(), r[2].decode() == "1")
            for r in sql("SELECT id, name, is_online FROM web.account ORDER BY id")]


def chars():
    rows = sql("SELECT charguid, accname, charname, level FROM tlbbdb.t_char WHERE isvalid=1 ORDER BY charguid")
    return [(r[0].decode(), viscii(r[1]), viscii(r[2]), r[3].decode()) for r in rows]


def gm_guids():
    if not os.path.exists(GMLIST):
        return []
    return re.findall(r"^guid\d+=(\d+)", open(GMLIST, encoding="latin-1").read(), re.M)


def write_gm(guids):
    with open(GMLIST, "w", encoding="ascii", newline="\n") as f:
        f.write("[gm]\ncount=%d\n" % len(guids))
        for i, g in enumerate(guids):
            f.write("guid%d=%s\n" % (i, g))


def pending(guid):
    p = os.path.join(QUEUE, guid + ".txt")
    if not os.path.exists(p):
        return []
    return [l.strip() for l in open(p, encoding="ascii", errors="replace") if l.strip()]


def act(form):
    a = form.get("a", "")
    v = lambda k: form.get(k, "").strip()
    if a == "tao_tk":
        n, pw = v("ten"), v("mk")
        if not RE_ACC.match(n):
            return "Ten chi gom a-z 0-9 _ (3-20 ky tu)"
        if not RE_PASS.match(pw):
            return "Mat khau 6-32 ky tu: chu, so, _@.!-"
        if sql("SELECT id FROM web.account WHERE name='%s'" % n):
            return "Tai khoan %s da ton tai" % n
        sql("INSERT INTO web.account (name, password) VALUES ('%s', MD5('%s'))" % (n, pw))
        audit("tao tai khoan %s" % n)
        return "Da tao tai khoan %s" % n
    if a == "doi_mk":
        n, pw = v("ten"), v("mk")
        if not (RE_ACC.match(n) and RE_PASS.match(pw)):
            return "Ten hoac mat khau khong hop le"
        sql("UPDATE web.account SET password=MD5('%s') WHERE name='%s'" % (pw, n))
        audit("doi mat khau %s" % n)
        return "Da doi mat khau %s" % n
    if a == "xoa_tk":
        n = v("ten")
        if not RE_ACC.match(n) or n == "admin":
            return "Khong xoa duoc tai khoan nay"
        sql("DELETE FROM web.account WHERE name='%s'" % n)
        audit("xoa tai khoan %s" % n)
        return "Da xoa tai khoan %s" % n
    if a == "qua":
        g, kind, val, cnt = v("guid"), v("loai"), v("gt"), v("sl") or "1"
        if g == "all":
            targets = [c[0] for c in chars()]
            if not targets:
                return "Chua co nhan vat nao"
            msgs = [act(dict(form, guid=t)) for t in targets]
            bad = [m for m in msgs if not m.startswith("Da xep")]
            return bad[0] if bad else "Da xep hang qua cho %d nhan vat" % len(targets)
        if not RE_INT.match(g) or kind not in ("item", "knb", "vang") or not RE_INT.match(val) or not RE_INT.match(cnt):
            return "Du lieu qua khong hop le"
        if kind == "item" and val not in ITEM_NAME:
            return "Khong co vat pham ID %s trong danh muc" % val
        if kind == "item" and not 1 <= int(cnt) <= 999:
            return "So luong 1-999"
        if kind == "knb" and not 1 <= int(val) <= 99999:
            return "KNB 1-99999 moi lan"
        os.makedirs(QUEUE, exist_ok=True)
        line = "item %s %s" % (val, cnt) if kind == "item" else "%s %s" % (kind, val)
        with open(os.path.join(QUEUE, g + ".txt"), "a", encoding="ascii", newline="\n") as f:
            f.write(line + "\n")
        audit("qua GUID %s: %s %s" % (g, line, ITEM_NAME.get(val, "") if kind == "item" else ""))
        return "Da xep hang qua cho GUID %s: %s. Nhan vat nhan khi dang nhap (dang online thi thoat ra vao lai)." % (g, line)
    if a == "huy_qua":
        g = v("guid")
        if RE_INT.match(g):
            open(os.path.join(QUEUE, g + ".txt"), "w").close()
            audit("huy qua GUID %s" % g)
            return "Da huy qua cho GUID %s" % g
    if a in ("gm_bat", "gm_tat"):
        g = v("guid")
        if not RE_INT.match(g):
            return "GUID khong hop le"
        cur = gm_guids()
        cur = sorted(set(cur) | {g}) if a == "gm_bat" else [x for x in cur if x != g]
        write_gm(cur)
        audit("%s GUID %s" % (a, g))
        return "Da cap nhat GM list. Can RESTART server de co hieu luc."
    if a == "restart":
        audit("restart server (online: %d)" % online_count())
        subprocess.Popen(["setsid", os.path.join(DEPLOY, "tlbb.sh"), "restart"],
                         stdout=open("/tmp/panel-restart.log", "w"), stderr=subprocess.STDOUT, stdin=subprocess.DEVNULL)
        return "Dang restart (khoang 3 phut). Tai lai trang sau do."
    return "Hanh dong la: " + a


# ---------------------------------------------------------------- giao dien
CSS = """
body{font-family:system-ui,sans-serif;margin:0;background:#f4f5f7;color:#1d2330}
header{background:#1d2330;color:#fff;padding:12px 20px;display:flex;gap:20px;align-items:center;flex-wrap:wrap}
header b{font-size:18px}.st{font-size:13px;opacity:.85}
main{max-width:1100px;margin:0 auto;padding:16px;display:grid;gap:16px}
section{background:#fff;border-radius:8px;padding:14px 16px;box-shadow:0 1px 2px #0001}
h2{font-size:16px;margin:0 0 10px}table{border-collapse:collapse;width:100%;font-size:14px}
td,th{border-bottom:1px solid #e5e7eb;padding:6px 8px;text-align:left;vertical-align:top}
input,select,button{font:inherit;padding:5px 8px;border:1px solid #c9ced6;border-radius:5px}
button{background:#2457d6;color:#fff;border:0;cursor:pointer}button.r{background:#c0392b}button.g{background:#5b6475}
form.in{display:inline}.msg{background:#e7f6ec;border:1px solid #9bd3ad;padding:8px 12px;border-radius:6px}
.row{display:flex;gap:8px;flex-wrap:wrap;align-items:center}.muted{color:#6b7280;font-size:13px}
.on{color:#138a36}.off{color:#c0392b}code{background:#eef0f3;padding:1px 4px;border-radius:3px}
"""


def esc(s):
    return html.escape(str(s))


def btn(action, label, hidden=None, cls="", confirm=None):
    h = "".join('<input type="hidden" name="%s" value="%s">' % (esc(k), esc(v)) for k, v in (hidden or {}).items())
    oc = ' onsubmit="return confirm(%s)"' % esc(json.dumps(confirm)) if confirm else ""
    return ('<form class="in" method="post"%s><input type="hidden" name="t" value="%s">'
            '<input type="hidden" name="a" value="%s">%s<button class="%s">%s</button></form>') % (
        oc, TOKEN, action, h, cls, esc(label))


def page(msg="", q=""):
    procs = " ".join('<span class="%s">%s</span>' % ("on" if running(p) else "off", p)
                     for p in ["mysqld", "billing", "ShareMemory", "Login", "World", "Server"])
    mem = open("/proc/meminfo").read()
    tot = int(re.search(r"MemTotal:\s+(\d+)", mem).group(1)) // 1024
    avail = int(re.search(r"MemAvailable:\s+(\d+)", mem).group(1)) // 1024
    out = ['<!doctype html><meta charset="utf-8"><meta name="viewport" content="width=device-width">',
           '<title>NetCo4 Admin</title><style>%s</style>' % CSS,
           '<header><b>NetCo4 Admin</b><span class="st">%s</span><span class="st">Online: %d</span>'
           '<span class="st">RAM: %d/%d MB</span></header><main>' % (procs, online_count(), tot - avail, tot)]
    if msg:
        out.append('<div class="msg">%s</div>' % esc(msg))
    try:
        accs, chs = accounts(), chars()
    except Exception as e:  # MySQL tat
        out.append('<section><b class="off">Khong doc duoc database: %s</b></section>' % esc(e))
        accs, chs = [], []
    gms = set(gm_guids())

    # Tai khoan
    out.append('<section><h2>Tai khoan (%d)</h2>' % len(accs))
    out.append('<form method="post" class="row"><input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="tao_tk">'
               '<input name="ten" placeholder="ten dang nhap" required pattern="[a-z0-9_]{3,20}">'
               '<input name="mk" placeholder="mat khau" required pattern="[A-Za-z0-9_@.!\\-]{6,32}"><button>Tao tai khoan</button>'
               '<span class="muted">a-z 0-9 _ ; mat khau 6-32 ky tu</span></form><table><tr><th>ID</th><th>Ten</th><th>Online</th><th></th></tr>' % TOKEN)
    online_acc = {n for _, n, on in accs if on}
    for i, n, on in accs:
        doi = ('<form class="in" method="post"><input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="doi_mk">'
               '<input type="hidden" name="ten" value="%s"><input name="mk" placeholder="mat khau moi" size="12" required>'
               '<button class="g">Doi MK</button></form> ') % (TOKEN, esc(n))
        xoa = btn("xoa_tk", "Xoa", {"ten": n}, "r", "Xoa tai khoan %s?" % n) if n != "admin" else ""
        out.append("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s%s</td></tr>" % (
            esc(i), esc(n), '<b class="on">online</b>' if on else '<span class="muted">-</span>', doi, xoa))
    out.append("</table></section>")

    # Nhan vat + phat qua
    give_form = ('<form method="post" class="row"><input type="hidden" name="t" value="%s"><input type="hidden" name="a" value="qua">'
                 '<input type="hidden" name="guid" value="%%s"><select name="loai"><option value="item">Vat pham (ID)</option>'
                 '<option value="knb">KNB</option><option value="vang">Vang</option></select>'
                 '<input name="gt" placeholder="ID / so" size="10" required pattern="\\d{1,10}">'
                 '<input name="sl" placeholder="SL" size="3" value="1" pattern="\\d{1,3}"><button%%s>%%s</button></form>') % TOKEN
    out.append('<section><h2>Nhan vat (%d) - phat qua / GM</h2>' % len(chs))
    out.append('<div class="row"><b>Gui cho TAT CA nhan vat:</b> %s</div><br>' % (
        give_form % ("all", ' class="r" onclick="return confirm(\'Gui cho tat ca nhan vat?\')"', "Gui tat ca")))
    out.append('<table><tr><th>GUID</th><th>Tai khoan</th><th>Nhan vat</th>'
               '<th>Cap</th><th>Online</th><th>GM</th><th>Qua dang cho</th><th>Phat qua</th></tr>')
    for g, acc, name, lv in chs:
        pend = pending(g)
        pend_s = "<br>".join(esc(p + ("  " + ITEM_NAME.get(p.split()[1], "") if p.startswith("item") else "")) for p in pend) or '<span class="muted">-</span>'
        if pend:
            pend_s += "<br>" + btn("huy_qua", "Huy", {"guid": g}, "g")
        gm = (btn("gm_tat", "Tat GM", {"guid": g}, "r") if g in gms else btn("gm_bat", "Cap GM", {"guid": g}, "g"))
        give = give_form % (esc(g), "", "Gui")
        on = '<b class="on">online</b>' if acc in online_acc else '<span class="muted">-</span>'
        out.append("<tr><td>%s</td><td>%s</td><td><b>%s</b></td><td>%s</td><td>%s</td><td>%s%s</td><td>%s</td><td>%s</td></tr>" % (
            esc(g), esc(acc), esc(name), esc(lv), on, "GM " if g in gms else "", gm, pend_s, give))
    out.append('</table><p class="muted">Qua duoc phat khi nhan vat <b>dang nhap</b> (dang online: thoat ra vao lai). '
               'Tui day thi phan con lai nhan o lan sau. Doi GM can restart.</p></section>')

    # Tim vat pham
    out.append('<section><h2>Tim ID vat pham</h2><form method="get" class="row"><input name="q" value="%s" placeholder="vd: Nhan Thach, 重楼, 10422016" size="40">'
               '<button>Tim</button><span class="muted">%d vat pham trong danh muc</span></form>' % (esc(q), len(ITEMS)))
    if q:
        ql = q.lower()
        hits = [it for it in ITEMS if ql in it[1].lower() or ql == it[0]][:80]
        out.append("<table><tr><th>ID</th><th>Ten</th><th>Loai</th></tr>")
        for i, n, k in hits:
            out.append("<tr><td><code>%s</code></td><td>%s</td><td>%s</td></tr>" % (esc(i), esc(n), esc(k)))
        out.append("</table>" if hits else '</table><p class="muted">Khong thay</p>')
    out.append("</section>")

    # Server
    out.append('<section><h2>Server</h2><div class="row">%s<span class="muted">Dang co %d nguoi online se bi ngat ket noi.</span></div></section>' % (
        btn("restart", "Restart server", cls="r", confirm="Restart server? Nguoi dang choi se bi ngat."), online_count()))
    out.append("</main>")
    return "".join(out)


class H(BaseHTTPRequestHandler):
    def _host_ok(self):
        return self.headers.get("Host", "") in ("127.0.0.1:%d" % PORT, "localhost:%d" % PORT)

    def _send(self, body, code=200):
        b = body.encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(b)))
        self.send_header("X-Frame-Options", "DENY")
        self.end_headers()
        self.wfile.write(b)

    def _redirect(self, msg):
        # Post/Redirect/Get: F5 sau khi gui form khong gui lai lan nua
        self.send_response(303)
        self.send_header("Location", "/?" + urlencode({"m": msg}))
        self.send_header("Content-Length", "0")
        self.end_headers()

    def do_GET(self):
        if not self._host_ok():
            return self._send("Forbidden", 403)
        qs = parse_qs(urlparse(self.path).query)
        self._send(page(msg=qs.get("m", [""])[0], q=qs.get("q", [""])[0]))

    def do_POST(self):
        if not self._host_ok():
            return self._send("Forbidden", 403)
        n = int(self.headers.get("Content-Length", 0) or 0)
        form = {k: v[0] for k, v in parse_qs(self.rfile.read(min(n, 10000)).decode("utf-8", "replace")).items()}
        if not secrets.compare_digest(form.get("t", ""), TOKEN):
            return self._redirect("Phien het han (panel vua khoi dong lai). Thu lai.")
        try:
            msg = act(form)
        except Exception as e:
            msg = "Loi: %s" % e
        self._redirect(msg)

    def log_message(self, *a):
        pass


if __name__ == "__main__":
    os.makedirs(QUEUE, exist_ok=True)
    print("NetCo4 panel: http://%s:%d" % (HOST, PORT))
    ThreadingHTTPServer((HOST, PORT), H).serve_forever()
