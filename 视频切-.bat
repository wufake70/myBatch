@echo off
echo 请输入路径：
set /p fp=
echo 请输入开始时间：
set /p st=
echo 请输入结束时间：
set /p et=
echo 请输入分片时间：
set /p sgt=
echo 注意：循环范围参数要空格。
for /l %%i in (%st%, %sgt%, %et%) do call :aaa %sgt% %%i
pause

:aaa
set /a sgt_2=%2 + sgt
ffmpeg -i %fp% -ss %2 -to %sgt_2% -acodec copy -vcodec copy %2.mp4






























