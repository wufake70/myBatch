@echo off
echo ��������������(��������)
set /p a=:
echo �������������̷�
set /p b=:
echo ���Ե�
dir /s/b/a %b%:\* | findstr /i %a% > �������.csv

pause

