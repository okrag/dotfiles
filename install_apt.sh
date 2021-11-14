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

echo "Installing vs code..."
wget --output-file=vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i vscode.deb
rm vscode.deb

cat install2.sh | zsh