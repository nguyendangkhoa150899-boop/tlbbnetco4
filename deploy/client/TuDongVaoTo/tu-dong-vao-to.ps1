# NetCo4: tu dong bam "Dong y" khi co nguoi moi vao to doi (bang "... hy vong cac ha cung nhom, dong y khong?").
# Game khong co tuy chon tu nhan to (System.cfg chi co RefuseTeamRequest = tu choi), server cung khong can thiep
# duoc (loi moi to do World + client xu ly, khong qua Lua). Nen cong cu nay chay tren MAY NGUOI CHOI:
# chup man hinh cua so game ~3 lan/giay, thay bang moi to thi di chuot toi nut "Dong y", bam, tra chuot ve cho cu.
#
# Cach nhan ra bang moi to (de khong bam nham bang giao dich / thach dau cung co nut Dong y):
#   mau\nut-dong-y.png   = chu "Dong y" tren nut (bat buoc)
#   mau\nut-cu-tuyet.png = chu "Cu tuyet" tren nut ngay ben phai (co file thi bat buoc phai thay)
#   mau\chu-*.png        = chu phai co trong bang, phia tren nut (bat buoc it nhat 1; mac dinh chu-1.png = "nhom,")
# Chi nhan nut thoi la NGUY HIEM: chu "Dong y" con o bang xac nhan mua Tiem KNB, "Dong y chi ra KNB", nut cong diem.
# Mau mac dinh cat tu anh chup game 1280x720. May nao khong bam thi lay mau lai bang Ctrl+F9 / Ctrl+F10 (xem HUONG-DAN.txt).
#
# Chay: CHAY.cmd (hoac powershell -ExecutionPolicy Bypass -File tu-dong-vao-to.ps1). Dong cua so = tat.
# Kiem tra tren anh chup:  .\tu-dong-vao-to.ps1 -ThuAnh anh.png
# Tao mau tu anh chup:     .\tu-dong-vao-to.ps1 -MauTuAnh anh.png -Nut 224,195 -Chu 238,128   (toa do giua nut / giua chu)
# File chi dung ky tu ASCII.
param(
    [string]$ThuAnh = '',
    [string]$MauTuAnh = '',
    [string]$Nut = '',
    [string]$Chu = ''
)
$ErrorActionPreference = 'Stop'

$code = @'
using System;
using System.IO;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Threading;
using System.Security.Principal;

