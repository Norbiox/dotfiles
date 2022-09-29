#!/bin/bash

echo "Fix time and date..."
sudo timedatectl set-ntp true

echo "Merge xrdb..."
xrdb -merge ~/.Xresources

echo "Install various packages..."
sudo pacman -Sy \
  acpi \
  blueman \
  btop \
  github-cli \
  gvim \
  ipython \
  lastpass \
  lastpass-cli \
  mplayer \
  nodejs \
  npm \
  python-pip \
  python-virtualenv \
  ranger \
  sysstat \
  translate-shell \
  w3m \
  wacom-settings-git \
  xclip \
  xss-lock \
  zoxide

echo "Install power-profiles-daemon..."
sudo pacman -Sy power-profiles-deamon
sudo systemctl enable power-profiles-daemon.service
sudo systemctl start power-profiles-daemon.service

echo "Install various packages from AUR..."
yay -S \
  hstr

echo "Install additional fonts..."
if [ ! -d "/usr/local/share/fonts" ]; then
  sudo mkdir /usr/local/share/fonts
fi
curl -s https://rubjo.github.io/victor-mono/VictorMonoAll.zip --output VictorMonoAll.zip
sudo bsdtar -xf- VictorMonoAll.zip -C /usr/local/share/fonts
fc-cache

echo "Setup git..."
git config --global user.name "Norbiox"
git config --global user.email "norbertchmiel.it@gmail.com"
git config --global core.editor "vim"
gh auth login

echo "Install python packages..."
pip install idasen

echo "Setup printing..."
sudo systemctl enable cups.service
sudo systemctl start cups.service

echo "Done"
