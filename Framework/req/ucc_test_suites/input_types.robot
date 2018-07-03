# -*- coding: robot -*-

*** Settings ***
Library   OperatingSystem
Library   lib${/}UCCTestLibrary.py
Variables        ..${/}ucc_input${/}ucc_input_variables.py
Test Teardown    UCC Test Teardown   ${TEST NAME}

*** Test Cases ***
AT.IT.001.001
    [Documentation]  UCC should allow periods in the file names listed in
    ...              fileList.txt.
    Create UCC File List     filelist.txt    FileA1.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv
    Default Output should contain   C_CPP  FileA1.cpp

AT.IT.002.001
    [Documentation]  UCC should recognize the input files listed in
    ...              fileList.txt
    Create default file list     @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}          -d  -i1  fileList.txt  -i2  fileList.txt
    Baseline A output should contain   cc_main.cpp  MainObject.cpp

AT.IT.003.001
    [Documentation]  UCC should generate error message if input files in
    ...              fileList.txt are not listed one per line
    Create default file list     @{IN_SAME_LINE1}
    Run UCC    java  -jar  @{UCC BASE}
    Response should contain     No valid files found for processing with UCC-G

AT.IT.003.002
    [Documentation]  UCC should generate error message if input files in
    ...              fileList.txt are not listed one per line
    Create default file list     @{IN_SAME_LINE1}
    Create UCC File List     File List A.txt    FileA1.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  File List A.txt  -i2  fileList.txt
    Response should contain     Invalid file list: fileList.txt.

AT.IT.004.001
    [Documentation]  UCC should not require delimiters (other than new line)
    ...              in fileList.txt.
    Create default file list     ${DELIMITED FILE LIST}
    Create UCC File List     File List A.txt    FileA1.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  File List A.txt  -i2  fileList.txt
    Response should contain     Invalid file list: fileList.txt.

