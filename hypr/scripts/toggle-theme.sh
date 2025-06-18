#!/bin/bash

#DEFINE PATHS
THEME_DIR="$HOME/.config/waybar/themes"
WAYBAR_DIR="$HOME/.config/waybar"
CONFIG_LINK="$WAYBAR_DIR/config.jsonc"
STYLE_LINK="$WAYBAR_DIR/style.css"

#CHECK IF WOFI IS RUNNING
killall wofi
#GET THEME LISTS
THEMES=$(ls "$THEME_DIR" | wofi --dmenu --prompt "Select Theme")

[-z "$THEMES" ] && exit 1

#BUILD FULLL PATHS
THEME_PATH="$THEME_DIR/$THEMES"
THEME_CONFIG="$THEME_PATH/config.jsonc"
THEME_STYLE="$THEME_PATH/style.css"

#ENSURE THEME FILES EXIST
if [[ ! -f "$THEME_CONFIG" || ! -f "$THEME_STYLE" ]]; then
    notify-send "Theme files not found!"
    exit 1
fi

#APPLY THEME
ln -sf "$THEME_CONFIG" "$CONFIG_LINK"
ln -sf "$THEME_STYLE" "$STYLE_LINK"

#RESTART WAYBAR
killall waybar 
waybar &