@echo off
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableAdvertisingID.ps1 -o dai.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableConsumerApps.ps1 -o dca.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableCortana.ps1 -o dc.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableDiagTrack.ps1 -o ddt.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableSmartScreen.ps1 -o dss.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/DisableTelemetry.ps1 -o dt.ps1
curl https://raw.githubusercontent.com/DorkYBru/FixUrGames/main/UninstallMsftBloat.ps1 -o umb.ps1
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








