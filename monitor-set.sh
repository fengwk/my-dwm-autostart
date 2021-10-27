#!/bin/bash

CONN=$(xrandr | grep 'DP-1-2' | awk '{print $2}')
if [ ${CONN} = 'connected' ]; then
    xrandr --output DP-1-2 --right-of eDP-1-1 --mode 3840x2160
else
    xrandr --output DP-1-2 --off
fi
