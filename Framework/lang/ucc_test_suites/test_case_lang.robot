# -*- coding: robot -*-
*** Settings ***
Library   OperatingSystem
Library   lib${/}UCCLanguageTestLibrary.py
Library   String


Test Teardown    NONE

*** Variables ***
@{DEFAULT CPP FILE LIST}    lang/ucc_input/cpp/input_one
@{DEFAULT C FILE LIST}    lang/ucc_input/c/input_one
@{DEFAULT CSS FILE LIST}    lang/ucc_input/css/input_one
@{DEFAULT JAVA FILE LIST}    lang/ucc_input/java/input_one
@{DEFAULT HTML FILE LIST}    lang/ucc_input/html/input_one
@{DEFAULT PYTHON FILE LIST}    lang/ucc_input/python/input_one
@{DEFAULT PERL FILE LIST}    lang/ucc_input/perl/input_one
@{DEFAULT BASH FILE LIST}    lang/ucc_input/bash/input_one
@{DEFAULT Cs FILE LIST}    lang/ucc_input/c#/input_one
@{DEFAULT JS FILE LIST}    lang/ucc_input/javascript/input_one
@{DEFAULT CSH FILE LIST}    lang/ucc_input/cshell/input_one
@{DEFAULT JSP FILE LIST}    lang/ucc_input/jsp/input_one
@{DEFAULT SQL FILE LIST}	lang/ucc_input/sql/input_one
@{DEFAULT ASP FILE LIST}    lang/ucc_input/asp/input_one
@{DEFAULT XML FILE LIST}    lang/ucc_input/xml/input_one
@{DEFAULT BAT FILE LIST}    lang/ucc_input/batch/input_one
@{DEFAULT MATLAB FILE LIST}	lang/ucc_input/matlab/input_one
@{DEFAULT PHP FILE LIST}	lang/ucc_input/php/input_one
@{DEFAULT RUBY FILE LIST}    lang/ucc_input/ruby/input_one
@{DEFAULT VBSCRIPT FILE LIST}    lang/ucc_input/vbscript/input_one
@{DEFAULT VB FILE LIST}    lang/ucc_input/vb/input_one
@{DEFAULT ADA FILE LIST}    lang/ucc_input/ada/input_one
@{DEFAULT ASSEMBLY FILE LIST}    lang/ucc_input/assembly/input_one
@{DEFAULT VERILOG FILE LIST}    lang/ucc_input/verilog/input_one
@{DEFAULT IDL FILE LIST}    lang/ucc_input/idl/input_one
@{DEFAULT PASCAL FILE LIST}    lang/ucc_input/pascal/input_one
@{DEFAULT MAKEFILES FILE LIST}    lang/ucc_input/makefiles/input_one
@{DEFAULT COLDFUSION FILE LIST}    lang/ucc_input/coldfusion/input_one
@{DEFAULT FORTRAN FILE LIST}    lang/ucc_input/fortran/input_one
@{DEFAULT NEXTMIDAS FILE LIST}    lang/ucc_input/nextmidas/input_one
@{DEFAULT XMIDAS FILE LIST}    lang/ucc_input/xmidas/input_one
@{DEFAULT VHDL FILE LIST}    lang/ucc_input/VHDL/input_one
@{DEFAULT COLDFUSIONSCRIPT FILE LIST}    lang/ucc_input/coldfusionscript/input_one
@{DEFAULT SCALA FILE LIST}    lang/ucc_input/Scala/input_one
@{BASELINE JS}			lang/ucc_input/javascript/input_two
@{BASELINE Cs}			lang/ucc_input/c#/input_two
@{BASELINE JSP}			lang/ucc_input/jsp/input_two
@{BASELINE SQL}			lang/ucc_input/jsp/input_two
@{BASELINE CPP}			lang/ucc_input/cpp/input_two
@{BASELINE C}			lang/ucc_input/c/input_two
@{BASELINE CSS}			lang/ucc_input/css/input_two
@{BASELINE JAVA}			lang/ucc_input/java/input_two
@{BASELINE HTML}			lang/ucc_input/html/input_two
@{BASELINE PYTHON}			lang/ucc_input/python/input_two
@{BASELINE PERL}			lang/ucc_input/perl/input_two
@{BASELINE BASH}			lang/ucc_input/bash/input_two
@{BASELINE MATLAB}			lang/ucc_input/matlab/input_two
@{BASELINE PHP}				lang/ucc_input/php/input_two
@{BASELINE RUBY}			lang/ucc_input/ruby/input_two
@{BASELINE BAT}			lang/ucc_input/batch/input_two
@{BASELINE XML}			lang/ucc_input/xml/input_two
@{BASELINE ASP}			lang/ucc_input/asp/input_two
@{BASELINE CSH}			lang/ucc_input/cshell/input_two
@{BASELINE VB}			lang/ucc_input/vb/input_two
@{BASELINE VBSCRIPT}			lang/ucc_input/vbscript/input_two
@{BASELINE ADA}			lang/ucc_input/ada/input_two
@{BASELINE ASSEMBLY}			lang/ucc_input/assembly/input_two
@{BASELINE VERILOG}			lang/ucc_input/verilog/input_two
@{BASELINE IDL}			lang/ucc_input/idl/input_two
@{BASELINE PASCAL}			lang/ucc_input/pascal/input_two
@{BASELINE MAKEFILES}			lang/ucc_input/makefiles/input_two
@{BASELINE COLDFUSION}			lang/ucc_input/coldfusion/input_two
@{BASELINE FORTRAN}			lang/ucc_input/fortran/input_two
@{BASELINE NEXTMIDAS}			lang/ucc_input/nextmidas/input_two
@{BASELINE XMIDAS}			lang/ucc_input/xmidas/input_two
@{BASELINE VHDL}			lang/ucc_input/VHDL/input_two
@{BASELINE COLDFUSIONSCRIPT}			lang/ucc_input/coldfusionscript/input_two
@{BASELINE SCALA}			lang/ucc_input/Scala/input_two
@{uccVersion1}  ucc_executables/UCC_201512
@{uccVersion2}  ucc_executables/UCC


