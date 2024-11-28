#!/bin/bash

animations=(
    "▁▁▁▁▁"
    "▁▁▂▁▁"
    "▁▂▃▂▁"
    "▂▃▄▃▂"
    "▃▄▅▄▃"
    "▄▅▆▅▄"
    "▅▆▇▆▅"
    "▆▇█▇▆"
    "▇███▇"
    "█████"
    "▇███▇"
    "▆▇█▇▆"
    "▅▆▇▆▅"
    "▄▅▆▅▄"
    "▃▄▅▄▃"
    "▂▃▄▃▂"
    "▁▂▃▂▁"
    "▁▁▂▁▁"
)

# Get the player name dynamically
PLAYER_NAME=$(playerctl -l | grep chromium | head -n 1)

# Fallback if no chromium player is found
if [ -z "$PLAYER_NAME" ]; then
    PLAYER_NAME="chromium.instance1"
fi

get_player_info() {
    # Check for qqmusic player using the player name variable
    if ! playerctl -p $PLAYER_NAME status > /dev/null 2>&1; then
        status=""
        title=""
        artist=""
        return
    fi

    # Get info using the player name variable
    local new_status=$(playerctl -p $PLAYER_NAME status 2> /dev/null)
    local new_title=$(playerctl -p $PLAYER_NAME metadata title 2> /dev/null)
    local new_artist=$(playerctl -p $PLAYER_NAME metadata artist 2> /dev/null)
    
    # Compare and update only if changed
    if [[ "$status" != "$new_status" ]] || [[ "$title" != "$new_title" ]] || [[ "$artist" != "$new_artist" ]]; then
        status=$new_status
        title=$new_title
        artist=$new_artist
    fi
}

get_player_info

if [[ $status == "Playing" ]]; then
    frame=$(( $(date +%s%N) / 50000000 % ${#animations[@]} ))
    
    get_player_info
    
    if [ ${#title} -gt 30 ]; then
        title="${title:0:27}..."
    fi
    if [ ${#artist} -gt 20 ]; then
        artist="${artist:0:17}..."
    fi
    
    echo "{\"text\": \"${animations[$frame]} ${artist} - ${title}\", \"class\": \"playing\", \"tooltip\": \"$artist - $title\"}"
elif [[ $status == "Paused" ]]; then
    get_player_info
    echo "{\"text\": \"🎵 ${artist} - ${title}\", \"class\": \"paused\", \"tooltip\": \"$artist - $title\"}"
else
    echo "{\"text\": \"🎶 No music\", \"class\": \"stopped\"}"
fi