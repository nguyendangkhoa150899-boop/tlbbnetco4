# Sua client Thien Long 3D de vao server moi, bo tan du cua server cu.
# Chay trong thu muc chua file nay:
#   powershell -ExecutionPolicy Bypass -File .\sua-client.ps1 -ClientDir "D:\...\Thien Long Gate"
param(
    [Parameter(Mandatory = $true)][string]$ClientDir,
    [string]$ServerIP = '103.216.118.123',
    [string]$ServerName = 'NetCo4'
)
$ErrorActionPreference = 'Stop'
# Doc/ghi theo byte (Latin-1) de khong lam hong chu tieng Viet trong file
$raw = [System.Text.Encoding]::GetEncoding(28591)

$patch = Join-Path $ClientDir 'Patch'
if (-not (Test-Path (Join-Path $ClientDir 'Bin\Game.exe'))) { throw "Khong thay Bin\Game.exe trong $ClientDir" }

function Backup($f) { if ((Test-Path $f) -and -not (Test-Path "$f.goc")) { Copy-Item $f "$f.goc" } }

# 1. Tro ve server moi
$ls = Join-Path $patch 'LoginServer.txt'
Backup $ls
$t = $raw.GetString([IO.File]::ReadAllBytes($ls))
$t = [regex]::Replace($t, '\d{1,3}(\.\d{1,3}){3}:7384', "${ServerIP}:7384")
# Dong server: <khu vuc>,<ten server>,... -> doi ten server (giu nguyen ten khu vuc)
$t = [regex]::Replace($t, '(?m)^([^,\r\n]*),[^,\r\n]*,(.*:7384)', "`$1,$ServerName,`$2")
[IO.File]::WriteAllBytes($ls, $raw.GetBytes($t))
Write-Host "LoginServer.txt -> $ServerName ${ServerIP}:7384"

$ra = Join-Path $patch 'RemoteAddr.txt'
if (Test-Path $ra) {
    Backup $ra
    [IO.File]::WriteAllBytes($ra, $raw.GetBytes("[RemoteAddr]`r`nLogin_IP=$ServerIP`r`n"))
}

# 2. Tat tu cap nhat tu web server cu (hoiucthienlong.com). Ten mien het han co the bi nguoi khac mua
#    va phat file la cho may nguoi choi.
$pi = Join-Path $patch 'patchinfo.txt'
Backup $pi
$ver = (Get-Content (Join-Path $ClientDir '(version)') -Raw).Trim()
[IO.File]::WriteAllBytes($pi, $raw.GetBytes("[Version]`r`nLatest=$ver`r`nNewLaunch=1.0.0`r`n"))
Write-Host "patchinfo.txt: da tat tu cap nhat (phien ban $ver)"

# 3. Xoa ten dang nhap cua nguoi choi cu da luu
Get-ChildItem (Join-Path $ClientDir 'Accounts') -Directory -Filter '#*' -ErrorAction SilentlyContinue |
    Remove-Item -Recurse -Force
Write-Host "Da xoa ten dang nhap cu trong Accounts\"

Write-Host ""
Write-Host "Xong. Mo game bang Run.cmd. KHONG chay fixgame.cmd (no reset tuong lua va mang Windows)."
