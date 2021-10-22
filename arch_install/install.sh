#!/usr/bin/env bash

if ["$(id -u)" = 0]; then
  echo "=========================="
  echo "do not run this as a root"
  echo "=========================="
  exit 1
fi

echo "=========================="
echo "installing base"
echo "=========================="

sudo pacman --noconfirm --needed -Sy - < pkglist.txt

echo "=========================="
echo "copying base configs"
echo "=========================="

[ ! -d ~/.config ] && mkdir ~/.config

ln -s ../.vimrc/ ~/.vimrc
ln -s ../.vim/ ~/.vim
ln -s ../.config/tmux/ ~/.config/tmux
ln -s ../.config/nvim/ ~/.config/nvim
ln -s ../.fish/ ~/.config/fish

echo "=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Install gui?"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-="

echo "=========================="
echo "installing gui"
echo "=========================="

sudo pacman --noconfirm --needed -Sy - < pkglist_gui.txt

cd ../dwm-6.2/
sudo make install
cd ../arch_install/

echo "=========================="
echo "copying gui configs"
echo "=========================="

cp -r ../.config/dwm ~/.config/dwm
cp -r ../.config/rofi ~/.config/rofi

