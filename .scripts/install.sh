#!/bin/bash

USER=`whoami`

echo "Fix time and date..."
sudo timedatectl set-ntp true

echo "Merge xrdb..."
xrdb -merge ~/.Xresources

echo "Install various packages..."
sudo pacman -Sy \
  acpi \
  audacity \
  autorandr \
  blueman \
  btop \
  clojure \
  dunst \
  fd \
  github-cli \
  gvim \
  ipython \
  lastpass \
  lastpass-cli \
  leiningen \
  libreoffice-fresh \
  mplayer \
  nmap \
  nodejs \
  npm \
  openssh \
  pasystray \
  python-pip \
  python-virtualenv \
  ranger \
  slack-desktop \
  sysstat \
  teams \
  tldr \
  tmux \
  translate-shell \
  unclutter \
  visual-studio-code-bin \
  w3m \
  wacom-settings-git \
  xclip \
  xss-lock \
  zathura \
  zathura-pdf-mupdf \
  zoxide

echo "Install nvidia and CUDA..."
sudo pacman -Sy nvidia opencl-nvidia cuda

echo "Install power-profiles-daemon..."
sudo pacman -Sy power-profiles-deamon
sudo systemctl enable power-profiles-daemon.service
sudo systemctl start power-profiles-daemon.service

echo "Install docker..."
sudo pacman -Sy docker docker-compose
if [ -n $(getent group docker) ]; then
  sudo groupadd docker 
fi
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

echo "Install kubernetes..."
sudo pacman -Sy minikube kubectl kubectx

echo "Install various packages from AUR..."
yay -S \
  diff-so-fancy \
  dmenu-bluetooth \
  entr \
  fdupes \
  hstr \
  mongodb-compass \
  mongodb-tools \
  networkmanager-dmenu-git \
  scc


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
git config --global diff.tool "vimdiff"
git config --global difftool.prompt "false"
gh auth login

echo "Install python packages..."
pip install black idasen

echo "Setup printing..."
sudo systemctl enable cups.service
sudo systemctl start cups.service

echo "Setup wallpapers..."
git clone https://gitlab.com/dwt1/wallpapers.git ~/.local/share/wallpapers
sed "/dirs=/ s/$/\/home\/$USER\/.local\/share\/wallpapers;/" ~/.config/nitrogen/nitrogen.cfg -i

echo "Installation done. Please reboot."
