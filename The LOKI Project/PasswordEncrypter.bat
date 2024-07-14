@echo off
setlocal EnableDelayedExpansion

REM Use PowerShell to compute MD5 hash
for /f %%H in ('powershell -Command "$password = read-host 'Enter password to encrypt'; $md5 = [System.Security.Cryptography.MD5]::Create(); $hash = [System.BitConverter]::ToString($md5.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($password))); $hash -replace '-'"') do (
    set "md5_hash=%%H"
)

REM Display the MD5 hash
echo MD5 Hash of "%password%": %md5_hash%

pause
