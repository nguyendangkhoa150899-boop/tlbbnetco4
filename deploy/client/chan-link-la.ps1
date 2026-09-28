# Chan cac trang web la ma nut "Nap the" / "Dang ky" trong client cu mo ra.
# Nut khong xoa duoc (giao dien bi khoa trong OgreMain.dll), nen tro ten mien ve 127.0.0.1:
# bam nut chi ra trang loi, khong bao gio toi web la (ten mien cu co the bi nguoi khac mua lai).
# Chay: chuot phai > Run with PowerShell (se hoi quyen admin). Chay lai nhieu lan khong sao.
param([string[]]$Them = @())

$domains = @(
    'hoatientu.tk',        # nut Nap the / Dang ky (ten mien .tk mien phi, da het han)
    'hoiucthienlong.com',  # web + ban va cua server cu
    'tanthanlong.com'      # web server cu
) + $Them

$admin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $admin) {
    $args2 = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', "`"$PSCommandPath`"")
    if ($Them.Count) { $args2 += @('-Them', ($Them -join ',')) }
    Start-Process powershell -Verb RunAs -ArgumentList $args2
    exit
}

$hosts = "$env:WINDIR\System32\drivers\etc\hosts"
$begin = '# >>> NetCo4: chan link server cu'
$end   = '# <<< NetCo4'
$lines = Get-Content $hosts -ErrorAction SilentlyContinue
# Bo khoi cu (neu co) roi ghi lai
$keep = @(); $skip = $false
foreach ($l in $lines) {
    if ($l -eq $begin) { $skip = $true; continue }
    if ($l -eq $end)   { $skip = $false; continue }
    if (-not $skip) { $keep += $l }
}
$block = @($begin)
foreach ($d in ($domains | ForEach-Object { $_.Split(',') } | Where-Object { $_ } | Sort-Object -Unique)) {
    $block += "127.0.0.1 $d"
    $block += "127.0.0.1 www.$d"
}
$block += $end
Set-Content -Path $hosts -Value ($keep + $block) -Encoding ASCII
ipconfig /flushdns | Out-Null

Write-Host "Da chan:" -ForegroundColor Green
$block | Where-Object { $_ -like '127.*' } | ForEach-Object { "  $_" }
Write-Host ""
Write-Host "Thay link la khac? Chay lai: .\chan-link-la.ps1 -Them tenmien.com"
Read-Host "Nhan Enter de dong"
