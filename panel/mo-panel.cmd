@echo off
rem Mo panel admin NetCo4: tao duong ham SSH toi VPS roi mo trinh duyet.
rem Panel chi nghe 127.0.0.1 tren VPS, khong ai tu internet vao duoc.
rem Can: may nay da co SSH key duoc them vao VPS (xem docs/TRANG-THAI.md).
set KEY=
if exist "%USERPROFILE%\.ssh\tlbb_vps" set KEY=-i "%USERPROFILE%\.ssh\tlbb_vps"
start "NetCo4 panel - DONG CUA SO NAY DE TAT PANEL" ssh %KEY% -p 24700 -o ExitOnForwardFailure=yes -o ServerAliveInterval=30 -N -L 8088:127.0.0.1:8088 root@103.216.118.123
timeout /t 4 >nul
start "" http://127.0.0.1:8088/
