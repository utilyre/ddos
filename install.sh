#!/bin/sh

out() {
	printf -- "\e[1;32m%s\e[m \e[1m%s\e[m\n" "===>" "$1"
}

err() {
	printf -- "\e[1;31m%s\e[m \e[1m%s\e[m\n" "===> ERROR:" "$1" >&2
	exit "1"
}

install_deps() {
	grep --extended-regexp --invert-match -- "^.+\..+/?.+$" "deps.list" | sudo pacman --noconfirm --sync -
	grep --extended-regexp -- "^.+\..+/?.+$" "deps.list" |
		while read -r dep; do
			mkdir --parents -- "$DOTFILES_CACHE"
			dest="$DOTFILES_CACHE/${dep##*/}"

			git clone --depth="1" -- "https://$dep.git" "$dest"
			(cd -- "$dest" && makepkg --noconfirm --syncdeps --rmdeps --install)
		done
}

exec_hooks() {
	sudo usermod --shell="/bin/zsh" -- "$USER"
	stow --target="$HOME" */
}

main() {
	install_deps || err "Failed to install dependencies. Exiting..."
	exec_hooks || err "Failed to execute hooks. Exiting..."

	out "Installed successfully. Reboot and login to X session!"
}

main
