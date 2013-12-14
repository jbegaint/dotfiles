#!/bin/bash
#
# inspiration : http://nick.txtcc.com/index.php/linux/809
# NB: true (ie: 1): docked

IN="LVDS1"
EXT="HDMI3"
PREV_STATUS=0

while true; do

	if (lsusb | grep "Mini Dock Plus" > /dev/null); then
		STATUS=1
	else
		STATUS=0
	fi

	if [ "$STATUS" -ne "$PREV_STATUS" ]; then

		if [ "$STATUS" -eq 1 ]; then
			xrandr --output $IN --off --output $EXT --auto
			setxkbmap us '' compose:rwin
			notify-send "DOCKING INFO" "$IN [off]\n$EXT [on]"
		else 
			xrandr --output $IN --auto --output $EXT --off
			setxkbmap fr
			notify-send "DOCKING INFO" "$IN [on]"
		fi

		eval `cat ~/.fehbg`

	fi

	PREV_STATUS=$STATUS
	sleep 1
done

