#!/usr/bin/env bash

DIRs=(\
  "${HOME}/alacritty"\
  "${HOME}/neovim"\
  "${HOME}/tmux"\
  "${HOME}/tmux-bash-completion"\
  "${HOME}/ripgrep"\
)

for DIR in "${DIRs[@]}"
do
  if [ -d "${DIR}" ]; then
    pushd "${DIR}" &> /dev/null || exit 1
    git fetch &> /dev/null
    echo "${DIR##*/}:"
    git status | head -n 2
    echo "-------------------------"
    popd &> /dev/null || exit 2
  fi
done
