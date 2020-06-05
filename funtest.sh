#!/bin/bash

prn() {
  local VAR=$1
  echo ${VAR#*dotfiles/}
}

targets=`find $HOME/dotfiles/.[!.]* -type f`

for a in $targets; do
  if [[ ! $a == *".git/"* ]]; then
    prn $a
  fi
done