@{tear}             error_log*.txt   UCC_Performance*.txt    *.csv   *.cpp   File*.txt

*** Keywords ***
UCC Teardown with Dir
    [Documentation]          Custom teardown for deleting directories along with tmp files
    [Arguments]              @{teardir}
    Remove Files             @{tear}
    :FOR     ${dir}   IN     @{teardir}
    \    Remove Directory    ${dir}    recursive=True  

*** Test Cases ***
Setup Cpp
    Create UCC file list    fileList.txt    @{DEFAULT CPP FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}cpp_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}cpp_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT CPP FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE CPP}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}cpp_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}cpp_output${/}diff

	
Setup C
	Create UCC file list    fileList.txt    @{DEFAULT C FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}c_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}c_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT C FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE C}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}c_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}c_output${/}diff
	
Setup Css
	Create UCC file list    fileList.txt    @{DEFAULT CSS FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}css_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}css_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT CSS FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE CSS}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}css_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}css_output${/}diff
	
Setup Java
	Create UCC file list    fileList.txt    @{DEFAULT JAVA FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}java_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}java_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT JAVA FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE JAVA}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}java_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}java_output${/}diff

Setup JSP
	Create UCC file list    fileList.txt    @{DEFAULT JSP FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}jsp_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}jsp_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT JSP FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE JSP}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}jsp_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}jsp_output${/}diff
	
Setup Html
	Create UCC file list    fileList.txt    @{DEFAULT HTML FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}html_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}html_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT HTML FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE HTML}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}html_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}html_output${/}diff
	
Setup Python
	Create UCC file list    fileList.txt    @{DEFAULT PYTHON FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}python_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}python_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT PYTHON FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE PYTHON}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}python_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}python_output${/}diff
	
Setup Perl
	Create UCC file list    fileList.txt    @{DEFAULT PERL FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}perl_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}perl_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT PERL FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE PERL}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}perl_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}perl_output${/}diff

Setup Bash
	Create UCC file list    fileList.txt    @{DEFAULT BASH FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}bash_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}bash_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT BASH FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE BASH}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}bash_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}bash_output${/}diff

Setup C#
	Create UCC file list    fileList.txt    @{DEFAULT Cs FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}c#_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}c#_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT Cs FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE Cs}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}c#_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}c#_output${/}diff

