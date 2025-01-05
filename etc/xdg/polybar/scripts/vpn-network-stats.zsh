#!/bin/zsh

ICON_CONNECTED=" "  
ICON_DISCONNECTED=" "
  
# fetching wireguard interfaces connection
WIREGUARD_INTERFACE=$(nmcli device | grep -i "wireguard" | grep -i "connected" | awk '{print $1}')

if [[ -n $WIREGUARD_INTERFACE ]]; then

    echo "%{F#61ffca}$ICON_CONNECTED%{F-}"
else
    # no active vpn
    echo "%{T1}$ICON_DISCONNECTED%{T-}"
fi

