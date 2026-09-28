@echo off
rem Ban sua NetCo4 cho client da tai truoc do.
rem Cach dung: giai nen goi nay VAO THU MUC GAME (noi co thu muc Bin, Patch, Accounts) roi chay file nay.
cd /d "%~dp0"
if not exist "Bin\Game.exe" (
    echo [LOI] Khong thay Bin\Game.exe. Hay giai nen goi fix vao dung thu muc game roi chay lai.
    pause
    exit /b 1
)
echo === 1/2 Sua client: tro ve server NetCo4, che do cua so, tat tu cap nhat, xoa ten dang nhap cu
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0sua-client.ps1" -ClientDir "%~dp0."
echo.
echo === 2/2 Chan link la cua nut Nap the / Dang ky (Windows se hoi quyen, bam Yes)
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0chan-link-la.ps1"
echo.
echo Xong. Mo game bang NetCo4.cmd
pause
