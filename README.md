# 💀 SkullOS

My personal archlinux setup.

## 📦 Dependencies

### Official Repos

- bspwm
- git
- jq
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
- [utilyre/herbe](https://github.com/utilyre/herbe)
- [utilyre/st](https://github.com/utilyre/st)

## 🚦 Installation

**NOTE:** Make sure you have all the dependencies installed.

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
