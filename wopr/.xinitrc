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
parcellite &
xset dpms 300 &
pnmixer &

# launch scripts
~/bin/docked.sh &
~/bin/redshift/run.sh &

xautolock -locker 'i3lock -c 333333' &

# fix some xdg-* related bugs
export DE='xfce'

exec i3
