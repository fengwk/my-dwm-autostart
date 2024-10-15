#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# for java application
wmname LG3D

# set default laptop xbacklight
# 使用此选项必须在sudor文件中将xbacklight设置为特权否则会因为要输入密码而卡死
xbacklight -set 65

# libinput-gestures-setup start
libinput-gestures-setup restart

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
if [ ! -f "$polkit_path" ]; then
  # for ubuntu
  polkit_path="/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1"
fi
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

# composite
# if ! pgrep -u $UID -x picom >/dev/null; then
#   killall -u $USER -q picom
#   while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
#   # 使透明穿透到桌面：--experimental-backends --transparent-clipping
#   # picom -b --experimental-backends --transparent-clipping
#   # picom -b
#   picom --experimental-backends -b
# fi

# network
if ! pgrep -u $UID -x nm-applet >/dev/null; then
  killall -u $USER -q nm-applet
  while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
  nm-applet &
fi

# wpa_supplicant
# if ! pgrep -u $UID -x wpa_supplicant >/dev/null; then
#   sudo killall -u $USER -q wpa_supplicant
#   while pgrep -u $UID -x wpa_supplicant >/dev/null; do sleep 1; done
#   sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant-wlo1.conf -i wlo1 &
# fi

# power
# if ! pgrep -u $UID -x xfce4-power-manager >/dev/null; then
#   killall -u $USER -q xfce4-power-manager
#   while pgrep -u $UID -x xfce4-power-manager >/dev/null; do sleep 1; done
#   xfce4-power-manager &
# fi

# clipster
if ! pgrep -u $UID -x clipster >/dev/null; then
  killall -u $USER -q clipster
  while pgrep -u $UID -x clipster >/dev/null; do sleep 1; done
  clipster -d &
fi

# clash for windows
# if ! pgrep -u $UID -x /opt/clash-for-windows-chinese/cfw >/dev/null; then
#   killall -u $USER -q /opt/clash-for-windows-chinese/cfw
#   while pgrep -u $UID -x /opt/clash-for-windows-chinese/cfw >/dev/null; do sleep 1; done
#   sleep 3 # 迟启动调整托盘图标出现位置
#   /opt/clash-for-windows-chinese/cfw &
# fi

# optimus
# if ! pgrep -u $UID -x optimus-manager-qt >/dev/null; then
#   killall -u $USER optimus-manager-qt
#   while pgrep -u $UID -x optimus-manager-qt >/dev/null; do sleep 1; done
#   optimus-manager-qt &
# fi

# wxwork
# if ! pgrep -u $UID -x wxwork >/dev/null; then
#   killall -u $USER -q wxwork
#   while pgrep -u $UID -x wxwork >/dev/null; do sleep 1; done
#   wxwork &
# fi

# birdtray
# if ! pgrep -u $UID -x birdtray >/dev/null; then
#   killall -u $USER -q birdtray
#   while pgrep -u $UID -x birdtray >/dev/null; do sleep 1; done
#   # env -u QT_AUTO_SCREEN_SCALE_FACTOR birdtray &
#   birdtray &
# fi

# 在最后启动compfy防止过早启动导致tray圆角排除无效问题
$script_dir/compositor.sh
