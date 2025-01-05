#!/bin/zsh

# fetching wireguard interfaces connection
WIREGUARD_INTERFACE=$(nmcli device | grep -i "wireguard" | grep -i "connected" | awk '{print $1}')

if [[ -n $WIREGUARD_INTERFACE ]]; then
	bspc rule -a Alacritty state=floating && alacritty -e zsh -c "sudo wg-quick down /etc/wireguard/protonvpn.conf; exec zsh" && bspc rule -r Alacritty
else
	bspc rule -a Alacritty state=floating && alacritty -e zsh -c "sudo wg-quick up /etc/wireguard/protonvpn.conf; exec zsh" && bspc rule -r Alacritty
fi
