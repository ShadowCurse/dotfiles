#!/bin/sh

## system
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo cp configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch
