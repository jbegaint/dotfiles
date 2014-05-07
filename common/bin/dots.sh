#!/bin/bash
# Simple bash utility to backup dotfiles
# 06/03/2014

TARGET="$HOME/Documents/dotfiles"

SRC="
.fehbg
.i3
.i3status.conf
.xinitrc
"

COMMON="
.nanorc
.vimrc
.Xresources
.zshrc
.zshrc_aliases
.vim
bin"

backup_wall()
{
	wall=$(cat $HOME/.fehbg | awk '{print $3}')
	wall=${wall:1:-1} # remove first and last character from string "'"
	wall_basename=$(basename $wall)
	cp -v "$wall" "$TARGET/$(hostname)/$wall_basename"
}

check_dir()
{
	if [[ ! -d "$1" ]]; then
		mkdir -vp "$1"
	fi
}

backup_files()
{
	check_dir "$2"
	for i in $1
	do
		if [[ -d "$HOME/$i" ]]; then
			mkdir -vp "$2/$i"
			cp -rv "$HOME/$i" "$2"
		elif [[ -f "$HOME/$i" ]]; then
			cp -v "$HOME/$i" "$2/$i"
		fi
	done
}

backup_files "$SRC" "$TARGET/$(hostname)"
backup_files "$COMMON" "$TARGET/common"
backup_wall

exit 0
