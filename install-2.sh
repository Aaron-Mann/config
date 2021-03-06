#!/bin/bash

path=$(pwd)

echo "Beginning Installation..."

echo "Cloning yay Repository..."

git clone https://aur.archlinux.org/yay.git

cd yay

echo "Installing yay..."

makepkg --noconfirm -si

cd ..

rm -rf yay

echo "Installing AUR Packages..."

yay --noconfirm -S leftwm brave-bin minecraft-launcher discord

# configure dotfiles and configs

echo "Cloning Dotfile Git Repository..."

git clone https://github.com/Aaron-Mann/config

echo "Creating .xinitrc file..."

echo "xwallpaper --zoom $HOME/.wallpaper.jpg" >> $HOME/.xinitrc
echo "picom &" >> $HOME/.xinitrc
echo "exec dbus-launch leftwm" >> $HOME/.xinitrc

echo "Creating .bashrc file..."

echo "neofetch" >> $HOME/.bashrc

echo "Creating Symlinks to '.config' Directory..."

[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/alacritty ] && rm -rf $HOME/.config/alacritty
cp -r $path/config/config/alacritty $HOME/.config/alacritty

cp -r $path/config/.wallpaper.jpg $HOME/.wallpaper.jpg

echo "Congragulations! Installation is complete!"
echo ""
echo "Now, type 'startx' to enter leftwm and begin computing!"
