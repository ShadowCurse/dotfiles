#!/bin/sh

## system
sudo cp configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch

## user
mkdir -p ~/.config/nixpkgs
cd ~/.config/nixpkgs
ln -s ~/.dotfiles/nixos/desktop/home.nix .
home-manager switch
