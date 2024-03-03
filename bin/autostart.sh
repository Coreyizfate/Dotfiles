#!/bin/sh

# Using Dex To Execute .Desktop Files In Autostart Folders
dex -a --term kitty & disown

# Automount removeable media. Thumb drives, External SSDs, & more.
udiskie & disown

emacs --daemon

# Hides mouse curser when not in use
unclutter --ignore-scrolling --start-hidden & disown

# Start Polkit Authentication Agent - Allows dialog box prompt for sudo/admin privilege granting
/usr/lib/polkit-kde-authentication-agent-1 & disown
