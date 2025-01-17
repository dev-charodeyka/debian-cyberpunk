#!/bin/zsh

#my marshall IV headset NAC address
HEADSET_MAC="XX:XX:XX:XX:XX:XX"

#fetching bluetooth power status
if [[ $(bluetoothctl show | grep -q "Powered: yes" && echo 1 || echo 0) -eq 0 ]]; then
  #if bluetooth is off:
  echo "%{F#edecee} 󰂲 %{F-}"
else
  #check what is connected
  CONNECTED_DEVICES=$(bluetoothctl devices Connected | awk '{print $2}')
  
  if [[ -z "$CONNECTED_DEVICES" ]]; then
    # 0 devices connected
    echo "%{F#ffca85}  %{F-}" # Bluetooth is on but no device is connected
  elif [[ "$CONNECTED_DEVICES" == "$HEADSET_MAC" ]]; then
    # if ONLY my headset is connected
    echo "%{F#61ffca} 󰥰 %{F-}" # Headset connected
  else
    # if something ELSE is connected
    echo "%{F#a277ff} 󰂴 %{F-}" # More than one device connected
  fi
fi