Setup JS
	Create UCC file list    fileList.txt    @{DEFAULT JS FILE LIST}
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}javascript_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT JS FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE JS}
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}javascript_output${/}diff

Setup SQL
	Create UCC file list    fileList.txt    @{DEFAULT SQL FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}sql_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}sql_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT SQL FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE SQL}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}sql_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}sql_output${/}diff

Setup MATLAB
	Create UCC file list    fileList.txt    @{DEFAULT MATLAB FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}matlab_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}matlab_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT MATLAB FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE MATLAB}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}matlab_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}matlab_output${/}diff

Setup PHP
	Create UCC file list    fileList.txt    @{DEFAULT PHP FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}php_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}php_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT PHP FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE PHP}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}php_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}php_output${/}diff

Setup Ruby
	Create UCC file list    fileList.txt    @{DEFAULT RUBY FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}ruby_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}ruby_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT RUBY FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE RUBY}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}ruby_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}ruby_output${/}diff

Setup XML
	Create UCC file list    fileList.txt    @{DEFAULT XML FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}xml_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}xml_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT XML FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE XML}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}xml_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}xml_output${/}diff

Setup BAT
	Create UCC file list    fileList.txt    @{DEFAULT BAT FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}batch_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}batch_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT BAT FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE BAT}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}batch_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}batch_output${/}diff

Setup Cshell
	Create UCC file list    fileList.txt    @{DEFAULT CSH FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}cshell_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}cshell_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT CSH FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE CSH}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}cshell_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}cshell_output${/}diff

Setup ASP
	Create UCC file list    fileList.txt    @{DEFAULT ASP FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}asp_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}asp_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT ASP FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE ASP}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}asp_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}asp_output${/}diff

Setup VB
	Create UCC file list    fileList.txt    @{DEFAULT VB FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}vb_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}vb_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT VB FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE VB}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}vb_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}vb_output${/}diff

Setup VBSCRIPT
	Create UCC file list    fileList.txt    @{DEFAULT VBSCRIPT FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}vbscript_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}vbscript_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT VBSCRIPT FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE VBSCRIPT}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}vbscript_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}vbscript_output${/}diff

Setup ADA
	Create UCC file list    fileList.txt    @{DEFAULT ADA FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}ada_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}ada_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT ADA FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE ADA}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}ada_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}ada_output${/}diff

Setup ASSEMBLY
	Create UCC file list    fileList.txt    @{DEFAULT ASSEMBLY FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}assembly_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}assembly_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT ASSEMBLY FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE ASSEMBLY}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}assembly_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}assembly_output${/}diff

Setup VERILOG
	Create UCC file list    fileList.txt    @{DEFAULT VERILOG FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}verilog_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}verilog_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT VERILOG FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE VERILOG}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}verilog_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}verilog_output${/}diff

Setup IDL
	Create UCC file list    fileList.txt    @{DEFAULT IDL FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}idl_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}idl_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT IDL FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE IDL}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}idl_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}idl_output${/}diff

Setup PASCAL
	Create UCC file list    fileList.txt    @{DEFAULT PASCAL FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}pascal_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}pascal_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT PASCAL FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE PASCAL}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}pascal_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}pascal_output${/}diff

Setup MAKEFILES
	Create UCC file list    fileList.txt    @{DEFAULT MAKEFILES FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}makefiles_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}makefiles_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT MAKEFILES FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE MAKEFILES}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}makefiles_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}makefiles_output${/}diff

Setup COLDFUSION
	Create UCC file list    fileList.txt    @{DEFAULT COLDFUSION FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}coldfusion_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}coldfusion_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT COLDFUSION FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE COLDFUSION}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}coldfusion_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}coldfusion_output${/}diff

Setup FORTRAN
	Create UCC file list    fileList.txt    @{DEFAULT FORTRAN FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}fortran_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}fortran_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT FORTRAN FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE FORTRAN}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}fortran_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}fortran_output${/}diff

Setup NEXTMIDAS
	Create UCC file list    fileList.txt    @{DEFAULT NEXTMIDAS FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}nextmidas_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}nextmidas_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT NEXTMIDAS FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE NEXTMIDAS}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}nextmidas_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}nextmidas_output${/}diff

