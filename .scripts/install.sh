#!/bin/bash

echo "Merge xrdb..."
xrdb -merge ~/.Xresources

echo "Install various packages..."
sudo pacman -Sy \
  blueman \
  github-cli \
  gvim \
  ipython \
  lastpass \
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

echo "Setup git..."
git config --global user.name "Norbiox"
git config --global user.email "norbertchmiel.it@gmail.com"
git config --global core.editor "vim"
gh auth login

echo "Install python packages..."
pip install idasen

echo "Done"
