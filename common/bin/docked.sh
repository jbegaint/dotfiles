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

	xset s 0
	xset -dpms

	notify-send "DOCKING INFO" "$IN [off]\n$EXT [on]"

	pacmd set-sink-port \
		alsa_output.pci-0000_00_1b.0.analog-stereo \
		analog-output

	setxkbmap us '' compose:rwin
}

apply_config_undock() {
	xrandr --output $IN --auto --primary --output $EXT --off
	setxkbmap fr '' compose:rctrl

	xset dpms 300

	notify-send "DOCKING INFO" "$IN [on]\n$EXT [off]"

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
