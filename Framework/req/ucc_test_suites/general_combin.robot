# -*- coding: robot -*-

*** Settings ***
Library   OperatingSystem
Library   lib${/}UCCTestLibrary.py
Variables        ..${/}ucc_input${/}ucc_input_variables.py
Test Teardown    UCC Test Teardown   ${TEST NAME}

*** Variables ***
${TEMP STR}		Read, Analyze & Count keywords in files

*** Test Cases ***
AT.GR.001.001
    [Documentation]  UCC display error and usage on invalid switch
    [Setup]    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    [Template]    Invalid switch
    Error: -abc is not a valid UCC command line argument.  
    ...    -abc
    Error: -outdir\ \ Directory name is missing
    ...    -outdir
    Error: -trunc\ \ Truncation value missing
    ...    -trunc
    Error: -i1\ \ Baseline A file name missing
    ...    -i1
    Error: -i1\ \ Unable to open Baseline A file (invalid_file)
    ...    -i1  invalid_file
    Error: -i2 is not a valid UCC command line argument.
    ...    -i2
    Error: -i2\ \ Unable to open Baseline B file (invalid_file)
    ...    -d  -i1  fileList.txt  -i2  invalid_file
    Error: -t\ \ Invalid usage: -d\ \ must be specified as well
    ...    -t
    Error: -t\ \ Threshold number missing
    ...    -d  -t
    Error: -dir\ \ Not enough directories given
    ...    -dir
    Error: -dir\ \ Invalid Baseline A directory: (invalid_dir) either not found or not a directory.
    ...    -dir  invalid_dir
    Error: -dir\ \ Invalid Baseline B directory: (invalid_dir) either not found or not a directory.
    ...    -d  -dir  req/ucc_input  invalid_dir
    Error: -t\ \ Difference threshold given must be an integer between 0 and 100.
    ...    -d  -t  150

AT.GR.002.001
    [Documentation]  UCC should have a progress indicator that displays the
    ...              number of files processed during program execution.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    :FOR	${iter}	IN RANGE	1	${DEFAULT FILE LIST SIZE}+1
    \	${TEMP STR}	Builtin.Catenate	${TEMP STR}\\D*${iter}
    ${TEMP STR}	Builtin.Catenate	${TEMP STR}\\D*DONE
    Log	${TEMP STR}
    Response should match	${TEMP STR}

AT.GR.004.001
    [Documentation]  UCC should return the amount of time the UCC program
    ...              ran, the total number of files UCC processed and the 
    ...              ratio of files processed compared to time in an
    ...              output file.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   Total time :\\s+\\d+ seconds
    Response should match   \\d+ files for \\d+(.\\d+)? files processed per second
    
AT.GR.004.002
    [Documentation]  UCC should return the amount of time the UCC program
    ...              ran, the total number of files UCC processed and the 
    ...              ratio of files processed compared to time in an
    ...              output file.
    Create UCC File List     File List A.txt    FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp  
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp    
    Run UCC   @{UCC BASE}               -d  -i1  File List A.txt  -i2  FileListB.txt
    Response status check    0  0  0  0  0
    Response should match   Total time :\\s+\\d+ seconds
    Response should match   A Files: \\d+( )+B Files: \\d+ for \\d+(.\\d+)? files processed per second

AT.GR.005.001
    [Documentation]  UCC should allow the option of multi-threaded 
    ...              processing with the number of threads specified by 
    ...              either user input or automatically based on the number 
    ...              of free processors. 
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}   -threads  4
    Response should not contain  Error: -threads is not a valid UCC command line argument.
    
AT.GR.005.003
    [Documentation]  UCC should allow the option of multi-threaded 
    ...              processing with the number of threads specified by 
    ...              either user input or automatically based on the number 
    ...              of free processors.
    Create UCC File List     File List A.txt    FileA1.cpp
    Copy File                @{COUNTSET7.filelist}[0]   FileA1.cpp   
    Run UCC  @{UCC BASE}                -i1  File List A.txt  -threads  4
    Response should not contain  Error: -threads is not a valid UCC command line argument.

AT.GR.006.001
    [Documentation]  UCC should accept -ramlimit <#> switch to specify RAM 
    ...              limit used for estimation of success in 100 MB     
    ...              increments.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}  -ramlimit  1
    Response should not contain
    ...     Error: -ramlimit is not a valid UCC command line argument.
    Response should not contain
    ...     Available RAM is not enough for estimated needs.

