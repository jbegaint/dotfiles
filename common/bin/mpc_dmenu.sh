#!/bin/bash

readonly COMMANDS=(toggle next prev up down album artist playlists shuffle)

function load() {
	mpc -q clear

	if [[ "$1" == "playlist" ]]; then
		mpc -q load "$2"
	else
		mpc search "$1" "$2" | mpc add
	fi
	mpc -q play
}

function dmenu_wrapper() {
	dmenu -i -sb '#81A2BE' -sf '#000000' -nf '#969896' -p "$1:" -h 21
}

function parse_cmd() {
	local $action=$1

	case $action in
		playlists)
			res=$(mpc lsplaylists | dmenu_wrapper "playlist" )
			[[ ! -z $res ]] && load "playlist" "$res"
			;;

		artist)
			res=$(mpc list artist | sort | uniq -i | dmenu_wrapper "artist")
			[[ ! -z $res ]] && load "artist" "$res"
			;;

		album)	
			res=$(mpc list album | dmenu_wrapper "album")
			[[ ! -z $res ]] && load "album" "$res"
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
}

main() {
	action=$(printf "%s\n" "${COMMANDS[@]}" | dmenu_wrapper "action")

	# if not empty then parse command
	[[ ! -z $action ]] && parse_cmd $action
}

main

exit 0
