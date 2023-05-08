chcp 65001 > nul
color 3e
@echo off

echo "wifi-devices:"
netsh wlan show profiles | findstr ":"
set /p a="Please enter the corresponding above wifi name:	"
echo.

rem 新建零时文件保存
rem netsh wlan show profiles "%a%" key=clear > .\temp.txt
rem (type .\temp.txt | findstr "Key Content" & type .\temp.txt | findstr "关键内容") 

rem 删除零时文件
rem echo y | del .\temp.txt

rem 使用 find、findstr查询
netsh wlan show profiles "%a%" key=clear | findstr "Key Content"




pause > nul