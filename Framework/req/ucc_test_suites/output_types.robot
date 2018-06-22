*** Settings ***
Library          OperatingSystem
Library          lib/UCCTestLibrary.py
Variables        ..${/}ucc_input${/}ucc_input_variables.py
Test Teardown    UCC Test Teardown   ${TEST NAME}

*** Test Cases ***
AT.OT.001.001
    [Documentation]          Return outputs in the default directory for counting operation.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Run UCC    java  -jar  @{UCC BASE}
    Response Status Check    0  0  0  0  0
    File should exist        *_outfile.csv
    File should exist        outfile_cplx.csv
    File should exist        outfile_cyclomatic_cplx.csv
    File should exist        outfile_summary.csv

AT.OT.001.002
    [Documentation]          Return outputs in the default directory for differencing operation.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Run UCC    java  -jar  @{UCC BASE}                  -d
    Response Status Check    0  0  0  0  0
    File should exist        Baseline-A-*_outfile.csv
    File should exist        Baseline-A-outfile_cplx.csv
    File should exist        Baseline-A-outfile_cyclomatic_cplx.csv
    File should exist        Baseline-A-outfile_summary.csv
    File should exist        Baseline-B-*_outfile.csv
    File should exist        Baseline-B-outfile_cplx.csv
    File should exist        Baseline-B-outfile_cyclomatic_cplx.csv
    File should exist        Baseline-B-outfile_summary.csv
    File should exist        MatchedPairs.csv
    File should exist        outfile_diff_results.csv

AT.OT.002.001
    [Documentation]          Output all counting results in a single file.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Run UCC    java  -jar  @{UCC BASE}                  -unified
    Response Status Check    0  0  0  0  0
    File should exist        TOTAL_outfile.csv
    File should not exist    [!T]*_outfile.csv

AT.OT.002.002
    [Documentation]          Output all counting results of differencing operation in a single file for each baseline.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Run UCC    java  -jar  @{UCC BASE}                  -d  -unified
    Response Status Check    0  0  0  0  0
    File should exist        Baseline-A-TOTAL_outfile.csv
    File should exist        Baseline-B-TOTAL_outfile.csv
    File should not exist    Baseline-?-[!T]*_outfile.csv

AT.OT.003.001
    [Documentation]          Output all counting results in text format.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Run UCC    java  -jar  @{UCC BASE}                  -ascii
    Response Status Check    0  0  0  0  0
    File should exist        *_outfile.txt
    File should exist        outfile_cplx.txt
    File should exist        outfile_cyclomatic_cplx.txt
    File should exist        outfile_summary.txt

AT.OT.003.002
    [Documentation]          Output all counting results of differencing operation in text format.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Run UCC    java  -jar  @{UCC BASE}                  -d  -ascii
    Response Status Check    0  0  0  0  0
    File should exist        Baseline-A-*_outfile.txt
    File should exist        Baseline-A-outfile_cplx.txt
    File should exist        Baseline-A-outfile_cyclomatic_cplx.txt
    File should exist        Baseline-A-outfile_summary.txt
    File should exist        Baseline-B-*_outfile.txt
    File should exist        Baseline-B-outfile_cplx.txt
    File should exist        Baseline-B-outfile_cyclomatic_cplx.txt
    File should exist        Baseline-B-outfile_summary.txt
    File should exist        MatchedPairs.txt
    File should exist        outfile_diff_results.txt

AT.OT.004.001
    [Documentation]          Allow users to specify custom output directory for counting.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Create directory         Test
    Run UCC    java  -jar  @{UCC BASE}                  -outdir  Test
    Response Status Check    0  0  0  0  0
    File should exist        Test${/}*_outfile.csv
    File should exist        Test${/}outfile_cplx.csv
    File should exist        Test${/}outfile_cyclomatic_cplx.csv
    File should exist        Test${/}outfile_summary.csv
    File should not exist    *_outfile.csv
    File should not exist    outfile_cplx.csv
    File should not exist    outfile_cyclomatic_cplx.csv
    File should not exist    outfile_summary.csv

