@echo off
echo ������·����
set /p fp=
echo �����뿪ʼʱ�䣺
set /p st=
echo ���������ʱ�䣺
set /p et=
echo �������Ƭʱ�䣺
set /p sgt=
echo ע�⣺ѭ����Χ����Ҫ�ո�
for /l %%i in (%st%, %sgt%, %et%) do call :aaa %sgt% %%i
pause

:aaa
set /a sgt_2=%2 + sgt
ffmpeg -i %fp% -ss %2 -to %sgt_2% -acodec copy -vcodec copy %2.mp4






























