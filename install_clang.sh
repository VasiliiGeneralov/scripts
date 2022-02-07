#!/usr/bin/env bash

if [[ -z "${1}" ]]; then
  echo "Please specify clang version! e.g. 11, 12, etc."
  exit 1
fi

apt install\
 "libllvm-${1}-ocaml-dev"\
 "libllvm${1}"\
 "llvm-${1}"\
 "llvm-${1}-dev"\
 "llvm-${1}-doc"\
 "llvm-${1}-examples"\
 "llvm-${1}-runtime"\
 "clang-${1}"\
 "clang-tools-${1}"\
 "clang-${1}-doc"\
 "libclang-common-${1}-dev"\
 "libclang-${1}-dev"\
 "libclang1-${1}"\
 "clang-format-${1}"\
 "clang-tidy-${1}"\
 "python3-clang-${1}"\
 "clangd-${1}"\
 "libfuzzer-${1}-dev"\
 "lldb-${1}"\
 "lld-${1}"\
 "libc++-${1}-dev"\
 "libc++abi-${1}-dev"\
 "libomp-${1}-dev"\
 "libclc-${1}-dev"
