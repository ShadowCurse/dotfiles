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

ln -s $PWD/../.vimrc/ ~/.vimrc
ln -s $PWD/../.vim/ ~/.vim
ln -s $PWD/../.config/tmux/ ~/.config/tmux
ln -s $PWD/../.config/nvim/ ~/.config/nvim
ln -s $PWD/../.fish/ ~/.config/fish

echo "=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "Install gui?"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-="

while true; do
  read -p "Install gui? [Y/n] " yn
  case $yn in
      [Yy]* ) break;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
  esac
done

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

ln -s $PWD/../.config/dwm ~/.config/dwm
ln -s $PWD/../.config/rofi ~/.config/rofi

