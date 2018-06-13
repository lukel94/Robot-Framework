#!/bin/csh  
#Program:  
    #Scriput name: yzx.csh  
    #Usage: ./yzx.csh filename or ./yzx.csh  
#History:  
    #2012-05-09 By Adultf  
if ( $#argv == 1 ) then  
    set filename = $1  
else if ( $#argv == 0 ) then  
    echo "The script should be executed as: ./yzx.csh filename!"  
    echo "But it doesn't matter, you can enter the file name now."  
    echo -n "Please enter the file name:"  
    set filename = $<  
else if ( $#argv > 1 ) then  
    echo "The script should be executed as: ./yzx.csh filename!"  
    echo "But the argument is more than 1."  
    echo "Terminate script execution!"  
    exit  
endif  
if ( ! -e $filename ) then  
    echo "The file doesn't exist!"  
    echo "Terminate script execution!"  
    exit  
endif  
set fline = `grep -n -i '\.subckt' $filename | sed 's/:.*$//g'`  
set i = 1  
set sumk = 0  
if ( -e output && -f output ) then  
    echo -n "The ouput file has existed! Delete?(y/n)"  
    set answer = $<  
    if ( $answer == 'y' || $answer == 'Y' ) then  
        echo "Delete existed output file!"  
        rm -f output  
    else  
        echo "You choose not to delete the existed output file."  
        echo " You may want to have a check."  
        echo "So, terminate script execution!"  
        exit  
    endif  
endif  
echo "Create new output file!"  
echo "Beginning..."  
foreach line ( $fline )  
    if ( -e output ) then  
        awk 'NR=="'$line'"{printf "%s%i\t","XI","'$i'";j=2;k=1;while (j<NF) {printf "%s%i\t","net",k+"'$sumk'";j++;k++};printf "/\t"$2"\n"}' $filename >> output  
    else  
        awk 'NR=="'$line'"{printf "%s%i\t","XI","'$i'";j=2;k=1;while (j<NF) {printf "%s%i\t","net",k+"'$sumk'";j++;k++};printf "/\t"$2"\n"}' $filename > output  
    endif  
    @ i = $i + 1  
    set temp = `sed -n "${line}p" $filename | wc -w`  
    @ temp = $temp - 2  
    @ sumk = $sumk + $temp  
end #end of foreach  
echo "Finished~~~"  