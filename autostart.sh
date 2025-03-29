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
polkit_path="/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
if ! pgrep -u $UID -x -f "$polkit_path" >/dev/null; then
  killall -u $USER -q "$polkit_path"
  while pgrep -u $UID -x -f "$polkit_path" >/dev/null; do sleep 1; done
  "$polkit_path" &
fi

# status bar
if ! pgrep -u $UID -x dwm-status.sh >/dev/null; then
  killall -u $USER -q dwm-status.sh
  while pgrep -u $UID -x dwm-status.sh >/dev/null; do sleep 1; done
  ${script_dir}/dwm-status.sh &
fi

# network
if ! pgrep -u $UID -x nm-applet >/dev/null; then
  killall -u $USER -q nm-applet
  while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
  nm-applet &
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
if [ -n "$(ps -ef | grep -q /opt/clash-for-windows-bin/cfw | grep -v grep)" ]; then
  killall -q /opt/clash-for-windows-bin/cfw
  while [ -z "$(ps -ef | grep -q /opt/clash-for-windows-bin/cfw | grep -v grep)" ]; do sleep 1; done
fi
#sleep 1 # 迟启动调整托盘图标出现位置
# gtk-launch clash-for-windows.desktop

# picom
killall -u $USER -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom -b
