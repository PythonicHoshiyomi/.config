#!/bin/bash
# filepath: /home/gzzz/.config/waybar/spotify.sh

artist=$(playerctl -p spotify metadata artist 2>/dev/null)
title=$(playerctl -p spotify metadata title 2>/dev/null)

if [ -n "$artist" ] && [ -n "$title" ]; then
  echo "{\"text\": \"$artist - $title\", \"tooltip\": \"$title by $artist\"}"
else
  echo "{\"text\": \"󰓇  Not Playing\", \"tooltip\": \"Spotify is not playing\"}"
fi