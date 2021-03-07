#! /usr/bin/env bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

NIX_RECORDINGS_EPISODE="${1:-1}"

termtosvg \
  --preset -g 38x9 -M 2000 -m 10 -t noteed-xterm -s \
  -c "./the-nix-recordings.sh ${NIX_RECORDINGS_EPISODE}" title/

./post-process-svgs.sh
