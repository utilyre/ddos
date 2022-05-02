#!/bin/bash

export XDG_DOCUMENTS_HOME="$HOME/Documents"
export XDG_DOWNLOADS_HOME="$HOME/Downloads"
export XDG_MUSIC_HOME="$HOME/Music"
export XDG_PICTURES_HOME="$HOME/Pictures"
export XDG_PUBLIC_HOME="$HOME/Public"
export XDG_VIDEOS_HOME="$HOME/Videos"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$PATH:$HOME/.local/bin"

export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config.ini"
export LF_CACHE_DIR="$XDG_CACHE_HOME/lf"
export PASSWORDS_DIR="$XDG_DATA_HOME/passwords"
export HISTFILE="$XDG_STATE_HOME/shell"
export LESSHISTFILE="$XDG_STATE_HOME/less"
export WALIRESFILE="$XDG_STATE_HOME/wali"
export XAUTHORITY="$XDG_RUNTIME_DIR/xauthority"

export TERMINAL="/bin/st"
export EDITOR="/bin/nvim"

printenv | awk --field-separator="=" "(\$1 ~ /^XDG_.+_HOME\$/) { print \$2 }" | xargs --delimiter="\n" mkdir --parents
startx "$XDG_CONFIG_HOME/x11/xinitrc"
