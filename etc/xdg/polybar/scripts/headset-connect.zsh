#!/bin/zsh

#MAC address of a headset 
HEADSET_MAC="XX:XX:XX:XX:XX:XX"

#try to connect
dunstify -u low "Connecting..." "to the headset"
              
if bluetoothctl connect "$HEADSET_MAC"; then
  # Wait a moment for connection status to update
  sleep 5
  # Check connection status
  if bluetoothctl info "$HEADSET_MAC" | grep -q "Connected: yes"; then
    dunstify -u low "Connected successfully!"
    exit 0
  else
    dunstify -u normal "Connection Failed" "Please try manually"
    sleep 2
    bspc rule -a Alacritty state=floating && alacritty -e bluetoothctl && bspc rule -r Alacritty
  fi
else
  dunstify -u normal "Connection Failed" "Please try manually"
  sleep 2
  bspc rule -a Alacritty state=floating && alacritty -e bluetoothctl && bspc rule -r Alacritty
fi
