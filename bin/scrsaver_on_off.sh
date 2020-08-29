#!/bin/sh

while true; do
	xscreensaver-command -deactivate >/dev/null;
	#Check if DPMS is on. If it is, deactivate and reactivate again. If it is not, do nothing.
	dpmsStatus=`xset -q | grep -ce 'DPMS is Enabled'`
	if [ $dpmsStatus == 1 ]
	then
		xset -dpms
		xset dpms
	fi
	reset
    if [ -f /usr/bin/screenfetch ]
    then
        screenfetch
    fi
	sleep 30;
done
