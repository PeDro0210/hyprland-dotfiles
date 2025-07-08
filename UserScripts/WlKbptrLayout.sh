# Check if wlogout is already running
if pgrep -x "wl-kbptr" >/dev/null; then
  pkill -x "wl-kbptr"
  exit 0
fi

wl-kbptr -c "$HOME/.config/wl-kbptr/config"
