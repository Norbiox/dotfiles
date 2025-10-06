#!/bin/sh
xrandr \
  --output DP1 --off \
  --output DP2 --off \
  --output HDMI1 --on \
  --output VIRTUAL1 --off

xrandr --output HDMI1 --mode 1920x1200 --pos 0x0    --rotate normal --primary
xrandr --output eDP1  --mode 1920x1080 --pos 0x1200 --rotate normal

# sleep 3
# nitrogen --restore
