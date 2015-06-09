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

# load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
COLORS=~/.config/base16-xresources/base16-tomorrow.dark.256.xresources && \
	[[ -f $COLORS ]] && \
	xrdb -merge $COLORS

# set wallpaper
eval $(cat ~/.fehbg)

# remap useless caps lock to escape
setxkbmap -option caps:escape

# autostart apps
. ~/bin/docked.sh &
dunst &
parcellite &
redshift-gtk &
urxvtd -q -o -f &
volumeicon &
xautolock -locker 'i3lock -u -c 333333' &

# fix some xdg-* related bugs
export DE='xfce'

exec i3
