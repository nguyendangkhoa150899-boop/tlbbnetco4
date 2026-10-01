@echo off
rem NetCo4: tu dong bam "Dong y" khi co nguoi moi vao to doi. Dong cua so nay = tat.
rem Game chay bang quyen admin thi chuot phai file nay > Run as administrator.
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tu-dong-vao-to.ps1"
pause
