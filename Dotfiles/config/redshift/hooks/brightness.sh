#!/bin/sh

# Set brightness via xbrightness when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day=3.0
brightness_transition=0.5
brightness_night=1.5
# Set fade time for changes to one minute
#fade_time=50000

if [ "$1" = period-changed ]; then
	case $3 in
		night)
			#xbacklight -set $brightness_night -time $fade_time
			light -S $brightness_night
			;;
		transition)
			#xbacklight -set $brightness_transition -time $fade_time
			light -S $brightness_transition
			;;
		daytime)
			#xbacklight -set $brightness_day -time $fade_time
			light -S $brightness_day
			;;
	esac
fi
