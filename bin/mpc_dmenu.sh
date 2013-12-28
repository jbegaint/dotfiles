#!/bin/bash

COMMANDS="
toggle\n
next\n
prev\n
playlists
"

function load_playlist {
	mpc -q clear
	mpc -q load $1
	mpc -q shuffle
	mpc -q play
}

function dmenu_wrapper {
	dmenu -i -sb '#4A6787' -p "$1:"
}

CMD=$(echo -e $COMMANDS | dmenu_wrapper "MPC command")

if [[ "$CMD" == " playlists" ]]
then
	PLAYLIST=$(mpc lsplaylists | dmenu_wrapper "MPD playlist:" )
	load_playlist "$PLAYLIST"
else
	mpc -q $CMD;
fi