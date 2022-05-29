#!/bin/zsh

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

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config.ini"
export ZCOMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export LF_CACHE_DIR="$XDG_CACHE_HOME/lf"
export ZDIR="$XDG_DATA_HOME/zsh"
export PASSWORDS_DIR="$XDG_DATA_HOME/passwords"
export HISTFILE="$XDG_STATE_HOME/shell"
export LESSHISTFILE="$XDG_STATE_HOME/less"
export WALIRESFILE="$XDG_STATE_HOME/wali"
export XAUTHORITY="$XDG_RUNTIME_DIR/xauthority"

export LESS_TERMCAP_md="$(tput bold setaf 4)"
export LESS_TERMCAP_me="$(tput sgr0)"
export LESS_TERMCAP_us="$(tput sitm setaf 5)"
export LESS_TERMCAP_ue="$(tput sgr0)"
export LESS_TERMCAP_so="$(tput setab 3 setaf 0)"
export LESS_TERMCAP_se="$(tput sgr0)"

printenv | awk --field-separator="=" "(\$1 ~ /^XDG_.+_HOME\$/) { print \$2 }" | xargs --delimiter="\n" mkdir --parents
startx "$XDG_CONFIG_HOME/x11/xinitrc"
