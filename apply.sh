#!/usr/bin/env bash

if ! command -v patcher &> /dev/null
then
  echo "Patcher not installed. Installing..."
  ./setup.sh
fi

patcher apply --patches patches --patched patched --base base