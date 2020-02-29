#!/bin/bash
sudo apt -y update; sudo apt -y full-upgrade
sudo apt install iptables-persistent netfilter-persistent

sudo sed -i -e "\$aauto eth0\niface eth0 inet dhcp" /etc/network/interfaces
sudo service networking restart
sudo sysctl -w net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo netfilter-persistent save
sudo systemctl status netfilter-persistent

sudo sed -i "s/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g" /etc/sysctl.conf

wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt -y update
sudo apt -y install apt-transport-https
sudo apt -y update
sudo apt -y install dotnet-sdk-2.2

sudo git clone --recurse-submodules https://github.com/cobbr/Covenant /opt/Covenant