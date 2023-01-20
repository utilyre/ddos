#!/bin/zsh

use() {
	mkdir --parents -- "$ZSH_DATA"
	repo="${1%:*}"
	dest="$ZSH_DATA/${repo##*/}"

	[ ! -d "$dest" ] && {
		printf -- "\e[33m\e[m \e[1m%s\e[m" "$repo"
		error="$(git clone --single-branch --filter="blob:none" -- "https://github.com/$repo.git" "$dest" 2>&1)" &&
			printf -- "\r\e[32m\e[m %s\n" "$repo" ||
			{
				printf -- "\r\e[31m\e[m %s\n" "$repo"
				printf -- "\e[31m%s\e[m\n\n" "$(printf -- "%s\n" "$error" | sed -- "s/^/> /")"
				return
			}
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
HISTSIZE="4096"
SAVEHIST="4096"

setopt globcomplete
setopt nolisttypes
autoload "compinit" && compinit -d "$ZSH_CACHE/zcompdump"
zmodload "zsh/complist"
zstyle ":completion:*" menu "select"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "$LS_COLORS"

use "utilyre/atmachine-prompt:atmachine-prompt.zsh-theme"
RPS1=""

use "zsh-users/zsh-autosuggestions:zsh-autosuggestions.zsh"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

setopt interactivecomments
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
