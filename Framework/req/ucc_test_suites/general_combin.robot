# -*- coding: robot -*-

*** Settings ***
Library   OperatingSystem
Library   lib${/}UCCTestLibrary.py
Variables        ..${/}ucc_input${/}ucc_input_variables.py
Test Teardown    UCC Test Teardown   ${TEST NAME}


*** Test Cases ***
AT.GR.001.001
    [Documentation]  UCC display error and usage on invalid switch
    [Setup]    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    [Template]    Invalid switch
    Argument '-abc' is not supported by UCC-G.
    ...    -abc
    No arguments provided
    ...    -outdir
    Error reading file
    ...    -i1  invalid_file
    Please specify valid arguments: -i2 option can only be used with -d option
    ...    -i2
    Error reading file
    ...    -d  -i1  fileList.txt  -i2  invalid_file
    Please provide a value for modifications threshold
    ...    -d  -t
    Please specify valid arguments for -dir option
    ...    -dir
    No files found at directory path
    ...    -dir  invalid_dir
    No files found at directory path
    ...    -d  -dir  req/ucc_input  invalid_dir
    Please provide a value for truncation threshold
    ...    -trunc
    Please provide a value for modifications threshold
    ...    -t

AT.GR.002.001
    [Documentation]  UCC should have a progress indicator that displays the
    ...              process of files processed during program execution.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Performing file counting..........................DONE

AT.GR.004.001
    [Documentation]  UCC should return the amount of time the UCC program
    ...              ran, the total number of files UCC processed and the
    ...              ratio of files processed compared to time in an
    ...              output file.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Total execution time:\\s+\\d+(.\\d+)?\\s+

AT.GR.004.002
    [Documentation]  UCC should return the amount of time the UCC program
    ...              ran.
    Create UCC File List     File List A.txt    FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  File List A.txt  -i2  FileListB.txt
    Response status check    0  0  0  0  0
    Response should match   Total execution time:\\s+\\d+(.\\d+)?\\s+


AT.GR.007.001
    [Documentation]  UCC should display version number when -v switch is
    ...              used
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}   -v
    Response should contain   Version =

AT.GR.007.002
    [Documentation]  UCC should display version number when -v switch is
    ...              used with -trunc switch
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}   -v  -trunc  85
    Response should contain   Version =

AT.GR.008.001
    [Documentation]  UCC should allow a user to set up a logical SLOC
    ...              truncation threshold, which by default is 10,000.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}   -trunc 85
    Response should not contain  Error: -trunc is not a valid UCC command line argument.

AT.GR.008.002
    [Documentation]  UCC should allow a user to set up a logical SLOC
    ...              truncation threshold, which by default is 10,000.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}   -trunc  100
    Response should match   Total execution time:\\s+\\d+(.\\d+)?\\s+

AT.GR.009.001
    [Documentation]  UCC should be able to handle ClearCase filenames.
    Create UCC file list  fileList.txt  req/ucc_input/cc_main.cpp@@cc_main.cpp
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should not contain  Error: Unable to open file

AT.GR.010.001
    [Documentation]  UCC should not follow symbolic linked directory on
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s req/ucc_input/test/sub.dir req/ucc_input/test/sub_dir
    Run UCC    java  -jar  @{UCC BASE}      -nolinks  -dir  req/ucc_input/test/sub_dir
    Should not exist  DuplicatePairs.csv
    Response should match   Total execution time:\\s+\\d+(.\\d+)?\\s+

AT.GR.010.002
    [Documentation]  UCC should not follow symbolic linked file on
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s MainObject.cpp req/ucc_input/test/sub_dir/MainObject2.cpp
    Run UCC    java  -jar  @{UCC BASE}      -nolinks  -dir  req/ucc_input/test/sub_dir
    Should not exist  DuplicatePairs.csv
    Response should match   Total execution time:\\s+\\d+(.\\d+)?\\s+
    Run          rm req/ucc_input/test/test_link/realdir/MainObject2.cpp

