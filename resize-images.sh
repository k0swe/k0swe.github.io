#!/usr/bin/env bash
max_dimension=1024
images=$(find assets/ -iname "*.gif" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.webp" | sort)
for i in $images; do
  width=$(convert $i -print "%w" /dev/null)
  height=$(convert $i -print "%h" /dev/null)
  if [ "$width" -gt "$max_dimension" -o "$height" -gt "$max_dimension" ]; then
    echo "Shrinking $i"
    convert $i -resize "$max_dimension"x"$max_dimension"\> -strip $i
  fi
done
