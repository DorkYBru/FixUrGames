if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath 'cmd' -ArgumentList 'am_admin'"
    exit /b
)
start VolersPvP.exe
cls