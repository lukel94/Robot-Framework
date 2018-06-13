#!/bin/csh
#
#
#This script takes a filename as a command line arguement and then
#displays the contents of the file to the screen
#
#If no arguement is provided, or the file doesn't exist ( or the user
# does not have read permission to the file) then an error is displayed
#
#
if ($#argv == 0) then
        echo "## A file name must be supplied as an arguement # #"
       
else
 
    if ( -e $argv[1] && -r $argv[1]) then
        echo "## here is the file##"
        cat $argv[1] |more
        echo "#######  all done ##########"
    else
        if ( ! -e $argv[1]) echo "The file does not exist"
        if ( ! -r $argv[1] && -e $argv[1]) echo "You do not have read access to the file"
    endif
 
endif
 
echo "************  All done folks *****************"
 

 
/home/hayhurst/scripts- ifthensample
## A file name must be supplied as an arguement # #
************  All done folks *****************
 
 
/home/hayhurst/scripts-
 
/home/hayhurst/scripts- ifthensample simple
## here is the file##
#!/bin/csh
#
#simple script
#
echo Welcome to the world of script files
echo -n "The current time and date are: "
date
#######  all done ##########
************  All done folks *****************
 
 
/home/hayhurst/scripts-
/home/hayhurst/scripts- ifthensample nofile
The file does not exist
