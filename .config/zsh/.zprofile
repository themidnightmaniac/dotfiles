# Source secret env
#. $ZDOTDIR/.zshenv-secret

# Get screen widht and height
export DISPLAY_WIDTH=$(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f 1 | head)
export DISPLAY_HEIGHT=$(xrandr | grep '*' | awk '{print $1}' | cut -d 'x' -f 2 | head)

# Clear the terminal from any errors
clear

# Prevent other users reading/writing/executing files created by me.
umask 77

# Start X server
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx &> /dev/null
