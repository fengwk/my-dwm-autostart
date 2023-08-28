#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# fcitx5
killall -q fcitx5

# polkit-gnome
killall -q /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# status bar
killall -q dwm-status.sh

# window render
killall -q picom

# network
killall -q nm-applet

# wpa_supplicant
# sudo killall -q wpa_supplicant

# power
killall -q xfce4-power-manager

# clipster
killall -q clipster

# clash-for-windows-chinese
# killall -q /opt/clash-for-windows-chinese/cfw

# optimus
# killall optimus-manager-qt

# wxwork
# killall -q wxwork

# birdtray
# killall -q birdtray

# optimus-manager
# https://github.com/Askannz/optimus-manager/issues/404
# sudo /usr/bin/prime-switch
