#!/bin/zsh

cd ~

echo "Installing nvm..."
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh" | zsh

echo "Installing deno..."
curl -fsSL "https://deno.land/x/install/install.sh" | zsh