AT.OT.004.002
    [Documentation]          Allow users to specify custom output directory for differencing.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Create directory         Test
    Run UCC    java  -jar  @{UCC BASE}                  -d  -outdir  Test
    Response Status Check    0  0  0  0  0
    File should exist        Test${/}Baseline-A-*_outfile.csv
    File should exist        Test${/}Baseline-A-outfile_cplx.csv
    File should exist        Test${/}Baseline-A-outfile_cyclomatic_cplx.csv
    File should exist        Test${/}Baseline-A-outfile_summary.csv
    File should exist        Test${/}Baseline-B-*_outfile.csv
    File should exist        Test${/}Baseline-B-outfile_cplx.csv
    File should exist        Test${/}Baseline-B-outfile_cyclomatic_cplx.csv
    File should exist        Test${/}Baseline-B-outfile_summary.csv
    File should exist        Test${/}MatchedPairs.csv
    File should exist        Test${/}outfile_diff_results.csv
    File should not exist    Baseline-A-*_outfile.csv
    File should not exist    Baseline-A-outfile_cplx.csv
    File should not exist    Baseline-A-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-A-outfile_summary.csv
    File should not exist    Baseline-B-*_outfile.csv
    File should not exist    Baseline-B-outfile_cplx.csv
    File should not exist    Baseline-B-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-B-outfile_summary.csv
    File should not exist    MatchedPairs.csv
    File should not exist    outfile_diff_results.csv

AT.OT.005.001
    [Documentation]          Allow users to specify full path for custom output directory for counting.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Create directory         Test
    Run UCC    java  -jar  @{UCC BASE}                  -outdir  ${EXECDIR}${/}Test
    Response Status Check    0  0  0  0  0
    File should exist        Test${/}*_outfile.csv
    File should exist        Test${/}outfile_cplx.csv
    File should exist        Test${/}outfile_cyclomatic_cplx.csv
    File should exist        Test${/}outfile_summary.csv
    File should not exist    *_outfile.csv
    File should not exist    outfile_cplx.csv
    File should not exist    outfile_cyclomatic_cplx.csv
    File should not exist    outfile_summary.csv

AT.OT.005.002
    [Documentation]          Allow users to specify full path for custom output directory for differencing.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Create directory         Test
    Run UCC    java  -jar  @{UCC BASE}                  -d  -outdir  ${EXECDIR}${/}Test
    Response Status Check    0  0  0  0  0
    File should exist        Test${/}Baseline-A-*_outfile.csv
    File should exist        Test${/}Baseline-A-outfile_cplx.csv
    File should exist        Test${/}Baseline-A-outfile_cyclomatic_cplx.csv
    File should exist        Test${/}Baseline-A-outfile_summary.csv
    File should exist        Test${/}Baseline-B-*_outfile.csv
    File should exist        Test${/}Baseline-B-outfile_cplx.csv
    File should exist        Test${/}Baseline-B-outfile_cyclomatic_cplx.csv
    File should exist        Test${/}Baseline-B-outfile_summary.csv
    File should exist        Test${/}MatchedPairs.csv
    File should exist        Test${/}outfile_diff_results.csv
    File should not exist    Baseline-A-*_outfile.csv
    File should not exist    Baseline-A-outfile_cplx.csv
    File should not exist    Baseline-A-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-A-outfile_summary.csv
    File should not exist    Baseline-B-*_outfile.csv
    File should not exist    Baseline-B-outfile_cplx.csv
    File should not exist    Baseline-B-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-B-outfile_summary.csv
    File should not exist    MatchedPairs.csv
    File should not exist    outfile_diff_results.csv

