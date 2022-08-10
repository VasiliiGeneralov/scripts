#!/usr/bin/env bash
a=( $(git tag -l 'v[0-9]*.[0-9]*.[0-9]' --sort=-v:refname) )
ver_r="${a[0]##*.}"
ver_l="${a[0]%%.[0-9]}"
echo "${ver_l}.$(echo $(( ${ver_r} + 1 )) )"
