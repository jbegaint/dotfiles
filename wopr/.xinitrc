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

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# term color
xrdb -merge ~/.config/base16-xresources/base16-tomorrow.dark.xresources

# font config stuff
xset +fp /usr/share/fonts/local/ &
xset fp rehash &

# autostart apps
dunst &
eval $(cat ~/.fehbg) &
parcellite &
pnmixer &
start-pulseaudio-x11 &
xautolock -locker 'i3lock -c 333333' &
xset dpms 300 &

# launch scripts
~/bin/docked.sh &
~/bin/redshift/run.sh &

# map caps lock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# fix some xdg-* related bugs
export DE='xfce'

wmname LG3D &

exec i3
