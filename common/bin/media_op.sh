#!/bin/bash

# simple script to control mpd/ mocp

function is_running() {
	if [ ! -z $(pidof $1) ]; then
		echo true
	else
		echo false
	fi
}

function mocp_status() {
	echo "hello world"
}

function execute_mocp() {
	case $1 in
		"toggle" ) mocp -G;;
		"next" ) mocp -f;;
		"prev" ) mocp -r;;
		*) echo "unkown command";;
	esac
}

function execute_mpd() {
	case $1 in
		"toggle" ) mpc toggle -q;;
		"next" ) mpc next -q;;
		"prev" ) mpc prev -q;;
		*) echo "unkown command";;
	esac
}

function is_mpd_paused() {
	if [ -z "$(mpc status | grep paused)" ]; then
		return 1
	else
		return 0
	fi
}

function is_mocp_paused() {
	echo "a	"
}

MPD_STATE=$(is_running mpd)
MOCP_STATE=$(is_running mocp)

if $MPD_STATE && $MOCP_STATE; then
	echo "mpd & mocp running"

	# mpd first :)

	if is_mpd_paused && is_mpd_paused ; then
		execute_mpd $1
	elif is_mocp_paused; then
		execute_mpd $1

elif $MPD_STATE; then
	echo "mpd running"
	execute_mpd $1

elif $MOCP_STATE; then
	echo "mocp running"
	execute_mpd $1
fi