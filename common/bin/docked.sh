#!/bin/bash
# Switch output, keyboard layout and stuff when docking/undocking.
# Inspiration : http://nick.txtcc.com/index.php/linux/809

readonly IN="LVDS1"
readonly EXT="HDMI3"
readonly DOCKNAME="Mini Dock Plus"

apply_config_dock() {
	printf "%s\n" "[docked]"

	source ~/.screenlayout/HDMI3Left.sh &
	setxkbmap fr
	# setxkbmap us '' compose:rwin

	xset s 0
	xset -dpms
}

apply_config_undock() {
	printf "%s\n" "[undocked]"

	source ~/.screenlayout/LVDS1.sh &
	setxkbmap fr

	xset dpms 300
}

reload_config_generic() {
	eval $(cat ~/.fehbg)
	# remap useless caps lock
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
}

printf "%s: " "Status"
if [[ -n $(lsusb | grep "$DOCKNAME") ]]; then
	apply_config_dock
else
	apply_config_undock
fi

reload_config_generic

exit 0
