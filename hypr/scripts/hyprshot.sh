#!/bin/bash

# Hyprshot script to take screenshots with Hyprland
MENU = "Select screenshot mode"
OPTIONS=("Full Screen" "Active Window" "Selected Area" "Cancel")

# Display the menu using wofi
CHOICE=$(printf "%s\n" "${OPTIONS[@]}" | wofi --dmenu --prompt "$MENU")
if [[ -z "$CHOICE" || "$CHOICE" == "Cancel" ]]; then
    exit 0
fi

# Define the screenshot command based on the choice
case "$CHOICE" in
    "Full Screen")
        hyprshot -m output
        ;;
    "Active Window")
        hyprshot -m window
        ;;
    "Selected Area")
        hyprshot -m region
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

