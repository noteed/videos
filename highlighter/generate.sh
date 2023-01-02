#! /usr/bin/env bash

# Generate an animated yellow highlighter line.
#
# Each frame is first generated as SVG, then converted to PNG using inkscape,
# then assembled as an MP4 (I think it is nicer to have one single file as
# output, although Blender, where the video editing is done, supports image
# sequences too).
#
# The 2560x1440 dimension is not really need.
#
# A width of 228 is ok for about 7 characters in the
# ../terminal-settings/dimensions-82x21.txt case.

VIDEO_NAME=${1:-video.mp4}
FINAL_WIDTH=${2:-228}

FRAMES=12

set -e

function one_frame {
  # $1 should be in the range [1, $FRAMES].
  INCREMENT=$((FINAL_WIDTH / $FRAMES))
  WIDTH=$(($INCREMENT * $1))

  echo "<svg"
  echo "  xmlns=\"http://www.w3.org/2000/svg\""
  echo "  xmlns:xlink=\"http://www.w3.org/1999/xlink\""
  echo "  viewBox=\"0 0 2560 1440\""
  echo "  version=\"1.1\">"
  echo "  <rect"
  echo "    x=\"2\" y=\"15\" width=\"${WIDTH}\" height=\"55\""
  echo "    fill=\"yellow\" transform=\"rotate(-2, 2, 15)\"/>"
  echo "</svg>"
}

for i in `seq 1 $FRAMES` ; do
  one_frame $i > $(printf "frame-%02d.svg" $i)
done

for i in *.svg ; do
  inkscape -w 2560 -h 1440 ./"$i" --export-filename ./"${i%.svg}.png" -b '#ffffff' -y 255
done

ffmpeg -y -i frame-%02d.png \
  -c:v libx264 -preset slow -crf 18 -movflags +faststart -use_editlist 0 \
  -vf fps=25 -s 2560x1440 -pix_fmt yuv420p -aspect 2560:1440 \
  "${VIDEO_NAME}"

rm *.svg *.png
