set /p a= 请输入:
echo %a%
if %a% == b (goto aaa) else goto bbb 

:aaa
echo 已跳转到aaa
pause

:bbb 
echo 已跳转到bbb
pause

