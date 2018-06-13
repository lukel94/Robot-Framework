#!/bin/csh
#
#
#This script takes a number as a command line argument and then
#determines/displays if the number is within a specified range.
#
#If no argument is provided, or the number isn't in one of the specified
#ranges then an error is displayed
#
#
if ($#argv == 0) then
        echo "## A number  must be supplied as an argument # #"
       
else
   
    if ($argv[1] <= 0) then
        echo "## The number $argv[1] is less than or equal to zero ## "
    else if ($argv[1] > 0 && $argv[1] <= 100) then
           echo "The number $argv[1] is between 1 and 100"
    else if ($argv[1] > 100 && $argv[1] <= 1000) then
           echo "the number $argv[1] is between 101 and 1000"
    else
           echo "the number $argv[1] is greater than 1000"
    endif
 
endif
 
echo "************  All done folks *****************"
 

/home/hayhurst/scripts-  elseifsample
## A number  must be supplied as an arguement # #
************  All done folks *****************
 
 
/home/hayhurst/scripts-
/home/hayhurst/scripts- elseifsample -234
## The number -234 is less than or equal to zero ##
************  All done folks *****************
 
 
/home/hayhurst/scripts-
/home/hayhurst/scripts- elseifsample 56
The number 56 is between 1 and 100
************  All done folks *****************
 
 
/home/hayhurst/scripts-
/home/hayhurst/scripts- elseifsample 560
the number 560 is between 101 and 1000
************  All done folks *****************
 
 
/home/hayhurst/scripts- elseifsample 5600
the number 5600 is greater than 1000
************  All done folks *****************
 

