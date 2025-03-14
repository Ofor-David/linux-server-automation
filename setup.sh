#!/bin/bash

set -e # exit if any command fails

echo "updating system packages..."
sudo apt update $$ sudo apt upgrade -y

echo "installing essential packages..."
sudo apt install -y nginx ufw fail2ban

# add admin user here
sudo useradd -m -s /bin/bash serveradmin
echo "serveradmin:password123" | sudo chpasswd
sudo usermod -aG sudo serveradmin

# Setup firewall
echo "configuring firewall..."
sudo ufw allow OpenSSH
sudo ufw allow "Nginx Full"
sudo ufw enable

echo "Setup Complete!"