AT.OT.006.001
    [Documentation]          Allow users to specify relative path for custom output directory for counting.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Create directory         Test
    Run UCC    java  -jar  @{UCC BASE}                  -outdir  Test
    Response Status Check    0  0  0  0  0
    File should exist        Test${/}*_outfile.csv
    File should exist        Test${/}outfile_cplx.csv
    File should exist        Test${/}outfile_cyclomatic_cplx.csv
    File should exist        Test${/}outfile_summary.csv
    File should not exist    *_outfile.csv
    File should not exist    outfile_cplx.csv
    File should not exist    outfile_cyclomatic_cplx.csv
    File should not exist    outfile_summary.csv

AT.OT.006.002
    [Documentation]          Allow users to specify relative path for custom output directory for differencing.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Create directory         Test
    Run UCC    java  -jar  @{UCC BASE}                  -d  -outdir  Test
    Response Status Check    0  0  0  0  0
    File should exist        Test${/}Baseline-A-*_outfile.csv
    File should exist        Test${/}Baseline-A-outfile_cplx.csv
    File should exist        Test${/}Baseline-A-outfile_cyclomatic_cplx.csv
    File should exist        Test${/}Baseline-A-outfile_summary.csv
    File should exist        Test${/}Baseline-B-*_outfile.csv
    File should exist        Test${/}Baseline-B-outfile_cplx.csv
    File should exist        Test${/}Baseline-B-outfile_cyclomatic_cplx.csv
    File should exist        Test${/}Baseline-B-outfile_summary.csv
    File should exist        Test${/}MatchedPairs.csv
    File should exist        Test${/}outfile_diff_results.csv
    File should not exist    Baseline-A-*_outfile.csv
    File should not exist    Baseline-A-outfile_cplx.csv
    File should not exist    Baseline-A-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-A-outfile_summary.csv
    File should not exist    Baseline-B-*_outfile.csv
    File should not exist    Baseline-B-outfile_cplx.csv
    File should not exist    Baseline-B-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-B-outfile_summary.csv
    File should not exist    MatchedPairs.csv
    File should not exist    outfile_diff_results.csv

AT.OT.007.001
    [Documentation]          Allow periods in the custom output directory for counting.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Create directory         Test.1
    Run UCC    java  -jar  @{UCC BASE}                  -outdir  Test.1
    Response Status Check    0  0  0  0  0
    File should exist        Test.1${/}*_outfile.csv
    File should exist        Test.1${/}outfile_cplx.csv
    File should exist        Test.1${/}outfile_cyclomatic_cplx.csv
    File should exist        Test.1${/}outfile_summary.csv
    File should not exist    *_outfile.csv
    File should not exist    outfile_cplx.csv
    File should not exist    outfile_cyclomatic_cplx.csv
    File should not exist    outfile_summary.csv

AT.OT.007.002
    [Documentation]          Allow periods in the custom output directory for differencing.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Create directory         Test.1
    Run UCC    java  -jar  @{UCC BASE}                  -d  -outdir  Test.1
    Response Status Check    0  0  0  0  0
    File should exist        Test.1${/}Baseline-A-*_outfile.csv
    File should exist        Test.1${/}Baseline-A-outfile_cplx.csv
    File should exist        Test.1${/}Baseline-A-outfile_cyclomatic_cplx.csv
    File should exist        Test.1${/}Baseline-A-outfile_summary.csv
    File should exist        Test.1${/}Baseline-B-*_outfile.csv
    File should exist        Test.1${/}Baseline-B-outfile_cplx.csv
    File should exist        Test.1${/}Baseline-B-outfile_cyclomatic_cplx.csv
    File should exist        Test.1${/}Baseline-B-outfile_summary.csv
    File should exist        Test.1${/}MatchedPairs.csv
    File should exist        Test.1${/}outfile_diff_results.csv
    File should not exist    Baseline-A-*_outfile.csv
    File should not exist    Baseline-A-outfile_cplx.csv
    File should not exist    Baseline-A-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-A-outfile_summary.csv
    File should not exist    Baseline-B-*_outfile.csv
    File should not exist    Baseline-B-outfile_cplx.csv
    File should not exist    Baseline-B-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-B-outfile_summary.csv
    File should not exist    MatchedPairs.csv
    File should not exist    outfile_diff_results.csv

