#!/bin/bash

edp1=$(xrandr | grep -P -w -o "^eDP(-1-1|-1|1)" | head -n 1)
dp1=$(xrandr | grep -P -w -o "^DP(-1-1|-1|1)" | head -n 1)
dp2=$(xrandr | grep -P -w -o "^DP(-1-2|-2|2)" | head -n 1)

auto() {
  dp=$(xrandr | grep -w connected | grep -P -o "^($dp1|$dp2)")
  if [ -z "$dp" ]; then
    # 断开连接
    on1=$(xrandr| grep -w "$dp1" | grep -P "disconnected \d+x\d+")
    if [ ! -z "$on1" ]; then
      xrandr --output $dp1 --off --output $edp1 --auto
      echo "screen off $dp1 on $edp1"
    fi
    on2=$(xrandr| grep -w "$dp2" | grep -P "disconnected \d+x\d+")
    if [ ! -z "$on2" ]; then
      xrandr --output $dp2 --off --output $edp1 --auto
      echo "screen off $dp2 on $edp1"
    fi
  else
    # 连接了设备
    conn=$(xrandr | grep -n1 -w $dp | grep "*")
    if [ -z "$conn" ]; then
      # 说明没有连接
      xrandr --output $dp --auto --output $edp1 --off
      echo "screen on $dp off $edp1"
    fi
  fi
}

# 开启屏幕时如果发现已连接屏幕并打开则关闭笔记本显示器
dp=$(xrandr | grep -w connected | grep -P -o "^($dp1|$dp2)")
if [ ! -z $dp ]; then
  xrandr --output $dp --auto --output $edp1 --off
  sleep 0.5
  # wp-change.sh
fi

while true; do
  auto
  sleep 1
done

# dp=$(xrandr | grep -w connected | grep -P -o "^DP-{0,1}[1|2]")
# if [ ! -z $dp ]; then
#   xrandr --output $dp --same-as eDP-1
# fi
#
# while true; do
#   screen-auto.sh
#   sleep 2
# done
