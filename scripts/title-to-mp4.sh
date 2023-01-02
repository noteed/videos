#! /usr/bin/env bash

ffmpeg -y -f concat -i title.txt \
  -c:v libx264 -preset slow -crf 18 -movflags +faststart -use_editlist 0 \
  -vf fps=25 -s 2560x1440 -pix_fmt yuv420p -aspect 2560:1440 \
  title.mp4