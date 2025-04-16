#!/bin/bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpaper"

# create wallpaper directory if it doesn't exist
if [ ! -d "$WALLPAPER_DIR" ]; then
    mkdir -p "$WALLPAPER_DIR"
fi

# check if wallpaper directory is empty
if [ -z "$(ls -A $WALLPAPER_DIR)" ]; then
    echo "Wallpaper directory is empty. Please add some wallpapers to $WALLPAPER_DIR"
    exit 1
fi

# create cache directory if it doesn't exist
CACHE_DIR="$HOME/.cache"
if [ ! -d "$CACHE_DIR" ]; then
    mkdir -p "$CACHE_DIR"
fi

# randomly select a wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

# copy selected wallpaper to a fixed location
cp "$WALLPAPER" ~/.cache/current_wallpaper

# Kill existing hyprpaper and wait a moment
pkill hyprpaper

# Start hyprpaper with the new configuration
hyprpaper > /dev/null 2>&1 & disown

# Reload hyprlock configuration if it's being used
killall -SIGUSR2 hyprlock 2>/dev/null
