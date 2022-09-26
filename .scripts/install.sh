#!/bin/bash

echo "Setup git..."
git config --global user.name "Norbiox"
git config --global user.email "norbertchmiel.it@gmail.com"
git config --global core.editor "vim"

sudo pacman -S github-cli
gh auth login

echo "Setup node..."
sudo pacman -S nodejs npm

echo "Setup vim..."
sudo pacman -S gvim

echo "Merge xrdb..."
xrdb -merge ~/.Xresources

echo "Done"
