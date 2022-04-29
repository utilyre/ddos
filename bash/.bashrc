#!/bin/bash

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
bind "set keyseq-timeout 500"
bind "set show-mode-in-prompt on"
bind "set vi-cmd-mode-string \1\e[2 q\2"
bind "set vi-ins-mode-string \1\e[6 q\2"
bind "\"jj\": vi-movement-mode"
bind "\c-l:clear-screen"

eval "$(soni init)"
