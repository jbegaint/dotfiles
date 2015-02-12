#!/bin/bash
# Switch output, keyboard layout and stuff when docking/undocking.
# Inspiration : http://nick.txtcc.com/index.php/linux/809

readonly IN="LVDS1"
readonly EXT="HDMI3"
# readonly EXT="VGA1"

is_docked() {
	local dockname="Mini Dock Plus"

	[[ -n $(lsusb | grep "$dockname") ]]
}

apply_config_dock() {
	echo "docked"

	# xrandr --output $IN --off --output $EXT --auto --primary
	source ~/.screenlayout/HDMI3Left.sh

	setxkbmap fr
	# setxkbmap us '' compose:rwin

	xset s 0
	xset -dpms

	pacmd set-sink-port \
		alsa_output.pci-0000_00_1b.0.analog-stereo \
		analog-output
}

apply_config_undock() {
	echo "undocked"

	# xrandr --output $IN --auto --primary --output $EXT --off
	source ~/.screenlayout/LVDS1.sh

	setxkbmap fr

	xset dpms 300

	pacmd set-sink-port \
		alsa_output.pci-0000_00_1b.0.analog-stereo \
		analog-output-speaker

}

reload_config_generic() {
	# reload wallpaper
	eval $(cat ~/.fehbg)

	# unmap caps lock
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
}

main() {

	if is_docked; then
		apply_config_dock
	else
		apply_config_undock
	fi

	reload_config_generic
}

main

exit 0
