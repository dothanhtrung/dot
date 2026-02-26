#!/bin/bash
grim /tmp/screen.png
convert /tmp/screen.png -scale 5% -scale 2000% /tmp/screen.png
convert /tmp/screen.png ~/.local/share/icons/lock.png -gravity center -composite -matte /tmp/screen.png
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
hyprlock
#rm /tmp/screen.png
