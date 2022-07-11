#!/bin/sh

out() {
	printf -- "\e[1;32m%s\e[m \e[1m%s\e[m\n" "===>" "$1"
}

err() {
	printf -- "\e[1;31m%s\e[m \e[1m%s\e[m\n" "===> ERROR:" "$1" >&2
	exit 1
}

install_yay() {
	git clone --depth="1" -- "https://aur.archlinux.org/yay-bin.git" "$DOTFILES_CACHE/yay-bin"
	(cd -- "$DOTFILES_CACHE/yay-bin" && makepkg --noconfirm --syncdeps --rmdeps --install)
}

install_deps() {
	yay --noconfirm --sync --refresh --sysupgrade
	yay --noconfirm --sync --removemake - < "package.txt"
}

exec_hooks() {
	sudo usermod --shell="/bin/zsh" -- "$USER"
	stow --target="$HOME" */
}

main() {
	install_yay || err "Failed to install yay. Exiting..."
	install_deps || err "Failed to install dependencies. Exiting..."
	exec_hooks || err "Failed to execute hooks. Exiting..."

	out "Installed successfully. Reboot and login to X session!"
}

main
