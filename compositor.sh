#!/bin/bash

if cat /proc/cpuinfo | grep -i vendor_id | grep -iq intel; then
  # 公司的intel使用picom获取更多兼容性
  killall -u $USER -q picom
  while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
  picom -b
else
  killall -u $USER -q compfy
  while pgrep -u $UID -x compfy >/dev/null; do sleep 1; done
  compfy -b
fi
