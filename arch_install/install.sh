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

[ ! -d $HOME/.config ] && mkdir $HOME/.config

ln -s $PWD/../.vimrc/ $HOME/.vimrc
ln -s $PWD/../.vim/ $HOME/.vim
ln -s $PWD/../.config/tmux/ $HOME/.config/tmux
ln -s $PWD/../.config/nvim/ $HOME/.config/nvim
ln -s $PWD/../.fish/ $HOME/.config/fish

echo "=========================="
echo "installing fish as a default shell"
echo "=========================="

chsh -s /bin/fish

echo "=========================="
echo "installing fonts"
echo "=========================="

mkdir -p $HOME/.local/share/fonts
cp $PWD/../Fonts/* $HOME/.local/share/fonts
fc-cache -f -v

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

cd $PWD/../dwm-6.2/
sudo make install
cd $PWD/../arch_install/

echo "=========================="
echo "copying gui configs"
echo "=========================="

ln -s $PWD/../.config/dwm $HOME/.config/dwm
ln -s $PWD/../.config/alacritty $HOME/.config/alacritty
ln -s $PWD/../.config/rofi $HOME/.config/rofi

