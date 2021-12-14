#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# monitor
xrandr --output eDP-1-1 --mode 3480x2160
${script_dir}/monitor-set.sh
killall monitor-detection.sh
${script_dir}/monitor-detection.sh &

# status bar
${script_dir}/dwm-status.sh &

# wallpaper
${script_dir}/wp-autochange.sh &

# window render
killall picom
picom -b

# fix for java
wmname LG3D

# bluez
# killall blueman-applet
# blueman-applet &

# network
killall nm-applet
nm-applet &

# power
# killall xfce4-power-manager
# xfce4-power-manager &

# volum
# killall xfce4-volumed-pulse
# xfce4-volumed-pulse &

# optimus
killall optimus-manager-qt
optimus-manager-qt &

# wait then exec
sleep 3

# fcitx5
killall fcitx5
fcitx5 &

# wxwork
# killall wxwork.sh
# wxwork.sh &

# birdtray
killall birdtray
birdtray &
