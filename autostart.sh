#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# for java application
wmname LG3D

# set default laptop xbacklight
sudo xbacklight -set 65

# libinput-gestures-setup start
libinput-gestures-setup restart

# monitor
dwm-switchmonitor 1

# wallpaper
dwm-defaultwallpaper

# fcitx5
killall -q fcitx5
while pgrep -u $UID -x fcitx5 >/dev/null; do sleep 1; done
fcitx5 &

# polkit-gnome
killall -q /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
while pgrep -u $UID -x /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null; do sleep 1; done
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# status bar
killall -q dwm-status.sh
while pgrep -u $UID -x dwm-status.sh >/dev/null; do sleep 1; done
${script_dir}/dwm-status.sh &

# window render
killall -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
# 使透明穿透到桌面：--experimental-backends --transparent-clipping
# picom -b --experimental-backends --transparent-clipping
# picom -b
picom --experimental-backends -b

# network
killall -q nm-applet
while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
nm-applet &

# wpa_supplicant
# sudo killall -q wpa_supplicant
# while pgrep -u $UID -x wpa_supplicant >/dev/null; do sleep 1; done
# sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant-wlo1.conf -i wlo1 &

# power
killall -q xfce4-power-manager
while pgrep -u $UID -x xfce4-power-manager >/dev/null; do sleep 1; done
xfce4-power-manager &

# clipster
killall -q clipster
while pgrep -u $UID -x clipster >/dev/null; do sleep 1; done
clipster -d &

# clash for windows
# killall -q /opt/clash-for-windows-chinese/cfw
# while pgrep -u $UID -x /opt/clash-for-windows-chinese/cfw >/dev/null; do sleep 1; done
# sleep 3 # 迟启动调整托盘图标出现位置
# /opt/clash-for-windows-chinese/cfw &

# optimus
# killall optimus-manager-qt
# while pgrep -u $UID -x optimus-manager-qt >/dev/null; do sleep 1; done
# optimus-manager-qt &

# wxwork
# killall -q wxwork
# while pgrep -u $UID -x wxwork >/dev/null; do sleep 1; done
# wxwork &

# birdtray
# killall -q birdtray
# while pgrep -u $UID -x birdtray >/dev/null; do sleep 1; done
# # env -u QT_AUTO_SCREEN_SCALE_FACTOR birdtray &
# birdtray &
