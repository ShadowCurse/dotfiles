#!/bin/sh

# xrandr --output DP-4 --mode 3440x1440 --rate 110 & xrandr --output HDMI-0  --right-of DP-4 & 
xrandr --output DP-4 --mode 3440x1440 --rate 110 
nitrogen --restore 
xinput --set-prop "SteelSeries SteelSeries Rival 600"  "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1
xset s off
xset -dpms
while true; do
    xsetroot -name "$(date +"%A %B %d | %H:%M")"
    sleep 1m
done &
