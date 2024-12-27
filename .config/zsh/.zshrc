#History
HISTFILE=$HOME/.log/histfile
HISTSIZE=1000
SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

#Enable Colors and Customize the Promt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#Super Globs
setopt autocd extendedglob
setopt extendedglob
setopt auto_cd
unsetopt caseglob

#Remember a Command Without Executing it
setopt interactivecomments

#Display Usage After 10 Seconds
REPORTTIME=10

#Autocompletion
autoload -U compinit
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


# Change cursor shape for different vi modes.
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
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#ls Colors
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

bindkey -v

zstyle :compinstall filename '/home/ncho/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'

. "${HOME}/.cache/wal/colors.sh" 2> /dev/null
# Import Colorscheme From 'wal' Asynchronously
# &   # Run the Process In The Background.
# ( ) # Hide Shell Job Control Messages.
(cat ~/.cache/wal/sequences 2> /dev/null &)

#Aliases:
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

alias news='newsraft'
alias detach='udiskie-umount --force --detach'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias ll='ls -l'
alias la='ls -a'
alias xbindkeys='xbindkeys -f $HOME/.config/.xbindkeysrc'
alias updateblocks='for i in {1..6}; do pkill -RTMIN+"$i" dwmblocks;done;unset i'
alias reboot='loginctl reboot'
alias poweroff='loginctl poweroff'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

#Terminal Bindings

# Set Wallpaper Script
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

#Extract Script
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

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
