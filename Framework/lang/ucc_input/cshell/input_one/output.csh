#!/bin/csh
echo “Enter a number between 1 and 10… “
@ number = $<
if ($number == 6) then
 echo “that’s the lucky number!”
endif
if ($number > 5 && $number < 7) then
 echo “that’s the lucky number!”
else
 echo “you lose. try again.”
endif
if ($number > 0 && $number < 5) then
 echo “a low pick.”
else if ($number >= 7 && $number <= 10) then
 echo “a high pick.”
else if ($number == 6) then
 echo “that’s the lucky number!”
else
 echo “you didn’t pick a number between 1 and 10!”
 echo “follow the instructions and try again...”
endif 