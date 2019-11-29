#! /bin/bash

nitrogen --restore &
xrandr --output DP-4 --mode 2560x1440 --rate 165 & xrandr --output HDMI-0  --right-of DP-4 & 

setxkbmap -layout us,ru &
setxkbmap -option 'grp:alt_shift_toggle' &

while true; do
    xsetroot -name "$(date +"%A %B %d | %H:%M")"
    sleep 1m
done &
