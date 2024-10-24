@echo off
chcp 65001 > nul
title config advanced proxy

rem 管理员权限运行
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :script","","runas",1)(window.close)&exit

:script
set /p ip="input ip of server: "
set /p port="input port of ip: "  

rem 判断是否可以通信
echo test the ip ....
ping %ip% > ip.txt
powershell "if ((get-content ip.txt) | select-string -allmatch 'Received = 4' | %%{$_.matches.success}){ echo . > true.txt}"
del .\ip.txt

rem timeout /t 1 >nul  rem 延时
if exist true.txt (
rem  自动编写json文件
echo {"Proxy": "%ip%:%port%","AutoconfigUrl":"","AutoDetect":false,"ProxyBypass":"chat.openai.com;*.csdn.net;*.bilibili.com;*.chaoxing.com;*.baidu.*;dazi.kukuw.com;*.runoob.*;*.lzjtu.*"} > temp.json

rem 设置高级代理
netsh winhttp set advproxy setting-scope=user settings-file=.\temp.json

del .\temp.json
del .\true.txt
echo It`s OK.....
pause > nul

)else (
echo ip Error .....

pause >nul)

