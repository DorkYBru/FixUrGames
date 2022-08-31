@echo off
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableAdvertisingID.ps1 -o dai.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableConsumerApps.ps1 -o dca.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableCortana.ps1 -o dc.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableDiagTrack.ps1 -o ddt.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableSmartScreen.ps1 -o dss.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableTelemetry.ps1 -o dt.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/UninstallMsftBloat.ps1 -o umb.ps1
attrib +r dai.ps1
attrib +r dca.ps1
attrib +r dc.ps1
attrib +r ddt.ps1
attrib +r dss.ps1
attrib +r dt.ps1
attrib +r umb.ps1
Powershell.exe -executionpolicy remotesigned -File "dai.ps1"
Powershell.exe -executionpolicy remotesigned -File "dca.ps1"
Powershell.exe -executionpolicy remotesigned -File "dc.ps1"
Powershell.exe -executionpolicy remotesigned -File "ddt.ps1"
Powershell.exe -executionpolicy remotesigned -File "dss.ps1"
Powershell.exe -executionpolicy remotesigned -File "dt.ps1"
Powershell.exe -executionpolicy remotesigned -File "umb.ps1"
del dai.ps1
del dca.ps1
del dc.ps1
del ddt.ps1
del dss.ps1
del dt.ps1
del fps.reg
del ogb.reg
del umb.ps1
del fpss.reg
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
exit







