#!/bin/zsh

# headset card name from pactl
HEADSET_CARD_NAME="bluez_card.XX_XX_XX_XX_XX_XX"

# fetch the current profile
ACTIVE_PROFILE=$(pactl list cards | awk "/Name: $HEADSET_CARD_NAME/,/Active Profile/ {if (\$1 == \"Active\" && \$2 == \"Profile:\") print substr(\$0, index(\$0, \$3))}")

#profiles that supported by my headset
PROFILE_HEADSET="headset-head-unit"
PROFILE_A2DP="a2dp-sink-sbc_xq"

# toggle profiles and notify about it
if [[ "$ACTIVE_PROFILE" == "$PROFILE_HEADSET" ]]; then
  pactl set-card-profile "$HEADSET_CARD_NAME" "$PROFILE_A2DP"
  dunstify -u low "Headset Profile changed" "Output only"
else
  pactl set-card-profile "$HEADSET_CARD_NAME" "$PROFILE_HEADSET"
  dunstify -u low "Headset Profile changed" "Microfone is enabled"
fi