AT.GR.006.002
    [Documentation]  If a process will exceed RAM allocated, UCC should 
    ...              display error message suggesting user to increase the 
    ...              RAM limit parameter, reduce the number of files to 
    ...              process or split the largest file.
    Log  os.sep
    Pass Execution If  os.sep == '\'
    ...  Windows detected, test case is for Unix-like OS only
    Set test variable  ${LARGE FILE DIR}  robot_output/tmp/largefile
    Run     mkdir -p ${LARGE FILE DIR}
    Run     dd if=/dev/zero of=${LARGE FILE DIR}/large_file.cpp count=105 bs=1048576
    Run UCC    @{UCC BASE}  -dir  ${LARGE FILE DIR}  -ramlimit  1
    Response should contain
    ...              Available RAM is not enough for estimated needs.
    Run     rm -rf ${LARGE FILE DIR}
    
AT.GR.006.003
    [Documentation]  UCC should accept -ramlimit <#> switch to specify RAM 
    ...              limit used for estimation of success in 100 MB     
    ...              increments.  
    Create UCC File List     File List A.txt    FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp  
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp    
    Run UCC   @{UCC BASE}               -d  -i1  File List A.txt  -i2  FileListB.txt  -ramlimit  1
    Response should not contain
    ...     Error: -ramlimit is not a valid UCC command line argument.
    Response should not contain
    ...     Available RAM is not enough for estimated needs.


AT.GR.007.001
    [Documentation]  UCC should display version number when -v switch is  
    ...              used
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}   -v
    Response should contain   UCC version

AT.GR.007.002
    [Documentation]  UCC should display version number when -v switch is
    ...              used with -trunc switch
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}   -v  -trunc  85
    Response should contain   UCC version

AT.GR.008.001
    [Documentation]  UCC should allow a user to set up a logical SLOC 
    ...              truncation threshold, which by default is 10,000.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}   -trunc 85
    Response should not contain  Error: -trunc is not a valid UCC command line argument.

AT.GR.008.002
    [Documentation]  UCC should allow a user to set up a logical SLOC
    ...              truncation threshold, which by default is 10,000.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}   -trunc  100
    Response should contain  files processed per second

AT.GR.009.001
    [Documentation]  UCC should be able to handle ClearCase filenames. 
    Create UCC file list  fileList.txt  req/ucc_input/cc_main.cpp@@cc_main.cpp
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should not contain  Error: Unable to open file

AT.GR.010.001
    [Documentation]  UCC should not follow symbolic linked directory on 
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s req/ucc_input/test/sub.dir req/ucc_input/test/sub_dir
    Run UCC    @{UCC BASE}      -nolinks  -dir  req/ucc_input/test/sub_dir
    Should not exist  DuplicatePairs.csv
    Response should match  2 files for.*files processed per second

AT.GR.010.002
    [Documentation]  UCC should not follow symbolic linked file on 
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s MainObject.cpp req/ucc_input/test/sub_dir/MainObject2.cpp
    Run UCC    @{UCC BASE}      -nolinks  -dir  req/ucc_input/test/sub_dir
    Should not exist  DuplicatePairs.csv
    Response should match  2 files for.*files processed per second
    Run          rm req/ucc_input/test/test_link/realdir/MainObject2.cpp