// Anh xam: do sang 0..255 cua tung diem
public class NcAnh {
    public int W, H;
    public byte[] L;
    public NcAnh(int w, int h) { W = w; H = h; L = new byte[w * h]; }
    static byte[] px = new byte[0];   // dung lai giua cac lan chup
    public static NcAnh TuBitmap(Bitmap b) {
        NcAnh a = new NcAnh(b.Width, b.Height);
        BitmapData d = b.LockBits(new Rectangle(0, 0, b.Width, b.Height), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
        int stride = d.Stride, n = stride * b.Height;
        if (px.Length < n) px = new byte[n];
        Marshal.Copy(d.Scan0, px, 0, n);
        b.UnlockBits(d);
        byte[] p = px, L = a.L;
        for (int y = 0; y < b.Height; y++) {
            int o = y * stride, k = y * b.Width, e = k + b.Width;
            for (; k < e; k++, o += 4)
                L[k] = (byte)((p[o + 2] * 77 + p[o + 1] * 150 + p[o] * 29) >> 8);   // do sang ~ 0.30R + 0.59G + 0.11B
        }
        return a;
    }
}

// Mau can tim: moi diem la "sang" (net chu) hoac "toi" (nen). So khop theo nguong T de chiu duoc nen hoi trong suot.
public class NcMau {
    public string Ten;
    public int W, H, T, ChoSai, Nhanh;
    public int[] Dx, Dy;
    public bool[] Sg;
    public static NcMau TuAnh(NcAnh a) {
        int n = a.L.Length, split = 170, demSang = 0;
        foreach (byte v in a.L) if (v >= 170) demSang++;
        if (demSang < 6) split = NcAuto.Otsu(a.L);
        long tong = 0; int ns = 0, maxToi = 0;
        foreach (byte v in a.L) { if (v >= split) { tong += v; ns++; } else if (v > maxToi) maxToi = v; }
        if (ns < 6 || ns > n - 6) return null;
        NcMau m = new NcMau();
        m.W = a.W; m.H = a.H;
        m.T = (int)((tong / ns + maxToi) / 2);
        List<int> sang = new List<int>(), toi = new List<int>();
        for (int i = 0; i < n; i++) { if (a.L[i] > m.T) sang.Add(i); else toi.Add(i); }
        if (sang.Count < 6 || toi.Count < 6) return null;
        Tron(sang, 12345u); Tron(toi, 54321u);
        // thu tu kiem xen ke sang / toi -> vi tri sai bi loai sau vai diem
        m.Dx = new int[n]; m.Dy = new int[n]; m.Sg = new bool[n];
        int k = 0, i1 = 0, i2 = 0;
        while (i1 < sang.Count || i2 < toi.Count) {
            if (i1 < sang.Count) { int p = sang[i1++]; m.Dx[k] = p % a.W; m.Dy[k] = p / a.W; m.Sg[k] = true; k++; }
            if (i2 < toi.Count) { int p = toi[i2++]; m.Dx[k] = p % a.W; m.Dy[k] = p / a.W; m.Sg[k] = false; k++; }
        }
        m.Nhanh = Math.Min(24, n);
        m.ChoSai = Math.Max(2, n * 5 / 100);   // cho sai 5% so diem
        return m;
    }
    static void Tron(List<int> l, uint s) {
        for (int i = l.Count - 1; i > 0; i--) {
            s = unchecked(s * 1103515245u + 12345u);
            int j = (int)((s >> 8) % (uint)(i + 1));
            int t = l[i]; l[i] = l[j]; l[j] = t;
        }
    }
}

public static class NcAuto {
    [StructLayout(LayoutKind.Sequential)] public struct POINT { public int X, Y; }
    [StructLayout(LayoutKind.Sequential)] public struct RECT { public int Left, Top, Right, Bottom; }
    [DllImport("user32.dll")] static extern bool SetProcessDPIAware();
    [DllImport("user32.dll")] static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")] static extern uint GetWindowThreadProcessId(IntPtr h, out uint pid);
    [DllImport("user32.dll")] static extern bool GetClientRect(IntPtr h, out RECT r);
    [DllImport("user32.dll")] static extern bool ClientToScreen(IntPtr h, ref POINT p);
    [DllImport("user32.dll")] static extern bool GetCursorPos(out POINT p);
    [DllImport("user32.dll")] static extern bool SetCursorPos(int x, int y);
    [DllImport("user32.dll")] static extern short GetAsyncKeyState(int vk);
    [DllImport("user32.dll")] static extern IntPtr WindowFromPoint(POINT p);
    [DllImport("user32.dll")] static extern IntPtr GetAncestor(IntPtr h, uint flags);
    [DllImport("user32.dll")] static extern bool IsIconic(IntPtr h);
    [DllImport("user32.dll")] static extern void mouse_event(uint f, int dx, int dy, uint d, IntPtr e);
    [DllImport("kernel32.dll")] static extern IntPtr OpenProcess(uint access, bool inherit, uint pid);
    [DllImport("kernel32.dll")] static extern bool CloseHandle(IntPtr h);
    [DllImport("advapi32.dll")] static extern bool OpenProcessToken(IntPtr h, uint access, out IntPtr tok);
    [DllImport("advapi32.dll")] static extern bool GetTokenInformation(IntPtr tok, int cls, out int info, int len, out int ret);

    public static string Dir;
    public static NcMau Nut, Ben;   // Ben = chu "Cu tuyet" tren nut ben phai
    public static List<NcMau> Chu = new List<NcMau>();
    public static bool Bat = true;
    static bool laAdmin;
    static bool[] truoc = new bool[256];
    static DateTime quetLanSau = DateTime.MinValue, nghiDen = DateTime.MinValue, baoChuLuc = DateTime.MinValue, baoLoiLuc = DateTime.MinValue;
    static int dem = 0, truot = 0, lastX = -1, lastY = -1;
    static DateTime lastClick = DateTime.MinValue;
    static Dictionary<uint, bool> laGame = new Dictionary<uint, bool>();

