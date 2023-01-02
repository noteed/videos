#! /usr/bin/env bash

for i in frames/*.svg ; do
  sed -i 's@class="foreground">&#9656; #@class="color4">\&#9656; #@g' "$i"
done
