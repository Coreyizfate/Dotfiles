#!/bin/bash


# Executes autostart desktop files.
dex -a --term kitty &

# Stop sleep/screensaver from being triggered from idle.
xset s off &
xset s noblank &
xset -dpms &

# Hides mouse curser when not in use
unclutter --ignore-scrolling --start-hidden &

# Rclone to mount Google Drive
rclone mount googledrive:/ ~/GDrive &

# Automount removeable media. Thumb drives, External SSDs, & more.
udiskie &

# Start Polkit Authentication Agent - Allows dialog box prompt for sudo/admin privilege granting
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
