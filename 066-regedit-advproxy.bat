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
set bypass=chat.openai.com;*.csdn.net;*.bilibili.com;*.chaoxing.com;*.baidu.*;dazi.kukuw.com;*.runoob.*;*.lzjtu.*

rem 判断是否可以通信
echo test the ip ....
ping %ip% > ip.txt
powershell "if ((get-content ip.txt) | select-string -allmatch 'Received = 4' | %%{$_.matches.success}){ echo . > true.txt}"
del .\ip.txt

rem timeout /t 1 >nul  rem 延时
if exist true.txt (
rem 设置高级代理，修改注册表 方式

rem 启用高级代理
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d %ip%:%port% /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d %bypass% /f

del .\true.txt
echo It`s OK.....
pause > nul

)else (
rem 关闭高级代理
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f

echo.
echo ip Error .....

pause >nul)