AT.GR.010.003
    [Documentation]  UCC should not follow symbolic linked file on
    ...              Unix-based systems.
    Log  os.sep
    Pass Execution If  os.sep != '/'  Windows detected, test case is for Unix-like OS only
    Run          ln -s MainObject.cpp req/ucc_input/test/sub_dir/link1/
    Run      rm req/ucc_input/test/sub_dir/realdir
    Run          ls -a req/ucc_input/test/sub_dir/* > fileList.txt
    Run UCC    java  -jar  @{UCC BASE}      -nolinks
    Response should match   Total execution time:\\s+\\d+(.\\d+)?\\s+
    Run          rm req/ucc_input/test/test_link/realdir/MainObject2.cpp

AT.GR.011.001
    [Documentation]  UCC should return the number of cores in available system resources.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Num cores: \\d+

AT.GR.011.002
    [Documentation]  UCC should return the total memory in available system resources.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Total Memory: \\d+(.\\d+)? MB

AT.GR.011.003
    [Documentation]  UCC should return the free memory in available system resources.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Free Memory: \\d+(.\\d+)? MB

AT.GR.011.004
    [Documentation]  UCC should return the total HD space in available system resources.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Total HD Space: \\d+(.\\d+)? GB

AT.GR.011.005
    [Documentation]  UCC should return the usable HD space in available system resources.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Usable HD Space: \\d+(.\\d+)? GB

AT.GR.012.001
    [Documentation]  Check Checksum calculation execution time when processing request.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Checksum calculation execution time:\\s+\\d+(.\\d+)?\\s+

AT.GR.012.002
    [Documentation]  Check Duplicate check execution time when processing request.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   Duplicate check execution time:\\s+\\d+(.\\d+)?\\s+

AT.GR.012.003
    [Documentation]  Check PSLOC and LSLOC Counting execution time when processing request.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Response should match   PSLOC and LSLOC Counting execution time:\\s+\\d+(.\\d+)?\\s+

AT.GR.013.001
    [Documentation]  UCC should return the number of seconds required at
    ...              each processing step(steps are: build file
    ...              list; read, analyze & count; find duplicates; generate
    ...              results files).
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Log should Match   Build file list\\s*:\\s*\\d+(.\\d+)?\\s*Read, Analyze & Count\\s*:\\s*\\d+(.\\d+)?\\s*Find duplicates\\s*:\\s*\\d+(.\\d+)?\\s*Generate results files\\s*:\\s*\\d+(.\\d+)?\\s*

AT.GR.013.002
    [Documentation]  UCC should return the total number of seconds
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Log should Match   Total time\\s*:\\s*\\d+(.\\d+)?\\s*


AT.GR.014.001
    [Documentation]  UCC should return the number of stack dumps returned.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Log should Match   Stack Dumps:\\s*\\d+

AT.GR.015.001
    [Documentation]  UCC should return the number of errors occurred.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Log should Match   Errors:\\s*\\d+

AT.GR.016.001
    [Documentation]  UCC should return the number of warnings returned.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Log should Match   Warnings:\\s*\\d+

AT.GR.016.002
    [Documentation]  UCC should return the number of warnings returned when generated using -dir.
    Run UCC    java  -jar  @{UCC BASE}  -dir    req/ucc_input   *.cpp
    Log should Match   Warnings:\\s*\\d+

AT.GR.017.001
    [Documentation]  UCC should return the number of information messages
    ...              returned.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Log should Match   Information:\\s*\\d+

AT.GR.017.002
    [Documentation]  UCC should return the number of information messages
    ...              returned.
    Run UCC    java  -jar  @{UCC BASE}  -dir    req/ucc_input   *.h
    Log should Match   Information:\\s*\\d+

AT.GR.018.001
    [Documentation]  UCC should return the number of files that were not
    ...              counted.
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    Log should Match   Uncounted Files:\\s*\\d+

AT.GR.018.002
    [Documentation]  UCC should return the number of files that were not
    ...              counted.
    Run UCC    java  -jar  @{UCC BASE}  -dir    req/ucc_input   *.cpp   *.h
    Log should Match   Uncounted Files:\\s*\\d+

AT.GR.019.001
    [Documentation]         Check if UCC throws an error with no arguments
    Run UCC                 java  -jar  @{UCC BASE}
    Response should contain   No arguments provided. Seeking out the file list by default.\nNo file list was found

AT.GR.020.001
    [Documentation]         Check if UCC throws an error with only dir option
    Run UCC                 java  -jar  @{UCC BASE}  -dir
    Response should contain   Please specify valid arguments for -dir option

AT.GR.020.002
    [Documentation]         Check if UCC throws an error with filelist
    Create default file list     @{DEFAULT FILE LIST}
    Run UCC                 java  -jar  @{UCC BASE}  -dir  filelist.txt
    Response should contain   No files found at directory path

AT.GR.020.003
    [Documentation]         Check if UCC throws an error if given only a directory without dir option
    Run UCC                 java  -jar  @{UCC BASE}  @{OUTPUT ENHANCEMENTS SOURCE}
    Response should contain   is not supported by UCC-G

AT.GR.023.001
    [Documentation]         Check if UCC throws an error for negative trunc
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC                 java  -jar  @{UCC BASE}  -trunc  -1
    Log should contain    Invalid truncation threshold value provided.

AT.GR.023.002
    [Documentation]         Manually check if UCC throws an error for String trunc
    Create UCC file list    fileList.txt    @{DEFAULT FILE LIST}
    Run UCC                 java  -jar  @{UCC BASE}  -trunc  "string"
    Log should contain   Cannot convert it to an integer.

AT.GR.024.001
    [Documentation]         Check if UCC throws an error for empty directory
    Run UCC                 java  -jar  @{UCC BASE}  -d  -dir  @{GENERAL EMPTY}
    Response should contain   Please specify two directory paths for differencer operation

AT.GR.024.003
    [Documentation]         Check if UCC throws an error for empty directory
    Run UCC                 java  -jar  @{UCC BASE}  -dir  @{GENERAL EMPTY}
    Response should contain   No files found at directory path


AT.GR.025.001
    [Documentation]         Check if UCC throws an error when given only one filelist
    Run UCC                 java  -jar  @{UCC BASE}  -d  -i1  @{MAINTENANCE_CSHARP_ALL_SOURCE}
    Response should contain   Please specify two file lists for differencing

*** Keywords ***
Invalid switch
    [Arguments]   ${error}  @{args}
    Run UCC    java  -jar  @{UCC BASE}       @{args}
    Response should contain   ${error}

