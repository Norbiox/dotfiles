#!/bin/bash
# This script install all my favourite software on Arch based system

USER=`whoami`

echo "Fix time and date..."
sudo timedatectl set-ntp true

echo "Merge xrdb..."
xrdb -merge ~/.Xresources

./install/base.sh
./install/docker.sh

echo "Installation done. Please reboot."
