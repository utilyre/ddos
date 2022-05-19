#!/bin/zsh

export EDITOR="/bin/nvim"
export LESS_TERMCAP_md="$(tput bold setaf 4)"
export LESS_TERMCAP_me="$(tput sgr0)"
export LESS_TERMCAP_us="$(tput sitm setaf 5)"
export LESS_TERMCAP_ue="$(tput sgr0)"
export LESS_TERMCAP_so="$(tput setab 3 setaf 0)"
export LESS_TERMCAP_se="$(tput sgr0)"

alias grep="grep --color=\"auto\" --ignore-case"
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --group-directories-first --no-group --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"

zinstall() {
	mkdir --parents "$ZPLUG_DIR"
	plugin="$ZPLUG_DIR/${1##*/}"

	[ ! -d "$plugin" ] && git clone --quiet --depth="1" "https://github.com/$1.git" "$plugin"
	[ -n "$2" ] && source "$plugin/$2"
	fpath+="$plugin"
}

zupdate() {
	for d in "$ZPLUG_DIR"/*; do
		[ ! -d "$d" ] && continue
		(cd "$d" && git pull --quiet)
	done
}

setopt "appendhistory"
SAVEHIST="4096"

zinstall "jeffreytse/zsh-vi-mode" "zsh-vi-mode.zsh"
zvm_after_init() {
	zvm_bindkey "viins" "jk" "zvm_exit_insert_mode"
	zvm_bindkey "viins" "kj" "zvm_exit_insert_mode"
}
ZVM_KEYTIMEOUT="0.05"

zinstall "sindresorhus/pure"
autoload "promptinit" && promptinit
prompt "pure"
zstyle ":prompt:pure:prompt:success" "color" "green"
zstyle ":prompt:pure:git:branch" "color" "magenta"
PURE_PROMPT_SYMBOL="||>"
PURE_PROMPT_VICMD_SYMBOL="<||"
PURE_GIT_DOWN_ARROW="<"
PURE_GIT_UP_ARROW=">"
PURE_GIT_STASH_SYMBOL="$"

zinstall "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
autoload "compinit" && compinit
zstyle ":completion:*" "menu" "select"
zstyle ":completion:*" "matcher-list" "m:{a-z}={A-Za-z}"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370"

zinstall "zdharma-continuum/fast-syntax-highlighting" "fast-syntax-highlighting.plugin.zsh"
setopt "interactive_comments"
