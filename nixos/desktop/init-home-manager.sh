#!/bin/sh
## user
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nix-channel --update
nix-shell '<home-manager>' -A install
mkdir -p ~/.config/nixpkgs
cd ~/.config/nixpkgs
ln -sf ~/.dotfiles/nixos/desktop/home.nix .
home-manager switch
