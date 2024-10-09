#! /usr/bin/env bash

# Bracket

SRC=bracket/src
OUTPUT=bracket/export
shopt -s globstar
echo "Building bracket STLs"
echo "Writing to $OUTPUT/"
for i in $SRC/**/*.scad; do # Whitespace-safe and recursive
    name="$OUTPUT/$(basename $i .scad).stl"
    openscad -o $name "$i"
    echo "$i -> $name"
done