    public static void KhoiDong(string dir) {
        try { SetProcessDPIAware(); } catch { }
        Dir = dir;
        laAdmin = new WindowsPrincipal(WindowsIdentity.GetCurrent()).IsInRole(WindowsBuiltInRole.Administrator);
        Directory.CreateDirectory(ThuMucMau());
        NapMau();
    }
    static string ThuMucMau() { return Path.Combine(Dir, "mau"); }

    public static void NapMau() {
        Nut = null; Ben = null; Chu.Clear();
        string f = Path.Combine(ThuMucMau(), "nut-dong-y.png");
        if (File.Exists(f)) Nut = DocMau(f);
        f = Path.Combine(ThuMucMau(), "nut-cu-tuyet.png");
        if (File.Exists(f)) Ben = DocMau(f);
        string[] ds = Directory.GetFiles(ThuMucMau(), "chu-*.png");
        Array.Sort(ds, StringComparer.OrdinalIgnoreCase);
        foreach (string c in ds) { NcMau x = DocMau(c); if (x != null) Chu.Add(x); }
    }
    static Bitmap DocBitmap(string f) {
        using (MemoryStream ms = new MemoryStream(File.ReadAllBytes(f)))
        using (Bitmap t = new Bitmap(ms)) return new Bitmap(t);
    }
    static NcMau DocMau(string f) {
        try {
            using (Bitmap b = DocBitmap(f)) {
                NcMau x = NcMau.TuAnh(NcAnh.TuBitmap(b));
                if (x != null) x.Ten = Path.GetFileName(f);
                else Bao("Mau " + Path.GetFileName(f) + " khong co chu ro rang -> bo qua", ConsoleColor.Red);
                return x;
            }
        } catch (Exception e) { Bao("Khong doc duoc " + Path.GetFileName(f) + ": " + e.Message, ConsoleColor.Red); return null; }
    }

    public static int Otsu(byte[] v) {
        int[] h = new int[256];
        foreach (byte b in v) h[b]++;
        int n = v.Length, t = 128, wB = 0;
        double sum = 0, sumB = 0, best = -1;
        for (int i = 0; i < 256; i++) sum += i * (double)h[i];
        for (int i = 0; i < 256; i++) {
            wB += h[i]; if (wB == 0) continue;
            int wF = n - wB; if (wF == 0) break;
            sumB += i * (double)h[i];
            double mB = sumB / wB, mF = (sum - sumB) / wF, g = (double)wB * wF * (mB - mF) * (mB - mF);
            if (g > best) { best = g; t = i + 1; }
        }
        return t;
    }

    // Tim moi vi tri (goc trai tren) khop mau trong vung x0..x1, y0..y1. Chu game net 1 diem, khong khu rang cua
    // -> lech 1 diem la sai nhieu, nen chi khop dung cho.
    public static List<Point> Tim(NcAnh a, NcMau m, int x0, int y0, int x1, int y1, int toiDa) {
        List<Point> kq = new List<Point>();
        if (x0 < 0) x0 = 0;
        if (y0 < 0) y0 = 0;
        if (x1 > a.W - m.W) x1 = a.W - m.W;
        if (y1 > a.H - m.H) y1 = a.H - m.H;
        int n = m.Dx.Length, T = m.T, nh = m.Nhanh, cho = m.ChoSai;
        int[] off = new int[n];
        for (int k = 0; k < n; k++) off[k] = m.Dy[k] * a.W + m.Dx[k];
        byte[] L = a.L; bool[] sg = m.Sg;
        for (int y = y0; y <= y1; y++) {
            int dong = y * a.W;
            for (int x = x0; x <= x1; x++) {
                int b = dong + x, sai = 0, k = 0;
                for (; k < nh; k++) if ((L[b + off[k]] > T) != sg[k] && ++sai > 2) break;
                if (k < nh) continue;
                for (; k < n; k++) if ((L[b + off[k]] > T) != sg[k] && ++sai > cho) break;
                if (k < n) continue;
                bool trung = false;
                foreach (Point p in kq) if (Math.Abs(p.X - x) < m.W && Math.Abs(p.Y - y) < m.H) { trung = true; break; }
                if (trung) continue;
                kq.Add(new Point(x, y));
                if (kq.Count >= toiDa) return kq;
            }
        }
        return kq;
    }

