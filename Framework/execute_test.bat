@echo off
setlocal enabledelayedexpansion

set TEAMNAME=none
set TESTTYPE=both
if [%1] == [] (
	echo Error: Invalid commandline.
	echo Usage: execute_test.bat -team ^<team-name^> [-test ^<test-type\file-name^>]
	exit /B 0
)
set args=%*
set arr.length=0
	for  %%I in ("%args: =" "%") do (
		set val=%%I
		set arr[!arr.length!]=!val:"=!

		rem incrememt %array.length%
		set /a arr.length=!arr.length! + 1
		
	)
	echo arr[] has a length of %arr.length%.
 set /a arr.Ubound=%arr.length% - 1
 for /L %%I in (0, 2, %arr.Ubound%) do (
    echo arr[%%I] = !arr[%%I]!
	if "!arr[%%I]!" == "-team" (
		call set /A "v=%%I%% + 1"
		call set "TEAMNAME=%%arr[!v!]%%"
		echo !TEAMNAME!
		if exist "..\UCC\!TEAMNAME!" (
		echo true team
		) else (
			echo Invalid team name
			exit /B 0
		)
	) else if "!arr[%%I]!" == "-test" (
		echo %%I
		call set /A "l=%%I%% + 1"
		call set "TESTTYPE=%%arr[!l!]%%"
		echo !TESTTYPE!
		
		if exist ".\!TESTTYPE!" (
		echo true type
		) else if exist "req\ucc_test_suites\!TESTTYPE!" (
		echo truetesttype1
		) else if exist "lang\ucc_test_suites\!TESTTYPE!" (
			echo true testtype2
		) else (
			echo Invalid test type
			exit /B 0
		)
		
	) else (
		echo Invalid switch
		echo Usage: execute_test.bat -team ^<team-name^> [-test ^<test-type\file-name^>]
		exit /B 0
	)
)
if "!TEAMNAME!" == "none" ( 
	echo -team is mandatory
	exit /B 0
)

REM make -C "..\UCC\!TEAMNAME!"
cp "../UCC/!TEAMNAME!/bin/UCC" "./ucc_executables/" 
mkdir output\tmp

if "!TESTTYPE!" == "both" (
	set test_suite=req\ucc_test_suites
	call robot -d output\tmp %test_suite%
	call python execute_test_archive.py	!TEAMNAME! req
    rmdir /s/q output\tmp
    mkdir output\tmp
    cp -r lang/output_tmp/* output/tmp 
	set test_suite=lang\ucc_test_suites
	call robot -d output\tmp %test_suite%
	call python execute_test_archive.py	!TEAMNAME! lang

) else if "!TESTTYPE" == "req" (
	set test_suite=req\ucc_test_suites
	call robot -d output\tmp !test_suite!
	call python execute_test_archive.py	!TEAMNAME! req

) else if "!TESTTYPE!" == "lang" (
	set test_suite=lang\ucc_test_suites
    cp -r lang/output_tmp/* output/tmp 
	call robot -d output\tmp %test_suite%
	call python execute_test_archive.py	!TEAMNAME! lang

) else if exist ".\req\ucc_test_suites\!TESTTYPE!" (
	set test_suite=req\ucc_test_suites\!TESTTYPE!
	call robot -d output\tmp !test_suite!
	call python execute_test_archive.py	!TEAMNAME! !TESTTYPE!

) else (
	set test_suite="lang\ucc_test_suites\!TESTTYPE!"
    cp -r lang/output_tmp/* output/tmp 
	call robot -d output\tmp !TESTTYPE!
	call python execute_test_archive.py	!TEAMNAME! !TESTTYPE!
)

rm -rf output/tmp
REM rm -rf ../UCC/!TEAMNAME!/*
rm ucc_executables/UCC	







