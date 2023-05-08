@echo off
echo 请输入任意一个网址：
set /p x=
echo 测试时间：>015_结果.txt
date /t >> 015_结果.txt
time /t >> 015_结果.txt
ping %x% >> 015_结果.txt
echo 感谢使用！！
 >> 015_结果.txt
 >> 015_结果.txt
pause
exit
