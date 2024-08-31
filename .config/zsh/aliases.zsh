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

alias l.="eza -A | egrep '^\.'"

# Colorize 
alias dmesg='sudo dmesg --color="auto"'

# Shortening common commandline utilities / apps
alias info='info --vi-keys'
alias b='bat'
alias g='grep'
alias v='nvim'
alias vi='nvim'
alias j='z'               # type j for jump isnteead of z to use zsh-z plugin
alias ya='yazi'

# Excluding certain directories form the 'fd' command
alias fd='fd --exclude /usr/share/icons --exclude /run/media --exclude /usr/lib/python3.11 --exclude /opt/metasploit --exclude /opt/anaconda'

# Fuzzy search for files with a preview window of file contents on right 50%(can be hidden also)
alias fzf='fzf --preview "bat {}" --preview-window "right,50%,border-left" --bind "ctrl-/:change-preview-window(hidden|)"'

# chown & chmod aliases
alias own="sudo chown"
alias me="sudo chown corey:corey"
alias meR="sudo chown -R corey:corey"
alias mod="sudo chmod"
alias modR="sudo chmod -R"

# Aliases to add flags to rm command that are frequently used
alias del='trash'
alias rmrf='trash -rf'
alias sdel='sudo trash'
alias srmrf='sudo trash -rf'
alias sv='sudo -E nvim'

# Shortened command to run ranger with sudo
alias sya='sudo -E yazi'

# Edit Qtile Configuration File
alias qtconf='$EDITOR ~/.config/qtile/config.py'

# Test run Qtile config.py with python
alias qttest='python ~/.config/qtile/config.py'

# Search aliases

###############   ############   #################
#   #    #  #                      #  #      #   #
#   #    #  #     Edit Configs     #  #      #   #
#   #    #  #                      #  #      #   #
###############     ########     #################

alias eqtile="$EDITOR ~/.config/qtile/config.py"
alias eautostart="$EDITOR ~/bin/autostart.sh"
alias estartup="$EDITOR ~/bin/autostart.sh"
alias estart="$EDITOR ~/bin/autostart.sh"
alias ezsh="$EDITOR ~/.config/zsh/.zshrc"
alias ezshrc="$EDITOR ~/.config/zsh/.zshrc"
alias ebat="$EDITOR ~/.config/bat/config"
alias ekitty="$EDITOR ~/.config/kitty/kitty.conf"
alias eparu="$EDITOR ~/.config/paru/paru.conf"
alias etrizen="$EDITOR ~/.config/trizen/trizen.conf"
alias eaur="$EDITOR ~/.config/trizen/trizen.conf"
alias epacman="sudo $EDITOR /etc/pacman.conf"
alias eyay="$EDITOR ~/.config/yay/config.json"
alias ealias="$EDITOR ~/.config/zsh/aliases.zsh"
alias ealiases="$EDITOR ~/.config/zsh/aliases.zsh"
alias eenv="$EDITOR ~/.config/zsh/env.zsh"
alias epicom="$EDITOR ~/.config/picom.conf"
alias eyazi="$EDITOR ~/.config/yazi/yazi.toml"
alias eya="$EDITOR ~/.config/yazi/yazi.toml"
alias egrub="sudo $EDITOR /etc/default/grub"
alias egrubconf="sudo $EDITOR /boot/grub/grub.cfg"

# Git alias for bare repository & dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias add='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add'
alias commit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit'


   ######  #   #    ####  ^^^    ***        <<      |||      >>        ***    ^^^  ####    #   #  ######   
  ####### ##  ###  ###### ^^^  *******    <<  <<   || ||   >>  >>    *******  ^^^ ######  ###  ## #######  
 ######## ##  ###  ###### ^^^  ****               ||   ||               ****  ^^^ ######  ###  ## ######## 
######### ##  ###  ###### ^^^  ***     PACKAGES   || & ||   ALIASES      ***  ^^^ ######  ###  ## #########
 ######## ##  ###  ###### ^^^  ****               ||   ||               ****  ^^^ ######  ###  ## ######## 
  ####### ##  ###  ###### ^^^  *******    <<  <<   || ||   >>  >>    *******  ^^^ ######  ###  ## #######  
   ######  #   #    ####  ^^^    ***        <<      |||      >>        ***    ^^^  ####    #   #  ######



alias aur='trizen'

### Remove package(s)
alias R='paru -R'

# Install package(s)
alias S='paru -S'

# Info/Status Packages
alias P='paru -Ps'

# Fuzzy package searching & alternative package searching/finding
alias fzypkg='fpf'
alias fuzzypkg='fpf'
alias fzfpkg='fpf'

# Get Status information about Packages on system
alias Ps='paru -Ps'
alias pkgstat='paru -Ps'

# Check owner of file (which package if any)
alias qo='paru -Qo'
alias Qo='paru -Qo'
alias whoowns='paru -Qo'

# List packages sorted by newest install
alias pkgssortnew='pkghist -o compact -L 1 | $PAGER'
alias newpkgssort='pkghist -o compact -L 1 | $PAGER'
alias sortnewpkgs='pkghist -o compact -L 1 | $PAGER'
alias pkgstail='pkghist -o compact -L 1 --last 25'
alias tailpkgs='pkghist -o compact -L 1 --last 25'

# Search for specific installed package with -Q and grep
alias Qg='paru -Qq | grep'
alias qg='paru -Qq | grep'

# Search for packages explicitly installed with -Qe and grep
alias Qeg='paru -Qqe | grep'
alias qeg='paru -Qqe | grep'

# List All Installed Packages By Name
alias Qq='paru -Qq | $PAGER'
alias qq='paru -Qq | $PAGER'

# List all packages explicitly installed by name
alias Qe='paru -Qqe | $PAGER'
alias qe='paru -Qqe | $PAGER'

