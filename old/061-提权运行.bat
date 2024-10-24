@ECHO OFF
chcp 65001
setlocal EnableDelayedExpansion

rem 将当前目录更改为脚本所在的目录, cd /d 中参数 d 表示 可以直接改变 盘符，不用单独切换
PUSHD %~DP0 & cd /d "%~dp0"         
rem 运行传递给脚本的第一个和第二个参数。
%1 %2                               

rem 管理员权限 运行cmd, %~s0 表示 脚本当前路径
mshta vbscript:createobject("shell.application").shellexecute("%~s0","cmd","","runas",1)(window.close) 

rem echo %~s0       
rem pause