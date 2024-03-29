#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bars
for m in $(polybar --list-monitors | cut -d":" -f1); do
	echo "---" | tee -a /tmp/polybar-main-$m.log
	MONITOR=$m polybar main 2>&1 | tee -a /tmp/polybar-main-$m.log & disown
done

echo "Bars launched..."
