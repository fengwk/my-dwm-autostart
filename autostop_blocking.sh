#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

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

# powerkit
# killall -q powerkit

# power
killall -q xfce4-power-manager

# volum
# killall -q xfce4-volumed-pulse

# parcellite
# killall -q parcellite

# gpaste
# killall -q gpaste-daemon

# clipster
killall -q clipster

# clash-for-windows-chinese
# killall -q /opt/clash-for-windows-chinese/cfw

# parcellite
# killall -q parcellite

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
