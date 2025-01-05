#!/bin/zsh

#temporary rule for terminal session to open it in floating mode launching ncspot and cava together
bspc rule -a "*" -o state=floating rectangle=700x500+200+300 && alacritty -e ncspot &
bspc rule -a "*" -o state=floating rectangle=700x500+1000+300 && alacritty -e cava &

