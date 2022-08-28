# 💀 SkullOS

My personal archlinux setup.

## 📦 Dependencies

### Official Repos

- bspwm
- dunst
- git
- gtk2
- jq
- kitty
- libnotify
- lxsession-gtk3
- mediainfo
- mpv
- neovim
- picom
- playerctl
- polkit
- pulseaudio
- ripgrep
- stow
- sxhkd
- sxiv
- ueberzug
- xdotool
- xorg-server
- xorg-xinit
- xorg-xrandr
- xorg-xset
- xorg-xsetroot
- xsel
- xwallpaper
- youtube-dl
- zsh

### AUR

- brave-bin
- dragon-drop
- lemonbar-xft-git
- lf-bin

### GitHub

- [utilyre/dmenu](https://github.com/utilyre/dmenu)

## 🚦 Installation

**NOTE**: Make sure you have all the dependencies installed.

Clone the repo

```bash
git clone -- "https://github.com/utilyre/skullos.git"
```

Set `zsh` as your default shell

```bash
sudo usermod --shell="/bin/zsh" -- "$USER"
```

Create symbolic links of the configurations

```bash
stow --target="$HOME" */ # everything
stow --target="$HOME" DIR # only DIR
```
