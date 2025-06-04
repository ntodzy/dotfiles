#!/bin/sh
status=$(playerctl -p spotify status 2>/dev/null)

# if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
if [ "$status" = "Playing" ] ; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    ablum=$(playerctl -p spotify metadata album)

    if [ "$1" = "waybar" ] ; then
        # Waybar specific formatting
        echo "{\"text\":\"$title - $artist\", \"tooltip-format\":\" hi $album\"}"
        exit 0
    else
        # General formatting
        echo "$title - $artist"
    fi
else
    echo ""
fi