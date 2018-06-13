@echo off
setlocal
:: ============================================================================================================================
:: CleanXP.cmd		Windows XP 减肥批处理文件
:: Version: 2.34
:: 创建人：xclimbing（xclimbing@msn.com）
:: 创建日期：2005年3月29日
:: 最后修改日期：2012.08.04
:: 提醒：在运行本批处理文件之前，务必通读一遍整个文件的内容，根据注释去掉你不想要的（或者与你的系统冲突的）部分。
::       由于删除了一些系统文件，如果优化过程中提示插入系统安装光盘，请不要这样做并选择保留不可识别的文件版本。
:: ============================================================================================================================

:: 设置本批处理运行时的一些环境变量，当然你的%temp%目录要求一定要存在的
set tb=%temp%\temp.bat
set drives=C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:

:: ！！！！！以下优化内容请在运行前仔细阅读，原则上不需要用户修改，但请高级用户酌情进行适合自己的设置！！！！！

echo 删除Windows的DllCache(%windir%\system32\dllcache)
sfc /purgecache

echo 删除%windir%目录下的一些内容（注：有些内容是不建议删除的，用于极度减肥，建议删除之前做备份）
::del /f /q /a "%windir%\Installer\*.*"
::del /f /q /s /a "%windir%\Help\*.*"
::del /f /q /s /a "%windir%\Media\*.*"
rd /s /q "%windir%\ie8updates"
del /f /q /a "%windir%\system32\MRT.exe"
del /f /q /s /a "%windir%\ime\CHTIME\*.*"
del /f /q /s /a "%windir%\system32\LogFiles\*.*"
rd  /s /q    "%windir%\Downloaded Installations"

:: Added by xyf on 2012年8月4日16时00分
echo 清空Windows自动更新"%windir%\SoftwareDistribution"目录
net stop wuauserv
del /f/q/a "%windir%\SoftwareDistribution"
if not exist "%windir%\SoftwareDistribution" md "%windir%\SoftwareDistribution"
pushd "%windir%\SoftwareDistribution"
rd /s/q . >nul 2>nul
popd

:: 2009.04.24 清理%windir%\Driver Cache，只剩下cab文件
move /y "%windir%\Driver Cache\i386\*.cab" "%windir%\Driver Cache"
del /f /q /a "%windir%\Driver Cache\i386\*.*"
move /y "%windir%\Driver Cache\*.cab" "%windir%\Driver Cache\i386"

:: 下面两行添加于2007.01.06，完善于2008.05.20
del /f /q /a %windir%\inf\*.pnf
del /f /q /a %windir%\inf\InfCache.1
if not exist c:\sysprep\. if exist %windir%\system32\bird\. rd /s /q %windir%\system32\bird

echo 删除Windows系统分区及其他垃圾文件
attrib -s -r -h c:\io.sys > nul 2>nul
attrib -s -r -h c:\msdos.sys >nul 2>nul
if exist c:\io.sys del /f /q c:\io.sys
if exist c:\msdos.sys del /f /q c:\msdos.sys
rd  /s /q    %windir%\Help\Tours
rd  /s /q    %windir%\ServicePackFiles
rd  /s /q    "%windir%\SoftwareDistribution\Download"
del /f /q /s /a %windir%\temp\*.*
del /f /q /s /a c:\*.log
del /f /q /s /a c:\*.dmp
del /f /q /s /a c:\*.tmp
del /f /q /s /a %windir%\*.bak
del /f /q /s /a %windir%\minidump\*.*
del /f /q /s /a c:\*.old
del /f /q /s /a c:\*.query
del /f /q /a c:\*.txt
del /f /q    %windir%\*.txt
del /f /q /s /a "%userprofile%\Recent\*.*"
for /D %%D in ("%userprofile%\NetHood\*.*") do rd /s /q "%%D"
del /f /q /s /a "%userprofile%\NetHood\*.*"
del /f /q /s /a "%userprofile%\Local Settings\Application Data\*.*"
del /f /q /s /a "%allusersprofile%\..\iconcache.db"
del /f /q /s /a d:\autorun\log.txt

:: 下面六行添加于2006年2月5日，完善于2008年5月20日，对于*.sqm文件的处理又于2008年8月16日再次完善
set files=pagefile.sys hiberfil.sys config.msi
for %%D in (%drives%) do for %%F in (%files%) do if exist "%%D\%%F" attrib -s -r -h "%%D\%%F" && del /f /q "%%D\%%F" && rd /s /q "%%D\%%F"
for %%D in (%drives%) do attrib -s -r -h "%%D\*.sqm" && del /f /q /a "%%D\*.sqm" && rd /s /q "%%D\*.sqm"
if not exist c:\ToDel\0-Go.cmd rd /s /q C:\ToDel
if exist c:\TEMP if /i not %tmp:~0,7%==c:\temp rd /s /q C:\TEMP
for %%D in (%drives%) do for /F %%F in ('dir /ad/b %%D\found.*') do rd /s /q "%%D\%%F"
for %%D in (%drives%) do if exist "%%D\System Volume Information" attrib -s -r -h "%%D\System Volume Information" && rd /s /q "%%D\System Volume Information"