Setup XMIDAS
	Create UCC file list    fileList.txt    @{DEFAULT XMIDAS FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}xmidas_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}xmidas_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT XMIDAS FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE XMIDAS}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}xmidas_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}xmidas_output${/}diff

Setup VHDL
	Create UCC file list    fileList.txt    @{DEFAULT VHDL FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}vhdl_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}vhdl_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT VHDL FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE VHDL}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}vhdl_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}vhdl_output${/}diff

Setup COLDFUSIONSCRIPT
	Create UCC file list    fileList.txt    @{DEFAULT COLDFUSIONSCRIPT FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}coldfusionscript_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}coldfusionscript_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT COLDFUSIONSCRIPT FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE COLDFUSIONSCRIPT}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}coldfusionscript_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}coldfusionscript_output${/}diff

Setup SCALA
	Create UCC file list    fileList.txt    @{DEFAULT SCALA FILE LIST}
	Run ucc                 @{uccVersion1}  -i1  fileList.txt  -outdir  output${/}tmp${/}version1${/}scala_output${/}counting
	Run ucc                 @{uccVersion2}  -i1  fileList.txt  -outdir  output${/}tmp${/}version2${/}scala_output${/}counting
	Create UCC file list    fileListA.txt    @{DEFAULT SCALA FILE LIST}
	Create UCC file list    fileListB.txt    @{BASELINE SCALA}
	Run ucc                 @{uccVersion1}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version1${/}scala_output${/}diff
	Run ucc                 @{uccVersion2}  -d   -i1  fileListA.txt  -i2   fileListB.txt   -outdir   output${/}tmp${/}version2${/}scala_output${/}diff
    Run     rm -rf file*.txt


	
AT.MC.001.001  
    [Documentation]         UCC should return total number of lines of the individual input files.
	Ucc total lines individual		

AT.MC.002.001  
    [Documentation]         UCC should return the number of blank lines in individual input files. 
	Ucc blank lines individual
	
AT.MC.003.001
	[Documentation]			UCC should return the number of whole comments in individual input files.
	Ucc whole comments individual

AT.MC.004.001
	[Documentation]			UCC should return the number of embedded comments in individual input files.
	Ucc embedded comments individual	
	
AT.MC.005.001
	[Documentation]			UCC should return the number of compiler directive lines in individual input files. 
	Ucc compiler directive individual

AT.MC.006.001
	[Documentation]			UCC should return the number of data declaration lines in individual input files.
	Ucc data decl individual

AT.MC.007.001
	[Documentation]			UCC should return the number of executable instruction lines in individual input files.
	Ucc exec instr individual
	
AT.MC.008.001
	[Documentation]			UCC should return the logical SLOC of the individual input files. 
	Ucc logical sloc individual

AT.MC.009.001
	[Documentation]			UCC should return the physical SLOC of the individual input files. 
	Ucc physical sloc individual
	
AT.MC.010.001
	[Documentation]			UCC should return the total lines of all the input files. 
	Ucc total lines

	
AT.MC.011.001
	[Documentation]			UCC should return the total number of blank lines over all the input files. 
	Ucc blank lines
	
AT.MC.012.001
	[Documentation]			UCC should return the total number of whole comments over all the input files.
	Ucc whole comments

AT.MC.013.001
	[Documentation]			UCC should return the total number of embedded comments over all the input files.
	Ucc embedded comments

AT.MC.014.001
	[Documentation]			UCC should return the total number of compiler directive lines over all the input files. 
	Ucc compiler directive

AT.MC.015.001
	[Documentation]			UCC should return the total number of data declaration lines over all the input files.
	Ucc data decl
	
AT.MC.016.001
	[Documentation]			UCC should return the total number of executable instruction lines over all the input files.
	Ucc exec instr

AT.MC.017.001
	[Documentation]			UCC should return the total logical SLOC over all the input files. 
	Ucc logical sloc

AT.MC.018.001
	[Documentation]			UCC should return the total physical SLOC over all the input files. 
	Ucc physical sloc
	
AT.MC.019.001
	[Documentation]			UCC should return the number of input files were counted. 
	Ucc counted files

AT.MC.020.001
	[Documentation]			UCC should return the total number of input files that were found. 
	Ucc accessed files


AT.MC.021.001
	[Documentation]			UCC should return the physical SLOC to logical SLOC ratio. 
	Ucc psloc to lsloc ratio


