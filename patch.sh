#!/usr/bin/env bash

if ! command -v patcher &> /dev/null
then
  echo "Patcher not installed. Installing..."
  ./setup.sh
fi

patcher patch --patches patches --patched patched