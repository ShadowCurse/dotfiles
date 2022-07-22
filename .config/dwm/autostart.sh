#!/bin/sh

nitrogen --restore 
#xrandr --output DP-4 --mode 3440x1440 --rate 110 & xrandr --output HDMI-0  --right-of DP-4 & 
setxkbmap -layout us,ru 
setxkbmap -option 'grp:alt_shift_toggle' 
xinput --set-prop "SteelSeries SteelSeries Rival 600"  "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1
xset s 0 0 
xset noblank
xset s off
xset dpms 0 0 0 
xset -dpms
while true; do
    xsetroot -name "$(date +"%A %B %d | %H:%M")"
    sleep 1m
done &
