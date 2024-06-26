#!/usr/bin/env bash

# Terminate already running bar instances
# killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar second 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar mainbar 2>&1 | tee -a /tmp/polybar3.log & disown


sleep 5

killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar mainbar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