    // Tim nut Dong y + (neu co mau) nut Cu tuyet ngay ben phai + chu nhan dien phia tren (trong bang).
    // Chi nut thoi thi KHONG du: chu "Dong y" con co o bang xac nhan mua (Tiem KNB), o "Dong y chi ra KNB", nut cong diem tiem nang.
    static bool CoCuTuyet(NcAnh a, Point p) {
        return Ben == null || Tim(a, Ben, p.X + Nut.W + 2, p.Y - 4, p.X + Nut.W + 50, p.Y + 4, 1).Count > 0;
    }
    static bool Quet(NcAnh a, out Point nut, out string chuKhop, out bool thayNut) {
        nut = Point.Empty; chuKhop = null; thayNut = false;
        if (Chu.Count == 0) return false;
        foreach (Point p in Tim(a, Nut, 0, 0, a.W, a.H, 6)) {
            thayNut = true;
            if (!CoCuTuyet(a, p)) continue;
            foreach (NcMau c in Chu) {
                if (Tim(a, c, p.X - 330, p.Y - 170, p.X + 170, p.Y - 2, 1).Count > 0) { nut = p; chuKhop = c.Ten; return true; }
            }
        }
        return false;
    }

    // Cat khung chu sang quanh diem (cx,cy): mo rong toi khi gap >= gap cot trong (khoang trang giua 2 tu = 5 cot)
    static bool HangCo(NcAnh a, int y, int x0, int x1, int t) { for (int x = x0; x <= x1; x++) if (a.L[y * a.W + x] >= t) return true; return false; }
    static bool CotCo(NcAnh a, int x, int y0, int y1, int t) { for (int y = y0; y <= y1; y++) if (a.L[y * a.W + x] >= t) return true; return false; }
    static void MoRong(int seed, int lo, int hi, int gap, Func<int, bool> co, out int r0, out int r1) {
        int blank = 0; r0 = seed;
        for (int i = seed - 1; i >= lo; i--) { if (co(i)) { r0 = i; blank = 0; } else if (++blank >= gap) break; }
        blank = 0; r1 = seed;
        for (int i = seed + 1; i <= hi; i++) { if (co(i)) { r1 = i; blank = 0; } else if (++blank >= gap) break; }
    }
    public static Rectangle CatChu(NcAnh a, int cx, int cy, int gap, int rw, int rh) {
        int wx0 = Math.Max(0, cx - rw), wx1 = Math.Min(a.W - 1, cx + rw);
        int wy0 = Math.Max(0, cy - rh), wy1 = Math.Min(a.H - 1, cy + rh);
        if (wx1 - wx0 < 8 || wy1 - wy0 < 6) return Rectangle.Empty;
        int dSang = 0;
        for (int y = wy0; y <= wy1; y++) for (int x = wx0; x <= wx1; x++) if (a.L[y * a.W + x] >= 170) dSang++;
        int t = 170;
        if (dSang < 10) {
            byte[] v = new byte[(wx1 - wx0 + 1) * (wy1 - wy0 + 1)]; int i = 0;
            for (int y = wy0; y <= wy1; y++) for (int x = wx0; x <= wx1; x++) v[i++] = a.L[y * a.W + x];
            t = Otsu(v);
            if (t < 60) return Rectangle.Empty;
        }
        int sx0 = Math.Max(wx0, cx - 8), sx1 = Math.Min(wx1, cx + 8);
        int ry = -1;
        for (int d = 0; d <= rh && ry < 0; d++) {
            if (cy - d >= wy0 && HangCo(a, cy - d, sx0, sx1, t)) ry = cy - d;
            else if (cy + d <= wy1 && HangCo(a, cy + d, sx0, sx1, t)) ry = cy + d;
        }
        if (ry < 0) return Rectangle.Empty;
        int y0, y1, x0, x1;
        MoRong(ry, wy0, wy1, 3, delegate(int y) { return HangCo(a, y, sx0, sx1, t); }, out y0, out y1);
        int rx = -1;
        for (int d = 0; d <= 10 && rx < 0; d++) {
            if (cx - d >= wx0 && CotCo(a, cx - d, y0, y1, t)) rx = cx - d;
            else if (cx + d <= wx1 && CotCo(a, cx + d, y0, y1, t)) rx = cx + d;
        }
        if (rx < 0) return Rectangle.Empty;
        int yy0 = y0, yy1 = y1;
        MoRong(rx, wx0, wx1, gap, delegate(int x) { return CotCo(a, x, yy0, yy1, t); }, out x0, out x1);
        // co lai hang theo dung khung cot cua tu
        int seedY = -1;
        for (int y = y0; y <= y1 && seedY < 0; y++) if (HangCo(a, y, x0, x1, t)) seedY = y;
        if (seedY < 0) return Rectangle.Empty;
        int xx0 = x0, xx1 = x1;
        MoRong(seedY, wy0, wy1, 3, delegate(int y) { return HangCo(a, y, xx0, xx1, t); }, out y0, out y1);
        return new Rectangle(x0, y0, x1 - x0 + 1, y1 - y0 + 1);
    }
    static Rectangle CatNut(NcAnh a, int cx, int cy) { return CatChu(a, cx, cy, 7, 30, 9); }
    // chu cua nut ke ben phai nut Dong y (Cu tuyet): cot sang dau tien sau khung r, cung hang
    static Rectangle CatBen(NcAnh a, Rectangle r) {
        if (r.IsEmpty) return Rectangle.Empty;
        int y0 = Math.Max(0, r.Top - 2), y1 = Math.Min(a.H - 1, r.Bottom + 1), cy = r.Top + r.Height / 2;
        for (int x = r.Right + 3; x < Math.Min(a.W, r.Right + 60); x++)
            if (CotCo(a, x, y0, y1, 170)) return CatChu(a, x, cy, 7, 60, 9);
        return Rectangle.Empty;
    }
    static Rectangle CatTu(NcAnh a, int cx, int cy) { return CatChu(a, cx, cy, 3, 60, 12); }

