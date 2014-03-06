#!/bin/bash
# Simple bash utility to backup dotfiles
# 06/03/2014

TARGET="$HOME/Documents/dotfiles"

SRC="
.fehbg
.i3
.i3status.conf
.nanorc
.vimrc
.xinitrc
.Xresources
.zshrc
.zshrc_aliases
"

COMMON="
bin"

backup_wall()
{
	wall=$(cat $HOME/.fehbg | awk '{print $3}')
	wall=${wall:1:-1} # remove first and last character from string "'"
	wall_basename=$(basename $wall)
	cp -v "$wall" "$TARGET/$(hostname)/$wall_basename"
}

backup_files()
{
	for i in $1
	do
		if [[ -d "$HOME/$i" ]]; then
			mkdir -p "$TARGET/$i"
			cp -rv "$HOME/$i" "$2"
		elif [[ -f "$HOME/$i" ]]; then
			cp -v "$HOME/$i" "$2/$i"
		fi
	done
}

if [[ ! -d $TARGET ]]; then
	mkdir -p $TARGET
fi

backup_files "$SRC" "$TARGET/$(hostname)"
backup_files "$COMMON" "$TARGET"
backup_wall

exit 0