AT.OT.008.001
    [Documentation]          Allow underscores in the custom output directory for counting.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Create directory         Test_1
    Run UCC    java  -jar  @{UCC BASE}                  -outdir  Test_1
    Response Status Check    0  0  0  0  0
    File should exist        Test_1${/}*_outfile.csv
    File should exist        Test_1${/}outfile_cplx.csv
    File should exist        Test_1${/}outfile_cyclomatic_cplx.csv
    File should exist        Test_1${/}outfile_summary.csv
    File should not exist    *_outfile.csv
    File should not exist    outfile_cplx.csv
    File should not exist    outfile_cyclomatic_cplx.csv
    File should not exist    outfile_summary.csv

AT.OT.008.002
    [Documentation]          Allow underscores in the custom output directory for differencing.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Create directory         Test_1
    Run UCC    java  -jar  @{UCC BASE}                  -d  -outdir  Test_1
    Response Status Check    0  0  0  0  0
    File should exist        Test_1${/}Baseline-A-*_outfile.csv
    File should exist        Test_1${/}Baseline-A-outfile_cplx.csv
    File should exist        Test_1${/}Baseline-A-outfile_cyclomatic_cplx.csv
    File should exist        Test_1${/}Baseline-A-outfile_summary.csv
    File should exist        Test_1${/}Baseline-B-*_outfile.csv
    File should exist        Test_1${/}Baseline-B-outfile_cplx.csv
    File should exist        Test_1${/}Baseline-B-outfile_cyclomatic_cplx.csv
    File should exist        Test_1${/}Baseline-B-outfile_summary.csv
    File should exist        Test_1${/}MatchedPairs.csv
    File should exist        Test_1${/}outfile_diff_results.csv
    File should not exist    Baseline-A-*_outfile.csv
    File should not exist    Baseline-A-outfile_cplx.csv
    File should not exist    Baseline-A-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-A-outfile_summary.csv
    File should not exist    Baseline-B-*_outfile.csv
    File should not exist    Baseline-B-outfile_cplx.csv
    File should not exist    Baseline-B-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-B-outfile_summary.csv
    File should not exist    MatchedPairs.csv
    File should not exist    outfile_diff_results.csv

AT.OT.009.001
    [Documentation]          Allow spaces in the custom output directory for counting.
    Create UCC File List     FileList.txt      @{COUNTSET1.filelist}
    Create directory         Test 1
    Run UCC    java  -jar  @{UCC BASE}                  -outdir  Test 1
    Response Status Check    0  0  0  0  0
    File should exist        Test 1${/}*_outfile.csv
    File should exist        Test 1${/}outfile_cplx.csv
    File should exist        Test 1${/}outfile_cyclomatic_cplx.csv
    File should exist        Test 1${/}outfile_summary.csv
    File should not exist    *_outfile.csv
    File should not exist    outfile_cplx.csv
    File should not exist    outfile_cyclomatic_cplx.csv
    File should not exist    outfile_summary.csv

AT.OT.009.002
    [Documentation]          Allow spaces in the custom output directory for differencing.
    Create UCC File List     FileListA.txt      @{DIFFSET1.fileAlist}
    Create UCC File List     FileListB.txt      @{DIFFSET1.fileBlist}
    Create directory         Test 1
    Run UCC    java  -jar  @{UCC BASE}                  -d  -outdir  Test 1
    Response Status Check    0  0  0  0  0
    File should exist        Test 1${/}Baseline-A-*_outfile.csv
    File should exist        Test 1${/}Baseline-A-outfile_cplx.csv
    File should exist        Test 1${/}Baseline-A-outfile_cyclomatic_cplx.csv
    File should exist        Test 1${/}Baseline-A-outfile_summary.csv
    File should exist        Test 1${/}Baseline-B-*_outfile.csv
    File should exist        Test 1${/}Baseline-B-outfile_cplx.csv
    File should exist        Test 1${/}Baseline-B-outfile_cyclomatic_cplx.csv
    File should exist        Test 1${/}Baseline-B-outfile_summary.csv
    File should exist        Test 1${/}MatchedPairs.csv
    File should exist        Test 1${/}outfile_diff_results.csv
    File should not exist    Baseline-A-*_outfile.csv
    File should not exist    Baseline-A-outfile_cplx.csv
    File should not exist    Baseline-A-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-A-outfile_summary.csv
    File should not exist    Baseline-B-*_outfile.csv
    File should not exist    Baseline-B-outfile_cplx.csv
    File should not exist    Baseline-B-outfile_cyclomatic_cplx.csv
    File should not exist    Baseline-B-outfile_summary.csv
    File should not exist    MatchedPairs.csv
    File should not exist    outfile_diff_results.csv