AT.IT.005.001
    [Documentation]  UCC should allow periods in the file names listed in
    ...              fileList.txt.
    Create default file list     @{PERIOD DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv
    Default Output should contain   C_CPP  cc.main.cpp

AT.IT.006.001
    [Documentation]  UCC should allow underscores in the file names listed
    ...              in fileList.txt.
    Create default file list    @{UNDERSCORE DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv
    Default Output should contain   C_CPP  cc_main.cpp

AT.IT.007.001
    [Documentation]  UCC should allow spaces in the file names listed in
    ...              fileList.txt.
    Create default file list    @{SPACE DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.007.002
    [Documentation]  UCC should allow spaces in the file names together with files
    ...              which don't have spaces in file names listed in fileList.txt.
    Create default file list    req/ucc_input/cc_main.cpp  req/ucc_input/test/cc main.cpp
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.008.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in fileList.txt are
    ...              specified using full paths.
    Create full path default file list     @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.008.002
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in fileList.txt are
    ...              specified using full paths.
    Create full path default file list     @{COUNT DEFAULT FILE LIST}
    Add to default file list    @{DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.009.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided three files listed in fileList.txt are
    ...              specified using relative paths, with respect to the
    ...              executable's location.
    Create default file list     @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.010.001
    [Documentation]  UCC should allow periods in the file paths listed in
    ...              fileList.txt.
    Create default file list    req/ucc_input/cc_main.cpp  req/ucc_input/test/cc main.cpp
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.010.002
    [Documentation]  UCC should allow periods in the file paths listed in
    ...              fileList.txt.
    Create default file list     req/ucc_input/test/sub.dir/MainObject.cpp  req/ucc_input/cc_main.cpp
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.011.001
    [Documentation]  UCC should allow underscores in the file paths listed
    ...              in fileList.txt.
    Create default file list     req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.011.002
    [Documentation]  UCC should allow hyphens in the file paths listed
    ...              in fileList.txt.
    Create default file list     req/ucc_input/test/sub-dir/MainObject.cpp
    ...  req/ucc_input/test/sub-dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv


AT.IT.012.001
    [Documentation]  UCC should allow spaces in the file paths listed in
    ...              fileList.txt.
    Create default file list     req/ucc_input/test/sub dir/MainObject.cpp
    ...  req/ucc_input/test/sub dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.012.002
    [Documentation]  UCC should allow numerics in the file paths listed in
    ...              fileList.txt.
    Create default file list     req/ucc_input/test/sub4dir/MainObject.cpp
    ...  req/ucc_input/test/sub4dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}
    File should exist   outfile_summary.csv

AT.IT.013.001
    [Documentation]  If UCC is unable to find any files specified in
    ...              fileList.txt due to incorrect file names or invalid
    ...              paths, UCC should return appropriate error messages.
    Create default file list     req/ucc_input/test/sub_dir1/MainObject.cpp
    ...  req/ucc_input/test/sub_dir1/invalid_file.h
    Run UCC    java  -jar  @{UCC BASE}
    Response should contain     No valid files found for processing with UCC-G

AT.IT.013.002
    [Documentation]  In case UCC is unable to find any files specified in
    ...              fileList.txt due to illegitimate file names or paths
    ...              , UCC should return appropriate error messages.
    Create default file list     req/ucc_input/test/sub()dir/MainObject.cpp
    ...  req/ucc_input/test/sub()dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}
    Response should contain     Error: Unable to open file with illegitimate names or paths

AT.IT.014.001
    [Documentation]  UCC should allow users to specify a custom file list
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.014.002
    [Documentation]  UCC should allow users to specify a custom file list to have a directory in the list and recursively counts files in it.
    Create UCC file list    customFileList.txt  req/ucc_input
    Run UCC    java  -jar  @{UCC BASE}             -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.015.001
    [Documentation]  UCC should find the custom file list provided a full
    ...              path is specified.
    Create UCC file list    req/ucc_input/test/customFileList.txt  req/ucc_input/
    ...  MainObject.cpp  req/ucc_input/MainObject.h
    ${ret} =  Get absolute path  req/ucc_input/test/customFileList.txt
    Run UCC    java  -jar  @{UCC BASE}             -i1  ${ret}
    File should exist   outfile_summary.csv

AT.IT.016.001
    [Documentation]  UCC should find the custom file list provided a
    ...              relative path is specified, with
    ...              respect to the executable's location.
    Create UCC file list    req/ucc_input/test/customFileList.txt  req/ucc_input/
    ...  MainObject.cpp  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -i1  req/ucc_input/test/customFileList.txt
    File should exist   outfile_summary.csv


AT.IT.017.001
    [Documentation]  UCC should accept custom file with
    ...              a custom file name, provided that it is specified.
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}            -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.018.001
    [Documentation]  UCC should recognize the input files listed in the
    ...              custom file list provided that the files
    ...              are listed one per line.
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.019.001
    [Documentation]          Multiple filenames listed in same line for custom file list.
    Create UCC file list single   customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC  java  -jar  @{UCC BASE}                -i1  customFileList.txt
    Response should contain    No valid files found for processing with UCC-G

AT.IT.020.001
    [Documentation]  UCC should not require delimiters (other than new line) for custom file list.
    ...              in fileList.txt.
    Create UCC file list    customFileList.txt  ${DELIMITED FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}              -i1  customFileList.txt
    Response should contain     No valid files found for processing with UCC-G

AT.IT.021.001
    [Documentation]  UCC should allow periods in the file names listed in
    ...              the custom file list.
    Create UCC file list    customFileList.txt  @{PERIOD DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.022.001
    [Documentation]  UCC should allow underscores in the file names listed
    ...              in the custom file list
    Create UCC file list    customFileList.txt  @{UNDERSCORE DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.023.001
    [Documentation]  UCC should allow spaces in the file names listed
    ...              in the custom file list.
    Create UCC file list    customFileList.txt	@{SPACE DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}	     -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.024.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in the custom file list are
    ...              specified using full paths.
    Create UCC full path file list   customFileList.txt  @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}	     -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.025.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in the custom file list are
    ...              specified using relative paths, with respect to the
    ...              executable's location.
    Create UCC file list     customFileList.txt  @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}       -i1  customFileList.txt
    File should exist   outfile_summary.csv

AT.IT.026.001
    [Documentation]  UCC should allow periods in the custom file list name
    Create UCC file list    custom.file.list.txt  @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -i1  custom.file.list.txt
    File should exist   outfile_summary.csv

AT.IT.027.001
    [Documentation]  UCC should allow underscores in the custom file list name
    Create UCC file list    custom_file_list.txt  @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -i1  custom_file_list.txt
    File should exist   outfile_summary.csv


AT.IT.028.001
    [Documentation]  UCC should Allow spaces in the custom file list name.
    Create UCC File List     custom file list.txt    @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -i1  custom file list.txt
    Response status check    0  0  0  0  0
    File should exist   outfile_summary.csv



AT.IT.029.001
    [Documentation]          Allow specification of full pathname for custom file list.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Copy File                @{COUNTSET7.filelist}[0]   FileA1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -i1  ${EXECDIR}${/}FileListA.txt
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.030.001
    [Documentation]          Allow specification of relative pathname for custom file list.
    Create Directory         Test
    Create UCC File List     Test${/}FileListA.txt      FileA1.cpp
    Copy File                @{COUNTSET7.filelist}[0]   FileA1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -i1  Test${/}FileListA.txt
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.031.001
    [Documentation]          Allow periods in file paths for custom file list.
    Create Directory         Test.1
    Create UCC File List     Test.1${/}FileListA.txt      FileA1.cpp
    Copy File                @{COUNTSET7.filelist}[0]   FileA1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -i1  Test.1${/}FileListA.txt
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.032.001
    [Documentation]          Allow underscores in file paths for custom file list.
    Create Directory         Test_1
    Create UCC File List     Test_1${/}FileListA.txt      FileA1.cpp
    Copy File                @{COUNTSET7.filelist}[0]   FileA1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -i1  Test_1${/}FileListA.txt
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.033.001
    [Documentation]          Allow spaces in file paths for custom file list.
    Create Directory         Test 1
    Create UCC File List     Test 1${/}FileListA.txt      FileA1.cpp
    Copy File                @{COUNTSET7.filelist}[0]   FileA1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -i1  Test 1${/}FileListA.txt
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}

AT.IT.034.002
    [Documentation]  If UCC is unable to find any files specified in
    ...              custom file list due to incorrect file names or invalid
    ...              paths, UCC should return appropriate error messages.
    Create UCC File List    customFileList.txt  req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/invalid_file.h
    Run UCC    java  -jar  @{UCC BASE}       -i1      customFileList.txt
    Response should contain     No valid files found for processing with UCC-G

