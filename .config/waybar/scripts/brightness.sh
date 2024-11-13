#!/bin/bash

CACHE_FILE="/tmp/monitor_brightness"
SYNC_INTERVAL=300 # 5 minutes

# check if we need to sync
current_time=$(date +%s)
last_sync=0
if [ -f "/tmp/brightness_last_sync" ]; then
    last_sync=$(cat "/tmp/brightness_last_sync")
fi

if [ $((current_time - last_sync)) -gt $SYNC_INTERVAL ]; then
    ddcutil getvcp 10 | grep -oP 'current value =\s*\K[0-9]+' > "$CACHE_FILE"
    echo "$current_time" > "/tmp/brightness_last_sync"
fi

# cache the current brightness
if [ ! -f "$CACHE_FILE" ]; then
    ddcutil getvcp 10 | grep -oP 'current value =\s*\K[0-9]+' > "$CACHE_FILE"
fi

# adjust the brightness
function adjust_brightness() {
    local direction=$1
    local current=$(cat "$CACHE_FILE")
    
    if [ "$direction" = "up" ] && [ "$current" -lt 100 ]; then
        ddcutil setvcp 10 + 10
        echo $((current + 10)) > "$CACHE_FILE"
    elif [ "$direction" = "down" ] && [ "$current" -gt 0 ]; then
        ddcutil setvcp 10 - 10
        echo $((current - 10)) > "$CACHE_FILE"
    fi
}

# get the current brightness
function get_brightness() {
    local brightness=$(cat "$CACHE_FILE")
    echo "{\"percentage\": $brightness}"
}

# main logic
case "$1" in
    "up")
        adjust_brightness "up"
        ;;
    "down")
        adjust_brightness "down"
        ;;
    *)
        get_brightness
        ;;
esac