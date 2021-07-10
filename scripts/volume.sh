#!/bin/sh
a=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
b=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")

if [ $a = 'on' ]; then
	printf " $b%%"
else 
	printf "";
fi
