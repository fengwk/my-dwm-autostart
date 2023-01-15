#!/bin/bash

# feh --bg-fill --no-fehbg ~/Pictures/wallpapers/040.png

script_dir=$(dirname $(readlink -f $0))

monitor-detection.sh

while true; do
	sleep 15m
  wpchange
done
