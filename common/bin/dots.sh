#!/bin/bash
# Simple bash utility to backup dotfiles

readonly TARGET="$HOME/Documents/dotfiles"

readonly LOCAL="
.fehbg
.i3/
.i3status.conf
.xinitrc
"

readonly COMMON="
.Xresources
.nanorc
.tmux.conf
.vimrc
.zsh/
.zshenv
bin/"

backup_wall() {
	wall=$(cat $HOME/.fehbg | awk '{print $3}')
	wall=${wall:1:-1} # remove first and last character from string: "'"
	wall_basename=$(basename $wall)
	cp "$wall" "$TARGET/$(hostname)/$wall_basename"
}

check_dir() {
	local dir="$1"

	if [[ ! -d "$dir" ]]; then
		mkdir -p "$dir"
	fi
}

backup_files() {
	local src="$1"
	local dest="$2"

	check_dir "$dest"

	for i in $src
	do
		if [[ -d "$HOME/$i" ]];
		then
			check_dir "$dest/$i"
			cp -r "$HOME/$i" "$dest"
		elif [[ -f "$HOME/$i" ]];
		then
			cp "$HOME/$i" "$dest/$i"
		fi
	done
}

main() {
	backup_files "$LOCAL" "$TARGET/$(hostname)"
	backup_files "$COMMON" "$TARGET/common"
	backup_wall
}

main

exit 0
