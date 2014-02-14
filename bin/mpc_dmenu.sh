#!/bin/bash

COMMANDS="
toggle\n
next\n
prev\n
playlists\n
artist
"

function load_playlist {
	mpc -q clear
	mpc -q load $1
	mpc -q shuffle
	mpc -q play
}

function load_artist {
	mpc -q clear
	mpc -q find artist "$1" | mpc add
	mpc -q play
}

function dmenu_wrapper {
	dmenu -i -sb '#4A6787' -p "$1:" -h 21
}

CMD=$(echo -e $COMMANDS | dmenu_wrapper "action")

if [[ "$CMD" == " playlists" ]]
then
	PLAYLIST=$(mpc lsplaylists | dmenu_wrapper "playlist" )
	load_playlist "$PLAYLIST"

elif [[ "$CMD" == " artist" ]]
then
	artist=$(mpc list artist | dmenu_wrapper "artist")
	load_artist "$artist"
else
	mpc -q $CMD;
fi