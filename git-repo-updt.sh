#!/usr/bin/env bash

DIRs="\
  ${HOME}/alacritty\
  ${HOME}/neovim\
  ${HOME}/tmux\
  ${HOME}/tmux-bash-completion\
  ${HOME}/ripgrep\
  ${HOME}/conan-bashcompletion\
  ${HOME}/exa\
"

for DIR in ${DIRs}
do
  if [ -d "${DIR}" ]; then
    pushd "${DIR}" &> /dev/null || exit 1
    git pull --rebase --recurse-submodules &> /dev/null
    echo "${DIR##*/}:"
    git status | head -n 2
    echo "-------------------------"
    popd &> /dev/null || exit 2
  fi
done
