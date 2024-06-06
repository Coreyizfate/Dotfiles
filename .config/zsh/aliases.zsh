#                                                                #
# This File Should Be Ran With '$SHELL' At Startup/Login         #
#                                                                # 
# As Well It Will Be Used By The ZSH Shell Which Is $SHELL       #
# Since It Has Been Set By 'chsh' As My Default SHELL            #
#                                                                #
# Primary Purpose Is Setting Aliases To Allow Shortened Commands #
#________________________________________________________________#
#       --------------------------------------------------       #
#                 ####   ALIASES   ####                          #
##################################################################

# Alias to basically export an environment variable for wget(to move from home dir)
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias yarn='yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config'


# Move to previous directories without typing 'cd'
alias .....='cd ../../../../'
alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ../'
alias ~='cd $HOME'

# File Navigation / List Contents of Working Directory (pwd)
alias ls='eza -A --color-scale=all --color-scale-mode=fixed --icons=always --no-quotes --sort name --group-directories-first --color=always'

alias ll='eza -lA --color-scale=all --color-scale-mode=fixed --icons=always --no-quotes --sort name --group-directories-first --color=always'

# Colorize 
alias dmesg='dmesg --color="auto"'

# Shortening common commandline utilities / apps
alias info='info --vi-keys'
alias b='bat'
alias g='grep'
alias v='nvim'
alias j='z'               # type j for jump isnteead of z to use zsh-z plugin
alias r='ranger'
alias ya='yazi'
alias sfm='sudo thunar'

# Excluding certain directories form the 'fd' command
alias fd='fd --exclude /usr/share/icons --exclude /run/media --exclude /usr/lib/python3.11 --exclude /opt/anaconda'

alias fzfp='fzf --preview "bat {}" --preview-window "right,50%,border-left" --bind "ctrl-/:change-preview-window(hidden|)"'

alias fzp='fzf --preview "bat {}" --preview-window "right,50%,border-left" --bind "ctrl-/:change-preview-window(hidden|)"'

# Aliases to add flags to rm command that are frequently used
alias rmrf='trash -rf'
alias srm='sudo trash'
alias srmrf='sudo trash -rf'

# Shortened command to edit file/open nvim with sudo
alias sv='sudo nvim'

# Shortened command to run ranger with sudo
alias sr='sudo ranger'
alias sya='sudo yazi'

# Edit Qtile Configuration File
alias qtconf='$EDITOR ~/.config/qtile/config.py'

# Test run Qtile config.py with python
alias qttest='python ~/.config/qtile/config.py'
alias testqt='python ~/.config/qtile/config.py'

# Edit Autostart.sh | Startup Applications / Services
alias autostart='$EDITOR ~/bin/autostart.sh'

# Edit .zshrc - Add Plugins and/or Change Theme
alias zshrc='$EDITOR ~/.config/zsh/.zshrc'

# Add/Modify Aliases File(s)
alias aliases='$EDITOR ~/.config/zsh/aliases.zsh'

# Git alias for bare repository & dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias add='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'
alias commit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit'

###########   Package Manager   ###########
#                                         #
#_________________________________________#

# Remove package(s)
alias R='yay -R'

# Install package(s)
alias S='yay -S'

# Info/Status Packages
alias P='yay -Ps'

# Fuzzy package searching & alternative package searching/finding
alias fzypkg='fpf'
alias fuzzypkg='fpf'
alias fzfpkg='fpf'

# Get Status information about Packages on system
alias Ps='yay -Ps'
alias pkgstat='yay -Ps'

# Search for specific installed package with -Q and grep
alias Qg='yay -Qq | grep'
alias qg='yay -Qq | grep'

# Search for packages explicitly installed with -Qe and grep
alias Qeg='yay -Qe | grep'
alias qeg='yay -Qe | grep'

# List All Installed Packages By Name
alias Qq='yay -Qq | $PAGER'
alias qq='yay -Qq | $PAGER'

# List all packages explicitly installed by name
alias Qe='yay -Qe | $PAGER'
alias qe='yay -Qe | $PAGER'

# List of all installed packages by name with description
alias Qs='yay -Qs | $PAGER'
alias qs='yay -Qs | $PAGER'

# Get List Of Files Installed By Package - Package Associations
alias Ql='yay -Ql | $PAGER'
alias ql='yay -Ql | $PAGER'

# Get Details(version,desc,url,group(s),provides,depends on,optional dependencies,requiredby,optionalfor,
# conflictswith,replaces,size,packager,builddate,installdate,installreason,installscript,& validatedby
alias Qi='yay -Qi | $PAGER'
alias qi='yay -Qi | $PAGER'

# Uses custom script to snapshot all subvolumes with specified description
alias snapall='sh ~/bin/snapall.sh'
alias snaproot='sudo snapper -c root create'
alias snaphome='sudo snapper -c home create'
alias snapvar='sudo snapper -c var create'

##########      ##########      ##########      ##########      ##########
#   Copied From Ultimate Bashrc
##########      ##########      ##########      ##########      ##########j<D-z>

# Show top ten processes
alias cpu='ps aux | sort -r -nk +4 | head'

# Show CPU information
alias cpuinfo='lscpu'

# Display amount of free and used memory
alias freemem='free -h'

# Show the USB device tree
alias usb='lsusb -t'

# Show the PCI device tree
alias pci='lspci -tv'

# Clear the screen with both clear and cls shorthand
alias clr='clear'
alias c='clear'

# Search and play YouTube videos in the terminal
alias yt='ytfzf -l -t'

# Check running processes - options used described below(commented within file)
alias ps='ps auxf'

    # When reporting a snapshot of the current processes:
    # a = all users
    # u = user-oriented format providing detailed information
    # x = list the processes without a controlling terminal
    # f = display a tree view of parent to child processes
