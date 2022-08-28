#!/bin/bash

script_dir=$(dirname $(readlink -f $0))

# monitor
# xrandr --output eDP-1-1 --mode 3480x2160
# ${script_dir}/monitor-set.sh
# killall monitor-detection.sh
# ${script_dir}/monitor-detection.sh &

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
picom -b

# bluez
# killall -q blueman-applet &
# while pgrep -u $UID -x blueman-applet >/dev/null; do sleep 1; done
# blueman-applet &

# network
# killall -q nm-applet &
# while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
# nm-applet &

# power
# killall -q xfce4-power-manager &
# while pgrep -u $UID -x xfce4-power-manager >/dev/null; do sleep 1; done
# xfce4-power-manager &

# volum
# killall -q xfce4-volumed-pulse &
# while pgrep -u $UID -x xfce4-volumed-pulse >/dev/null; do sleep 1; done
# xfce4-volumed-pulse &

# optimus
# killall optimus-manager-qt
# while pgrep -u $UID -x optimus-manager-qt >/dev/null; do sleep 1; done
# optimus-manager-qt &

# fcitx5
killall -q fcitx5
while pgrep -u $UID -x fcitx5 >/dev/null; do sleep 1; done
fcitx5 &

# wxwork
# killall -q wxwork
# while pgrep -u $UID -x wxwork >/dev/null; do sleep 1; done
# wxwork &

# birdtray
# killall -q birdtray
# while pgrep -u $UID -x birdtray >/dev/null; do sleep 1; done
# birdtray &

# lightscreen
# killall -q lightscreen
# while pgrep -u $UID -x lightscreen >/dev/null; do sleep 1; done
# lightscreen &
