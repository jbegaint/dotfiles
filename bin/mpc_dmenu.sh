#!/bin/bash

CMD="
toggle\n
next\n
prev
"

mpc $(echo -e $CMD | dmenu -i -sb '#4A6787' -p "MPC command:")