    static Bitmap ChupBitmap(Rectangle r) {
        Bitmap b = new Bitmap(r.Width, r.Height, PixelFormat.Format32bppArgb);
        using (Graphics g = Graphics.FromImage(b)) g.CopyFromScreen(r.X, r.Y, 0, 0, r.Size, CopyPixelOperation.SourceCopy);
        return b;
    }
    static Rectangle VungKhach(IntPtr h) {
        RECT r; POINT p; p.X = 0; p.Y = 0;
        if (!GetClientRect(h, out r) || !ClientToScreen(h, ref p)) return Rectangle.Empty;
        return new Rectangle(p.X, p.Y, r.Right - r.Left, r.Bottom - r.Top);
    }

    static bool LaGame(IntPtr h) {
        if (h == IntPtr.Zero) return false;
        uint pid; GetWindowThreadProcessId(h, out pid);
        bool r;
        if (!laGame.TryGetValue(pid, out r)) {
            try { r = string.Equals(Process.GetProcessById((int)pid).ProcessName, "Game", StringComparison.OrdinalIgnoreCase); } catch { r = false; }
            if (laGame.Count > 200) laGame.Clear();
            laGame[pid] = r;
            if (r && !laAdmin && GameAdmin(pid) != 0)
                Bao("Game dang chay bang quyen ADMIN -> Windows chan cong cu bam ho. Tat cua so nay, chuot phai CHAY.cmd > Run as administrator.", ConsoleColor.Red);
        }
        return r;
    }
    // 1 = game chay quyen admin, 0 = khong, -1 = khong kiem duoc (thuong la co admin)
    static int GameAdmin(uint pid) {
        IntPtr h = OpenProcess(0x1000, false, pid);
        if (h == IntPtr.Zero) return -1;
        IntPtr t;
        if (!OpenProcessToken(h, 0x0008, out t)) { CloseHandle(h); return -1; }
        int e, ret;
        bool ok = GetTokenInformation(t, 20, out e, 4, out ret);
        CloseHandle(t); CloseHandle(h);
        return ok ? (e != 0 ? 1 : 0) : -1;
    }