AT.CC.001.001
	[Documentation] 		UCC should be able to calculate the number of control flows with 'if' statements in XMIDAS source, manually check file 'outfile_cyclomatic_cplx.csv' , CC1 values should be '2'
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC FOR XMIDAS SOURCE}	x_midas_testcase1.txt
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.002.001
	[Documentation] 		UCC should be able to calculate the number of control flows with while, end while statements in XMIDAS source
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC FOR XMIDAS SOURCE}	x_midas_testcase2.txt
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.003.001
	[Documentation] 		UCC should be able to calculate the number of control flows with loop, endloop statements in XMIDAS source
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC FOR XMIDAS SOURCE}	x_midas_testcase3.txt
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.004.001
	[Documentation] 		UCC should be able to calculate the number of control flows with labels and if statements in XMIDAS source, manually check file 'outfile_cyclomatic_cplx.csv' , CC1 values should be '2'
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC FOR XMIDAS SOURCE}	x_midas_testcase4.txt
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.005.001
	[Documentation] 		UCC should be able to calculate the number of control flows with if, else, endif statements in XMIDAS source
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC FOR XMIDAS SOURCE}	x_midas_testcase5.txt
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.006.001
	[Documentation] 		UCC should be able to calculate the number of control flows with simple if, endif statements in NextMidas source code
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC_FOR_NEXTMIDAS_SOURCE}	nextmidas_TC_1.mm
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.007.001
	[Documentation] 		UCC should be able to calculate the number of control flows with an if statement followed by a bunch of elseif statement in NextMidas source
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC_FOR_NEXTMIDAS_SOURCE}	nextmidas_TC_2.mm
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.008.001
	[Documentation] 		UCC should be able to calculate the number of control flow with while loop in NextMidas source
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC_FOR_NEXTMIDAS_SOURCE}	nextmidas_TC_3.mm
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.009.001
	[Documentation] 		UCC should be able to calculate the number of control flow with dowhile loop in NextMidas source
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC_FOR_NEXTMIDAS_SOURCE}	nextmidas_TC_4.mm
    File should exist 		outfile_cyclomatic_cplx.csv

AT.CC.010.001
	[Documentation] 		UCC should be able to calculate the number of control flow with while loop followed by dowhile in NextMidas source
	Run UCC                 java  -jar  @{UCC BASE}	-dir	@{CC_FOR_NEXTMIDAS_SOURCE}	nextmidas_TC_5.mm
    File should exist 		outfile_cyclomatic_cplx.csv

AT.GEN.014.001
	[Documentation]			Check if UCC runs differencing on two empty directories
	Run UCC                 java  -jar  @{UCC BASE}  -d  -dir  @{GENERAL EMPTY}  @{GENERAL EMPTY1}
	Response status check    0  0  0  0  0

AT.INT.001.001
	[Documentation]			Check if UCC works for default filelist
	Create default file list     @{DEFAULT FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}
	File should exist		outfile_cplx.csv	outfile_summary.csv
	Time limit		5

AT.INT.002.001
	[Documentation]			Check if UCC throws an error with version switch
	Run UCC                 java  -jar  @{UCC BASE}  -v
	Response should contain 	UCC version
	Time limit		5

