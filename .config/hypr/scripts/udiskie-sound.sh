#!/bin/bash

# device: pactl list short sinks
play_mount_sound() {
    paplay --device=0 ~/.config/hypr/audio/mount-sound.mp3
}

play_unmount_sound() {
    paplay --device=0 ~/.config/hypr/audio/unmount-sound.mp3
}

# Initialize a set to track processed device paths
declare -A processed_devices

# Function to check if the device path is a disk (not a partition)
is_disk() {
    [[ ! "$1" =~ [0-9]$ ]]
}

# Start udiskie and monitor for mount/unmount events
udiskie -t --notify &
udisksctl monitor | grep --line-buffered -E "Added|Removed.*block_devices" | while read -r line; do
    echo "Line read: $line"
    device_path=$(echo "$line" | awk '{print $NF}')
    if is_disk "$device_path"; then
        if [[ "$line" == *"Added"* && -z "${processed_devices[$device_path]}" ]]; then
            play_mount_sound
            processed_devices["$device_path"]=1
            sleep 1
        elif [[ "$line" == *"Removed"* && -n "${processed_devices[$device_path]}" ]]; then
            play_unmount_sound
            unset processed_devices["$device_path"]
            sleep 1
        fi
    fi
done