# List of all installed packages by name with description
alias Qs='paru -Qs | $PAGER'
alias qs='paru -Qs | $PAGER'

# Get List Of Files Installed By Package - Package Associations
alias Ql='paru -Ql | $PAGER'
alias ql='paru -Ql | $PAGER'

# Get package information details using paru
alias Qi='paru -Qi | $PAGER'
alias qi='paru -Qi | $PAGER'

# Uses custom script to snapshot all subvolumes with specified description
alias snapall='sh ~/bin/snapall.sh'
alias snaproot='sudo snapper -c root create'
alias snaphome='sudo snapper -c home create'
alias snapvar='sudo snapper -c var create'




##################     ######   ##   ##########   ##   ######     #################
#      #     #                                                        #    #      #
#      #     #       ALIASES FROM ARCOLINUX DEFUALT BASHRC FILE       #    #      #
#      #     #                                                        #    #      #
##################     ######   ##   ##########   ##   ######     #################




# show the list of packages that need this package - depends mpv as example
function_depends()  {
    search=$(echo "$1")
    sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
    }

alias depends='function_depends'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#userlist
alias userlist="cut -d: -f1 /etc/passwd | sort"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'
alias upd='sudo pacman -Syyu'

# paru as aur helper - updates everything
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#grub issue 08/2022
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArcoLinux"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#skel alias has been replaced with a script at /usr/local/bin/skel

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#switch between displaymanager or bootsystem
alias toboot="sudo /usr/local/bin/arcolinux-toboot"
alias togrub="sudo /usr/local/bin/arcolinux-togrub"
alias torefind="sudo /usr/local/bin/arcolinux-torefind"
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill polybar
alias kp='killall polybar'
# quickly kill picom
alias kpi='killall picom'

#hardware info --short
alias hw="hwinfo --short"

#audio check pulseaudio or pipewire
alias audio="pactl info | grep 'Server Name'"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#approximation of how old your hardware is
alias howold="sudo lshw | grep -B 3 -A 8 BIOS"

#check cpu
alias cpu="cpuid -i | grep uarch | head -n 1"

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#enabling vmware services
alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
alias vmware-start="sudo systemctl enable --now vmtoolsd.service"

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -30 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | bat"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"
alias isoo="cat /etc/dev-rel"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# install packages from list
# pacman -S --needed - < my-list-of-packages.txt

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nvim for important configuration files
#know what you do in these files
alias emakepkg="sudo $EDITOR /etc/makepkg.conf"
alias emkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias emirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias earcomirrorlist="sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias esddm="sudo $EDITOR /etc/sddm.conf"
alias esddmkde="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias efstab="sudo $EDITOR /etc/fstab"
alias ensswitch="sudo $EDITOR /etc/nsswitch.conf"
alias esamba="sudo $EDITOR /etc/samba/smb.conf"
alias egnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias ehosts="sudo $EDITOR /etc/hosts"
alias ehostname="sudo $EDITOR /etc/hostname"
alias eresolv="sudo $EDITOR /etc/resolv.conf"
alias eb="$EDITOR ~/.bashrc"
alias ez="$EDITOR ~/.zshrc"
alias ef="$EDITOR ~/.config/fish/config.fish"
alias eplymouth="sudo $EDITOR /etc/plymouth/plymouthd.conf"
alias evconsole="sudo $EDITOR /etc/vconsole.conf"
alias eenvironment="sudo $EDITOR /etc/environment"
alias eloader="sudo $EDITOR /boot/efi/loader/loader.conf"
alias erefind="sudo $EDITOR /boot/refind_linux.conf"
alias ealacritty="nvim $HOME/.config/alacritty/alacritty.toml"

#removing packages
alias rkmix="arcolinux-remove-kmix"

#reading logs with bat
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"
alias lqtile="bat $HOME/.local/share/qtile/qtile.log"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
#fix-sddm-config is no longer an alias but an application - part of ATT
#alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
alias fix-grub="sudo /usr/local/bin/arcolinux-fix-grub"
alias fixgrub="sudo /usr/local/bin/arcolinux-fix-grub"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias shutdown="sudo shutdown now"

#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"
alias xdw="ls /usr/share/wayland-sessions"

#give a list of the kernels installed
alias kernel="ls /usr/lib/modules"
alias kernels="ls /usr/lib/modules"

#am I on grub,systemd-boot or refind
alias boot="sudo /usr/local/bin/arcolinux-boot"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#wayland aliases
alias wsimplescreen="wf-recorder -a"
alias wsimplescreenrecorder="wf-recorder -a -c h264_vaapi -C aac -d /dev/dri/renderD128 --file=recording.mp4"

#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#git
alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"

#pamac
alias pamac-unlock="sudo rm /var/tmp/pamac/dbs/db.lock"



##################     ######   ##   ##########   ##   ######     #################
#      #     #                                                        #    #      #
#      #     #              Copied From Ultimate Bashrc               #    #      #
#      #     #                                                        #    #      #
##################     ######   ##   ##########   ##   ######     #################



# Command line system information script for console and IRC
alias infoutils='man inxi'     # >
alias lssys='man inxi'         # >>
alias infols='man inxi'        # >>>
alias infohelp='man inxi'      # >>>> View options/parameters for 'inxi' (detailed system info)
alias syshelp='man inxi'       # >>>
alias sysinfohelp='man inxi'   # >>
alias sysinfoh='man inxi'      # >

alias infoutil='inxi'
alias sysinfo='inxi'
alias sys='inxi'
alias sinfo='inxi'
alias lsinfo='inxi'

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

    # When reporting a snapshot of the current processes:
    # a = all users
    # u = user-oriented format providing detailed information
    # x = list the processes without a controlling terminal
    # f = display a tree view of parent to child processes