AT.IT.034.003
    [Documentation]  If UCC is unable to find any files specified in
    ...              custom file list due to incorrect file names or invalid
    ...              paths, UCC should return appropriate error messages.
    Create UCC File List    customFileList.txt  req/ucc_input/test/sub_dir/Main Object.cpp
    Run UCC    java  -jar  @{UCC BASE}       -i1      customFileList.txt
    Response should contain     No valid files found for processing with UCC-G

AT.IT.035.001
    [Documentation]          Error when invalid filenames specified for custom file list.
    Remove File              FileListA.txt
    Run UCC    java  -jar  @{UCC BASE}                  -i1  FileListA.txt
    Is UCC Response Error    Error reading file



AT.IT.036.001
    [Documentation]          UCC should allow users to specify a directory

    ...                      containing input files to be processed.
    Create Directory         Adir
    Copy File                @{COUNTSET7.filelist}[0]   Adir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Adir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.037.001
    [Documentation]          UCC should not process files in fileList.txt when

    ...                      a directory is specified.
    Create Directory         Adir
    Copy File                @{COUNTSET7.filelist}[0]   Adir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Adir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}

AT.IT.038.001
    [Documentation]          UCC should be able to find and process supported files within the directory,
    ...                      provided a full path to the directory is specified.
    Create Directory         Adir
    Copy File                @{COUNTSET7.filelist}[0]   Adir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  ${EXECDIR}${/}Adir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.039.001
    [Documentation]          UCC should be able to find and process supported files within the directory,
    ...                      provided a relative path to the directory is specified.
    Create Directory         Test
    Create Directory         Test${/}Adir
    Copy File                @{COUNTSET7.filelist}[0]   Test${/}Adir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Test${/}Adir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.040.001
    [Documentation]          Allow periods in directory name.
    Create Directory         A.dir
    Copy File                @{COUNTSET7.filelist}[0]   A.dir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  A.dir

    UCC Count Results         @{COUNTSET7.counts}



AT.IT.041.001
    [Documentation]          Allow underscores in directory name.
    Create Directory         A_dir
    Copy File                @{COUNTSET7.filelist}[0]   A_dir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  A_dir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.042.001
    [Documentation]          Allow spaces in directory name.
    Create Directory         A dir
    Copy File                @{COUNTSET7.filelist}[0]   A dir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  A dir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.043.001
    [Documentation]          Allow periods in the filenames within the directory.
    Create Directory         Adir
    Copy File                @{COUNTSET7.filelist}[0]   Adir${/}File.A.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Adir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.044.001
    [Documentation]          Allow underscores in the filenames within the directory.
    Create Directory         Adir
    Copy File                @{COUNTSET7.filelist}[0]   Adir${/}File_A.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Adir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.045.001
    [Documentation]          Allow spaces in the filenames within the directory.
    Create Directory         Adir
    Copy File                @{COUNTSET7.filelist}[0]   Adir${/}File A.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Adir
    Response Status Check    0  0  0  0  0
    UCC Count Results         @{COUNTSET7.counts}



AT.IT.046.001
    [Documentation]          Error when invalid directory is specified.
    Remove Directory         Adir  recursive=True
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Adir
    Is UCC Response Error    No files found at directory path



AT.IT.047.001
    [Documentation]          Allow user to specify file extensions using wildcard character *.
    Create Directory         Adir
    Copy File                @{COUNTSET7.filelist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET4.fileAlist}[0]   Adir${/}FileA.c
    Copy File                @{DIFFSET4.fileAlist}[1]   Adir${/}FileA.h
    Run UCC    java  -jar  @{UCC BASE}                  -dir  Adir  *.cpp
    Response Status Check    0  0  0  0  0
    Default Output should not contain   C_CPP  FileA.c  FileB.c   FileA.h   FileB.h
    Default Output should contain   C_CPP  FileA.cpp
    UCC Count Results         @{COUNTSET7.counts}

AT.IT.048.001
    [Documentation]  UCC should recognize the input files listed in
    ...              fileListA.txt and fileListB.txt
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    File should exist   MatchedPairs.csv

AT.IT.049.001
    [Documentation]  UCC should recognize the input files listed in
    ...              fileListA.txt
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    MainObject.cpp  MainObject.h
    ...  main.cpp

AT.IT.050.001
    [Documentation]  UCC should recognize the input files listed in
    ...              fileListB.txt
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.IT.051.001
    [Documentation]  UCC should generate error message if input files in
    ...              fileListA.txt are not listed one per line
    Create baseline A file list     @{INVALID FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}     -d
    Response should contain     Error: Unable to open file

AT.IT.052.001
    [Documentation]  UCC should generate error message if input files in
    ...              fileListB.txt are not listed one per line
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{INVALID FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}     -d
    Response should contain     Error: Unable to open file

AT.IT.053.001
    [Documentation]  UCC should not require delimiters (other than new line)
    ...              in fileListA.txt.
    Create baseline A file list     ${DELIMITED FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}     -d
    Response should contain     No valid files found for processing with UCC-G

AT.IT.054.001
    [Documentation]  UCC should not require delimiters (other than new line)
    ...              in fileListB.txt.
    Create baseline A file list     @{BASELINE B FILE LIST}
    Create baseline B file list     ${DELIMITED FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}     -d
    Response should contain     No valid files found for processing with UCC-G

