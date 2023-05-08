@echo off
chcp 65001 > nul
title connect wifi

%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :script","","runas",1)(window.close)&exit

:script
REM 请重启wifi，搜索 更多wifi
echo reboot wifi device ....
netsh interface set interface name="wlan" admin=disable
netsh interface set interface name="wlan" admin=enable

REM 等待五秒
echo wait 5s ....
timeout /t 5 /nobreak > nul
echo.

echo all old wifi:
powershell "(netsh wlan show profiles) | select-string -allmatch ': (.*)'|%%{$_.matches}|%%{$_.value -replace ': ',''}"
echo =============================

echo all available wifi:
REM 查看所有可用 wifi 网络配置
powershell "(netsh wlan show networks) | select-string -allmatch 'SSID(.*)'|%%{$_.matches}|%%{$_.value -replace '^S(.*): ',''}"
echo.

set /p a=please select one wifi devices: 

REM 链接
netsh wlan connect name="%a%"

pause > nul