#!/bin/zsh

zuse() {
	mkdir --parents -- "$ZSH_DATA"
	repo="${1%:*}"
	dest="$ZSH_DATA/${repo##*/}"

	[ ! -d "$dest" ] && git clone --depth="1" -- "https://github.com/$repo.git" "$dest"
	source -- "$dest/${1##*:}"
}

lfcd() {
	tmp="$(mktemp)"
	cough --last-dir-path="$tmp" "$@"

	cd -- "$(cat -- "$tmp")"
	rm -- "$tmp"
}

alias grep="grep --color=\"auto\""
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --group-directories-first --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"
alias lf="lfcd"
alias g="git"
alias v="rvim"

setopt appendhistory
setopt histignorealldups
setopt promptsubst
setopt transientrprompt
setopt nolisttypes
setopt interactivecomments

HISTSIZE="1024"
SAVEHIST="1024"

autoload "vcs_info" && precmd() { vcs_info; }
zstyle ":vcs_info:*" check-for-changes "true"
zstyle ":vcs_info:*" formats "─%B%F{magenta}%K{magenta}%F{black}  %b %k%F{magenta}"
zstyle ":vcs_info:*" actionformats "─%B%F{magenta}%K{magenta}%F{black}  %b %K{yellow}%F{magenta}%F{black}  %a %k%F{yellow}"
PS1=$'\n'"%B%F{blue}%K{blue}%F{black}  %c %(?.%K{green}.%K{red})%F{blue}%F{black} %(?.. %?) %k%(?.%F{green}.%F{red})%f%k%b\$vcs_info_msg_0_%f%k%b "

zuse "zsh-users/zsh-autosuggestions:zsh-autosuggestions.zsh"
autoload "compinit" && compinit -d "$ZSH_CACHE/zcompdump"
zmodload "zsh/complist"
zstyle ":completion:*" menu "select"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "$LS_COLORS"
bindkey -M "menuselect" "^[[z" "reverse-menu-complete"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

zuse "zsh-users/zsh-syntax-highlighting:zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_HIGHLIGHTERS=("main" "brackets")
ZSH_HIGHLIGHT_STYLES[comment]="fg=241"

zuse "softmoth/zsh-vim-mode:zsh-vim-mode.plugin.zsh"
bindkey -M "viins" "jk" "vi-cmd-mode"
bindkey -M "viins" "kj" "vi-cmd-mode"
KEYTIMEOUT="5"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_SEARCH="underline"
MODE_INDICATOR_VICMD="%B%F{green}%K{green}%F{black} NORMAL %k%F{green}%f%k%b"
MODE_INDICATOR_VIINS="%B%F{blue}%K{blue}%F{black} INSERT %k%F{blue}%f%k%b"
MODE_INDICATOR_VISUAL="%B%F{magenta}%K{magenta}%F{black} VISUAL %k%F{magenta}%f%k%b"
MODE_INDICATOR_VLINE="%B%F{magenta}%K{magenta}%F{black} V-LINE %k%F{magenta}%f%k%b"
MODE_INDICATOR_REPLACE="%B%F{red}%K{red}%F{black} REPLACE %k%F{red}%f%k%b"
MODE_INDICATOR_SEARCH="%B%F{yellow}%K{yellow}%F{black} COMMAND %k%F{yellow}%f%k%b"

zuse "hlissner/zsh-autopair:autopair.zsh"
autopair-init
