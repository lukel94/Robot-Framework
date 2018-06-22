DICT__COUNTSET1 = {'filelist': ['req/ucc_input/File1.cpp'], 'count': 187, 'lang': 'cpp'}
DICT__COUNTSET2 = {'filelist': ['req/ucc_input/File2.cpp'], 'count': 95, 'lang': 'cpp'}
DICT__COUNTSET3 = {'filelist': ['req/ucc_input/File1.c'], 'count': 38, 'lang': 'cpp'}
DICT__COUNTSET4 = {'filelist': ['req/ucc_input/File2.c'], 'count': 7, 'lang': 'cpp'}
DICT__COUNTSET5 = {'filelist': ['req/ucc_input/File1.h'], 'count': 24, 'lang': 'cpp'}
DICT__COUNTSET6 = {'filelist': ['req/ucc_input/File2.h'], 'count': 14, 'lang': 'cpp'}

DICT__COUNTSET7= {'filelist': ['req/ucc_input/File1.cpp'],'counts': [1,189,187]}


DICT__DIFFSET1 = {'fileAlist': ['req/ucc_input/File1.cpp'], 'fileBlist': ['req/ucc_input/File2.cpp'],
                  'counts': [95, 187, 0, 0]}
DICT__DIFFSET2 = {'fileAlist': ['req/ucc_input/File1.cpp'], 'fileBlist': ['req/ucc_input/File1.cpp'],
                  'counts': [0, 0, 0, 187]}
DICT__DIFFSET3 = {'fileAlist': ['req/ucc_input/File1.c', 'req/ucc_input/File1.h'], 'fileBlist': ['req/ucc_input/File2.c', 'req/ucc_input/File2.h'],
                  'counts': [21, 62, 0, 0]}
DICT__DIFFSET4 = {'fileAlist': ['req/ucc_input/File1.c', 'req/ucc_input/File1.h'], 'fileBlist': ['req/ucc_input/File1.c', 'req/ucc_input/File1.h'],
                  'counts': [0, 0, 0, 62]}


BASELINE_A_FILE_LIST = ['req/ucc_input/MainObject.cpp',
    'req/ucc_input/MainObject.h',
    'req/ucc_input/main.cpp']

BASELINE_B_FILE_LIST = [
    'req/ucc_input/MainObject.cpp',
    'req/ucc_input/MainObject.h',
    'req/ucc_input/sema.h']

INVALID_FILE_LIST = [ 
    'req/ucc_input/MainObject.cpp',
    'req/ucc_input/MainObject.h',
    'req/ucc_input/invalidfile.h']


IN_SAME_LINE1 = [
                 'req/ucc_input/File1.c req/ucc_input/File1.cpp']

DELIMITED_FILE_LIST = 'req/ucc_input/MainObject.cpp;req/ucc_input/MainObject.h;req/ucc_input/invalidfile.h'

DEFAULT_FILE_LIST = [
    'req/ucc_input/cc_main.cpp',
    'req/ucc_input/cc_main.h',
    'req/ucc_input/main.cpp',
    'req/ucc_input/MainObject.cpp',
    'req/ucc_input/MainObject.h',
    'req/ucc_input/sema.h',
    'req/ucc_input/shortFileList.txt',
    'req/ucc_input/test/cc main.cpp',
    'req/ucc_input/test/cc main.h',
    'req/ucc_input/test/cc.main.cpp',
    'req/ucc_input/test/cc.main.h',
    'req/ucc_input/test/customFileList.txt',
    'req/ucc_input/test/sub dir/MainObject.cpp',
    'req/ucc_input/test/sub dir/MainObject.h',
    'req/ucc_input/test/sub.dir/MainObject.cpp',
    'req/ucc_input/test/sub.dir/MainObject.h',
    'req/ucc_input/test/sub_dir/MainObject.cpp',
    'req/ucc_input/test/sub_dir/MainObject.h',
    'req/ucc_input/UCCFilesOut.cpp',
    'req/ucc_input/UCCFilesOut.h' ]

DEFAULT_FILE_LIST_SIZE = len(DEFAULT_FILE_LIST)

COUNT_DEFAULT_FILE_LIST = [
                     'req/ucc_input/cc_main.cpp',
                     'req/ucc_input/MainObject.cpp'
                      ]

PERIOD_DEFAULT_FILE_LIST = [
                           'req/ucc_input/test/cc.main.cpp'
                           ]

UNDERSCORE_DEFAULT_FILE_LIST = [
                            'req/ucc_input/test/cc_main.cpp'
                            ]

SPACE_DEFAULT_FILE_LIST = [
                                'req/ucc_input/test/cc main.cpp'
                                ]

"""
UCC_BASE = ['ucc_test_suites/ucc_executables/UCC_base']

UCC_OE = ['ucc_test_suites/ucc_executables/UCC_oe']

UCC_OE2 = ['ucc_test_suites/ucc_executables/UCC_oe2']

UCC_MAINTENANCE = ['ucc_test_suites/ucc_executables/UCC_maintenance']

UCC_INT = ['ucc_test_suites/ucc_executables/UCC_integration']

UCC_INTEGRATION = ['ucc_test_suites/ucc_executables/UCC_integration_test_team']

UCC_CC = ['ucc_test_suites/ucc_executables/UCC_base']
"""

UCC_BASE = ['ucc_executables/ucc-j.java']


DIRECTORY = [
                     'req/ucc_input'
            ]
			
OUTPUT_ENHANCEMENTS_SOURCE = ['req/ucc_input/output_enhancements']

OUTPUT_ENHANCEMENTS_JAVA1 = ['req/ucc_input/output_enhancements/java1']

OUTPUT_ENHANCEMENTS_JAVA2 = ['req/ucc_input/output_enhancements/java2']			

HEADER_H1 = ['req/ucc_input/headers/h1.txt']

HEADER_EMPTY = ['req/ucc_input/headers/h_empty.txt']

HEADER_INVALID = ['req/ucc_input/headers/h999999.txt']

MAINTENANCE_CSHARP_SINGLE_SOURCE = ['req/ucc_input/maintenance/csharp_all_files/chocolatey']

MAINTENANCE_CSHARP_ALL_SOURCE = ['req/ucc_input/maintenance/csharp_all_files']

MAINTENANCE_MATLAB_ALL_SOURCE = ['req/ucc_input/maintenance/matlab']

MAINTENANCE_PYTHON_SINGLE_SOURCE = ['req/ucc_input/maintenance/python']

MAINTENANCE_PYTHON_CYCLOMATIC_SOURCE = ['req/ucc_input/maintenance/python_cyclomatic']

CC_FOR_XMIDAS_SOURCE = ['req/ucc_input/XMidas']

CC_FOR_NEXTMIDAS_SOURCE = ['req/ucc_input/NextMidas']

GENERAL_EMPTY = ['req/ucc_input/empty']

GENERAL_EMPTY1 = ['req/ucc_input/empty1']

GENERAL = ['req/ucc_input/general']
