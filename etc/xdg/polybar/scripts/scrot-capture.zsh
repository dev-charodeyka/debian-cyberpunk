#!/bin/zsh

dunstify -u low -t 4000 "Screen will be captured in 5 seconds!"
scrot -d 5 "/home/alisa/Screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png"
dunstify -u low "" "Screenshot saved into $HOME/Screenshots"

#LATEST_FILE=$(ls -t /home/alisa/Screenshots/screenshot_*.png | head -n 1)
#bspc rule -a feh state=floating && feh "$LATEST_FILE" && bspc rule -r feh
