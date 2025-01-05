#!/bin/zsh

# fteching the output
WIFI_INFO=$(nmcli -t -f ACTIVE,SSID,RATE,SIGNAL device wifi | grep '^yes')

# extracting values from text output
RATE=$(echo "$WIFI_INFO" | awk -F: '{print $3}' | sed 's/ Mbit\/s//')
SIGNAL=$(echo "$WIFI_INFO" | awk -F: '{print $4}')

#setting ICONs and COLOR based on the strenght of SIGNAL
if [[ "$SIGNAL" -gt 75 ]]; then
    ICON="󰤨"  
    ICON_COLOR="%{F#61ffca}"  
elif [[ "$SIGNAL" -gt 65 ]]; then
    ICON="󰤥"  
    ICON_COLOR="%{F#a277ff}"  
elif [[ "$SIGNAL" -gt 55 ]]; then
    ICON="󰤢"  
    ICON_COLOR="%{F#f694ff}"  
elif [[ "$SIGNAL" -gt 45 ]]; then
    ICON="󰤟"  
    ICON_COLOR="%{F#82e2ff}"  
elif [[ "$SIGNAL" -gt 35 ]]; then
    ICON="󰤯"  
    ICON_COLOR="%{F#ffca85}"  
else
    ICON="󰤭" 
    ICON_COLOR="%{F#ff6767}"
fi

echo "%{T1}${ICON_COLOR}${ICON}%{F-}%{T-} %{T2} ${RATE} Mbit/s%{T-}"
