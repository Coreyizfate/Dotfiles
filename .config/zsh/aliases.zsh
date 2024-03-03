#                                                                #
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
alias !\='cd $HOME/Documents'
alias ~='cd $HOME'
alias pers='cd $HOME/Personal'
alias personal='cd $HOME/Personal'
# File Navigation / List Contents of Working Directory (pwd)
alias ls='eza -A --color-scale=all --color-scale-mode=fixed --icons=always --no-quotes --sort name --group-directories-first --color=always'
alias ll='eza -lA --color-scale=all --color-scale-mode=fixed --icons=always --no-quotes --sort name --group-directories-first --color=always'
# Colorize 
alias dmesg='dmesg --color="auto"'
# Shortening common commandline utilities / apps
alias b='bat'
alias g='grep'
alias l='less'
alias v='nvim'
alias j='z'               # type j for jump isnteead of z to use zsh-z plugin
alias r='ranger'
alias f='yazi'
alias fm='yazi'
alias ya='yazi'
# Use fd within specified directories in search
alias fd='fd --exclude /usr/share/icons --exclude /run/media --exclude /usr/lib/python3.11 --exclude /opt/anaconda'   # excluding folders that i dont want & always show up
# Shortening emacs commands to the following aliases
alias em='emacsclient -t -a emacs'
alias emacs='emacsclient -t -a emacs'
alias doomclient='emacsclient -c -a emacs'
# Use AI in the terminal (multiple models available)
alias ai='tgpt'
alias gpt='tgpt -i'
alias oai='tgpt --model=opengpts -i'
alias llama='tgpt --model=llama2 -i'
alias phind='tgpt --model=phind -i'
alias bbai='tgpt --model=blackboxai -i'
alias blackboxai='tgpt --model=blackboxai -i'
alias blackbox='tgpt --model=blackboxai -i'
# Shortcut to move current directory
alias .downloads='cd /home/corey/Downloads'
alias .personal='cd /home/corey/Personal'
alias .nvim='cd /home/corey/.config/nvim'
alias .qtile='cd /home/corey/.config/qtile'
alias .kitty='cd /home/corey/.config/kitty'
alias .alac='cd /home/corey/.config/alacritty'
alias .alacritty='cd /home/corey/.config/alacritty'
alias .xautostart='cd /etc/xdg/autostart'
alias .xstart='cd /etc/xdg/autostart'
alias .xdgauto='cd /etc/xdg/autostart'
alias .xdgautostart='cd /etc/xdg/autostart'
alias .xdgstart='cd /etc/xdg/autostart'
alias .desktop='cd /usr/share/applications'
alias .ushareapp='cd /usr/share/applications'
alias .apps='cd /usr/share/applications'
alias .fonts='cd /usr/share/fonts'
# Aliases to add flags to rm command that are frequently used
alias rmrf='trash -rf'
alias srm='sudo trash'
alias srmrf='sudo trash -rf'
# Shortened command to edit file/open nvim with sudo
alias sv='sudo nvim'
# Shortened command to run ranger with sudo
alias sr='sudo ranger'
alias sf='sudo yazi'
alias sfm='sudo yazi'
alias sya='sudo yazi'
# Edit Qtile Configuration File
alias qtconf='$EDITOR ~/.config/qtile/config.py'
# Test run Qtile config.py with python
alias qttest='python ~/.config/qtile/config.py'
alias testqt='python ~/.config/qtile/config.py'
# Edit Kitty Configuration File
alias kittyconf='$EDITOR ~/.config/kitty/kitty.conf'
alias kitconf='$EDITOR ~/.config/kitty/kitty.conf'
# Edit Alacritty Configuration
alias alacconf='$EDITOR ~/.config/alacritty/alacritty.toml'
# Edit Autostart.sh | Startup Applications / Services
alias autostart='$EDITOR ~/bin/autostart.sh'
# Edit Picom Configuration File
alias piconf='$EDITOR ~/.config/picom.conf'
alias picomconf='$EDITOR ~/.config/picom.conf'
# Edit .zshrc - Add Plugins and/or Change Theme
alias zshrc='$EDITOR ~/.config/zsh/.zshrc'
# Edit .envrc - Environment Variabled
alias envzsh='$EDITOR ~/.config/zsh/env.zsh'
alias environment='sudo $EDITOR /etc/environment'
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
alias Rpkg='yay -R'
# Install package(s)
alias S='yay -S'
alias Spkg='yay -S'
# Fuzzy package searching & alternative package searching/finding
alias fzypkg='fpf'
alias fuzzypkg='fpf'
alias fzfpkg='fpf'
# Search for specific installed package with -Q and grep
alias fpkg='yay -Q | grep'
alias spkg='yay -Q | grep'
alias isinst='yay -Q | grep'
alias qg='yay -Q | grep'
alias Qg='yay -Q | grep'
# Search installed package with name & description provided
alias qsg='yay -Qs | grep'
alias Qsg='yay -Qs | grep'
# List All Installed Packages By Name
alias Qq='yay -Qq | $PAGER'
# List of all installed packages by name with description
alias aQs='yay -Qs | $PAGER'
alias aqs='yay -Qs | $PAGER'
# Get List Of Files Installed By Package - Package Associations
alias aql='yay -Qi | $PAGER'
alias aQl='yay -Qi | $PAGER'
alias Ql='yay -Ql | $PAGER'
alias ql='yay -Qi | $PAGER'
# Get Details(version,desc,url,group(s),provides,depends on,optional dependencies,requiredby,optionalfor,
# conflictswith,replaces,size,packager,builddate,installdate,installreason,installscript,& validatedby
alias aQi='yay -Qi | $PAGER'
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
