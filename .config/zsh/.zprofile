# Source secret env
. $ZDOTDIR/.zshenv-secret

# Clear the terminal from any errors
clear

# Prevent other users reading/writing/executing files created by me.
umask 77

# Start X server
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx &> /dev/null
