#!/usr/bin/env bash
find assets/ -iname "*.jpg" -exec convert {} -resize 1024x1024\> -strip {} \;
find assets/ -iname "*.png" -exec convert {} -resize 1024x1024\> -strip {} \;
find assets/ -iname "*.gif" -exec convert {} -resize 1024x1024\> -strip {} \;
