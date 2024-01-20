#!/usr/bin/env bash

if command -v patcher &> /dev/null
then
  echo "Patcher already installed"
  exit 1
fi

cd ~
git clone https://github.com/okrag/patcher ~/tmp-pather-src
cd ~/tmp-pather-src
cargo install --path .
rm -rf ~/tmp-pather-src