#!/bin/bash

set -e # exit if any command fails

echo "updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "installing essential packages..."
sudo apt install -y openssh-server nginx ufw fail2ban git sysstat

# enabling ssh service...
sudo systemctl enable ssh
sudo systemctl start ssh

# add admin user here
echo "New Admin Username:"
read username
password='password123'

sudo useradd -m -s /bin/bash $username
echo "$username:$password" | sudo chpasswd
sudo usermod -aG sudo $username
echo "New admin($username): password set to '$password'"

# Setup firewall
echo "configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow "Nginx Full"
sudo ufw enable

echo "Setup Complete!"