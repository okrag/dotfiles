#!/bin/bash

cd ~

echo "Creating links..."
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig  ~/.gitconfig

echo "Installing zsh..."
sudo apt install zsh

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing slimzsh..." 
git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh

chsh -s $(which zsh)