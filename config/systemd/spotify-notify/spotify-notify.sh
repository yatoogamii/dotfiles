#!/bin/bash

coverPath="/tmp/spotify_cover.jpg"

playerctl --player=spotify metadata --follow --format "{{artist}}" | while read -r line; do
    title=$(playerctl --player=spotify metadata xesam:title)
    artist=$(playerctl --player=spotify metadata xesam:artist)
    album=$(playerctl --player=spotify metadata xesam:album)
    artUrl=$(playerctl --player=spotify metadata mpris:artUrl)
    coverId=$(echo $artUrl | rg "[^/]+$" -o)

    if [[ -n "${coverId}" ]]; then
        curl -o "$coverPath" "$artUrl"
    fi

    notify-send "Now Playing" "<b>$title</b>\nby $artist\nfrom $album" -a spotify -i "$coverPath"
done

