#!/usr/bin/env bash

backgrounds_dir="$HOME/Pictures/backgrounds/"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected="$(find "$backgrounds_dir"  -type f -exec basename {} \; \
        | wofi --dmenu )"
fi

if [[ -z $selected ]]; then
    exit 0;
fi

selected_path=$backgrounds_dir$selected

hyprctl hyprpaper preload "$selected_path" 
hyprctl hyprpaper wallpaper ", $selected_path" 


