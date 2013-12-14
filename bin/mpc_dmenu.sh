#!/bin/bash

CMD="
toggle\n
next\n
prev
"
mpc $(echo -e $CMD | dmenu -i)
