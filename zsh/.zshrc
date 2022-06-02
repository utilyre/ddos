#!/bin/zsh

zuse() {
	mkdir --parents "$ZDIR"
	repo="${1%:*}"
	dest="$ZDIR/${repo##*/}"

	[ ! -d "$dest" ] && git clone --depth="1" "https://github.com/$repo.git" "$dest"
	source "$dest/${1##*:}"
}

alias grep="grep --color=\"auto\" --ignore-case"
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --group-directories-first --no-group --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"
alias lf="cd \"\$(lfcd)\""
alias g="git"
alias v="nvrs"

setopt appendhistory
setopt promptsubst
setopt nolisttypes
setopt interactivecomments

HISTSIZE="4096"
SAVEHIST="4096"

autoload "colors" && colors
autoload "vcs_info" && precmd() { vcs_info; }
zstyle ":vcs_info:*" check-for-changes "true"
zstyle ":vcs_info:*" stagedstr "%{$fg[green]%}+%{$reset_color%}"
zstyle ":vcs_info:*" unstagedstr "%{$fg[yellow]%}!%{$reset_color%}"
zstyle ":vcs_info:git:*" formats " on %{$fg_bold[magenta]%} %b%{$reset_color%}%c%u"
zstyle ":vcs_info:git:*" actionformats " on %{$fg_bold[magenta]%} %b%{$reset_color%}%c%u doing %{$fg_bold[cyan]%} %a%{$reset_color%}"
PS1=$'\n'"You're %{$fg_bold[yellow]%} %n%{$reset_color%} in %{$fg_bold[blue]%} %c%{$reset_color%}\$vcs_info_msg_0_"
PS1+=$'\n'"%(?:%{$fg[green]%}:%{$fg[red]%})%{$reset_color%} "
RPS1="%(?:%{$fg[green]%}:%{$fg[red]%})%{$reset_color%}"

zuse "zsh-users/zsh-autosuggestions:zsh-autosuggestions.zsh"
autoload "compinit" && compinit -d "$ZCOMPDUMP"
zmodload "zsh/complist"
zstyle ":completion:*" menu "select"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "$LS_COLORS"
bindkey -M "menuselect" "^[[Z" "reverse-menu-complete"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

zuse "zsh-users/zsh-syntax-highlighting:zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[comment]="fg=241"

zuse "softmoth/zsh-vim-mode:zsh-vim-mode.plugin.zsh"
bindkey -M "viins" "jk" "vi-cmd-mode"
bindkey -M "viins" "kj" "vi-cmd-mode"
KEYTIMEOUT="5"
MODE_CURSOR_VIINS="bar"
