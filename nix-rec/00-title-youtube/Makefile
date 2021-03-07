# This Makefile is used to
#
# - transform each SVG in PNG

SOURCES=$(shell find . -name '*.svg')
FILTERED := $(patsubst %.svg, %.png, $(SOURCES))

all: $(FILTERED)

%.png: %.svg
	inkscape $< --export-filename $@ -b '#ffffff' -y 255
