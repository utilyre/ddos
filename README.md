<h1 align="center">ddOS</h1>

<p align="center">
  My personal archlinux setup.
</p>

## 📦 Dependencies

### Official

- arc-solid-gtk-theme
- bspwm
- dmenu
- dunst
- git
- imv
- kitty
- lf
- libnotify
- lxsession-gtk3
- mediainfo
- mpv
- picom
- playerctl
- polybar
- pulseaudio
- stow
- sxhkd
- ueberzug
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

## 🚦 Installation

**NOTE**: Make sure you have all the dependencies installed.

Clone the repo

```bash
git clone -- "https://github.com/utilyre/ddos.git"
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
