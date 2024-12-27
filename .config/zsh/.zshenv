XDG_STATE_HOME="$HOME/.log"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/ncho/.config"
EDITOR="nvim"
VISUAL="nvim"
MESA_LOADER_DRIVER_OVERRIDE=iris

# DATA
GNUPGHOME="$XDG_DATA_HOME"/gnupg

# CONFIG
NVIMCFGPATH="$XDG_CONFIG_HOME/nvim"
WGETRC="$XDG_CONFIG_HOME/wgetrc"

# CUSTOM
MUSIC_DIR="$HOME/Music"
USR_SRC_DIR=$HOME/.local/src
player="mpd"

#$PATH
export PATH=/usr/local/bin/:$HOME/.local/bin:$PATH
