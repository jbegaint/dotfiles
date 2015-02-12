#!/bin/sh
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# systemctl --user import-environment 'DISPLAY'

# term color
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrdb -merge ~/.config/base16-xresources/base16-tomorrow.dark.xresources

# font config stuff
xset +fp /usr/share/fonts/local/

# autostart apps
dunst &
eval $(cat ~/.fehbg) &
parcellite &
volumeicon &
start-pulseaudio-x11&
xautolock -locker 'i3lock -c 333333'&
xset dpms 300

# launch scripts
~/bin/docked.sh &
redshift-gtk &

# map caps lock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# fix some xdg-* related bugs
export DE='xfce'

wmname LG3D

# urxvt daemon
urxvtd -q -o -f

exec i3
# exec startkde
