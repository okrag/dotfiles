#!/usr/bin/env bash

./apply.sh
mv .git .git.b
cd patched
mv .git .git.b
doas nixos-rebuild switch --flake .#okrag
home-manager switch --flake .#okrag
mv .git.b .git
cd ..
mv .git.b .git
