#!/bin/bash

cd ~

echo "Creating links..."
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig  ~/.gitconfig

echo "Installing zsh..."
sudo dnf install zsh

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing slimzsh..." 
git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh

cat install2.sh | zsh

