# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_CONFIG=~/.config/zsh
export HISTFILE=~/.config/zsh/history
export HISTORY_IGNORE="(clear|ls)"
export HISTSIZE=100000
export SAVEHIST=100000
setopt appendhistory     # Append history to the history file (no overwriting)
setopt sharehistory      # Share history across terminals
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed 

source /usr/share/zinit/zinit.zsh
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light kutsan/zsh-system-clipboard
zinit light hsienjan/colorize
zinit light Freed-Wu/zsh-help
zinit light mdumitru/fancy-ctrl-z
zinit light fourdim/zsh-archlinux
zinit light hchbaw/auto-fu.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k


autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/corey/.zshrc'




autoload -U compinit; compinit
autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
zmodload zsh/complist
_comp_options+=(globdots)   
# [ ! -d "$XDG_CACHE_HOME/zsh" ] && mkdir "$XDG_CACHE_HOME/zsh"


# Adding zoxide completion (z)
eval "$(zoxide init zsh)"

# Automatically cd into directories by just typing the directory name
setopt autocd

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

### VIM mode config
# Summery:
#  Allows you to use press ESC and then use VIM keys to edit
#  the command currently have in the command line.
#  When you are in INSERT mode, the cursor is a beam and in 
#  NORMAL mode, the cursor is a BLOCK. This makes it easer for us
#  to know what mode we are in.

# Activate vim mode.
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Jump to beginning using H and the end using L in NORMAL mode
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line

# Open current command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

# Prevent backspace key from not working: https://git.io/J48z9
bindkey "^?" backward-delete-char

# This brings the cursor back to the beam instead of the block cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ===============================
# ===     Custom Bindings     ===
# ===============================

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

precmd_functions+=(_fix_cursor)


# Sourcing custom personal files [aliases, environment settings, etc.]

if [[ -f $ZSH_CONFIG/aliases.zsh ]]; then
    source $ZSH_CONFIG/aliases.zsh
fi

if [[ -f $ZSH_CONFIG/env.zsh ]]; then
    source $ZSH_CONFIG/env.zsh
fi


# Allow changing cwd when exiting Yazi File Manager

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

autoload -Uz compinit
fpath+=~/.zfunc
