#!/bin/csh
dialog -- title “----- Text Input Example -----“ \
 -- inputbox “Enter the name of the file you want to delete” \
 7 60 ‘file’ \
 --stdout > temp_menu.txt
set exit_status = $? #get the dialog utilities exit status
#get the string that the user typed in the input box
set ifile = `cat temp_menu.txt`
echo “ “
switch ($exit_status)
 case 0:
 #A file name was entered
 echo “Deleting file $ifile”
 breaksw
 case 1:
 #The cancel button was pressed
 echo “Cancel button pressed”
 breaksw
 case 255:
 #User hit the escape key
 echo “Escape key pressed”
 breaksw
endsw
rm temp_menu.txt #get rid of temporary files