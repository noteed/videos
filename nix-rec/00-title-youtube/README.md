# Title sequence

This directory is used to generate the frames of a title sequence for a
particular video. Once generated, they are copied to the actual video directory
(ffmpeg can include frames listed in a file, provided they are in the same
directory, so we move them there).

```
$ ./termtosvg.sh 2               # The argument is the episode number
$ make                           # Turn SVGs into PNGs
$ ../../scripts/title-to-mp4.sh  # Just to check
$ ../../scripts/play.sh          # Just to check
$ cp -r title title.txt ../02-install-nix/
```

Once generated, the `title/` directory and `title.txt` file can be copied in a
specific video directory, e.g. `02-install-nix/`. That directory must provide
the last frame of the title sequence.

An example last frame is given by `title.svg`.

Generating an MP4 with just a title sequence can be done to visualize it but is
not actually used in the production of the full video. Instead, the `title.txt`
listing will be pre-pended to the video's own `listing.txt`.

In other words, the two lines marked "Just to check" can also be run in a
specific video directory.