AT.MC.022.001
	[Documentation]			UCC should return the number of occurrences of compiler directive keywords.
	Ucc compiler keywords

AT.MC.023.001
	[Documentation]			UCC should return the number of occurrences of data keywords. 
	Ucc data keywords

AT.MC.024.001
	[Documentation]			UCC should return the number of occurrences of executable keywords. 
	Ucc executable keywords
	
AT.MC.025.001
	[Documentation]			UCC should return counting results per language. 
	Ucc embedded comments individual
	
AT.MC.026.001
	[Documentation]			UCC should return the cumulative counting results for all of the input files. 
	Ucc embedded comments individual

AT.MD.001.001  
    [Documentation]         UCC should report the matching and comparison of files of two baselines (Baselines A and B) with respect to added, deleted, modified, and unmodified  logical SLOC. 
	Ucc embedded comments individual		

AT.MD.002.001  
    [Documentation]         UCC should report the files matched between Baselines A and B. 
	Ucc embedded comments individual
	
AT.MD.003.001
	[Documentation]			UCC should only difference on lines that were counted by the correct language parser. 
	Ucc embedded comments individual
	
AT.MD.004.001
	[Documentation]			UCC should return the counting results for Baseline A before Differencing. 
	Ucc embedded comments individual
	
AT.MD.005.001
	[Documentation]			UCC should return the counting results for Baseline B before Differencing. 
	Ucc embedded comments individual

AT.MD.006.001
	[Documentation]			UCC should return the counting results for all files in Baseline A before Differencing. 
	Ucc embedded comments individual

AT.MD.007.001
	[Documentation]			UCC should return the counting results for all files in Baseline B before Differencing. 
	Ucc embedded comments individual
	
AT.MD.008.001
	[Documentation]			UCC should return the complexity results for Baseline A before Differencing. 
	Ucc embedded comments individual

AT.MD.009.001
	[Documentation]			UCC should return the counting results for Baseline B before Differencing. 
	Ucc embedded comments individual
	
AT.MD.010.001
	[Documentation]			UCC should return the cyclomatic complexity results for Baseline A before Differencing. 
	Ucc embedded comments individual
	
AT.MD.011.001
	[Documentation]			UCC should return the cyclomatic complexity results for Baseline B before Differencing. 
	Ucc embedded comments individual
	
AT.MD.012.001
	[Documentation]			UCC's rules of counting for both Logical SLOC counting and Differencing should stay consistent. In other words, Baseline A's total logical SLOC = deleted + modified + unmodified, and Baseline B's total logical SLOC = new + modified + unmodified. 
	Ucc embedded comments individual

AT.MD.013.001
	[Documentation]			UCC should consider files in Baseline A that do not match to files in Baseline B as "deleted". 
	Ucc embedded comments individual

AT.MD.014.001
	[Documentation]			UCC should count the logical lines of code in files in Baseline A that do not match to files in Baseline B as "deleted" lines. 
	Ucc embedded comments individual

AT.MD.015.001
	[Documentation]			UCC should consider files in Baseline B that do not match to files in Baseline A as "added".
	Ucc embedded comments individual
	
AT.MD.016.001
	[Documentation]			UCC should count the logical lines of code in files in Baseline B that do not match to files in Baseline A as "new" lines. 
	Ucc embedded comments individual

AT.MD.017.001
	[Documentation]			UCC should consider a logical line of code in Baseline B, if different by more than the threshold percentage from the line it is being differenced with in Baseline A, "new", and the line being compared to should be considered "deleted". 
	Ucc embedded comments individual
	
AT.MU.001.001  
    [Documentation]         UCC should define duplicate files within the same baseline, if the files have the same contents with respect to logical lines of code. 
	Ucc embedded comments individual		

AT.MU.002.001  
    [Documentation]         UCC should return the count results for files that have been identified as duplicates separately, per language. 
	Ucc embedded comments individual
	
AT.MU.003.001
	[Documentation]			UCC should return the complexity results for files that have been identified as duplicates separately. 
	Ucc embedded comments individual
	
AT.MU.004.001
	[Documentation]			UCC should return the cyclomatic complexity results for the files that have been identified as duplicates separately. 
	Ucc embedded comments individual
	
