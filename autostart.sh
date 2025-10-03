#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# for java application
wmname LG3D

# monitor
dwm-switchmonitor 1

# wallpaper
dwm-defaultwallpaper

# fcitx5
if ! pgrep -u $UID -x fcitx5 >/dev/null; then
  killall -u $USER -q fcitx5
  while pgrep -u $UID -x fcitx5 >/dev/null; do sleep 1; done
  fcitx5 &
fi

# polkit-gnome
$script_dir/wrapper/polkit.sh &

# status bar
if ! pgrep -u $UID -x dwm-status.sh >/dev/null; then
  killall -u $USER -q dwm-status.sh
  while pgrep -u $UID -x dwm-status.sh >/dev/null; do sleep 1; done
  $script_dir/dwm-status.sh &
fi

# network
$script_dir/wrapper/nm-applet.sh &

# blueman
if ! pgrep -u $UID -x blueman-applet >/dev/null; then
  killall -u $USER -q blueman-applet
  while pgrep -u $UID -x blueman-applet >/dev/null; do sleep 1; done
  blueman-applet &
fi

# blueman
if ! pgrep -u $UID -x blueman-applet >/dev/null; then
  killall -u $USER -q blueman-applet
  while pgrep -u $UID -x blueman-applet >/dev/null; do sleep 1; done
  blueman-applet &
fi

# clipster
if ! pgrep -u $UID -x clipster >/dev/null; then
  killall -u $USER -q clipster
  while pgrep -u $UID -x clipster >/dev/null; do sleep 1; done
  clipster -d &
fi

# clash for windows
# if [ -n "$(ps -ef | grep -q /opt/clash-for-windows-bin/cfw | grep -v grep)" ]; then
#   killall -q /opt/clash-for-windows-bin/cfw
#   while [ -z "$(ps -ef | grep -q /opt/clash-for-windows-bin/cfw | grep -v grep)" ]; do sleep 1; done
# fi
#sleep 1 # 迟启动调整托盘图标出现位置
# gtk-launch clash-for-windows.desktop

# picom
killall -u $USER -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom -b

# linux stt input
# kill $(ps -ef | grep linux-stt-input | grep python3 | head  -n 1 | awk '{print $2}')
# while pgrep -u $UID -x linux-stt-input >/dev/null; do sleep 1; done
# linux-stt-input.sh
