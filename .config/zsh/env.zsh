export PATH=$HOME/bin:$PATH:$HOME/.config/emacs/bin:$HOME/.local/share/gem/ruby/3.0.0/bin
export BROWSER=brave
export EDITOR=nvim
export VISUAL=nvim
export FCEDIT=nvim
export MANPAGER="bat -l man"
export PAGER=bat
export ZSH_COLORIZE_TOOL=pygmentize
export ZSH_COLORIZE_STYLE="material"

export FZF_DEFAULT_COMMAND="fd --exclude /proc --exclude /usr/share/icons --exclude /run/media --exclude /usr/lib/python3.11 --exclude /opt/anaconda"

# Declaring Env Variables for common applications/tools
export NVIM_CONFIG_FILE="$XDG_CONFIG_HOME"/nvim/init.lua
export YAZIRC="$XDG_CONFIG_HOME"/yazi/yazi.toml

# Below line was copied from DistroTube youtube video.
# export MANPAGER="sh -c 'col -bx | bat -l man -p'" 
# although the below option is working great.

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

#   |---------- Moving unnessesary things out of $HOME ----------|

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export GOPATH="$XDG_DATA_HOME"/go
export W3M_DIR="$XDG_DATA_HOME"/w3m
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export _Z_DATA="$XDG_DATA_HOME"/z
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_DATA_HOME"/java

# Only change if complete instructions from xdg-ninja
# export GNUPGHOME="$XDG_DATA_HOME"/gnupg
