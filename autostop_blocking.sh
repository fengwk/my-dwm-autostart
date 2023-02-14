#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# for java application
wmname LG3D

# auto suspend
#killall -q xautolock

# monitor
#killall -q ${script_dir}/monitor-detection.sh

# fcitx5
killall -q fcitx5

# polkit-gnome
killall -q /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# status bar
killall -q dwm-status.sh

# wallpaper
killall -q wp-autochange.sh

# window render
killall -q picom

# bluez
# killall -q blueman-applet

# network
killall -q nm-applet

# wpa_supplicant
# sudo killall -q wpa_supplicant

# power
killall -q xfce4-power-manager

# volum
# killall -q xfce4-volumed-pulse

# parcellite
killall -q parcellite

# clash for windows
killall -q /opt/clash-for-windows-chinese/cfw

# optimus
# killall optimus-manager-qt

# slimbookbattery
# killall slimbookbattery

# wxwork
# killall -q wxwork

# birdtray
# killall -q birdtray

# lightscreen
# killall -q lightscreen

# optimus-manager
# https://github.com/Askannz/optimus-manager/issues/404
# sudo /usr/bin/prime-switch
