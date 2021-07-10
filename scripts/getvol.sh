#!/bin/sh
vol_on=$(amixer get Master | tail -n 1 | cut -d ' ' -f 8)
vol=$(amixer get Master | awk -F'[][]' 'END{ print $2 }')
if [ $vol_on = '[on]' ]; then
	echo "" $vol;
else
	printf " \n";
fi;
