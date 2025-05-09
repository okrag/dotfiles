#!/usr/bin/env bash

mkdir patches

./apply.sh
cd patched
cp /etc/nixos/hardware-configuration.nix nixos/hardware-configuration.nix
git add nixos/hardware-configuration.nix
git commit -m "Add hardware config"
cd ..
./patch.sh

mv .git .git.b
cd patched
mv .git .git.b
sudo nixos-rebuild switch --flake .#okrag
home-manager switch --flake .#okrag
mv .git.b .git
cd ..
mv .git.b .git
