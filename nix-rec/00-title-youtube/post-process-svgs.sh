#! /usr/bin/env bash

# Remove the cursor from the SVG images.

for i in title/*.svg ; do
  sed -i 's@<rect x=".*" y=".*" width="56" height="110" class="foreground"/>@@' "$i"
done
