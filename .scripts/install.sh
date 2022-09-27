#!/bin/bash

echo "Fix time and date..."
sudo timedatectl set-ntp true

echo "Merge xrdb..."
xrdb -merge ~/.Xresources

echo "Install various packages..."
sudo pacman -Sy \
  blueman \
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
  translate-shell \
  w3m \
  wacom-settings-git \
  zoxide

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

echo "Done"
