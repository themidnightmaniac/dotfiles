# Basic
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

# Data
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Config
export NVIMCFGPATH="$XDG_CONFIG_HOME/nvim"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"

# Custom
export MUSIC_DIR="$HOME/Music"
export USR_SRC_DIR=$HOME/.local/src
export player="mpd"
export EDITOR="nvim"
export VISUAL="nvim"

PATH=/usr/local/bin/:$HOME/.local/bin:$PATH
