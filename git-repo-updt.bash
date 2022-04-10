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
  if [[ -d "${DIR}" ]]; then
    pushd "${DIR}" &> /dev/null || exit 1
    git fetch &> /dev/null
    echo "${DIR##*/}:"
    git status | head -n 2
    tags=$(git tag -l '[0-9]*.[0-9]*' 'v[0-9]*.[0-9]*')
    if [[ -n "${tags}" ]]; then
      printf "Available tags:\n"
      i=0
      for tag in ${tags}
      do
        printf "%+12s " "${tag}"
        (( ++i ))
        if [[ i -ge 8 ]]; then
          i=0
          printf "\n"
        fi
      done
      printf "\n"
    fi
    echo "-------------------------"
    popd &> /dev/null || exit 2
  fi
done
