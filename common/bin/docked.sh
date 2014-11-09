#!/bin/bash
# Switch output, keyboard layout and stuff when docking/undocking.
# Inspiration : http://nick.txtcc.com/index.php/linux/809

readonly IN="LVDS1"
readonly EXT="HDMI3"

is_docked() {
	local dockname="Mini Dock Plus"

	[[ -n $(lsusb | grep "$dockname") ]]
}

apply_config_dock() {
	xrandr --output $IN --off --output $EXT --auto --primary
	setxkbmap us '' compose:rwin

	xset s 0
	xset -dpms

	pacmd set-sink-port \
		alsa_output.pci-0000_00_1b.0.analog-stereo \
		analog-output

	notify-send "DOCKING INFO" "$IN [off]\n$EXT [on]"
}

apply_config_undock() {
	xrandr --output $IN --auto --primary --output $EXT --off
	setxkbmap fr

	xset dpms 300

	pacmd set-sink-port \
		alsa_output.pci-0000_00_1b.0.analog-stereo \
		analog-output-speaker

	notify-send "DOCKING INFO" "$IN [on]\n$EXT [off]"
}

reload_config_generic() {
	# reload wallpaper
	eval $(cat ~/.fehbg)
}

main() {
	# test
	sleep 1s

	if is_docked; then
		apply_config_dock
	else
		apply_config_undock
	fi

	reload_config_generic
}

main
