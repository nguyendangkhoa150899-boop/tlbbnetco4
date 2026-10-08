# CHI DOC bo nho tien trinh game: tim cac ban mesh / skeleton DA GIAI MA ("\x00\x10[MeshSerializer_v1.40]" / "[Serializer_v1.10]")
# va ghi ra file (toi da Max byte moi ban) de doi chieu voi ban ma hoa trong goi. Khong ghi, khong chen code vao game.
param([int]$ProcId, [string]$Out, [int]$Max = 400000)
$ErrorActionPreference = 'Stop'
Add-Type -Language CSharp @"
using System; using System.Runtime.InteropServices; using System.IO; using System.Text;
public static class Ram {
  [StructLayout(LayoutKind.Sequential)] public struct MBI { public ulong BaseAddress, AllocationBase; public uint AllocationProtect, __a1; public ulong RegionSize; public uint State, Protect, Type, __a2; }
  [DllImport("kernel32")] static extern IntPtr OpenProcess(uint a, bool i, int pid);
  [DllImport("kernel32")] static extern int VirtualQueryEx(IntPtr h, IntPtr a, out MBI m, uint l);
  [DllImport("kernel32")] static extern bool ReadProcessMemory(IntPtr h, IntPtr a, byte[] b, IntPtr n, out IntPtr r);
  [DllImport("kernel32")] static extern bool CloseHandle(IntPtr h);
  public static string Run(int pid, string outDir, int max) {
    Directory.CreateDirectory(outDir);
    IntPtr h = OpenProcess(0x0410, false, pid); if (h == IntPtr.Zero) return "OpenProcess loi";
    byte[] m1 = Encoding.ASCII.GetBytes("[MeshSerializer_v1.40]"), m2 = Encoding.ASCII.GetBytes("[Serializer_v1.10]");
    long addr = 0; int n = 0, nm = 0, ns = 0; long scanned = 0; var sb = new StringBuilder();
    while (addr < 0x7FFF0000L) {
      MBI m; if (VirtualQueryEx(h, new IntPtr(addr), out m, (uint)Marshal.SizeOf(typeof(MBI))) == 0) break;
      long size = (long)m.RegionSize; if (size <= 0) break;
      bool ok = m.State == 0x1000 && (m.Protect & 0x100) == 0 && (m.Protect & 0x01) == 0 && (m.Protect & 0xEE) != 0;
      if (ok && size < 512L * 1024 * 1024) {
        byte[] buf = new byte[size]; IntPtr rd;
        if (ReadProcessMemory(h, new IntPtr(addr), buf, new IntPtr(size), out rd)) {
          scanned += size; int len = (int)rd;
          for (int i = 2; i + 24 < len; i++) {
            if (buf[i] != (byte)'[' || buf[i - 2] != 0 || buf[i - 1] != 0x10) continue;
            bool mesh = true, skel = true;
            for (int k = 0; k < m1.Length && mesh; k++) if (i + k >= len || buf[i + k] != m1[k]) mesh = false;
            for (int k = 0; k < m2.Length && skel; k++) if (i + k >= len || buf[i + k] != m2[k]) skel = false;
            if (!mesh && !skel) continue;
            int s = i - 2, e = Math.Min(len, s + max);
            byte[] o = new byte[e - s]; Array.Copy(buf, s, o, 0, e - s);
            File.WriteAllBytes(Path.Combine(outDir, (mesh ? "m_" : "s_") + n.ToString("D5") + "_" + (addr + s).ToString("x") + ".bin"), o);
            n++; if (mesh) nm++; else ns++;
          }
        }
      }
      addr += size;
    }
    CloseHandle(h);
    return "quet " + (scanned / 1048576) + " MB | ban mesh: " + nm + " | ban skeleton: " + ns;
  }
}
"@
[Ram]::Run($ProcId, $Out, $Max)
