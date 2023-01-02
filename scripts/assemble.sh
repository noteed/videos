#! /usr/bin/env bash

# This script generates the video.mp4 file from termtosvg's individual SVGs,
# pre-pending the images for the title screen, and turining the comments in
# blue.
#
# It must be called from a video directory, e.g. 02-install-nix/.

set -e

sed -e 's/^file /file frames\//' frames/listing.txt > listing-without-title.txt
cat title.txt listing-without-title.txt > listing-with-title.txt
if [[ ! -f listing.txt ]] ; then
  # Make sure the file exists, but don't overwrite it, as it is expected to be
  # manually edited afterwards.
  cp listing-with-title.txt listing.txt
fi
../../scripts/turn-comments-blue.sh
../../scripts/frames-to-mp4.sh
