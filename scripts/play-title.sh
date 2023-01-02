#! /usr/bin/env bash

# Play a video, then hold the last image. This is useful to check the title
# sequence whose last frame is, well, just a frame.

mplayer title.mp4 -idle -fixed-vo
