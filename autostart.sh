#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# for java application
wmname LG3D

# monitor
killall -q ${script_dir}/monitor-detection.sh
while pgrep -u $UID -x ${script_dir}/monitor-detection.sh >/dev/null; do sleep 1; done
${script_dir}/monitor-detection.sh &

# status bar
killall -q dwm-status.sh
while pgrep -u $UID -x dwm-status.sh >/dev/null; do sleep 1; done
${script_dir}/dwm-status.sh &

# wallpaper
killall -q wp-autochange.sh
while pgrep -u $UID -x wp-autochange.sh >/dev/null; do sleep 1; done
${script_dir}/wp-autochange.sh &

# window render
killall -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
# 使透明穿透到桌面：--experimental-backends --transparent-clipping
# picom -b --experimental-backends --transparent-clipping
# picom -b
picom --experimental-backends -b

# bluez
# killall -q blueman-applet &
# while pgrep -u $UID -x blueman-applet >/dev/null; do sleep 1; done
# blueman-applet &

# network
# killall -q nm-applet &
# while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
# nm-applet &

# wpa_supplicant
# sudo killall -q wpa_supplicant &
# while pgrep -u $UID -x wpa_supplicant >/dev/null; do sleep 1; done
# sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant-wlo1.conf -i wlo1 &

# power
# killall -q xfce4-power-manager &
# while pgrep -u $UID -x xfce4-power-manager >/dev/null; do sleep 1; done
# xfce4-power-manager &

# volum
# killall -q xfce4-volumed-pulse &
# while pgrep -u $UID -x xfce4-volumed-pulse >/dev/null; do sleep 1; done
# xfce4-volumed-pulse &

# fcitx5
killall -q fcitx5
while pgrep -u $UID -x fcitx5 >/dev/null; do sleep 1; done
fcitx5 &

# parcellite
killall -q parcellite
while pgrep -u $UID -x parcellite >/dev/null; do sleep 1; done
parcellite &

# optimus
killall optimus-manager-qt
while pgrep -u $UID -x optimus-manager-qt >/dev/null; do sleep 1; done
optimus-manager-qt &

# slimbookbattery
# killall slimbookbattery
# while pgrep -u $UID -x slimbookbattery >/dev/null; do sleep 1; done
# slimbookbattery &

# wxwork
# killall -q wxwork
# while pgrep -u $UID -x wxwork >/dev/null; do sleep 1; done
# wxwork &

# birdtray
# killall -q birdtray
# while pgrep -u $UID -x birdtray >/dev/null; do sleep 1; done
# # env -u QT_AUTO_SCREEN_SCALE_FACTOR birdtray &
# birdtray &

# lightscreen
# killall -q lightscreen
# while pgrep -u $UID -x lightscreen >/dev/null; do sleep 1; done
# lightscreen &
