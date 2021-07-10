#!/bin/sh

if [ "$(pgrep mocp)" ]; then
	if [ "$(mocp -Q %state)" = "PLAY" ];then
		SONG=$(mocp -Q %song)
		if [ -n "$SONG" ]; then
			echo " $SONG - $(mocp -Q %album)"
		else
			#basename " $(mocp -Q %file)"
			echo " $(mocp -Q %file)"
		fi
	fi
else
	echo ""
fi
