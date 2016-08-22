#!/bin/sh
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
COLORS=~/.config/base16-xresources/base16-tomorrow.dark.256.xresources && \
	[[ -f $COLORS ]] && \
	xrdb -merge $COLORS

# autostart apps
. ~/.fehbg &
dunst &
nm-applet &
parcellite &
redshift-gtk &
setxkbmap fr -option caps:escape
unclutter &
urxvtd -q -o -f &
volumeicon &
xss-lock -- ~/bin/lock.sh &

exec i3
