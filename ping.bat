@echo off

if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

wmic process where name="svchost.exe" CALL setpriority "idle"
ping 127.0.0.1 -n 5 >nul
wmic process where name="javaw.exe" CALL setpriority "high priority"
wmic process where name="javaw.exe" CALL setpriority "high priority"
ipconfig /flushdns
sc start BITS
goto LOGO
:LOGO
cls
color 0b
echo "No Lag <3"
start https://dorkybru.github.io/FixUrGames/ty.html
pause
