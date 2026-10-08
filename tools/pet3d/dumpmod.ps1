# CHI DOC: chep anh cac module (MEM_IMAGE) dang chay trong game ra file <ten>_<base>.img (ban da tu giai nen cua Themida/ASProtect)
param([int]$ProcId, [string]$Out, [string]$Loc = 'ogre|game|render|fairy|wx|kylin|ui')
$ErrorActionPreference = 'Stop'
Add-Type -Language CSharp @"
using System; using System.Runtime.InteropServices; using System.IO; using System.Text; using System.Text.RegularExpressions;
public static class Mod {
  [StructLayout(LayoutKind.Sequential)] public struct MBI { public ulong BaseAddress, AllocationBase; public uint AllocationProtect, __a1; public ulong RegionSize; public uint State, Protect, Type, __a2; }
  [DllImport("kernel32")] static extern IntPtr OpenProcess(uint a, bool i, int pid);
  [DllImport("kernel32")] static extern int VirtualQueryEx(IntPtr h, IntPtr a, out MBI m, uint l);
  [DllImport("kernel32")] static extern bool ReadProcessMemory(IntPtr h, IntPtr a, byte[] b, IntPtr n, out IntPtr r);
  [DllImport("psapi", CharSet=CharSet.Unicode)] static extern uint GetMappedFileNameW(IntPtr h, IntPtr a, StringBuilder s, uint n);
  public static string Run(int pid, string outDir, string loc) {
    Directory.CreateDirectory(outDir); var re = new Regex(loc, RegexOptions.IgnoreCase); var log = new StringBuilder();
    IntPtr h = OpenProcess(0x0410, false, pid);
    long addr = 0; long cur = -1; MemoryStream ms = null; string nm = null; long last = 0;
    Action flush = () => { if (ms != null) { File.WriteAllBytes(Path.Combine(outDir, nm + "_" + cur.ToString("x") + ".img"), ms.ToArray()); log.AppendLine(nm + " base " + cur.ToString("x") + " " + ms.Length); } ms = null; };
    while (addr < 0x7FFF0000L) {
      MBI m; if (VirtualQueryEx(h, new IntPtr(addr), out m, (uint)Marshal.SizeOf(typeof(MBI))) == 0) break;
      long size = (long)m.RegionSize; if (size <= 0) break;
      if (m.Type == 0x1000000 && m.State == 0x1000) {
        long ab = (long)m.AllocationBase;
        if (ab != cur) { flush(); cur = ab; var sb = new StringBuilder(512); GetMappedFileNameW(h, new IntPtr(ab), sb, 512); nm = Path.GetFileName(sb.ToString());
          if (re.IsMatch(nm)) { ms = new MemoryStream(); last = ab; } }
        if (ms != null) {
          if (addr - cur > ms.Length) ms.Write(new byte[addr - cur - ms.Length], 0, (int)(addr - cur - ms.Length));
          byte[] b = new byte[size]; IntPtr rd; if (!ReadProcessMemory(h, new IntPtr(addr), b, new IntPtr(size), out rd)) Array.Clear(b, 0, b.Length);
          ms.Write(b, 0, b.Length);
        }
      }
      addr += size;
    }
    flush(); return log.ToString();
  }
}
"@
[Mod]::Run($ProcId, $Out, $Loc)
