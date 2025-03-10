#!/bin/zsh

use() {
	mkdir --parents -- "$ZSH_DATA"
	dest="$ZSH_DATA/${1##*/}"

	[ ! -d "$dest" ] && {
		printf -- "\e[33m\e[m \e[1m%s\e[m" "$1"
		error="$(git clone --single-branch --filter="blob:none" -- "https://github.com/$1.git" "$dest" 2>&1)" &&
			printf -- "\r\e[32m\e[m %s\n" "$1" || {
				printf -- "\r\e[31m\e[m %s\n" "$1"
				printf -- "\e[31m%s\e[m\n\n" "$(printf -- "%s\n" "$error" | sed -- "s/^/> /")"

				read -sk "?[Press any key to exit]"
				exit "1"
			}
	}

	. -- "$dest/$2"
}

lf_autocd() {
	tmp="$(mktemp)"
	lf --last-dir-path="$tmp" "$@"

	cd -- "$(cat -- "$tmp")"
	rm -- "$tmp"
}

alias grep="grep --color=\"auto\""
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --hyperlink=\"auto\" --group-directories-first --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"
alias lf="lf_autocd"

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

use "woefe/git-prompt.zsh" "git-prompt.plugin.zsh"
setopt promptsubst
PS1="%F{%(?:green:red)}➜%f %B%F{cyan}%c%b%f \$(gitprompt)"
RPS1=""
ZSH_GIT_PROMPT_SHOW_STASH="true"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}(%f"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue})%f "
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%F{yellow}%f %F{magenta}"
ZSH_THEME_GIT_PROMPT_DETACHED="%F{yellow}%f %F{magenta}"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{red}↓"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{green}↑"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}?"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%F{red}!"
ZSH_THEME_GIT_PROMPT_STAGED="%F{green}+"
ZSH_THEME_GIT_PROMPT_STASHED="%F{cyan}$"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}="

use "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.plugin.zsh"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")

use "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.plugin.zsh"