AT.GR.010.003
    [Documentation]  UCC should not follow symbolic linked file on 
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s MainObject.cpp req/ucc_input/test/sub_dir/link1/
    Run		 rm req/ucc_input/test/sub_dir/realdir
    Run          ls -a req/ucc_input/test/sub_dir/* > fileList.txt
    Run UCC    @{UCC BASE}      -nolinks  
    Response should match  3 files for.*files processed per second
    Run          rm req/ucc_input/test/test_link/realdir/MainObject2.cpp

AT.GR.011.001
    [Documentation]  UCC should return the total number of files processed.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   \\d+ files for \\d+(.\\d+)? files processed per second

AT.GR.012.001
    [Documentation]  UCC should return the average number of files 
    ...              processed per second.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   \\d+ files for \\d+(.\\d+)? files processed per second

AT.GR.013.001
    [Documentation]  UCC should return the number of seconds required at 
    ...              each processing step, and total (steps are: build file 
    ...              list; read, analyze & count; find duplicates; generate 
    ...              results files). 
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   Build file list\\s*:\\s*\\d+\\s*Read, Analyze & Count\\s*:\\s*\\d+\\s*Find duplicates\\s*:\\s*\\d+\\s*Generate results files\\s*:\\s*\\d+\\s*Total time\\s*:\\s*\\d+\\s*seconds

AT.GR.014.001
    [Documentation]  UCC should return the number of stack dumps returned. 
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   Stack Dumps:\\s*\\d+

AT.GR.015.001
    [Documentation]  UCC should return the number of errors occurred.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   Errors:\\s*\\d+

AT.GR.016.001
    [Documentation]  UCC should return the number of warnings returned. 
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   Warnings:\\s*\\d+

AT.GR.016.002
    [Documentation]  UCC should return the number of warnings returned when generated using -dir. 
    Run UCC    @{UCC BASE}	-dir	req/ucc_input	*.cpp
    Response should match   Warnings:\\s*\\d+

AT.GR.017.001
    [Documentation]  UCC should return the number of information messages 
    ...              returned.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   Information:\\s*\\d+

AT.GR.017.002
    [Documentation]  UCC should return the number of information messages 
    ...              returned. 
    Run UCC    @{UCC BASE}	-dir	req/ucc_input	*.h
    Response should match   Information:\\s*\\d+

AT.GR.018.001
    [Documentation]  UCC should return the number of files that were not 
    ...              counted.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    @{UCC BASE}
    Response should match   Uncounted Files:\\s*\\d+

AT.GR.018.002
    [Documentation]  UCC should return the number of files that were not 
    ...              counted. 
    Run UCC    @{UCC BASE}	-dir	req/ucc_input	*.cpp	*.h
    Response should match   Uncounted Files:\\s*\\d+

AT.GR.019.001
	[Documentation]			Check if UCC throws an error with no arguments
	Run UCC                 @{UCC BASE}
	Response should contain   Unable to open list file

AT.GR.020.001
	[Documentation]			Check if UCC throws an error with only dir option
	Run UCC                 @{UCC BASE}  -dir
	Response should contain   Not enough directories given

AT.GR.020.002
	[Documentation]			Check if UCC throws an error with filelist
	Create default file list     @{DEFAULT FILE LIST}
	Run UCC                 @{UCC BASE}  -dir  filelist.txt
	Response should contain   not a directory

AT.GR.020.003
	[Documentation]			Check if UCC throws an error if given only a directory without dir option
	Run UCC                 @{UCC BASE}  -dir   @{OUTPUT ENHANCEMENTS SOURCE}
	Response should contain   Unable to open list file

AT.GR.021.001	
	[Documentation]			Manually check if UCC throws an error for negative number of threads 		
	Run UCC                 @{UCC BASE}  -threads  -2

AT.GR.021.002
	[Documentation]			Check if UCC throws an error for string with threads option
	Run UCC                 @{UCC BASE}  -threads  "string"
    Response should contain  files processed per second

AT.GR.022.001	
	[Documentation]			Manually check if UCC throws an error for negative ramlimit	
	Run UCC                 @{UCC BASE}  -ramlimit  -1

AT.GR.022.002	
	[Documentation]			Manually check if UCC throws an error for negative ramlimit	
	Run UCC                 @{UCC BASE}  -ramlimit  "string"  

AT.GR.023.001	
	[Documentation]			Check if UCC throws an error for negative trunc	
	Run UCC                 @{UCC BASE}  -trunc  -1
	#Response should contain   "Truncation value must be 0 or more"
	
AT.GR.023.002	
	[Documentation]			Manually check if UCC throws an error for String trunc	
	Run UCC                 @{UCC BASE}  -trunc  "string"  

AT.GR.024.001	
	[Documentation]			Check if UCC throws an error for empty directory	
	Run UCC                 @{UCC BASE}  -d  -dir  @{GENERAL EMPTY}  
	Response should contain   Not enough directories given
	
AT.GR.024.002	
	[Documentation]			Check if UCC throws an error for empty file in directory	
	Run UCC                 @{UCC BASE}  -dir  @{GENERAL}  empty.py  
	Response should contain   File is empty
	
AT.GR.024.003	
	[Documentation]			Check if UCC throws an error for empty directory	
	Run UCC                 @{UCC BASE}  -dir  @{GENERAL EMPTY}
	Response should contain   Unable to open list file
	
AT.GR.024.004	
	[Documentation]			Check if UCC runs differencing on two empty directories
	Run UCC                 @{UCC BASE}  -d  -dir  @{GENERAL EMPTY}  @{GENERAL EMPTY1}
	Response status check    0  0  0  0  0

AT.GR.025.001	
	[Documentation]			Check if UCC throws an error when given only one filelist	
	Run UCC                 @{UCC BASE}  -d  -i1  @{MAINTENANCE_CSHARP_ALL_SOURCE}
	Response should contain   Unable to open list file
    
*** Keywords ***
Invalid switch
    [Arguments]   ${error}  @{args}
    Run UCC    @{UCC BASE}       @{args}
    Response should contain   ${error}
    Response should contain   Usage: ucc