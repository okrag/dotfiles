#!/usr/bin/env bash

./apply.sh
cd patched
nix flake update
cp flake.lock ../base/flake.lock
cd ..
