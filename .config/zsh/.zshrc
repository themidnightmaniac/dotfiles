# My personal .zshrc. Pretty cool huh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTFILE=$HOME/.log/histfile
HISTSIZE=1000
SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

# Enable colors and customize the promt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Super globs
setopt autocd extendedglob
setopt extendedglob
setopt auto_cd
unsetopt caseglob

# Remember a command without executing it
setopt interactivecomments

# Display usage after 10 seconds
REPORTTIME=10

# Autocompletion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Change cursor shape for different vi-like modes.
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

# Initialize vi-like mode
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# ls colors
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# ?
bindkey -v

# grep colors
alias grep='grep --color=auto'

# Load wal colorscheme
. "${HOME}/.cache/wal/colors.sh" 2> /dev/null
(cat ~/.cache/wal/sequences 2> /dev/null &)

# Aliases:

alias ll='ls -l'
alias la='ls -a'
alias news='newsraft'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias xbindkeys='xbindkeys -f $HOME/.config/.xbindkeysrc'
alias updateblocks='for i in {1..6}; do pkill -RTMIN+"$i" dwmblocks;done;unset i'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias reboot='loginctl reboot'
alias poweroff='loginctl poweroff'

# Scripts

# Set Wallpaper 
setwall () {
	if [[ -z "{$2}" ]]; then return 1; fi
	if [[ -f "${1}" && ! -z "${1}" ]]; then
		echo  "--${2}" "${1}" > "$HOME/.local/share/wallpaper"
		wal -i "${1}" -n 1> /dev/null
		xwallpaper "--${2}" "${1}" --daemon --clear
		cd .local/src/dwm && rm config.h && make install
	else
		echo "Please provide an image file"
		return 1
	fi
	return 0;
}

# Extract 
extract () {
   if [ -f $1 ] ; then

       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# Enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
