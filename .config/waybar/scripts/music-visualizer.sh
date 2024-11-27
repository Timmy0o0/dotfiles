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

get_player_info() {
    local new_status=$(playerctl status 2> /dev/null)
    local new_title=$(playerctl metadata title 2> /dev/null)
    local new_artist=$(playerctl metadata artist 2> /dev/null)
    
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