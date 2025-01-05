#!/bin/zsh

#pactl card name of my headset
HEADSET_CARD_NAME="bluez_card.XX_XX_XX_XX_XX_XX"
#headset MAC address
HEADSET_MAC="XX:XX:XX:XX:XX:XX"

ICON_DISCONNECTED="󰟎 "

#check if headset is connected
if ! pactl list cards | grep -q "$HEADSET_CARD_NAME"; then
  echo "%{T1}$ICON_DISCONNECTED%{T-}"
  #finish script execution, as it is irrelevant when headset is not connected  
  exit 0
fi

#if headset is connected, fetch the profile in use (a.k.a codec)
ACTIVE_PROFILE=$(pactl list cards | awk "/Name: $HEADSET_CARD_NAME/,/Active Profile/ {if (\$1 == \"Active\" && \$2 == \"Profile:\") print substr(\$0, index(\$0, \$3))}")

#fetching battery level (number from 0 to 100)
BATTERY_LEVEL=$(bluetoothctl info $HEADSET_MAC | grep "Battery Percentage" | awk -F'[()]' '{print $2}')

BATTERY_ICONS=("󱃍""󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")
#choosing the battery based on the fetched battery level
BATTERY_ICON="${BATTERY_ICONS[$((BATTERY_LEVEL / 10 + 1))]}"

#fetching the name of headset
HEADSET_INFO=$(pactl list cards | grep -A 20 -E "Name: $HEADSET_CARD_NAME")
DEVICE_DESCRIPTION=$(echo "$HEADSET_INFO" | grep -E "device.description" | cut -d '"' -f 2)

#icons for profiles
ICON_A2DP=""     
ICON_HEADSET=""

#fetching active profile and displaying correct icon
if [[ "$ACTIVE_PROFILE" == "headset-head-unit" ]]; then
  echo "%{T1}%{F#a277ff}$ICON_HEADSET%{F-}%{T-} %{T2}$DEVICE_DESCRIPTION%{T-}%{F#fc78cc}%{T1} $BATTERY_ICON%{T-}%{F-} %{T2}$BATTERY_LEVEL%%{T-}"
else
  echo "%{T1}%{F#61ffca}$ICON_A2DP%{F-}%{T-} %{T2} $DEVICE_DESCRIPTION%{T-}%{F#fc78cc}%{T1} $BATTERY_ICON%{T-}%{F-} %{T2}$BATTERY_LEVEL%%{T-}"
fi
