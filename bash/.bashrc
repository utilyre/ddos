#!/bin/bash

export EDITOR="/bin/nvim"
export LESS_TERMCAP_md="$(tput bold setaf 1)"
export LESS_TERMCAP_me="$(tput sgr0)"
export LESS_TERMCAP_us="$(tput sitm setaf 2)"
export LESS_TERMCAP_ue="$(tput sgr0)"
export LESS_TERMCAP_so="$(tput setab 3 setaf 0)"
export LESS_TERMCAP_se="$(tput sgr0)"

shopt -s "autocd" "histverify"
alias grep="grep --color=\"auto\" --ignore-case"
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --group-directories-first --no-group --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"

bind "set editing-mode vi"
bind "set keyseq-timeout 50"
bind "set show-mode-in-prompt on"
bind "set vi-cmd-mode-string \1\e[2 q\2"
bind "set vi-ins-mode-string \1\e[6 q\2"
bind "\"jk\": vi-movement-mode"
bind "\"kj\": vi-movement-mode"
bind "\c-l:clear-screen"

ps_arrow() {
	printf "\001%s\002" "$([ "$?" -eq "0" ] && tput setaf 2 || tput setaf 1)"
	printf "%s" "$(echo "|-> >-> ->> |=> >=> =>> ~~> ||>" | tr " " "\n" | shuf --head-count="1")"
	printf "\001%s\002" "$(tput sgr0)"
}

ps_cwd() {
	printf "\001%s\002" "$([ -h "$PWD" ] && tput bold setaf 6 || tput bold setaf 4)"

	if [ "$PWD" = "$HOME" ]; then
		printf "%s" ""
	elif [ -h "$PWD" ]; then
		printf "%s" ""
	elif [ -z "$(ls --almost-all)" ]; then
		printf "%s" ""
	else
		printf "%s" ""
	fi
	printf " %s" "$(huma --component="basename" "$PWD")"

	printf "\001%s\002" "$(tput sgr0)"
}

ps_git() {
	git rev-parse 2> "/dev/null" || return
	printf "\001%s\002" "$(tput bold setaf 5)"

  [ -n "$(git status --porcelain)" ] && printf "%s " ""
	case "$(git remote --verbose)" in
		*"github.com"*) printf "%s" "" ;;
		*"gitlab.com"*) printf "%s" "" ;;
		*) printf "%s" "" ;;
	esac
	printf " %s" "$(git branch --show-current | grep --extended-regexp "^.+$" || git rev-parse --short "HEAD")"

	printf "\001%s\002 " "$(tput sgr0)"
}

PS1="\n\$(ps_arrow) \$(ps_cwd) \$(ps_git)"
