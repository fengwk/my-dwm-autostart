# 直接启动 nm-applet 会出现 tray 丢失问题
# 可能与启动脚本结束后某些结束信号有关, 真实原因尚未查明
# 使用一个包装脚本同步启动 nm-applet 来隔离这些信号
# 另外必须最后启动否则将影响其他tray
sleep 1.5
if ! pgrep -u $UID -x nm-applet >/dev/null; then
  killall -u $USER -q nm-applet
  while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
  nm-applet
fi
