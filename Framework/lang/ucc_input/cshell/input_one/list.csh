#!/bin/csh
#Example of looping through a list of files.
#
# e.g., imagine I have a bunch of SAC files that all end with the
# suffix .R
# i.e., I have them all rotated to the radial component.
# Now I want to do something with those files, in this example
# use SAC to cut them.
#make a temporary file listing all of my .R files
ls *.R >! file_list
# find out how many files I have
@ nr = `awk ‘END {print NR}’ file_list`
@ n = 1 # define a looping variable
# start the loop
while ($n <= $nr)
#grab nth file name from the list
set if = `awk ‘NR == ‘$n’ {print $1}’ file_list`
echo “cutting file $if ..”
sac << eof
r $if
cuterr fillz
cut 0 200
r
w over
q
eof
@ n = $n + 1 #increase n by one
end # end loop
# clean up temporary files
rm file_list 