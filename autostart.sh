#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# for java application
wmname LG3D

# set default laptop xbacklight
# 使用此选项必须在sudor文件中将xbacklight设置为特权否则会因为要输入密码而卡死
#xbacklight -set 70

# libinput-gestures-setup start
#libinput-gestures-setup restart

# monitor
dwm-switchmonitor 1

# wallpaper
dwm-defaultwallpaper

# fcitx5
if ! pgrep -u $UID -x fcitx5 >/dev/null; then
  killall -u $USER -q fcitx5
  while pgrep -u $UID -x fcitx5 >/dev/null; do sleep 1; done
  fcitx5 &
  # gtk-launch org.fcitx.Fcitx5.desktop
fi

# polkit-gnome
polkit_path="/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1"
if ! pgrep -u $UID -x -f "$polkit_path" >/dev/null; then
  killall -u $USER -q -f "$polkit_path"
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
if ! pgrep -u $UID -x nm-tray >/dev/null; then
  killall -u $USER -q nm-tray
  while pgrep -u $UID -x nm-tray >/dev/null; do sleep 1; done
  nm-tray &
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
# sleep 1 # 迟启动调整托盘图标出现位置
# gtk-launch clash-for-windows.desktop

# 在最后启动compfy防止过早启动导致tray圆角排除无效问题
killall -u $USER -q compfy
while pgrep -u $UID -x compfy >/dev/null; do sleep 1; done
compfy -b
