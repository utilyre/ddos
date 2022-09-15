# 💀 SkullOS

My personal archlinux setup.

## 📦 Dependencies

### Official Repos

- arc-solid-gtk-theme
- bspwm
- dmenu
- dunst
- git
- gtk2
- imv
- jq
- kitty
- libnotify
- lxsession-gtk3
- mediainfo
- mpv
- neovim
- noto-fonts-emoji
- picom
- playerctl
- polkit
- pulseaudio
- ripgrep
- starship
- stow
- sxhkd
- trayer
- ttf-cascadia-code
- ttf-dejavu
- ttf-nerd-fonts-symbols-2048-em
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
stow --no-folding --target="$HOME" */ # everything
stow --no-folding --target="$HOME" [DIR] # only [DIR]
```
