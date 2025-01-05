#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log /tmp/polybar4.log /tmp/polybarlog5.log
polybar topbarleft 2>&1 | tee -a /tmp/polybar1.log & disown
polybar topbarcenter 2>&1 | tee -a /tmp/polybar2.log & disown
polybar topbarright 2>&1 | tee -a /tmp/polybar3.log & disown
polybar bottombarleft 2>&1 | tee -a /tmp/polybar4.log & disown
polybar bottombarright 2>&1 | tee -a /tmp/polybar5.log & disown

echo "Bars launched..."
