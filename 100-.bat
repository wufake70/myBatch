runas /user:administrator "cmd /c %1"
@echo off
echo wifi devices:
netsh wlan show profiles | findstr :
set /p a=please enter wifi name:
netsh wlan show profiles "%a%" key=clear | findstr Key
pause