AT.IT.055.001
    [Documentation]  UCC should allow periods in the file names listed in
    ...              fileListA.txt.
    Create baseline A file list     req/ucc_input/test/cc.main.cpp  req/ucc_input/test/cc.main.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    cc.main.cpp  cc.main.h

AT.IT.056.001
    [Documentation]  UCC should allow periods in the file names listed in
    ...              fileListB.txt.
    Create baseline A file list     @{BASELINE B FILE LIST}
    Create baseline B file list     req/ucc_input/test/cc.main.cpp
    ...  req/ucc_input/test/cc.main.h
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    cc.main.cpp  cc.main.h

AT.IT.057.001
    [Documentation]  UCC should allow underscores in the file names listed
    ...              in fileListA.txt.
    Create baseline A file list  	req/ucc_input/cc_main.cpp  req/ucc_input/cc_main.h
    Create baseline B file list  @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}     -d
    Baseline A output should contain    cc_main.cpp     cc_main.h

AT.IT.058.001
    [Documentation]  UCC should allow underscores in the file names listed
    ...              in fileListB.txt.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     req/ucc_input/cc_main.cpp
    ...  req/ucc_input/cc_main.h
    Run UCC    java  -jar  @{UCC BASE}     -d
    Baseline B output should contain    cc_main.cpp     cc_main.h

AT.IT.059.001
    [Documentation]  UCC should allow spaces in the file names listed in
    ...              fileListA.txt.
    Create baseline A file list     req/ucc_input/test/cc main.cpp
    ...  req/ucc_input/test/cc main.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    cc main.cpp  cc main.h

AT.IT.060.001
    [Documentation]  UCC should allow spaces in the file names listed in
    ...              fileListB.txt.
    Create baseline A file list     @{BASELINE B FILE LIST}
    Create baseline B file list     req/ucc_input/test/cc main.cpp
    ...  req/ucc_input/test/cc main.h
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    cc main.cpp  cc main.h

AT.IT.061.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided thee files listed in fileListA.txt are
    ...              specified using full paths.
    Create full path baseline A file list     @{BASELINE A FILE LIST}
    Create full path baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    MainObject.cpp  MainObject.h  main.cpp

AT.IT.062.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided thee files listed in fileListB.txt are
    ...              specified using full paths.
    Create full path baseline A file list     @{BASELINE A FILE LIST}
    Create full path baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.IT.063.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided thee files listed in fileListA.txt are
    ...              specified using relative paths, with respect to the
    ...              executable's location.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    MainObject.cpp  MainObject.h
    ...  main.cpp

AT.IT.064.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided thee files listed in fileListB.txt are
    ...              specified using relative paths, with respect to the
    ...              executable's location.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.IT.065.001
    [Documentation]  UCC should allow periods in the file paths listed in
    ...              fileListA.txt.
    Create baseline A file list     req/ucc_input/test/sub.dir/MainObject.cpp  req/ucc_input/test/sub.dir/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    MainObject.cpp  MainObject.h

AT.IT.066.001
    [Documentation]  UCC should allow periods in the file paths listed in
    ...              fileListB.txt.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list    req/ucc_input/test/sub.dir/MainObject.cpp
    ...  req/ucc_input/test/sub.dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.067.001
    [Documentation]  UCC should allow underscores in the file paths listed
    ...              in fileListA.txt.
    Create baseline A file list     req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    MainObject.cpp  MainObject.h

AT.IT.068.001
    [Documentation]  UCC should allow underscores in the file paths listed
    ...              in fileListB.txt.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.069.001
    [Documentation]  UCC should allow spaces in the file paths listed in
    ...              fileListA.txt.
    Create baseline A file list     req/ucc_input/test/sub dir/MainObject.cpp
    ...  req/ucc_input/test/sub dir/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline A output should contain    MainObject.cpp  MainObject.h

AT.IT.070.001
    [Documentation]  UCC should allow spaces in the file paths listed in
    ...              fileListB.txt.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     req/ucc_input/test/sub dir/MainObject.cpp
    ...  req/ucc_input/test/sub dir/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.071.001
    [Documentation]  If UCC is unable to find any files specified in
    ...              fileListA.txt due to incorrect file names or invalid
    ...              paths, UCC should return appropriate error messages.
    Create baseline A file list     req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/invalid_file.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d
    Response should contain     Error: Unable to open file

AT.IT.072.001
    [Documentation]  If UCC is unable to find any files specified in
    ...              fileListB.txt due to incorrect file names or invalid
    ...              paths, UCC should return appropriate error messages.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/invalid_file.h
    Run UCC    java  -jar  @{UCC BASE}             -d
    Response should contain     Error: Unable to open file

