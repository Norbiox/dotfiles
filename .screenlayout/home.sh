#!/bin/sh
xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x1200 --rotate normal --output DP1 --off --output DP2 --off --output DP2-1 --mode 1920x1200 --pos 0x0 --rotate normal --output DP2-2 --mode 1920x1200 --pos 3840x0 --rotate normal --output DP2-3 --mode 1920x1200 --pos 1920x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off 
nitrogen --restore
