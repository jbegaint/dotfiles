#!/bin/bash

ACTIONS="toggle\nnext\nprev\nup\ndown\nalbum\nartist\nplaylists\nshuffle"

function load {
	mpc -q clear

	if [[ "$1" == "playlist" ]]; then
		mpc -q load "$2"
		mpc shuffle
	else
		echo "nope"
		mpc find "$1" "$2" | mpc add
	fi
	mpc -q play
}

function dmenu_wrapper {
	dmenu -i -sb '#81A2BE' -sf '#000000' -nf '#969896' -p "$1:" -h 21
}

action=$(echo -e $ACTIONS | dmenu_wrapper "action")

# test if return failure 
[[ -z $action ]] && exit 1

case $action in
	playlists)
		res=$(mpc lsplaylists | dmenu_wrapper "playlist" )
		load "playlist" "$res"
		;;

	artist)
		res=$(mpc list artist | dmenu_wrapper "artist")
		load "artist" "$res"
		;;

	album)	
		res=$(mpc list album | dmenu_wrapper "album")
		load "album" "$res"
		;;

	up)
		amixer set Master 5%+ -q
		;;

	down)
		amixer set Master 5%- -q
		;;

	*)
		mpc $action -q
		;;
esac

exit 0
