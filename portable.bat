@echo off
:first
cls
echo ----------------
echo Wybierz z listy
echo ----------------
echo.
echo 1.VolersPvP - "3" - Ta wartosc jest odpowiednia na wszystkie polskie serwery i na starty edycji - onlypvp.pl/watermc.eu/arivi.pl/mcevent.pl/enchant.pl/mc4u.pl/itp

echo 2.VolersPvP - "5" - Ta wartosc jest odpowiednia na zarazem polskie i amerykanskie serwery podczas uzytkowania z niej mozecie odczuc mniejszy knock i w nie ktorych momentach reach. 

echo 3.VolersPvP - "12" - Ta wartosc jest odpowiednia na polskie i jak zarazem na amerykanskie serwery tutaj mozecie odczuc bardzo malego knocka co powoduje duza przewage nad przeciwnikiem. 

echo 4.VolersPvP - "216" - Ta wartosc jest odpowiednia na polskie i jak zarazem na amerykanskie serwery tutaj mozecie odczuc lekki ping w gore ale za to dostajecie efekt mniejszego knocka i reacha. 

echo 5.VolersPvP - "255" - Ta wartosc jest odpowiednia na polskie i jak zarazem na amerykanskie serwery tutaj mozecie tez odczuc lekki ping w gore ale za to dostajecie efekt mniejszego knocka i reacha
echo.
set /p option=choose:
if %option%==1 goto option1
if %option%==2 goto option2
if %option%==3 goto option3
if %option%==4 goto option4
if %option%==5 goto option5
goto first
:option1
cls
echo Wdrazanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 3 /f
pause
goto poczatek
:option2
cls
echo Wdrazanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 5 /f
pause
goto poczatek
:option3
cls
echo Wdrazanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 12 /f
pause
goto poczatek
:option4
cls
echo Wdrazanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 216 /f
pause
:option5
cls
echo Wdrazanie zmian.
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 255 /f
pause
