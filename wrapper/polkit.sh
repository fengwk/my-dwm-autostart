# polkit-gnome
polkit_path="/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
if [ ! -f "$polkit_path" ]; then
  # for ubuntu
  polkit_path="/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1"
fi
if ! pgrep -u $UID -x -f "$polkit_path" >/dev/null; then
  killall -u $USER -q -f "$polkit_path"
  while pgrep -u $UID -x -f "$polkit_path" >/dev/null; do sleep 1; done
  "$polkit_path"
fi
