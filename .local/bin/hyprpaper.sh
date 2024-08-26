#!/bin/bash

export WALLPAPERS=${1:-$HOME/Pictures/Wallpapers}
export INTERVAL=${2:-300}

for i in $(find ${WALLPAPERS} -type f); do
	pkill -x hyprpaper
	sed -e "s#^wallpaper\s*=.*#wallpaper = ,${i}#" \
	    -e "s#^preload\s*=.*#preload = ${i}#" \
	    $HOME/.config/hypr/hyprpaper.conf &> /tmp/hyprpaper.conf
	hyprpaper -c /tmp/hyprpaper.conf &
	sleep ${INTERVAL}
done
