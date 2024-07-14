@echo off
title Loki Antivirus
cls

:Start
color 0A

echo " ___       ________  ___  __    ___     ";
echo "|\  \     |\   __  \|\  \|\  \ |\  \    ";
echo "\ \  \    \ \  \|\  \ \  \/  /|\ \  \   ";
echo " \ \  \    \ \  \\\  \ \   ___  \ \  \  ";
echo "  \ \  \____\ \  \\\  \ \  \\ \  \ \  \ ";
echo "   \ \_______\ \_______\ \__\\ \__\ \__\";
echo "    \|_______|\|_______|\|__| \|__|\|__|";
echo.
echo.
timeout /t 1 /nobreak >nul
echo ---------------------------
echo            MENU
echo ---------------------------
echo.
echo Choose options (Answer using 1, 2, 3, 4, or 5):
echo.
echo 1) PortScan
echo 2) IP Sniffer
echo 3) Exploit Detection (Work in progress)
echo 4) Password Encrypter
echo 5) Exit
echo.
set /p options=Option:
echo ----------------------------------------

if /i "%options%" == "1" (
    goto PortScan
) else if /i "%options%" == "2" (
    goto IpSniffer
) else if /i "%options%" == "3" (
    goto ExploitDetection
) else if /i "%options%" == "4" (
    goto PasswordEncrypter
) else if /i "%options%" == "5" (
    goto Exit
) else (
    goto InvalidOption
)

:PasswordEncrypter
echo Opening PasswordEncrypter...
pause
echo Please wait
cd "C:\Users\Canaan\Documents\Notepad++\The LOKI Project"
timeout /t 1 /nobreak >nul
start PasswordEncrypter.bat
pause
cls
goto Start

:PortScan
echo Scanning for open ports on your computer...
echo This may take a few moments.
echo.

rem Using netstat to list listening ports
netstat -an | find "LISTENING"

echo.
echo Scan complete.
pause
cls
goto Start

:IpSniffer
echo Opening IP Sniffer...
pause
echo Please wait
cd "C:\Users\Canaan\Documents\Notepad++\The LOKI Project"
timeout /t 1 /nobreak >nul
start python IpSniffer.py
pause
cls
goto Start

:ExploitDetection
echo Performing exploit detection...
echo.

rem Check for suspicious processes (example: looking for cmd.exe or powershell.exe running from unusual locations)
echo Checking for suspicious processes...
tasklist /FI "IMAGENAME eq cmd.exe" /FI "SESSIONNAME ne Console" > exploit_log.txt
tasklist /FI "IMAGENAME eq powershell.exe" /FI "SESSIONNAME ne Console" >> exploit_log.txt

rem Check for unusual network connections (example: looking for unusual remote addresses)
echo Checking for unusual network connections...
netstat -an | findstr /i "ESTABLISHED" >> exploit_log.txt

rem Check for unexpected changes in system files (example: checking if system files have been modified recently)
echo Checking for recent changes in system files...
dir C:\Windows\System32\*.* /OD /T:W >> exploit_log.txt

rem Check for auto-starting programs (example: looking for suspicious entries in the registry)
echo Checking for auto-starting programs...
reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run >> exploit_log.txt
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run >> exploit_log.txt

rem Check for unusual services (example: looking for non-standard services)
echo Checking for unusual services...
sc query type= service state= all | findstr /i "SERVICE_NAME" >> exploit_log.txt

rem Display results to the user
echo.
echo Exploit detection complete. Results saved in exploit_log.txt.
pause
cls
goto Start

:Exit
echo Are you sure you want to exit? (yes/no)
set /p answer=Answer:
if /i "%answer%" == "yes" (
    pause
    exit
) else if /i "%answer%" == "no" (
    cls
    goto Start
) else (
    echo Invalid answer, please choose again.
    pause
    cls
    goto Exit
)

:InvalidOption
echo Invalid option selected. Please choose a valid option from the menu.
pause
cls
goto Start
