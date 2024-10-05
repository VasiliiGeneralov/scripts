#!/usr/bin/env bash

cwd=$(dirname $(realpath ${0}))
is_ext=false
ext_globs=('*.mp4')
bad_chars=("[[:space:]]" '[' ']' '-')

function replace_chars() {
  local res=${1}

  for bad_char in ${bad_chars[@]}; do
    res=${res//${bad_char}/${2}}
  done

  echo "${res}"
}

for f in "${cwd}"/*; do
  is_ext=false

  for ext_glob in ${ext_globs[@]}; do
    if [[ "${f}" =~ "${ext_glob}" ]]; then
      is_ext=true
      break
    fi
  done

  if ! ${is_ext}; then
    continue
  fi

  mv -v "${f}" $(replace_chars "${f}" "_") || exit 1
done
