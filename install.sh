#!/bin/bash

USERNAME=$(whoami)
if [ $USERNAME == "root" ];
then
	echo "Please don't run as root"
	exit
fi

echo "Installing for user : $USERNAME"

# Create CTF directory
mkdir ~/CTF

# Put CTF docker starter in PATH
chmod +x kali.sh
sudo cp kali.sh /usr/bin/kali

# Setup CTF docker
sudo pacman --needed -S docker xorg-xhost
sudo usermod -aG docker $USERNAME
sudo systemctl start docker && sudo docker build -t kali --build-arg NAME=$USERNAME ./

echo "Done ! You can delete this folder. Logout to apply all changes"
