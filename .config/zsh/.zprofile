# Jus startx n chill

 . $ZDOTDIR/.zshenv-secret

export DISPLAY_WIDTH=$(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f 1 | head)
export DISPLAY_HEIGHT=$(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f 2 | head)

umask 77 # Haha nwo yuo cant see my home 

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx &> /dev/null
