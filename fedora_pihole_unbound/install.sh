#!/bin/bash

# seedup dnf
echo 'fastestmirror=true' >> /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
echo 'deltarpm=true' >> /etc/dnf/dnf.conf

sudo dnf update

# insall
sudo dnf install htop vim tmux cockpit-podman openssh-server

sudo systemctl enable sshd --now

# setup
sudo nmcli connection modify enp0s20u4c2 ipv4.method manual
sudo nmcli connection modify enp0s20u4c2 ipv4.addresses 192.168.88.12/24
sudo nmcli connection modify enp0s20u4c2 ipv4.gateway 192.168.88.1
sudo nmcli connection modify enp0s20u4c2 ipv4.dns "1.1.1.1"

sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo unlink /etc/resolv.conf
sudo systemctl restart NetworkManager

sudo firewall-cmd --zone=FedoraServer --add-port=80/tcp
sudo firewall-cmd --zone=FedoraServer --add-port=443/tcp
sudo firewall-cmd --zone=FedoraServer --add-port=53/tcp
sudo firewall-cmd --zone=FedoraServer --add-port=53/udp
sudo firewall-cmd --zone=FedoraServer --add-port=67/udp
sudo firewall-cmd --permanent --zone=FedoraServer --add-port=53/udp
sudo firewall-cmd --permanent --zone=FedoraServer --add-port=53/tcp
sudo firewall-cmd --permanent --zone=FedoraServer --add-port=443/tcp
sudo firewall-cmd --permanent --zone=FedoraServer --add-port=67/udp
sudo firewall-cmd --permanent --zone=FedoraServer --add-port=80/tcp

# pi-hole
sudo podman pull pihole/pihole
sudo podman volume create pihole_pihole
sudo podman volume create pihole_dnsmasq
sudo cp pihole.service /etc/systemd/system/
sudo systemctl enable pihole --now

# unbound
sudo podman pull mvance/unbound 
sudo cp unbound.service /etc/systemd/system/
sudo systemctl enable unbound --now

# podman auto-update
sudo systemctl enable --now podman-auto-update.timer
