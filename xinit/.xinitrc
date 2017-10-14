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
# compton -b
dunst &
nm-applet &
redshift &
setxkbmap fr -option caps:escape
unclutter &
urxvtd -q -o -f &
xfce4-clipman &
xss-lock -- ~/bin/lock.sh &
volumeicon &

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
