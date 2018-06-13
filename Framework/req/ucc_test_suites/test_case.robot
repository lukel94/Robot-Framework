*** Settings ***
Library   OperatingSystem
Library   lib${/}UCCTestLibrary.py
Variables        ..${/}ucc_input${/}ucc_input_variables.py
Test Teardown  UCC Test Teardown  ${TEST NAME}
Test Setup  Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
*** Test Cases ***
AT.GR.001.001
    [Documentation]  UCC display error and usage on invalid switch
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
    ...    -d  -dir  ucc_input  invalid_dir
    Error: -t\ \ Difference threshold given must be an integer between 0 and 100.
    ...    -d  -t  150

AT.GR.002.001
    [Documentation]  UCC should have a progress indicator that displays the
    ...              number of files processed during program execution.
    Run UCC    @{UCC BASE} 	
    Response should match   Read, Analyze & Count keywords in files.*1.*2.*3

AT.GR.004.001
    [Documentation]  UCC should return the amount of time the UCC program
    ...              ran, the total number of files UCC processed and the 
    ...              ratio of files processed compared to time in an
    ...              output file.
    Run UCC    @{UCC BASE}
    Response should match   Total time :\\s+\\d+ seconds
    Response should match   \\d+ files for \\d+(.\\d+)? files processed per second

AT.GR.005.001
    [Documentation]  UCC should allow the option of multi-threaded 
    ...              processing with the number of threads specified by 
    ...              either user input or automatically based on the number 
    ...              of free processors. 
    Run UCC    @{UCC BASE}   -threads 4
    Response should not contain  Error: -threads is not a valid UCC command line argument.

AT.GR.006.001
    [Documentation]  UCC should accept -ramlimit <#> switch to specify RAM 
    ...              limit used for estimation of success in 100 MB     
    ...              increments.
    Run UCC    @{UCC BASE}  -ramlimit 1
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


AT.GR.007.001
    [Documentation]  UCC should display version number when -v switch is  
    ...              used
    Run UCC    @{UCC BASE}   -v
    Response should contain   UCC version

AT.GR.008.001
    [Documentation]  UCC should allow a user to set up a logical SLOC 
    ...              truncation threshold, which by default is 10,000.
    Run UCC    @{UCC BASE}   -trunc 85
    Response should not contain  Error: -trunc is not a valid UCC command line argument.

AT.GR.009.001
    [Documentation]  UCC should be able to handle ClearCase filenames. 
    Create UCC file list  fileList.txt  ucc_input/cc_main.cpp@@cc_main.cpp
    Run UCC    @{UCC BASE}
    Response should not contain  Error: Unable to open file

AT.GR.010.001
    [Documentation]  UCC should not follow symbolic linked directory on 
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s ucc_input/test/sub.dir ucc_input/test/sub_dir
    Run UCC    @{UCC BASE}      -nolinks  -dir  ucc_input/test/sub_dir
    Should not exist  DuplicatePairs.csv
    Response should match  2 files for.*files processed per second

AT.GR.010.002
    [Documentation]  UCC should not follow symbolic linked file on 
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s MainObject.cpp ucc_input/test/sub_dir/MainObject2.cpp
    Run UCC    @{UCC BASE}      -nolinks  -dir  ucc_input/test/sub_dir
    Should not exist  DuplicatePairs.csv
    Response should match  2 files for.*files processed per second
    Run          rm ucc_input/test/test_link/realdir/MainObject2.cpp


AT.GR.011.001
    [Documentation]  UCC should return the total number of files processed. 
    Run UCC    @{UCC BASE}
    Response should match   \\d+ files for \\d+(.\\d+)? files processed per second

AT.GR.012.001
    [Documentation]  UCC should return the average number of files 
    ...              processed per second.  
    Run UCC    @{UCC BASE}
    Response should match   \\d+ files for \\d+(.\\d+)? files processed per second

AT.GR.013.001
    [Documentation]  UCC should return the number of seconds required at 
    ...              each processing step, and total (steps are: build file 
    ...              list; read, analyze & count; find duplicates; generate 
    ...              results files).  
    Run UCC    @{UCC BASE}
    Response should match   Build file list\\s*:\\s*\\d+\\s*Read, Analyze & Count\\s*:\\s*\\d+\\s*Find duplicates\\s*:\\s*\\d+\\s*Generate results files\\s*:\\s*\\d+\\s*Total time\\s*:\\s*\\d+\\s*seconds

AT.GR.014.001
    [Documentation]  UCC should return the number of stack dumps returned. 
    Run UCC    @{UCC BASE}
    Response should match   Stack Dumps:\\s*\\d+

AT.GR.015.001
    [Documentation]  UCC should return the number of errors occurred. 
    Run UCC    @{UCC BASE}
    Response should match   Errors:\\s*\\d+

AT.GR.016.001
    [Documentation]  UCC should return the number of warnings returned. 
    Run UCC    @{UCC BASE}
    Response should match   Warnings:\\s*\\d+

AT.GR.017.001
    [Documentation]  UCC should return the number of information messages 
    ...              returned. 
    Run UCC    @{UCC BASE}
    Response should match   Information:\\s*\\d+

AT.GR.018.001
    [Documentation]  UCC should return the number of files that were not 
    ...              counted. 
    Run UCC    @{UCC BASE}
    Response should match   Uncounted Files:\\s*\\d+

*** Keywords ***
Invalid switch
    [Arguments]   ${error}  @{args}
    Run UCC    @{UCC BASE}       @{args}
    Response should contain   ${error}
    Response should contain   Usage: ucc
