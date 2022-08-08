#!/bin/zsh

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
setopt nolisttypes
setopt interactivecomments
bindkey -e

HISTSIZE="1024"
SAVEHIST="1024"
PS1="%B%F{blue}%~%f%b %(?.%F{green}.%F{red})%(!.#.$)%f "

zmodload "zsh/complist"
autoload "compinit" && compinit -d "$ZSH_CACHE/zcompdump"
zstyle ":completion:*" menu "select"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "$LS_COLORS"
