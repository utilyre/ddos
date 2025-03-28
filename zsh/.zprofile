#!/bin/zsh

[ -n "$XINIT_CONFIG" ] && return

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

export XINIT_CONFIG="$XDG_CONFIG_HOME/x11/xinitrc"
export XPROFILE_CONFIG="$XDG_CONFIG_HOME/x11/xprofile"
export LF_CACHE="$XDG_CACHE_HOME/lf"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
export ZSH_DATA="$XDG_DATA_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GUARD_DATA="$XDG_DATA_HOME/guard"
export WALI_STATE="$XDG_STATE_HOME/wali"
export LESSHISTFILE="$XDG_STATE_HOME/less"
export HISTFILE="$XDG_STATE_HOME/shell"
export GUARD_STATE="$XDG_STATE_HOME/guard"
export XAUTHORITY="$XDG_RUNTIME_DIR/xauth.cookie"
export BSPWM_SOCKET="$XDG_RUNTIME_DIR/bspwm.sock"

export PAGER="less --raw-control-chars --use-color --color=\"P+kg\" --color=\"S+ky\" --color=\"d+b\" --color=\"u+m\""
export LS_COLORS="no=0;37:fi=0;37:ex=0;32:so=0;35:do=0;35:pi=0;33:ln=0;36:or=0;31:mi=0;31:di=1;34:tw=1;32:ow=1;32:st=1;32:cd=1;33:bd=1;37"
export LF_ICONS="no=:fi=:ex=:so=:do=:pi=:ln=:or=:mi=:di=:tw=:ow=:st=:cd=:bd="

printenv --null | awk --assign="RS=\0" --assign="ORS=\0" --assign="FS==" -- "(\$1 ~ /^XDG_.+_HOME\$/) { print \$2 }" | xargs --null -- mkdir --parents --
startx "$XINIT_CONFIG"
