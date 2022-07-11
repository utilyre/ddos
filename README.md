# Dotfiles

![cover](COVER.png)

## Installation

Make sure you have **git** installed:

```bash
sudo pacman -S git
```

Clone the repository:

```bash
git clone https://github.com/utilyre/dotfiles.git
cd dotfiles
```

Run the installation script:

```bash
DOTFILES_CACHE="${XDG_CACHE_HOME:-"$HOME/.cache"}/dotfiles" ./install.sh
```
