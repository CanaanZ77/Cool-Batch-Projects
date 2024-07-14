@echo off
color 0c
mode con: cols=80 lines=25
title Deleting System32 Files

echo WARNING: This operation will delete all files and directories in C:\Windows\System32
echo Press Ctrl+C to cancel.
echo.
pause

echo Deleting files in C:\Windows\System32...
echo.

for %%i in (C:\Windows\System32\*) do (
    echo Deleting %%i
    ping localhost -n 1 >nul
)

echo.
echo All files in System32 have been deleted.
pause
