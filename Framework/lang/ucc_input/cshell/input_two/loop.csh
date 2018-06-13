#!/bin/csh
# this script prompts a user for a file name, and then displays the file
# to the screen.  This will continue until the user enters  NO to the promt.
#
#
 
set prompt = "YES"
 
while ($prompt == YES)
       
        echo "Please enter the name of the file to display: "
        set filename = $<
 
        if (-e $filename && -r $filename) then
                cat $filename | more
        else
                echo "the file can not be displayed"
        endif
 
        echo "would you like to display another file: Please enter YES or NO"
        set prompt = $<
 
 
end
 

/home/hayhurst/scripts- whilescript
Please enter the name of the file to display:
simple
#!/bin/csh
#
#simple script
#
echo Welcome to the world of script files
echo -n "The current time and date are: "
date
would you like to display another file: Please enter YES or NO
YES
Please enter the name of the file to display:
quotes
#!/bin/csh
#
#
#This script takes a number as a command line arguement and then
#displays the displays a string using both single and double quotes.
#
#
#
if ($#argv == 0) then
        echo "## A number must be supplied as an arguement # #"
       
else
    echo  'Single quotes do not cause command line substitution'
    echo -n 'The number entered for $argv[1]: '
    echo -n "is $argv[1]"
    echo '\!'
endif
 
echo "************  All done folks *****************"
would you like to display another file: Please enter YES or NO
NO
/home/hayhurst/scripts-