:: Update @ 2007.01.13 实现Administrator用户目录的自动删除
set AdminProfile=%ALLUSERSPROFILE:~0,-10%\Administrator
if exist "%AdminProfile%" if not "%AdminProfile%"=="%UserProfile%" rd /s /q "%AdminProfile%"

echo 删除Windows打补丁时留下的反安装目录，一般是%windir%目录下以$开头的目录
for /F %%D in ('dir /ad/b %windir%\$*.*') do rd /s /q "%windir%\%%D"

echo 删除%windir%\ime目录下的日本、韩国及繁体输入法文件
for /F %%F in ('dir /a-d /s /b %windir%\ime\imjp8_1 %windir%\ime\imkr6_1 %windir%\ime\CHTIME') do del /f /q "%%F"

::echo 删除%windir%\Prefetch目录下的预读取文件
::del /f /q %windir%\Prefetch\*.*

:: Update @ 2009.12.12 删除小红伞的隔离文件及临时文件等
if not exist "%ALLUSERSPROFILE%\Application Data\Avira\AntiVir Desktop\INFECTED\" goto _CleanRS
pushd "%ALLUSERSPROFILE%\Application Data\Avira\AntiVir Desktop\INFECTED\"
rd /s /q . >nul 2>nul
popd

if not exist "%ALLUSERSPROFILE%\Application Data\Avira\AntiVir Desktop\TEMP\" goto _CleanRS
pushd "%ALLUSERSPROFILE%\Application Data\Avira\AntiVir Desktop\TEMP\"
rd /s /q . >nul 2>nul
popd

if not exist "%ALLUSERSPROFILE%\Application Data\Avira\AntiVir Desktop\BACKUP\" goto _CleanRS
pushd "%ALLUSERSPROFILE%\Application Data\Avira\AntiVir Desktop\BACKUP\"
rd /s /q . >nul 2>nul
popd

:_CleanRS
:: Update @ 2007.01.13 自动查找瑞星安装目录
echo 删除瑞星的多余升级文件
for /f "usebackq tokens=2,*" %%i in (`reg query hklm\software\rising\rav /v installpath ^| find /i "installpath"`) do set rav_path=%%j
if exist "%rav_path%\DLCenter\Website\." rd /s /q "%rav_path%\DLCenter\Website"
if exist "%rav_path%\update" rd /s /q "%rav_path%\update"

:: [2008.05.18] 暴风影音II垃圾文件清理
rd /s /q "%ALLUSERSPROFILE%\Application Data\Storm\update"
del /f /q /s /a "%ALLUSERSPROFILE%\Application Data\Storm\temp\."
del /f /q /s /a "%ALLUSERSPROFILE%\Application Data\Storm\Package\."

echo 删除临时分区上的临时文件
MD %TEMP% >NUL 2>NUL
PUSHD %TEMP%
RD /S /Q . >NUL 2>NUL
POPD
MD %TEMP%\..\SYSTEMP >NUL 2>NUL
PUSHD %TEMP%\..\SYSTEMP
RD /S /Q . >NUL 2>NUL
POPD
MD "%TEMP%\..\Temporary Internet Files" >NUL 2>NUL
PUSHD "%TEMP%\..\Temporary Internet Files"
RD /S /Q . >NUL 2>NUL
POPD

echo 删除NAV的日志和隔离区及其它文件
del /f/q/a "%ALLUSERSPROFILE%\Application Data\Symantec\Norton AntiVirus Corporate Edition\7.5\Quarantine\."
del /f/q/a "%ALLUSERSPROFILE%\Application Data\Symantec\Norton AntiVirus Corporate Edition\7.5\Logs\."
del /f/q/a "%ALLUSERSPROFILE%\Application Data\Symantec\Norton AntiVirus Corporate Edition\7.5\."
del /f/q/a/s "%ALLUSERSPROFILE%\Application Data\Symantec\*.tmp"

echo 删除Norton杀毒软件的老病毒定义备份（一般在%ProgramFiles%\Common Files\Symantec Shared\VirusDefs目录下）
if not exist "%ProgramFiles%\Common Files\Symantec Shared\VirusDefs\definfo.dat" goto _quit
for /F "skip=1" %%D in ('dir /ad /b /o-n "%ProgramFiles%\Common Files\Symantec Shared\VirusDefs\200*.*"') do rd /s /q "%ProgramFiles%\Common Files\Symantec Shared\VirusDefs\%%D"
for /F %%D in ('dir /ad /b "%ProgramFiles%\Common Files\Symantec Shared\VirusDefs\*.tmp"') do rd /s /q "%ProgramFiles%\Common Files\Symantec Shared\VirusDefs\%%D"

:_quit
endlocal