AT.INT.003.001
	[Documentation]			Check if UCC shows status on the command line
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{DIRECTORY}  *.cpp
	Response should contain 	Building list of source files
	File should exist		outfile_cplx.csv	outfile_summary.csv
	Time limit		5

AT.INT.004.001
	[Documentation]			Check if UCC runs differencing with default filelists
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d
	Response should contain 	Building list of source files
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.005.001
	[Documentation]			Check if UCC runs differencing with threshold set
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d	-t	30
	Response should contain 	Building list of source files
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.006.001
	[Documentation]			Manually check if UCC fails for random argument
	Run UCC                 java  -jar  @{UCC BASE}  -d	abc
	Time limit		5

AT.INT.007.001
	[Documentation]			Check if UCC runs differencing with -i option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d	-i1		filelistA.txt
	Response should contain 	Building list of source files
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.008.001
	[Documentation]			Check if UCC runs differencing with threshold and -i option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d	-i1		filelistA.txt	-t	10
	Response should contain 	Building list of source files
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.009.001
	[Documentation]			Check if UCC runs differencing with threshold and -i option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-t	10
	Response should contain 	Building list of source files
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.010.001
	[Documentation]			UCC should generate output summary file for Matlab files
	Run UCC                 java  -jar  @{UCC BASE} 		-dir	  @{MAINTENANCE MATLAB ALL SOURCE}  *.m
	File should exist 		outfile_summary.csv
	Time limit		5

AT.INT.011.001
	[Documentation]			UCC should run with help option
	Run UCC                 java  -jar  @{UCC BASE} 		-help
	Response should contain		Options:
	Time limit		5

AT.INT.012.001
	[Documentation]			Check if UCC runs with visualdiff option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d  -i1		filelistA.txt	-i2		filelistB.txt	-visualdiff
	File should exist		diff_dump.txt  highlighted_diff.html
	Time limit		5

AT.INT.013.001
	[Documentation]			Check if UCC runs with tdup option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-tdup 	12
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.014.001
	[Documentation]			Manually check if UCC throws an error with negative tdup value
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-tdup  -10
	Time limit		5

AT.INT.015.001
	[Documentation]			Manually check if UCC throws an error with string  tdup value
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-tdup  "string"
	Time limit		5

AT.INT.016.001
	[Documentation]			Manually check if UCC throws an error when the argument integers is out of bounds
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-tdup  112
	Time limit		5


