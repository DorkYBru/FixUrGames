@echo off

if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
echo|(set /p="Creating restore point" & echo.)
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Ping Restore Point", 100, 7
cls
wmic process where name="svchost.exe" CALL setpriority "idle"
ping 127.0.0.1 -n 5 >nul
wmic process where name="javaw.exe" CALL setpriority "high priority"
wmic process where name="javaw.exe" CALL setpriority "high priority"
ipconfig /flushdns
sc start BITS
netsh int tcp set global autotuninglevel=default
netsh int tcp set global chimney=default
netsh int tcp set global dca=default
netsh int tcp set global netdma=default
netsh int tcp set global congestionprovider=default
netsh int tcp set global ecncapability=default
netsh int tcp set heuristics default
netsh int tcp set global rss=default
netsh int tcp set global fastopen=default
netsh int tcp set global timestamps=default
netsh int tcp set global nonsackrttresiliency=default
netsh int tcp set global rsc=default
netsh int tcp set global maxsynretransmissions=2
netsh int tcp set global initialRto=3000
netsh winsock reset catalog
netsh branchcache reset
netsh branchcache flush
netsh int ip reset
netsh int tcp reset
netsh int ipv4 reset reset.log
netsh int ipv6 reset reset.log
netsh interface ipv4 set dns name=”Wi-Fi” static 1.1.1.1
netsh interface ipv4 set dns name=”Wi-Fi” static 1.0.0.1 index=2.
ipconfig /release
ipconfig /renew
ipconfig /flushdns
net start dot3svc
cls
SET MTU=1500
goto:ping

 
:ping
for /f "delims=: tokens=2" %%n in ('netsh lan show interface ^| findstr "Name"') do set "Network=%%n"
set "Network=%Network:~1%"
netsh interface ipv4 set subinterface "%Network%" mtu=%mtu% store=persistent
for /f "delims=: tokens=2" %%n in ('netsh wlan show interface ^| findstr "Name"') do set "Network=%%n"
set "Network=%Network:~1%"
netsh interface ipv4 set subinterface "%Network%" mtu=%mtu% store=persistent
netsh int tcp set supplemental internet congestionprovider=ctcp

powershell -Command "& {Set-NetTCPSetting -SettingName internet -ScalingHeuristics Disabled}
powershell -Command "& {Set-NetTCPSetting -SettingName internet -AutoTuningLevelLocal Restricted}
powershell -Command "& {Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing Disabled}
powershell -Command "& {Set-NetOffloadGlobalSetting -ReceiveSideScaling Enabled}
powershell -Command "& {Disable-NetAdapterLso -Name *}
powershell -Command "& {Disable-NetAdapterChecksumOffload -Name *}
powershell -Command "& {Set-NetTCPSetting -SettingName internet -EcnCapability Disabled}
powershell -Command "& {Set-NetOffloadGlobalSetting -Chimney Disabled}
powershell -Command "& {Set-NetTCPSetting -SettingName internet -Timestamps Disabled}
powershell -Command "& {Set-NetTCPSetting -SettingName internet -MaxSynRetransmissions 2}
powershell -Command "& {Set-NetTCPSetting -SettingName internet -NonSackRttResiliency Disabled}
powershell -Command "& {Set-NetTCPSetting -SettingName internet -InitialRto 2000}
powershell -Command "& {Set-NetTCPSetting -SettingName internet -MinRto 300}

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v LocalPriority /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v HostsPriority /t REG_DWORD /d 5 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v DnsPriority /t REG_DWORD /d 6 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v NetbtPriority /t REG_DWORD /d 7 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_SZ /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v Size /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65534 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f

for /f "delims=: tokens=2" %%n in ('netsh lan show interface ^| findstr "GUID"') do set "Network=%%n"
set "Network=%Network:~1%"
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TCPNoDelay /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpDelAckTicks /t REG_DWORD /d 0 /f
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 1 /f

for /f "delims=: tokens=2" %%n in ('netsh wlan show interface ^| findstr "GUID"') do set "Network=%%n"
set "Network=%Network:~1%"
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TCPNoDelay /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpDelAckTicks /t REG_DWORD /d 0 /f
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{%Network%} /v TcpAckFrequency /t REG_DWORD /d 1 /f
cls
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/iping.reg > iping.reg
reg import iping.reg
del iping.reg
goto LOGO
:LOGO
cls
color 0b
echo|(set /p="No lag <3" & echo.)
start https://dorkybru.github.io/FixUrGames/ty.html
pause






