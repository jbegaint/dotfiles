#!/bin/bash


WALL=$(cat ~/.fehbg | awk -F "'" '{print $2}' )
i3lock -i "$WALL" -t -u

[[ "$1" == "suspend" ]] && systemctl suspend &
