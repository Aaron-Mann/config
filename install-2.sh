#!/bin/bash

path=$(pwd)

echo "Beginning Installation..."

pulseaudio --start

echo "Cloning yay Repository..."

git clone https://aur.archlinux.org/yay.git

cd yay

echo "Installing yay..."

makepkg --noconfirm -si

cd ..

rm -rf yay

echo "Installing AUR Packages..."

yay --noconfirm -S brave-bin spotify minecraft-launcher

echo "Installing PIP Packages..."

pip install powerline-shell

echo "Configuring Emacs..."

# configure doom emacs

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

~/.emacs.d/bin/doom install

# configure dotfiles and configs

echo "Cloning Dotfile Git Repository..."

git clone https://github.com/Aaron-Mann/config

echo "Creating Symlinks in Home Directory..."

ln -sf $path/.xinitrc $HOME/.xinitrc
ln -sf $path/.bashrc $HOME/.bashrc

echo "Creating Symlinks to '.config' Directory..."

[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/alacritty ] && rm -rf $HOME/.config/alacritty
ln -sf $path/config/alacritty $HOME/.config/alacritty

[ -d $HOME/.config/nvim ] && rm -rf $HOME/.config/nvim
ln -sf $path/config/nvim $HOME/.config/nvim

echo "Final Step! Installing i3wm..."

sudo pacman -S i3wm

echo "Congragulations! Installation is complete!"
echo ""
Echo "Now, type 'startx' to enter i3wm and begin computing!"
