#!/bin/zsh

#fetching output
WIFI_INFO=$(nmcli -t -f ACTIVE,SSID,RATE,SIGNAL device wifi | grep '^yes')

# extracting SSID (name of the connected wifi)
SSID=$(echo "$WIFI_INFO" | awk -F: '{print $2}')

# if not connected
if [[ -z "$SSID" ]]; then
  SSID="Not connected"
fi

# send notification using dunstify
dunstify -u low -t 3000 "  $SSID"