AT.IT.073.001
    [Documentation]  UCC should allow users to specify custom file lists for
    ...              Baseline A and/or Baseline B.
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.IT.074.001
    [Documentation]  UCC should find the custom file list provided for
    ...              Baseline A provided a full path is specified.
    Create UCC file list    req/ucc_input/test/customFileList.txt  req/ucc_input/
    ...  MainObject.cpp  req/ucc_input/MainObject.h
    ${ret} =  Get absolute path  req/ucc_input/test/customFileList.txt
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  ${ret}  -i2  fileListB.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.IT.075.001
    [Documentation]  UCC should find the custom file list provided for
    ...              Baseline B provided a full path is specified.
    Create UCC file list    req/ucc_input/test/customFileList.txt  req/ucc_input/
    ...  MainObject.cpp  req/ucc_input/MainObject.h
    ${ret} =  Get absolute path  req/ucc_input/test/customFileList.txt
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListB.txt  -i2  ${ret}
    Baseline A output should contain    MainObject.cpp  MainObject.h
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.IT.076.001
    [Documentation]  UCC should find the custom file list provided for
    ...              Baseline A provided a relative path is specified, with
    ...              respect to the executable's location.
    Create UCC file list    req/ucc_input/test/customFileList.txt  req/ucc_input/
    ...  MainObject.cpp  req/ucc_input/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  req/ucc_input/test/customFileList.txt  -i2
    ...  fileListB.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.IT.077.001
    [Documentation]  UCC should find the custom file list provided for
    ...              Baseline B provided a relative path is specified, with
    ...              respect to the executable's location.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    req/ucc_input/test/customFileList.txt  req/ucc_input/
    ...  MainObject.cpp  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2
    ...  req/ucc_input/test/customFileList.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h  main.cpp
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.078.001
    [Documentation]  UCC should accept custom file list for Baseline A with
    ...              a custom file name, provided that it is specified.
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h

AT.IT.079.001
    [Documentation]  UCC should accept custom file list for Baseline B with
    ...              a custom file name, provided that it is specified.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  customFileList.txt  
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.080.001
    [Documentation]  UCC should recognize the input files listed in the
    ...              custom file list for Baseline A provided that the files
    ...              are listed one per line.
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h

AT.IT.081.001
    [Documentation]  UCC should recognize the input files listed in the
    ...              custom file list for Baseline B provided that the files
    ...              are listed one per line.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    customFileList.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  customFileList.txt
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.082.001
    [Documentation]  UCC should not require delimiters (other than new line)
    ...              in the custom file list for Baseline A.
    Create UCC file list    customFileList.txt
    ...  req/ucc_input/MainObject.cpp;ucc_input/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Response should contain     Invalid file list

AT.IT.083.001
    [Documentation]  UCC should not require delimiters (other than new line)
    ...              in the custom file list for Baseline B.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    customFileList.txt
    ...  req/ucc_input/MainObject.cpp;ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  customFileList.txt
    Response should contain     Invalid file list

