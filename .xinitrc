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

xset +fp /usr/share/fonts/local/ &
xset fp rehash &

# qwerty with right win as compose key
#setxkbmap us '' compose:rwin &

setxkbmap fr &

nitrogen --restore &
dunst &
nm-applet &
parcellite &
xset dpms 600 &
#compton -D1 -cGfzb &

# systray
#trayer --SetDockType true --SetPartialStrut true --transparent true --alpha 0 --tint 0x272822 --edge top --align right --widthtype pixel --heighttype pixel --width 100 --height 19 --padding 5 &

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO" &

#sxhkd &
#exec bspwm -s "$PANEL_FIFO" -p W 2> ~/.bspwm.log

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3 -V >> ~/.i3/i3log 2>&1
#exec startxfce4
