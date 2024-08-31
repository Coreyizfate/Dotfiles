#!/bin/env bash


# Using Dex To Execute .Desktop Files In Autostart Folders
dex -a --term kitty &

# Automount removeable media. Thumb drives, External SSDs, & more.
udiskie &

# Hides mouse curser when not in use
unclutter --ignore-scrolling --start-hidden &

xset s off
xset s noblank
xset -dpms

# Start Polkit Authentication Agent - Allows dialog box prompt for sudo/admin privilege granting
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
