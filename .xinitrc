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
xset +fp /usr/share/fonts/local/ &
xset fp rehash &

#autostart apps and scripts
dunst &
parcellite &
xset dpms 600 &
pnmixer &
compton -b &
bluetooth off &
eval `cat ~/.fehbg` &

~/bin/docking.sh &

exec i3
