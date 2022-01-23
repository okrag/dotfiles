#!/bin/zsh

echo "Installing node lts..."
nvm install --lts

echo "Installing npm packages"
npm i -g typescript ts-node nodemon @nestjs/cli