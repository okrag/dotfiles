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

echo "Installing vs code..."
wget --output-file=vscode.rpm "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64"
sudo dnf localinstall vscode.rpm
rm vscode.rpm

cat install2.sh | zsh