    static bool Phim(int vk) { return (GetAsyncKeyState(vk) & 0x8000) != 0; }
    static bool Nhan(int vk) { bool d = Phim(vk); bool r = d && !truoc[vk]; truoc[vk] = d; return r; }

    static void Bao(string s, ConsoleColor c) {
        ConsoleColor cu = Console.ForegroundColor;
        Console.ForegroundColor = c;
        Console.WriteLine("[" + DateTime.Now.ToString("HH:mm:ss") + "] " + s);
        Console.ForegroundColor = cu;
    }

    static void Bam(int x, int y) {
        POINT c; GetCursorPos(out c);
        SetCursorPos(x, y); Thread.Sleep(60);
        mouse_event(0x0002, 0, 0, 0, IntPtr.Zero); Thread.Sleep(60);   // trai xuong
        mouse_event(0x0004, 0, 0, 0, IntPtr.Zero); Thread.Sleep(60);   // trai len
        SetCursorPos(c.X, c.Y);
    }

    // Goi ~20 lan/giay tu vong lap PowerShell (de Ctrl+C van tat duoc)
    public static void Tick() {
        try { TickTrong(); }
        catch (Exception e) {
            if (DateTime.Now > baoLoiLuc) { baoLoiLuc = DateTime.Now.AddSeconds(30); Bao("Loi (bo qua, chay tiep): " + e.Message, ConsoleColor.DarkYellow); }
        }
    }
    static void TickTrong() {
        bool ctrl = Phim(0x11);
        bool f8 = Nhan(0x77), f9 = Nhan(0x78), f10 = Nhan(0x79);
        if (ctrl && f8) { Bat = !Bat; Bao(Bat ? "BAT tu dong dong y" : "TAT tu dong dong y (Ctrl+F8 de bat lai)", Bat ? ConsoleColor.Green : ConsoleColor.Yellow); }
        if (ctrl && f9) LayMau(false);
        if (ctrl && f10) LayMau(true);
        DateTime now = DateTime.Now;
        if (now < quetLanSau) return;
        quetLanSau = now.AddMilliseconds(300);
        if (!Bat || Nut == null || now < nghiDen) return;
        IntPtr fg = GetForegroundWindow();
        if (!LaGame(fg) || IsIconic(fg)) return;          // chi lam khi dang choi game (cua so game duoc chon)
        Rectangle cr = VungKhach(fg);
        if (cr.Width < 200 || cr.Height < 150) return;
        NcAnh a;
        using (Bitmap b = ChupBitmap(cr)) a = NcAnh.TuBitmap(b);
        Point p; string chu; bool thayNut;
        if (!Quet(a, out p, out chu, out thayNut)) {
            truot = 0;
            if (thayNut && now > baoChuLuc) { baoChuLuc = now.AddSeconds(20); Bao("Co bang voi nut Dong y nhung khong phai loi moi vao to -> khong bam", ConsoleColor.DarkGray); }
            return;
        }
        if (Phim(0x01) || Phim(0x02)) return;              // nguoi choi dang giu chuot: doi
        int px = cr.X + p.X + Nut.W / 2, py = cr.Y + p.Y + Nut.H / 2;
        if (px == lastX && py == lastY && (now - lastClick).TotalSeconds < 4) {
            if (++truot >= 2) {
                truot = 0; nghiDen = now.AddSeconds(10);
                Bao("Da bam ma bang van con. Game chay quyen admin? -> chay CHAY.cmd bang Run as administrator. Thu lai sau 10 giay.", ConsoleColor.Red);
                return;
            }
        } else truot = 0;
        POINT q; q.X = px; q.Y = py;
        IntPtr w = WindowFromPoint(q);
        if (w != fg && GetAncestor(w, 2) != fg) return;    // co cua so khac de len nut
        Bam(px, py);
        dem++; lastX = px; lastY = py; lastClick = DateTime.Now;
        nghiDen = DateTime.Now.AddMilliseconds(1200);
        Bao("Da bam Dong y vao to (khop " + chu + ") - lan " + dem, ConsoleColor.Green);
    }