AT.IT.084.001
    [Documentation]  UCC should allow periods in the file names listed in
    ...              the custom file list for Baseline A.
    Create UCC file list    customFileList.txt  @{PERIOD DEFAULT FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    cc.main.cpp

AT.IT.085.001
    [Documentation]  UCC should allow periods in the file names listed in
    ...              the custom file list for Baseline B.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    customFileList.txt  @{PERIOD DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  customFileList.txt
    Baseline B output should contain    cc.main.cpp

AT.IT.086.001
    [Documentation]  UCC should allow underscores in the file names listed
    ...              in the custom file list for Baseline A.
    Create UCC file list    customFileList.txt  @{UNDERSCORE DEFAULT FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    cc_main.cpp

AT.IT.087.001
    [Documentation]  UCC should allow underscores in the file names listed
    ...              in the custom file list for Baseline B.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    customFileList.txt  @{UNDERSCORE DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  customFileList.txt
    Baseline B output should contain    cc_main.cpp

AT.IT.088.001
    [Documentation]  UCC should allow spaces in the file names listed
    ...              in the custom file list for Baseline A.
    Create UCC file list    customFileList.txt  @{SPACE DEFAULT FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    cc main.cpp

AT.IT.089.001
    [Documentation]  UCC should allow spaces in the file names listed
    ...              in the custom file list for Baseline B.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    customFileList.txt  @{SPACE DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  customFileList.txt
    Baseline B output should contain    cc main.cpp

AT.IT.090.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in custom file list for Baseline A  are
    ...              specified using full paths.
    Create UCC full path file list   customFileList.txt  @{COUNT DEFAULT FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}	          -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    cc_main.cpp  MainObject.cpp

AT.IT.091.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in custom file list for Baseline B  are
    ...              specified using full paths.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC full path file list   customFileList.txt  @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}	          -d  -i1  fileListA.txt  -i2  customFileList.txt
    Baseline B output should contain    cc_main.cpp  MainObject.cpp

AT.IT.092.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in custom file list for Baseline A  are
    ...              specified using relative paths, with respect to the executable's location.
    Create UCC file list   customFileList.txt  @{COUNT DEFAULT FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}	          -d  -i1  customFileList.txt  -i2  fileListB.txt
    Baseline A output should contain    cc_main.cpp  MainObject.cpp

AT.IT.093.001
    [Documentation]  UCC should be able to find and process supported files
    ...              provided the files listed in custom file list for Baseline B  are
    ...              specified using relative paths, with respect to the executable's location.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list   customFileList.txt  @{COUNT DEFAULT FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}	          -d  -i1  fileListA.txt  -i2  customFileList.txt
    Baseline B output should contain    cc_main.cpp  MainObject.cpp

AT.IT.094.001
    [Documentation]  UCC should allow periods in the custom file list name for Baseline A.
    Create UCC file list    custom.file.list.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  custom.file.list.txt  -i2  fileListB.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h

AT.IT.095.001
    [Documentation]  UCC should allow periods in the custom file list name for Baseline B.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    custom.file.list.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  custom.file.list.txt
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.096.001
    [Documentation]  UCC should allow underscores in the custom file list name for Baseline A.
    Create UCC file list    custom_file_list.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  custom_file_list.txt  -i2  fileListB.txt
    Baseline A output should contain    MainObject.cpp  MainObject.h

AT.IT.097.001
    [Documentation]  UCC should allow underscores in the custom file list name for Baseline B.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC file list    custom_file_list.txt  req/ucc_input/MainObject.cpp
    ...  req/ucc_input/MainObject.h
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  custom_file_list.txt
    Baseline B output should contain    MainObject.cpp  MainObject.h

AT.IT.098.001
    [Documentation]          Allow spaces in the custom file list name for Baseline A.
    Create UCC File List     File List A.txt    FileA1.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  File List A.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.098.002
    [Documentation]          Allow spaces in the custom file list name for Baseline A.
    Create UCC File List     File List A.txt    FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  File List A.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.099.001
    [Documentation]          Allow spaces in the custom file list name for Baseline B.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     File List B.txt    FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  FileListA.txt  -i2  File List B.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.099.002
    [Documentation]          Allow spaces in the custom file list name for Baseline B.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     File List B.txt    FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  FileListA.txt  -i2  File List B.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.100.001
    [Documentation]          Multiple filenames listed in same line for custom file list in Baseline A.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     FileListA1.txt     FileA2.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp   FileB2.cpp
    Copy File                @{DIFFSET3.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET3.fileAlist}[1]   FileA2.cpp
    Copy File                @{DIFFSET3.fileBlist}[0]   FileB1.cpp
    Copy File                @{DIFFSET3.fileBlist}[1]   FileB2.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  FileListA.txt  FileListA1.txt  -i2  FileListB.txt
    Is UCC Response Error    Argument 'filelista1.txt' is not supported by UCC-G

AT.IT.101.001
    [Documentation]          Multiple filenames listed in same line for custom file list in Baseline B.
    Create UCC File List     FileListA.txt      FileA1.cpp   FileA2.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp   FileB2.cpp
    Create UCC File List     FileListB1.txt     FileB2.cpp
    Copy File                @{DIFFSET3.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET3.fileAlist}[1]   FileA2.cpp
    Copy File                @{DIFFSET3.fileBlist}[0]   FileB1.cpp
    Copy File                @{DIFFSET3.fileBlist}[1]   FileB2.cpp
    Run UCC   java  -jar  @{UCC BASE}               -d  -i1  FileListA.txt  -i2  FileListB.txt  FileListB1.txt
    Is UCC Response Error    Argument 'filelistb1.txt' is not supported by UCC-G.

AT.IT.102.001
    [Documentation]          Allow specification of full pathname for custom file list for Baseline A.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  ${EXECDIR}${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.102.002
    [Documentation]          Allow specification of full pathname for custom file list for Baseline A.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  ${EXECDIR}${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.103.001
    [Documentation]          Allow specification of full pathname for custom file list for Baseline B.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  ${EXECDIR}${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.103.002
    [Documentation]          Allow specification of full pathname for custom file list for Baseline B.
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  ${EXECDIR}${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.104.001
    [Documentation]          Allow specification of relative pathname for custom file list for Baseline A.
    Create Directory         Test
    Create UCC File List     Test${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.104.002
    [Documentation]          Allow specification of relative pathname for custom file list for Baseline A.
    Create Directory         Test
    Create UCC File List     Test${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.105.001
    [Documentation]          Allow specification of relative pathname for custom file list for Baseline B.
    Create Directory         Test
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test${/}FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.105.002
    [Documentation]          Allow specification of relative pathname for custom file list for Baseline B.
    Create Directory         Test
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test${/}FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.106.001
    [Documentation]          Allow periods in file paths for custom file list in Baseline A.
    Create Directory         Test.1
    Create UCC File List     Test.1${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test.1${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.106.002
    [Documentation]          Allow periods in file paths for custom file list in Baseline A.
    Create Directory         Test.1
    Create UCC File List     Test.1${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test.1${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.107.001
    [Documentation]          Allow periods in file paths for custom file list in Baseline B.
    Create Directory         Test.1
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test.1${/}FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test.1${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.107.002
    [Documentation]          Allow periods in file paths for custom file list in Baseline B.
    Create Directory         Test.1
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test.1${/}FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test.1${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.108.001
    [Documentation]          Allow underscores in file paths for custom file list in Baseline A.
    Create Directory         Test_1
    Create UCC File List     Test_1${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test_1${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.108.002
    [Documentation]          Allow underscores in file paths for custom file list in Baseline A.
    Create Directory         Test_1
    Create UCC File List     Test_1${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test_1${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.109.001
    [Documentation]          Allow underscores in file paths for custom file list in Baseline B.
    Create Directory         Test_1
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test_1${/}FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test_1${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.109.002
    [Documentation]          Allow underscores in file paths for custom file list in Baseline B.
    Create Directory         Test_1
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test_1${/}FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test_1${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.110.001
    [Documentation]          Allow spaces in file paths for custom file list in Baseline A.
    Create Directory         Test 1
    Create UCC File List     Test 1${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test 1${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.110.002
    [Documentation]          Allow spaces in file paths for custom file list in Baseline A.
    Create Directory         Test 1
    Create UCC File List     Test 1${/}FileListA.txt      FileA1.cpp
    Create UCC File List     FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  Test 1${/}FileListA.txt  -i2  FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.111.001
    [Documentation]          Allow spaces in file paths for custom file list in Baseline B.
    Create Directory         Test 1
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test 1${/}FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET2.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test 1${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.111.002
    [Documentation]          Allow spaces in file paths for custom file list in Baseline B.
    Create Directory         Test 1
    Create UCC File List     FileListA.txt      FileA1.cpp
    Create UCC File List     Test 1${/}FileListB.txt      FileB2.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB2.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  Test 1${/}FileListB.txt
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.112.001
    [Documentation]          If UCC is unable to find any files specified in custom file list
    ...                      for Baseline A due to incorrect file names or invalid paths,
    ...                      UCC should return appropriate error messages.
    Create UCC File List    customFileList.txt  req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/invalid_file.h
    Create baseline B file list     @{BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  customFileList.txt  -i2  fileListB.txt
    Response should contain     Error: Unable to open file

AT.IT.112.002
    [Documentation]          If UCC is unable to find any files specified in custom file list
    ...                      for Baseline B due to incorrect file names or invalid paths,
    ...                      UCC should return appropriate error messages.
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create UCC File List    customFileList.txt  req/ucc_input/test/sub_dir/MainObject.cpp
    ...  req/ucc_input/test/sub_dir/invalid_file.h
    Run UCC    java  -jar  @{UCC BASE}             -d  -i1  fileListA.txt  -i2  customFileList.txt
    Response should contain     Error: Unable to open file

AT.IT.113.001
    [Documentation]          Error when invalid filenames specified for custom file list in Baseline A.
    Remove File              FileListA.txt
    Create UCC File List     FileListB.txt      FileB1.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   FileB1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  FileListB.txt
    Is UCC Response Error    Invalid file list: FileListA.txt

AT.IT.114.001
    [Documentation]          Error when invalid filenames specified for custom file list in Baseline B.
    Remove File              FileListB.txt
    Create UCC File List     FileListA.txt      FileA1.cpp
    Copy File                @{DIFFSET1.fileAlist}[0]   FileA1.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -i1  FileListA.txt  -i2  FileListB.txt
    Is UCC Response Error    Invalid file list: FileListB.txt

AT.IT.115.001
    [Documentation]          Use directories for Baseline A and Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.116.001
    [Documentation]          Use directories for Baseline A and Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.117.001
    [Documentation]          Allow use of absolute path in Baseline A directory parameter for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  ${EXECDIR}${/}Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.117.002
    [Documentation]          Allow use of absolute path in Baseline A directory parameter for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  ${EXECDIR}${/}Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.118.001
    [Documentation]          Allow use of absolute path in Baseline B directory parameter for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  ${EXECDIR}${/}Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.118.002
    [Documentation]          Allow use of absolute path in Baseline B directory parameter for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  ${EXECDIR}${/}Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.119.001
    [Documentation]          Allow use of relative path in Baseline A directory parameter for differencing.
    Create Directory         Test
    Create Directory         Test${/}Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Test${/}Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Test${/}Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.119.002
    [Documentation]          Allow use of relative path in Baseline A directory parameter for differencing.
    Create Directory         Test
    Create Directory         Test${/}Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Test${/}Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Test${/}Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.120.001
    [Documentation]          Allow use of relative path in Baseline B directory parameter for differencing.
    Create Directory         Test
    Create Directory         Adir
    Create Directory         Test${/}Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Test${/}Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Test${/}Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.120.002
    [Documentation]          Allow use of relative path in Baseline B directory parameter for differencing.
    Create Directory         Test
    Create Directory         Adir
    Create Directory         Test${/}Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Test${/}Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Test${/}Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.121.001
    [Documentation]          Allow period in directory name for Baseline A for differencing.
    Create Directory         A.dir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   A.dir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  A.dir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.121.002
    [Documentation]          Allow period in directory name for Baseline A for differencing.
    Create Directory         A.dir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   A.dir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  A.dir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.122.001
    [Documentation]          Allow period in directory name for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         B.dir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   B.dir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  B.dir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.122.002
    [Documentation]          Allow period in directory name for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         B.dir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   B.dir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  B.dir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.123.001
    [Documentation]          Allow underscores in directory name for Baseline A for differencing.
    Create Directory         A_dir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   A_dir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  A_dir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.123.002
    [Documentation]          Allow underscores in directory name for Baseline A for differencing.
    Create Directory         A_dir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   A_dir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  A_dir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.124.001
    [Documentation]          Allow underscores in directory name for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         B_dir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   B_dir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  B_dir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.124.002
    [Documentation]          Allow underscores in directory name for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         B_dir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   B_dir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  B_dir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.125.001
    [Documentation]          Allow spaces in directory name for Baseline A for differencing.
    Create Directory         A dir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   A dir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  A dir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.125.002
    [Documentation]          Allow spaces in directory name for Baseline A for differencing.
    Create Directory         A dir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   A dir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  A dir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.126.001
    [Documentation]          Allow spaces in directory name for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         B dir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   B dir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  B dir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.126.002
    [Documentation]          Allow spaces in directory name for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         B dir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   B dir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  B dir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.127.001
    [Documentation]          Allow periods in the filenames within the directory for Baseline A for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}File.A.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.127.002
    [Documentation]          Allow periods in the filenames within the directory for Baseline A for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}File.A.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.128.001
    [Documentation]          Allow periods in the filenames within the directory for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}File.B.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.128.002
    [Documentation]          Allow periods in the filenames within the directory for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}File.B.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.129.001
    [Documentation]          Allow underscores in the filenames within the directory for Baseline A for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}File_A.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.129.002
    [Documentation]          Allow underscores in the filenames within the directory for Baseline A for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}File_A.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.130.001
    [Documentation]          Allow underscores in the filenames within the directory for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}File_B.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.130.002
    [Documentation]          Allow underscores in the filenames within the directory for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}File_B.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.131.001
    [Documentation]          Allow spaces in the filenames within the directory for Baseline A for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}File A.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.131.002
    [Documentation]          Allow spaces in the filenames within the directory for Baseline A for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}File A.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.132.001
    [Documentation]          Allow spaces in the filenames within the directory for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}File B.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.132.002
    [Documentation]          Allow spaces in the filenames within the directory for Baseline B for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}File B.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Response Status Check    0  0  0  0  0
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.133.001
    [Documentation]          Error when invalid directory is specified for Baseline A during differencing.
    Remove Directory         Adir  recursive=True
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Is UCC Response Error    No files found at directory path

AT.IT.134.001
    [Documentation]          Error when invalid directory is specified for Baseline B during differencing.
    Remove Directory         Bdir  recursive=True
    Create Directory         Adir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir
    Is UCC Response Error    No files found at directory path

AT.IT.135.001
    [Documentation]          Allow user to specify file extensions using wildcard character * for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Copy File                @{DIFFSET4.fileAlist}[0]   Adir${/}FileA.c
    Copy File                @{DIFFSET4.fileBlist}[0]   Bdir${/}FileB.c
    Copy File                @{DIFFSET4.fileAlist}[1]   Adir${/}FileA.h
    Copy File                @{DIFFSET4.fileBlist}[1]   Bdir${/}FileB.h
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir   *.cpp

    Baseline A Output should not contain   FileA.c  FileB.c   FileA.h   FileB.h
    Baseline B Output should not contain   FileA.c  FileB.c   FileA.h   FileB.h
    Baseline A Output should contain   FileA.cpp
    Baseline B Output should contain   FileB.cpp
    UCC Diff Results         @{DIFFSET2.counts}

AT.IT.135.002
    [Documentation]          Allow user to specify file extensions using wildcard character * for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Copy File                @{DIFFSET3.fileAlist}[0]   Adir${/}FileA.c
    Copy File                @{DIFFSET3.fileBlist}[0]   Bdir${/}FileB.c
    Copy File                @{DIFFSET3.fileAlist}[1]   Adir${/}FileA.h
    Copy File                @{DIFFSET3.fileBlist}[1]   Bdir${/}FileB.h
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir   *.cpp

    Baseline A Output should not contain   FileA.c  FileB.c   FileA.h   FileB.h
    Baseline B Output should not contain   FileA.c  FileB.c   FileA.h   FileB.h
    Baseline A Output should contain   FileA.cpp
    Baseline B Output should contain   FileB.cpp
    UCC Diff Results         @{DIFFSET1.counts}

AT.IT.135.003
    [Documentation]          Allow user to specify file extensions using wildcard character ? for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET2.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET2.fileBlist}[0]   Bdir${/}FileB.cpp
    Copy File                @{DIFFSET4.fileAlist}[0]   Adir${/}FileA.c
    Copy File                @{DIFFSET4.fileBlist}[0]   Bdir${/}FileB.c
    Copy File                @{DIFFSET4.fileAlist}[1]   Adir${/}FileA.h
    Copy File                @{DIFFSET4.fileBlist}[1]   Bdir${/}FileB.h
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir   *.?

    Baseline A Output should contain   FileA.c  FileA.h
    Baseline B Output should contain   FileB.c  FileB.h
    Baseline A Output should not contain   FileA.cpp
    Baseline B Output should not contain   FileB.cpp
    UCC diff results         @{DIFFSET4.counts}

AT.IT.135.004
    [Documentation]          Allow user to specify file extensions using wildcard character ? for differencing.
    Create Directory         Adir
    Create Directory         Bdir
    Copy File                @{DIFFSET1.fileAlist}[0]   Adir${/}FileA.cpp
    Copy File                @{DIFFSET1.fileBlist}[0]   Bdir${/}FileB.cpp
    Copy File                @{DIFFSET3.fileAlist}[0]   Adir${/}FileA.c
    Copy File                @{DIFFSET3.fileBlist}[0]   Bdir${/}FileB.c
    Copy File                @{DIFFSET3.fileAlist}[1]   Adir${/}FileA.h
    Copy File                @{DIFFSET3.fileBlist}[1]   Bdir${/}FileB.h
    Run UCC    java  -jar  @{UCC BASE}                  -d  -dir  Adir  Bdir   *.?

    Baseline A Output should contain   FileA.c  FileA.h
    Baseline B Output should contain   FileB.c  FileB.h
    Baseline A Output should not contain   FileA.cpp
    Baseline B Output should not contain   FileB.cpp
    UCC Diff Results         @{DIFFSET3.counts}

# vim:tw=0:wm=0:nowrap
