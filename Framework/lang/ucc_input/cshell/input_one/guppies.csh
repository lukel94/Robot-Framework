#!/bin/csh

alias commas "echo \!:1 | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'"

# The program is to output a day-by-day account of the populations
# until one of them dies off or the end of the observation period is
# reached.
# All reproductions and deaths occur overnight.
# Any fractional fish are discarded.
# These sharks only feed during the day.

if ( $1 == 'default' ) then

	set sharks   = 54
	set guppies  = 1000
	set duration = 150
	
else

	printf "Please enter number of sharks: "
	set sharks = $<

	printf "Please enter number of guppies: "
	set guppies = $<

	printf "Number of days to observe: "
	set duration = $<

endif

set day = 0
while ( $day < $duration )

  	@ day = $day + 1

	#print
	printf "Start of %3s Day: %15s sharks  %15s guppies\n" $day `commas $sharks` `commas $guppies`

	if ( $sharks <= 0 || $guppies <= 0 ) then
		break
	endif
		
	# Each shark eats 5 guppies a day.
	@ guppies_eaten = ( $sharks * 5 )
	@ guppies = ( $guppies - $guppies_eaten )

	if ( $guppies < 0 ) then
		set guppies=0
	endif

	#print
	printf "End of %5s Day: %15s sharks  %15s guppies\n" $day `commas $sharks` `commas $guppies`

	if ( $sharks <= 0 || $guppies <= 0 ) then
		break
	endif
		
	# The guppies increase at a rate of 80% per day,
	# provided the shark population is less than 20 % of the guppy population.
	# Otherwise there is no increase in the guppy population.
	if ( ( $guppies / $sharks ) > 5 ) then
	    @ guppy_plus =  ($guppies * 80 ) / 100
	    @ guppies = ( $guppies + $guppy_plus )
	endif
	
	# The sharks increase at a rate of 5% of the guppy population per day,
	# provided there are 50 or more guppies per shark.
	# Otherwise, the sharks die off at a rate of 50% per day.
	if ( ( $guppies / $sharks ) > 50 ) then
	    @ shark_increase = ( $guppies / 20 )
	    @ sharks = ( $sharks + $shark_increase )
	else
	    @ sharks = ( $sharks / 2 )
	endif

end

exit 0