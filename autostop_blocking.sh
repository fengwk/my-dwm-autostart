#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# fcitx5
killall -q fcitx5

# polkit-gnome
killall -q /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# status bar
killall -q dwm-status.sh

# network
killall -q nm-applet

# blueman
killall -q blueman-applet

# clipster
killall -q clipster

# clash-for-windows-chinese
# killall -q /opt/clash-for-windows-bin/cfw

killall -q picom

kill $(ps -ef | grep linux-stt-input | grep python3 | head  -n 1 | awk '{print $2}')
