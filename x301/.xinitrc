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

#font config stuff
xset +fp /usr/share/fonts/local/ &xset fp rehash &

#autostart apps
dunst &
parcellite &
xset dpms 300 &
#pnmixer &
compton -b &
#bluetooth off &
#urxvtd -q -o -f &

setxkbmap fr
xset -b

#restore background
eval `cat ~/.fehbg` &

#launch scripts
#~/bin/docking.sh &
~/bin/redshift/run.sh &

wifi on &

exec i3
#exec mate-session
