#!/bin/zsh

dunstify -u low "Starting DNS Leak Check..."
# fetching response json from api ipleak
JSON=$(curl -s https://ipv4.ipleak.net/json/)

#extracting from json ip and country name
IP=$(echo "$JSON" | jq -r '.ip')
COUNTRY_NAME=$(echo "$JSON" | jq -r '.country_name')

# display the rethrieved details using dunstify
dunstify -u low "DNS Leak Check" "$IP: $COUNTRY_NAME"


