@echo off
echo 请输入文件格式(* 通配所有内容，? 匹配任意一个字符)
set /p a=：
echo 请输入查找的盘符
set /p b=:
ehco 请稍等，努力查询中
dir /s/a/b %b%:\%a% > result.txt
echo 搜索已完成，请查看result.txt 文件
pause