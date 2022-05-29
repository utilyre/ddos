#!/bin/zsh

zinstall() {
	mkdir --parents "$ZDIR"
	plugin="$ZDIR/${1##*/}"

	[ ! -d "$plugin" ] && git clone --depth="1" "https://github.com/$1.git" "$plugin"
	source "$plugin/$2"
}

zupdate() {
	for d in "$ZDIR"/*; do
		[ ! -d "$d" ] && continue
		(cd "$d" && git pull)
	done
}

lfcd() {
	tmp="$(mktemp)"
	lfub -last-dir-path="$tmp" "$@"
	cd "$(cat "$tmp")"
	rm "$tmp"
}

alias grep="grep --color=\"auto\" --ignore-case"
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --group-directories-first --no-group --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"
alias g="git"
alias v="nvrs"
alias l="lfcd"

setopt appendhistory
setopt prompt_subst
setopt interactive_comments

HISTSIZE="4096"
SAVEHIST="4096"

autoload "vcs_info" && precmd() { vcs_info; }
zstyle ":vcs_info:*" enable "git"
zstyle ":vcs_info:*" check-for-changes "true"
zstyle ":vcs_info:git:*" formats " on %{$(tput bold setaf 5)%} %b%{$(tput sgr0)%}"
PS1=$'\n'"You're %{$(tput bold setaf 3)%} %n%{$(tput sgr0)%} in %{$(tput bold setaf 4)%} %c%{$(tput sgr0)%}\$vcs_info_msg_0_"
PS1+=$'\n'"%(?:%{$(tput setaf 2)%}:%{$(tput setaf 1)%})%{$(tput sgr0)%} "

zinstall "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
autoload "compinit" && compinit -d "$ZCOMPDUMP"
zmodload "zsh/complist"
zstyle ":completion:*" menu "select"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
bindkey -M "menuselect" "^[[Z" "reverse-menu-complete"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

zinstall "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[comment]="fg=241"

zinstall "softmoth/zsh-vim-mode" "zsh-vim-mode.plugin.zsh"
bindkey -M "viins" "jk" "vi-cmd-mode"
bindkey -M "viins" "kj" "vi-cmd-mode"
RPS1=""
KEYTIMEOUT="5"
MODE_CURSOR_VIINS="bar"
