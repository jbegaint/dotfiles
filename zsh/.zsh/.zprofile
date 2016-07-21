# vim:ts=4:sw=4:ft=zsh:

# start keychain
if [[ -f ~/.ssh/keys ]]; then
	keys=$(cat ~/.ssh/keys)
	eval $(keychain --eval --agents ssh --nogui -q $keys)
fi

# autostart x11 on tty1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx -- -keeptty -nolisten tcp > ~/.xorg.log 2>&1
	logout
fi
