*** Settings ***
Library          OperatingSystem
Library          lib/UCCTestLibrary.py
Variables        ..${/}ucc_input${/}ucc_input_variables.py
Test Teardown    UCC Test Teardown   ${TEST NAME}

*** Test Cases ***
AT.FTS.001.001
    [Documentation]          Return the properties file in the default directory
    Run UCC    java  -jar  @{UCC BASE}  -export  php
    File should exist        *phpLanguageProperties.txt

AT.FTS.001.002
    [Documentation]          Return the properties file in the specified directory (current space)
    Run UCC    java  -jar  @{UCC BASE}  -export  php  -outdir  ./
    File should exist        *phpLanguageProperties.txt

AT.FTS.001.003
    [Documentation]          Return the properties file in the specified directory (sub folder)
    Run UCC    java  -jar  @{UCC BASE}  -export  php  -outdir  ./out/
    File should exist        ./out/*phpLanguageProperties.txt

AT.FTS.002.001
    [Documentation]          Check if UCC support ClearCase filenames handling with -cf.
    Create UCC File List     customFileList.txt      @{CLEAR CASE FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}            -i1  customFileList.txt    -cf
    Response Status Check    0  0  0  0  0
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv

AT.FTS.002.002
    [Documentation]          Check if UCC can handle mixed file list contains both normal filename and ClearCase filename.
    Create UCC File List     customFileList.txt      @{CLEAR CASE FILE LIST CPLX}
    Run UCC    java  -jar  @{UCC BASE}            -i1  customFileList.txt    -cf
    Response Status Check    0  0  0  0  0
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv

AT.FTS.002.003
    [Documentation]          Check if -cf works properly with two file lists.
    Create baseline A file list     @{CLEAR CASE BASELINE A FILE LIST}
    Create baseline B file list     @{CLEAR CASE BASELINE B FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}             -d        -cf
    Baseline A output should contain    MainObject.cpp  MainObject.h  main.cpp
    Baseline B output should contain    MainObject.cpp  MainObject.h  sema.h

AT.FTS.003.001
    [Documentation]          Return the error message written in log
    Create baseline A file list     @{INVALID FILE}
    Create baseline B file list     @{INVALID FILE}
    Run UCC    java  -jar  @{UCC BASE}  -d  -i1  filelistA.txt  -i2  filelistB.txt  -debug  ERROR
    Response should contain   No valid files found for processing with UCC-G

AT.FTS.004.001
    [Documentation]          Return proper error message when only -i2 is specified
    Create baseline A file list     @{BASELINE A FILE LIST}
    Run UCC    java  -jar  @{UCC BASE}  -d  -i2  filelistA.txt
    Response should contain   Please specify a second file list with -i2 option for differencing

AT.FTS.005.001
    [Documentation]          Return the content of php properties file
    Run UCC    java  -jar  @{UCC BASE}  -import  @{PHP PROPERTIES FILE}
    Response should contain   Imported PHP language properties are:

AT.FTS.006.001
    [Documentation]         Return outputs for extfile function when adding one extension for one language
    Create UCC File List     FileList.txt      @{COUNTSET8.oolist}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.oopair}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Response Status Check    0  0  0  0  0
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv
    UCC Count Results        @{COUNTSET8.oocounts}

AT.FTS.006.002
    [Documentation]         Return outputs for extfile function when adding multiple extensions for one language
    Create UCC File List     FileList.txt      @{COUNTSET8.omlist}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.ompair}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Response Status Check    0  0  0  0  0
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv
    UCC Count Results        @{COUNTSET8.omcounts}


AT.FTS.006.003
    [Documentation]         Return outputs for extfile function when adding multiple extensions for multiple languages
    Create UCC File List     FileList.txt      @{COUNTSET8.mmlist}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.mmpair}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Response Status Check    0  0  0  0  0
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv
    UCC Count Multi Results        @{COUNTSET8.mmcounts}

AT.FTS.006.004
    [Documentation]         Return outputs for extfile function when removing extensions from one language
    Create UCC File List     FileList.txt      @{COUNTSET8.removelist}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.remove_ext}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Response Status Check    0  0  0  0  1
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv
    UCC Count Results        @{COUNTSET8.rmcounts}

AT.FTS.006.005
    [Documentation]         Test for deal with comment in extfile file
    Create UCC File List     FileList.txt      @{COUNTSET8.commentlist}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.comment}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Response Status Check    0  0  0  0  1
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv
    UCC Count Results        @{COUNTSET8.comcounts}


AT.FTS.006.006
    [Documentation]         Return error for missing argument of extfile function
    Create UCC File List     FileList.txt      @{COUNTSET8.oolist}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.oopair}
    Run UCC    java  -jar  @{UCC BASE}    -extfile
    Response should contain   Please specify a file name containing file extension mappings

AT.FTS.006.007
    [Documentation]         No file counted for unsupported language
    Create UCC File List     FileList.txt      @{COUNTSET8.errorlist1}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.e_unsupported_lang}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Log should match       Uncounted Files:\\s*1

AT.FTS.006.008
    [Documentation]         No file counted for unsupported language
    Create UCC File List     FileList.txt      @{COUNTSET8.errorlist1}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.e_unsupported_lang2}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Log should match       Uncounted Files:\\s*1

AT.FTS.006.009
    [Documentation]         No file counted for wrong language=extension pair grammar
    Create UCC File List     FileList.txt      @{COUNTSET8.errorlist1}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.e_wrong_pair_grammar}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Log should match       Uncounted Files:\\s*1


AT.FTS.006.010
    [Documentation]         No file counted for wrong seperator between different extensions
    Create UCC File List     FileList.txt      @{COUNTSET8.errorlist2}
    Create UCC File List     extfile.txt       @{EXT_FILE_EXTENSION.e_wrong_seperator}
    Run UCC    java  -jar  @{UCC BASE}    -extfile    extfile.txt
    Log should match       Uncounted Files:\\s*2
