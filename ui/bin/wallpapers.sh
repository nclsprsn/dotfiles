#!/bin/sh

########################################################################
# Wallpapers script
# Author: Nicolas Pierson

DURATION="15m"

while true; do
	find "$1" -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.jpe' \) -print0 |
		shuf -n1 -z | xargs -0 feh --bg-center
	break
	sleep $DURATION
done

