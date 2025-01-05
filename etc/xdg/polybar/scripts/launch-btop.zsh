#!/bin/zsh

bspc rule -a Alacritty state=floating rectangle=1100x700+400+200 && alacritty -e btop && bspc rule -r Alacritty
