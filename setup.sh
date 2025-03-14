#!/bin/bash

set -e # exit if any command fails

username="serveradmin"
password="password123"

echo "updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "installing essential packages..."
sudo apt install -y openssh-server nginx ufw fail2ban git

# enabling ssh service...
sudo systemctl enable ssh
sudo systemctl start ssh

# add admin user here
sudo useradd -m -s /bin/bash $username
echo "$username:$password" | sudo chpasswd
sudo usermod -aG sudo $username

# Setup firewall
echo "configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow "Nginx Full"
sudo ufw enable

echo "Setup Complete!"