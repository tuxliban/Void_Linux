#!/bin/sh
CIUDAD=foo
CLIMA=$(curl -s wttr.in/$CIUDAD?format=1 | grep -o "[0-9].*")
echo " $CLIMA" > /tmp/weather
