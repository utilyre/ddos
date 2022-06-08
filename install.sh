#!/bin/sh

out() {
	printf "\e[1;32m%s\e[m \e[1m%s\e[m\n" "===>" "$1" # bold
}

err() {
	printf "\e[1;31m%s\e[m \e[1m%s\e[m\n" "===> ERROR:" "$1" >&2
	exit 1
}

install_yay() {
	git clone --depth="1" -- "https://aur.archlinux.org/yay.git"
	(cd -- "yay" && makepkg --noconfirm --syncdeps --rmdeps --install)
}

install_deps() {
	yay --noconfirm --sync --refresh --sysupgrade
	yay --noconfirm --sync --removemake "-" < "package.txt"
	yay --noconfirm --sync --clean
}

download_repo() {
	git clone --depth="1" -- "https://github.com/utilyre/dotfiles.git"
	(cd "dotfiles" && stow --target="$HOME" */)
}

main() {
	install_yay || err "Failed to install yay. Exiting..."
	install_deps || err "Failed to install dependencies. Exiting..."
	download_repo || err "Failed to download repository. Exiting..."

	out "Installed successfully. Reboot and login to X11 session!"
}

main
