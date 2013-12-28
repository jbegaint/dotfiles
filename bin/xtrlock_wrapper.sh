#!/bin/bash

i3-msg -q 'workspace 42' &
i3-msg -q 'bar mode toggle' &
xtrlock 
i3-msg -q 'bar mode toggle'
i3-msg -q 'workspace back_and_forth'
