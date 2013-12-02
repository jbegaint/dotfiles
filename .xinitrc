#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


#font config stuff
xset +fp /usr/share/fonts/local/ &
xset fp rehash &

#autostart apps and scripts
dunst &
parcellite &
xset dpms 600 &
pnmixer &
compton  &
bluetooth off &
eval `cat ~/.fehbg` &

~/bin/docking.sh &

#bspwm legacy config
#[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
#mkfifo "$PANEL_FIFO" &
#sxhkd &
#exec bspwm -s "$PANEL_FIFO" -p W 2> ~/.bspwm.log


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3 -V >> ~/.i3/i3log 2>&1
