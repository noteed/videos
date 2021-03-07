#! /usr/bin/env bash

# To record this script as a video:
#
#   termtosvg --preset -g 38x9 -M 2000 -m 10 -t noteed-xterm -s \
#     -c ./the-nix-recordings.sh frames/
#
# then I manually remove the last rect element (the prompt) in each SVG, with
# post-process-svgs.sh, create a last frame using a title.svg file, and alter
# some durations (the resulting listing.txt is in this directory).
#
# An example title file: ../01-create-droplet/title.svg.
#
#   ../../scripts/title-to-mp4.sh
#
# The result can be play for instance with:
#
#   mplayer video.mp4 -idle -fixed-vo

NIX_RECORDINGS_EPISODE="${1:-1}"

echo
echo -en "\033[38;5;009m⬤\033[0m "

function stuff {
  str="$1"
  for (( i=0; i<${#str}; i++ )); do
    echo -n "${str:$i:1}"
    sleep 0.1
  done
}

sleep 0.2

stuff "The Nix recordings #${NIX_RECORDINGS_EPISODE}"

sleep 2
