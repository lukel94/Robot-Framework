@echo off
rem **************************************************************************
rem
rem zpag_wkbkup.bat
rem
rem **************************************************************************
rem
rem Description:
rem
rem This script adds directories to a zpaq archive.
rem directories at work to another hard drive.
rem
rem zpaq command line tool can be downloaded from the following link:
rem http://mattmahoney.net/dc/zpaq.html
rem
rem Requirements:
rem
rem Requires zpaq.exe to be mapped to the path environment variable.
rem
rem
rem Notes:
rem
rem http://ss64.com/nt/schtasks.html
rem http://support.microsoft.com/kb/308569
rem http://drupal.org/node/31506
rem
rem http://stackoverflow.com/questions/245395/hidden-features-of-windows-batch-files
rem
rem Maintenance:
rem
rem Periodically remove old incremental saves and verify the archive.
rem
rem Alternative Solutions:
rem
rem BUP is a backup utility built around git and maybe more suitable for my use
rem when it has a stable release.
rem
rem **************************************************************************

echo %0 start

rem ########################################
zpaq add c:\work.zpaq c:\_bkspc -method 4
zpaq add c:\work.zpaq c:\bin -method 4
zpaq add c:\work.zpaq c:\home -method 4
zpaq add c:\work.zpaq c:\projects -method 4
zpaq add c:\work.zpaq c:\repo -method 4
zpaq add c:\work.zpaq c:\license -method 4

time /t
date /t

set DRV=f:

IF EXIST %DRV% GOTO :DRV_EXISTS
echo ############################
echo  eee  RR    RR    OO    RR
echo E    R  R  R  R  O  O  R  R
echo Eee  RRR   RRR   O  O  RRR
echo E    R  R  R  R  O  O  R  R
echo Eeee R   R R   R  OO   R   R
echo ############################
echo ERROR: %DRV% DRIVE NOT CONNECTED, RDIFF-BACKUP SCRIPT NOT RUN
pause
exit

:DRV_EXISTS
rem OLDWAY ==> copy c:\work.zpaq %DRV%\work.zpaq

rem using esentutl to get a progress bar
del %DRV%\work.zpaq
esentutl /y c:\work.zpaq /d %DRV%\work.zpaq /o

echo ZPAQ backup batch script complete
rem **************************************************************************
rem Useful ZPAQ commands
rem **************************************************************************
