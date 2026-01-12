#!/bin/sh

xrandr \
  --output eDP-1 --mode 1920x1080 --pos 1920x1200 --rotate normal \
  --output DP-2-1 --mode 1920x1200 --pos 0x0 --rotate normal \
  --output DP-2-2 --primary --mode 1920x1200 --pos 1920x0 --rotate normal \
  --output DP-2-3 --mode 1920x1200 --pos 3840x0 --rotate normal \
  --output DP2-1-1 --off \
  --output DP2-2-1 --off \
  --output DP2-1-8 --off \
  --output DP2-2-8 --off \
  --output DP1 --off \
  --output DP2 --off \
  --output HDMI1 --off \
  --output VIRTUAL1 --off


sleep 3

nitrogen --restore
