#!/bin/bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpaper"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

cat > ~/.config/hypr/hyprpaper.conf << EOF
preload = $WALLPAPER
wallpaper = ,$WALLPAPER
EOF

sed -i "s|path = .*|path = $WALLPAPER|" ~/.config/hypr/hyprlock.conf

pkill hyprpaper
hyprpaper &
