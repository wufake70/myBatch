@echo off
echo 请输入搜索规则(可用正则)
set /p a=:
echo 请输入搜索的盘符
set /p b=:
echo 请稍等
dir /s/b/a %b%:\* | findstr /i %a% > 搜索结果.csv

pause

