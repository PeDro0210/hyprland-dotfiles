#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

# wlogout (Power, Screen Lock, Suspend, etc)

# Set variables for parameters
A_2160=450
B_2160=450
A_1600=400
B_1600=400
A_1440=350
B_1440=350
A_1080=350
B_1080=350
A_720=50
B_720=50

# Check if wlogout is already running
if pgrep -x "wlogout" >/dev/null; then
  pkill -x "wlogout"
  exit 0
fi

# Detect monitor resolution and scaling factor
resolution=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height / .scale' | awk -F'.' '{print $1}')
hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')

# Set parameters based on screen resolution and scaling factor

T_val=$(awk "BEGIN {printf \"%.0f\", $A_720 * 720 * $hypr_scale / $resolution}")
B_val=$(awk "BEGIN {printf \"%.0f\", $B_720 * 720 * $hypr_scale / $resolution}")
echo "Setting parameters for resolution >= 720p and < 1080p"
wlogout --protocol layer-shell -b 2 -T $T_val -B $B_val &
