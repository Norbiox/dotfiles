#!/bin/bash
# This script install docker

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

echo "Installation done."
