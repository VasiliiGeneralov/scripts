#!/bin/bash

printf "file '%s'\n" *.mp4 > 'list'
ffmpeg -f concat -i 'list' -c copy "${1}"
rm 'list'