AT.INT.017.001
	[Documentation]			Check if UCC runs with nodup option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-nodup
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.018.001
	[Documentation]			Check if UCC runs with nolinks option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-nolinks
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.019.001
	[Documentation]			Check if UCC runs with unified option
	Create default file list     @{DEFAULT FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -unified
	File should exist		outfile_summary.csv
	Time limit		5

AT.INT.020.001
	[Documentation]			Check if UCC runs with legacy option
	Create default file list     @{DEFAULT FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -legacy
	File should exist		outfile_summary.txt
	Time limit		5

AT.INT.021.001
	[Documentation]			Check if UCC runs with nocomplex option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-nocomplex
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.022.001
	[Documentation]			Check if UCC runs with visualdiff option and threads
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d  -i1		filelistA.txt	-i2		filelistB.txt	-visualdiff	  -threads  4
	File should exist		diff_dump.txt  highlighted_diff.html
	Time limit		5

AT.INT.023.001
	[Documentation]			Check if UCC runs with visualdiff option and threads
    Create baseline A file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -i1		filelistA.txt	-visualdiff	  -threads  4
	File should exist		outfile_summary.csv
	Time limit		5

AT.INT.024.001
	[Documentation]			Check if UCC runs with tdup option and threads
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-tdup 	12  -threads  4
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.025.001
	[Documentation]			Check if UCC runs with tdup option and threads
    Create baseline A file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}   -i1		filelistA.txt	-tdup 	12  -threads  4
	File should exist		outfile_summary.csv
	Time limit		5

AT.INT.026.001
	[Documentation]			Check if UCC runs differencing with threshold set and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d	-t	30	 -threads  4
	Response should contain 	Building list of source files
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.027.001
	[Documentation]			Check if UCC runs with nocomplex and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-nocomplex  -threads  4
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.028.001
	[Documentation]			Check if UCC runs with nocomplex and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -i1		filelistA.txt	-nocomplex  -threads  4
	File should exist		outfile_summary.csv
	Time limit		5

AT.INT.029.001
	[Documentation]			Check if UCC runs with trunc and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -i1		filelistA.txt   -trunc  100  -threads  4
	File should exist		outfile_summary.csv
	Time limit		5

AT.INT.030.001
	[Documentation]			Check if UCC runs with trunc and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d  -i1		filelistA.txt  -i2  filelistB.txt   -trunc  100  -threads  4
	File should exist		outfile_diff_results.csv
	Time limit		5

AT.INT.031.001
	[Documentation]			Check if UCC runs with cf option
	Create default file list     @{DEFAULT FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -cf  -threads  4
	File should exist		outfile_summary.csv
	Time limit		5

AT.INT.032.001
	[Documentation]			Check if UCC runs with ascii and threads option
	Create default file list     @{DEFAULT FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -ascii  -threads  4
	File should exist		outfile_summary.txt
	Time limit		5

AT.INT.033.001
	[Documentation]			Check if UCC runs with legacy and threads option
	Create default file list     @{DEFAULT FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -legacy  -threads  4
	File should exist		outfile_summary.txt
	Time limit		5

AT.INT.034.001
	[Documentation]			Check if UCC runs with nolinks and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE B FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-nolinks  -threads  4
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.035.001
	[Documentation]			Check if UCC runs with nolinks and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -i1		filelistA.txt	-nolinks  -threads  4
	File should exist		outfile_summary.csv
	Time limit		5

AT.INT.036.001
	[Documentation]			Check if UCC runs with nodup and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
    Create baseline B file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}  -d 	-i1		filelistA.txt	-i2		filelistB.txt	-nodup  -threads  4
	File should exist		MatchedPairs.csv	outfile_diff_results.csv
	Time limit		5

AT.INT.037.001
	[Documentation]			Check if UCC runs with nodup and threads option
    Create baseline A file list     @{BASELINE A FILE LIST}
	Run UCC                 java  -jar  @{UCC BASE}	-i1		filelistA.txt	-nodup  -threads  4
	File should exist		outfile_summary.csv
	Time limit		5

AT.MAIN.001.001
	[Documentation]			Manually check if Physical SLOC is 170 and Logical SLOC is 97 in outfile_summary
	Run UCC                 java  -jar  @{UCC BASE} 		-dir	  @{MAINTENANCE CSHARP SINGLE SOURCE}  GetChocolatey.cs
	File should exist 		outfile_summary.csv
	Time limit		0.35

AT.MAIN.002.001
	[Documentation]			Manually check if Physical SLOC is 32544 and Logical SLOC is 18319 in outfile_summary
	Run UCC                 java  -jar  @{UCC BASE} 		-dir	  @{MAINTENANCE CSHARP ALL SOURCE}  *.cs
	File should exist 		outfile_summary.csv
	Time limit		5

AT.MAIN.003.001
	[Documentation]			UCC should generate output summary file for Matlab files
	Run UCC                 java  -jar  @{UCC BASE} 		-dir	  @{MAINTENANCE MATLAB ALL SOURCE}  *.m
	File should exist 		outfile_summary.csv
	Time limit		0.35

AT.MAIN.004.001
	[Documentation]			UCC should generate output summary file for a Python file with unterminated literal string
	Run UCC                 java  -jar  @{UCC BASE} 		-dir	  @{MAINTENANCE PYTHON SINGLE SOURCE}  a.py
	File should exist 		outfile_summary.csv
	Time limit		0.35

AT.MAIN.005.001
	[Documentation]			UCC should not crash when processing cyclomatic complexity for python files.
	Run UCC                 java  -jar  @{UCC BASE} 		-dir	  @{MAINTENANCE PYTHON CYCLOMATIC SOURCE}  *.py
	File should exist 		outfile_summary.csv
	Time limit		0.35

AT.OE.001.001
	[Documentation] 		UCC should generate output summary file for valid header
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header  @{HEADER H1}
    File should exist 		outfile_summary.csv

AT.OE.002.001
	[Documentation] 		UCC should not throw an error for a valid header file
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header  @{HEADER H1}
    Response should not contain 		Information: -header Invalid

AT.OE.003.001
	[Documentation] 		UCC should throw an error for an invalid header file
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header  @{HEADER INVALID}
    Response should contain 		Information: -header Invalid

AT.OE.004.001
	[Documentation] 		UCC should throw an error when -header is specified and no path is given
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header
    Response should contain 		Header file missing

AT.OE.005.001
	[Documentation] 		UCC should throw an error when header file is empty
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header  @{HEADER EMPTY}
    Response should contain 		the file is empty

AT.OE.006.001
	[Documentation] 		UCC should create outfile_summary for -noheader
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -noheader
    File should exist 		outfile_summary.csv

AT.OE.007.001
	[Documentation] 		UCC should not throw an error for -noheader
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -noheader
    Response should not contain 		Information: -header

AT.OE.008.001
	[Documentation] 		UCC should create outfile_summary when -header is specified but no path is given
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header
    File should exist 		outfile_summary.csv

AT.OE.009.001
	[Documentation] 		UCC should create outfile_summary for empty header file
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header  @{HEADER EMPTY}
    File should exist 		outfile_summary.csv

AT.OE.010.001
	[Documentation] 		Manually check if outfile_summary.csv contains "This header is expected to be in outfile_summary.csv"
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header  @{HEADER H1}

AT.OE.011.001
	[Documentation] 		Manually check if outfile_summary.csv contains "USC Unified CodeCount"
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -noheader

AT.OE.012.001
	[Documentation] 		Manually check if outfile_summary.csv contains "USC Unified CodeCount"
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header

AT.OE.013.001
	[Documentation] 		Manually check if outfile_summary.csv contains "USC Unified CodeCount"
	Run UCC                 java  -jar  @{UCC BASE}  -dir  @{MAINTENANCE PYTHON SINGLE SOURCE}  -header  @{HEADER INVALID}

AT.OE.014.001
	[Documentation] 		Check if Visual differencing switch is working
	Run UCC                 java  -jar  @{UCC BASE}  -d  -dir  @{OUTPUT ENHANCEMENTS SOURCE}  @{MAINTENANCE CSHARP ALL SOURCE}  -visualdiff
	File should exist		diff_dump.txt  highlighted_diff.html

AT.OE.015.001
	[Documentation] 		Check if Visual differencing switch is working with header
	Run UCC                 java  -jar  @{UCC BASE}  -d  -dir  @{OUTPUT ENHANCEMENTS SOURCE}  @{MAINTENANCE CSHARP ALL SOURCE}  -visualdiff  -header  @{HEADER H1}
	File should exist		diff_dump.txt  highlighted_diff.html

AT.OE.016.001
	[Documentation] 		Check if Visual differencing switch is working with no header
	Run UCC                 java  -jar  @{UCC BASE}  -d  -dir  @{OUTPUT ENHANCEMENTS SOURCE}  @{MAINTENANCE CSHARP ALL SOURCE}  -visualdiff  -noheader
	File should exist		diff_dump.txt  highlighted_diff.html

AT.OE.017.001
	[Documentation] 		Check if Visual differencing switch is working for JAVA files
	Run UCC                 java  -jar  @{UCC BASE}  -d  -dir  @{OUTPUT ENHANCEMENTS JAVA1}  @{OUTPUT ENHANCEMENTS JAVA2}  -visualdiff
	File should exist		diff_dump.txt  highlighted_diff.html
