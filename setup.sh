#!/usr/bin/env bash

if command -v patcher &> /dev/null
then
  echo "Patcher already installed"
  exit 1
fi

pwd=$(pwd)
git clone https://github.com/okrag/patcher ~/tmp-patcher-src
cd ~/tmp-patcher-src
cargo install --path .
rm -rf ~/tmp-patcher-src
cd $pwd