    static string TenChuMoi() {
        for (int i = 1; ; i++) { string f = "chu-" + i + ".png"; if (!File.Exists(Path.Combine(ThuMucMau(), f))) return f; }
    }
    static bool Luu(Bitmap b, Rectangle r, string ten) {
        if (r.IsEmpty || r.Width < 4 || r.Height < 5) return false;
        using (Bitmap k = b.Clone(r, PixelFormat.Format32bppArgb)) k.Save(Path.Combine(ThuMucMau(), ten), ImageFormat.Png);
        return true;
    }

    // Ctrl+F9 / Ctrl+F10: lay mau tai cho chuot dang chi
    static void LayMau(bool laChu) {
        string gi = laChu ? "chu \"nhom,\" trong bang" : "giua nut Dong y";
        IntPtr fg = GetForegroundWindow();
        if (!LaGame(fg)) { Bao("Cua so game chua duoc chon. Bam vao game, de chuot len " + gi + " roi bam lai.", ConsoleColor.Red); return; }
        Rectangle cr = VungKhach(fg);
        POINT c; GetCursorPos(out c);
        if (!cr.Contains(c.X, c.Y)) { Bao("Chuot dang nam ngoai game.", ConsoleColor.Red); return; }
        // dua chuot ra goc tren trai: nut het sang len, con tro khong che chu
        SetCursorPos(cr.X + 2, cr.Y + 2);
        Thread.Sleep(300);
        Bitmap b = ChupBitmap(cr);
        SetCursorPos(c.X, c.Y);
        try {
            NcAnh a = NcAnh.TuBitmap(b);
            int cx = c.X - cr.X, cy = c.Y - cr.Y;
            string ten = laChu ? TenChuMoi() : "nut-dong-y.png";
            Rectangle r = laChu ? CatTu(a, cx, cy) : CatNut(a, cx, cy);
            if (!Luu(b, r, ten)) {
                Bao("Khong thay chu sang duoi chuot. Mo bang moi to, de chuot ngay " + gi + " roi bam lai.", ConsoleColor.Red);
                return;
            }
            bool coBen = false;
            if (!laChu) {
                // lay luon nut Cu tuyet ben canh; khong thay thi bo kiem tra nay
                coBen = Luu(b, CatBen(a, r), "nut-cu-tuyet.png");
                if (!coBen) File.Delete(Path.Combine(ThuMucMau(), "nut-cu-tuyet.png"));
            }
            NapMau();
            NcMau m = laChu ? Chu.Find(delegate(NcMau x) { return x.Ten == ten; }) : Nut;
            if (m == null) { Bao("Mau vua luu khong dung duoc, thu lai.", ConsoleColor.Red); return; }
            Bao("Da luu mau " + ten + " (" + m.W + "x" + m.H + ")" + (laChu ? "" : (coBen ? " + nut-cu-tuyet.png" : " (khong thay nut Cu tuyet ben phai)")), ConsoleColor.Cyan);
            if (Chu.Count == 0) Bao("Con thieu chu nhan dien: de chuot len chu \"nhom,\" roi Ctrl+F10.", ConsoleColor.Yellow);
        } finally { b.Dispose(); }
    }

    public static void InHuongDan() {
        Console.WriteLine("=== NetCo4: TU DONG VAO TO ===");
        Console.WriteLine("Khi co nguoi moi vao to, cong cu tu bam \"Dong y\". Chi bam khi cua so game dang duoc chon.");
        Console.WriteLine("Phim tat (bam khi dang o trong game):");
        Console.WriteLine("  Ctrl+F8   bat / tat");
        Console.WriteLine("  Ctrl+F9   lay lai mau nut: luc bang moi to hien, de chuot giua nut Dong y roi bam");
        Console.WriteLine("  Ctrl+F10  them chu nhan dien: de chuot len chu \"nhom,\" trong bang roi bam");
        Console.WriteLine("Tat: dong cua so nay.");
        Console.WriteLine();
        if (Nut == null) Bao("CHUA CO mau nut (mau\\nut-dong-y.png). Cho bang moi to hien ra roi Ctrl+F9.", ConsoleColor.Red);
        else Bao("Mau nut: " + Nut.Ten + " (" + Nut.W + "x" + Nut.H + ")" + (Ben != null ? " + " + Ben.Ten : ""), ConsoleColor.Gray);
        if (Chu.Count == 0) Bao("CHUA CO chu nhan dien -> KHONG bam gi (chu Dong y con co o bang mua do, cong diem...). Mo bang moi to, de chuot len chu \"nhom,\" roi Ctrl+F10.", ConsoleColor.Red);
        foreach (NcMau c in Chu) Bao("Chu nhan dien: " + c.Ten + " (" + c.W + "x" + c.H + ")", ConsoleColor.Gray);
        if (laAdmin) Bao("Dang chay bang quyen admin", ConsoleColor.Gray);
        Bao("Dang chay...", ConsoleColor.Green);
    }

