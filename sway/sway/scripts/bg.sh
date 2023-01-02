#!/bin/sh

# kill the current swaybg process
pkill swaybg

while true; do
	swaybg -i "$(find "$HOME/Pictures/GoSiMac" -type f -name '*.jpg' -or -name '*.png' -not -name lock.jpg | shuf -n1)" -m fill &
	NEW_PID=$!
	sleep 5
	if [ -e "$OLD_PID" ]; then
		kill "$OLD_PID"
	fi
	OLD_PID=$NEW_PID
	sleep 120
done
