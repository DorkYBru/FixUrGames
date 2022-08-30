@echo off
:first
cls
echo ———————————————–
echo Wybierz z listy
echo ———————————————–
echo.
echo 1.VolersPvP - "3" - Ta wartość jest odpowiednia na wszystkie polskie serwery i na starty edycji - onlypvp.pl/watermc.eu/arivi.pl/mcevent.pl/enchant.pl/mc4u.pl/itp

echo 2.VolersPvP - "5" - Ta wartość jest odpowiednia na zarazem polskie i amerykańskie serwery podczas użytkowania z niej możecie odczuć mniejszy knock i w nie których momentach reach. 

echo 3.VolersPvP - "12" - Ta wartość jest odpowiednia na polskie i jak zarazem na amerykańskie serwery tutaj możecie odczuć bardzo małego knocka co powoduje dużą przewagę nad przeciwnikiem. 

echo 4.VolersPvP - "216" - Ta wartość jest odpowiednia na polskie i jak zarazem na amerykańskie serwery tutaj możecie odczuć lekki ping w góre ale za to dostajecie efekt mniejszego knocka i reacha. 

echo 5.VolersPvP - "255" - Ta wartość jest odpowiednia na polskie i jak zarazem na amerykańskie serwery tutaj możecie też odczuć lekki ping w góre ale za to dostajecie efekt mniejszego knocka i reacha
echo.
set /p option=choose:
if %option%==1 goto option1
if %option%==2 goto option2
if %option%==3 goto option3
if %option%==4 goto option4
if %option%==5 goto option5
goto zly_wybor
:option1
cls
echo Wdrażanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 3 /f
pause
goto poczatek
:option2
cls
echo Wdrażanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 5 /f
pause
goto poczatek
:option3
cls
echo Wdrażanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 12 /f
pause
goto poczatek
:option4
cls
echo Wdrażanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 216 /f
pause
:option5
cls
echo Wdrażanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 255 /f
pause