    // ---- kiem tra / tao mau tu anh chup (khong can mo game) ----
    public static void ThuAnh(string f) {
        NcAnh a;
        using (Bitmap b = DocBitmap(f)) a = NcAnh.TuBitmap(b);
        if (Nut == null) { Console.WriteLine("Chua co mau nut"); return; }
        List<Point> ds = Tim(a, Nut, 0, 0, a.W, a.H, 6);
        Console.WriteLine(Path.GetFileName(f) + ": thay " + ds.Count + " nut Dong y");
        foreach (Point p in ds) {
            string s = "  nut giua (" + (p.X + Nut.W / 2) + "," + (p.Y + Nut.H / 2) + ")" + (Ben == null ? "" : (CoCuTuyet(a, p) ? " | co Cu tuyet" : " | KHONG co Cu tuyet"));
            foreach (NcMau c in Chu) {
                List<Point> k = Tim(a, c, p.X - 330, p.Y - 170, p.X + 170, p.Y - 2, 1);
                s += k.Count > 0 ? (" | " + c.Ten + " o (" + k[0].X + "," + k[0].Y + ")") : (" | khong co " + c.Ten);
            }
            Console.WriteLine(s);
        }
        Point q; string chu; bool tn;
        Console.WriteLine(Quet(a, out q, out chu, out tn) ? ("=> SE BAM tai (" + (q.X + Nut.W / 2) + "," + (q.Y + Nut.H / 2) + "), khop " + chu) : "=> KHONG bam");
    }
    public static void TaoMauTuAnh(string f, int nx, int ny, int cx, int cy) {
        using (Bitmap b = DocBitmap(f)) {
            NcAnh a = NcAnh.TuBitmap(b);
            if (nx >= 0) {
                Rectangle r = CatNut(a, nx, ny); Console.WriteLine("nut-dong-y.png: " + r + (Luu(b, r, "nut-dong-y.png") ? "" : " LOI"));
                Rectangle r2 = CatBen(a, r); Console.WriteLine("nut-cu-tuyet.png: " + r2 + (Luu(b, r2, "nut-cu-tuyet.png") ? "" : " LOI"));
            }
            if (cx >= 0) { string t = TenChuMoi(); Rectangle r = CatTu(a, cx, cy); Console.WriteLine(t + ": " + r + (Luu(b, r, t) ? "" : " LOI")); }
        }
        NapMau();
    }
}
'@

if (-not ('NcAuto' -as [type])) {
    Add-Type -TypeDefinition $code -ReferencedAssemblies System.Drawing
}
[NcAuto]::KhoiDong($PSScriptRoot)

if ($MauTuAnh) {
    $n = @(-1, -1); $c = @(-1, -1)
    if ($Nut) { $n = $Nut.Split(',') | ForEach-Object { [int]$_ } }
    if ($Chu) { $c = $Chu.Split(',') | ForEach-Object { [int]$_ } }
    [NcAuto]::TaoMauTuAnh((Resolve-Path $MauTuAnh).Path, $n[0], $n[1], $c[0], $c[1])
    return
}
if ($ThuAnh) {
    foreach ($f in (Resolve-Path $ThuAnh)) { [NcAuto]::ThuAnh($f.Path) }
    return
}

try { $Host.UI.RawUI.WindowTitle = 'NetCo4 - tu dong vao to (dong cua so = tat)' } catch { }
[NcAuto]::InHuongDan()
while ($true) {
    [NcAuto]::Tick()
    Start-Sleep -Milliseconds 50
}
