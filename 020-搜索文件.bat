@echo off
echo �������ļ���ʽ(* ͨ���������ݣ�? ƥ������һ���ַ�)
set /p a=��
echo ��������ҵ��̷�
set /p b=:
ehco ���Եȣ�Ŭ����ѯ��
dir /s/a/b %b%:\%a% > result.txt
echo ��������ɣ���鿴result.txt �ļ�
pause