AT.MU.005.001
	[Documentation]			UCC should return the cumulative duplicate files for all of the input files. 
	Ucc embedded comments individual

AT.MU.006.001
	[Documentation]			UCC should define duplicate files within Baseline A.
	Ucc embedded comments individual

AT.MU.007.001
	[Documentation]			UCC should define duplicate files within Baseline B.
	Ucc embedded comments individual
	
AT.MU.008.001
	[Documentation]			UCC should return the counting results for files that have been identified as duplicates within Baseline A separately, per language. 
	Ucc embedded comments individual

AT.MU.009.001
	[Documentation]			UCC should return the counting results for files that have been identified as duplicates within Baseline B separately, per language. 
	Ucc embedded comments individual
	
AT.MU.010.001
	[Documentation]			UCC should return the complexity results for files that have been identified as duplicates within Baseline A separately, per language. 
	Ucc embedded comments individual
	
AT.MU.011.001
	[Documentation]			UCC should return the complexity results for files that have been identified as duplicates within Baseline B separately, per language. 
	Ucc embedded comments individual
	
AT.MU.012.001
	[Documentation]			UCC should return the cyclomatic complexity results for files that have been identified as duplicates within Baseline A separately, per language. 
	Ucc embedded comments individual

AT.MU.013.001
	[Documentation]			UCC should return the cyclomatic complexity results for files that have been identified as duplicates within Baseline B separately, per language. 
	Ucc embedded comments individual

AT.MU.014.001
	[Documentation]			UCC should return the cumulative duplicate files for all the input files for Baseline A.
	Ucc embedded comments individual

AT.MU.015.001
	[Documentation]			UCC should return the cumulative duplicate files for all the input files for Baseline B.
	Ucc embedded comments individual
	
AT.MU.016.001
	[Documentation]			UCC should allow users to determine how close the files need to be, according to percentage between 0 to 100, for files to be considered duplicates. 
	Ucc embedded comments individual

AT.MU.017.001
	[Documentation]			UCC should have the option to not search for duplicate files.
	Ucc embedded comments individual

AT.MA.001.001
    [Documentation]			UCC should return counts for complexity, which includes math, trigonometrics, logarithmic functions, conditionals, logical, preprocessor, assignment, and pointer statements. 
	Ucc embedded comments individual
	
AT.MA.002.001
    [Documentation]			UCC should return cyclomatic complexity counts, which is the number of decision branches, per function. 
	Ucc embedded comments individual

AT.MA.003.001
    [Documentation]			UCC should return cyclomatic complexity counts, which is the number of decision branches, per file. 
	Ucc embedded comments individual

AT.MA.004.001
    [Documentation]			UCC should return the total cyclomatic complexity counts over all the input files. 
	Ucc embedded comments individual
	
AT.MA.005.001
    [Documentation]			UCC should return the total cyclomatic complexity counts over all the functions. 
	Ucc embedded comments individual
	
AT.MA.006.001
    [Documentation]			UCC should return the average cyclomatic complexity over all the input files. 
	Ucc embedded comments individual
	
AT.MA.007.001
    [Documentation]			UCC should return the average cyclomatic complexity over all the functions. 
	Ucc embedded comments individual
	
AT.MA.008.001
    [Documentation]			UCC should return all cyclomatic complexity results in rings: CC1, CC2, CC3, and CC4.
	Ucc embedded comments individual

AT.MA.009.001
    [Documentation]			UCC should return the cyclomatic complexity risk depending on the average CC1 result per file. 
	Ucc embedded comments individual
	
AT.MA.010.001
    [Documentation]			UCC should return the cyclomatic complexity risk depending on the CC1 result per function. 
	Ucc embedded comments individual
	
AT.MA.011.001
    [Documentation]			UCC should return the number of functions found in the input. 
	Ucc embedded comments individual
	
AT.MA.012.001
    [Documentation]			UCC should return the total number of files found in the input. 
	Ucc embedded comments individual
	
AT.MA.013.001
    [Documentation]			UCC should return the average number of functions per files in the input. 
	Ucc embedded comments individual
	
AT.MA.014.001
    [Documentation]			UCC should allow users not to process or report complexity or cyclomatic complexity results. 
	Ucc embedded comments individual
    Run    mv *.csv output/tmp

