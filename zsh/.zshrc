#!/bin/zsh

use() {
	mkdir --parents -- "$ZSH_DATA"
	repo="${1%:*}"
	dest="$ZSH_DATA/${repo##*/}"

	[ ! -d "$dest" ] && {
		printf -- "\e[33m\e[m \e[1m%s\e[m" "$repo"
		git clone --single-branch --filter="blob:none" -- "https://github.com/$repo.git" "$dest" 2> "/dev/null"
		printf -- "\r\e[32m\e[m %s\n" "$repo"
	}
	. -- "$dest/${1##*:}"
}

lf() {
	tmp="$(mktemp)"
	tough --last-dir-path="$tmp" "$@"

	cd -- "$(cat -- "$tmp")"
	rm -- "$tmp"
}

alias grep="grep --color=\"auto\""
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --hyperlink=\"auto\" --group-directories-first --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"

setopt appendhistory
setopt histignorealldups
setopt promptsubst
setopt nolisttypes
setopt interactivecomments

HISTSIZE="4096"
SAVEHIST="4096"

autoload "vcs_info" && precmd() { vcs_info; }
zstyle ":vcs_info:*" check-for-changes "true"
zstyle ":vcs_info:*" formats "-%F{magenta}%K{magenta}%F{black}  %b %k%F{magenta}"
zstyle ":vcs_info:*" actionformats "-%F{magenta}%K{magenta}%F{black}  %b %K{yellow}%F{magenta}%F{black}  %a %k%F{yellow}"
PS1=$'\n'"%F{blue}%K{blue}%F{black}  %2~ %(?.%K{green}.%K{red})%F{blue}%F{black} %(?.. %?) %k%(?.%F{green}.%F{red})%f%k\$vcs_info_msg_0_%f%k "
RPS1=""

use "zsh-users/zsh-autosuggestions:zsh-autosuggestions.zsh"
autoload "compinit" && compinit -d "$ZSH_CACHE/zcompdump"
zmodload "zsh/complist"
zstyle ":completion:*" menu "select"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "$LS_COLORS"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

use "zsh-users/zsh-syntax-highlighting:zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[comment]="fg=241"

use "softmoth/zsh-vim-mode:zsh-vim-mode.plugin.zsh"
bindkey -M "viins" "jk" "vi-cmd-mode"
bindkey -M "viins" "kj" "vi-cmd-mode"
bindkey -M "viins" "^p" "reverse-menu-complete"
bindkey -M "viins" "^n" "menu-complete"
bindkey -M "viins" "^i" "menu-complete"
bindkey -M "menuselect" "^i" "accept-line"
KEYTIMEOUT="5"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_SEARCH="underline"
