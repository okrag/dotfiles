#!/usr/bin/env bash

rm -rf base
rm -rf patched/.git
rm patched/nixos/hardware-configuration.nix
mv patched base
mkdir patched
echo "Review the patches before applying them."