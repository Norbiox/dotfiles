#!/bin/bash
# This script install all my favourite software on Arch based system

echo "Install base packages and programs that I always use..."
sudo pacman -Sy \
  acpi \
  autorandr \
  bat \
  blueman \
  btop \
  dunst \
  dust \
  exa \
  fd \
  ipython \
  jless \
  kitty \
  mpv \
  neovim \
  nmap \
  nodejs \
  npm \
  openssh \
  pasystray \
  peco \
  python-pipx \
  ranger \
  ripgrep \
  sd \
  slack-desktop \
  sniffnet \
  sysstat \
  tealdeer \
  tmux \
  translate-shell \
  unclutter \
  w3m \
  xclip \
  xss-lock \
  yay \
  zathura \
  zathura-pdf-mupdf \
  zoxide

echo "Install various packages from AUR..."
yay -S \
  diff-so-fancy \
  dmenu-bluetooth \
  entr \
  fdupes \
  hstr \
  networkmanager-dmenu-git \
  ncpamixer \
  scc \
  todoist

echo "Install power-profiles-daemon..."
sudo pacman -Sy power-profiles-deamon
sudo systemctl enable power-profiles-daemon.service
sudo systemctl start power-profiles-daemon.service

echo "Install additional fonts..."
if [ ! -d "/usr/local/share/fonts" ]; then
  sudo mkdir /usr/local/share/fonts
fi
curl -s https://rubjo.github.io/victor-mono/VictorMonoAll.zip --output VictorMonoAll.zip
sudo bsdtar -xf- VictorMonoAll.zip -C /usr/local/share/fonts
fc-cache

echo "Install python packages..."
pipx install \
  black \
  idasen

echo "Setup printing..."
sudo systemctl enable cups.service
sudo systemctl start cups.service

echo "Setup wallpapers..."
git clone https://gitlab.com/dwt1/wallpapers.git ~/.local/share/wallpapers
sed "/dirs=/ s/$/\/home\/$USER\/.local\/share\/wallpapers;/" ~/.config/nitrogen/nitrogen.cfg -i

echo "Installation done"
