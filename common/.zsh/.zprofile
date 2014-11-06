# start x at login on tty 1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx --vt1 &> ~/Xouput.log
