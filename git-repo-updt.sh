#!/usr/bin/env bash

DIRS="\
  $HOME/alacritty\
  $HOME/neovim\
  $HOME/tmux\
  $HOME/tmux-bash-completion\
  $HOME/ripgrep\
"

for DIR in $DIRS
do
  if [ -d "$DIR" ]; then
    pushd $DIR &> /dev/null
    git fetch $(git remote show | head -n 1) &> /dev/null
    echo "$DIR:" | sed -e 's/^.*\///'
    git status | head -n 2
    echo "-------------------------"
    popd &> /dev/null
  fi
done
