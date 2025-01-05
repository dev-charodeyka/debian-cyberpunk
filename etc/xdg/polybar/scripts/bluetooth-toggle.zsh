#!/bin/zsh

#just a very easy peasy script to poer on/off bluetooth
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  bluetoothctl power on
  dunstify -u low "Bluetooth status" "ON"	
else
  bluetoothctl power off
  dunstify -u low "Bluetooth status" "OFF"
fi
