#!/usr/bin/env bash
COMMIT=`git rev-parse --short HEAD`
rm -rf _site
git clone --depth 1 git@github.com:k0swe/k0swe.github.io.git -b public _site
bundle exec jekyll build
cd _site
touch .nojekyll
git add -A
git commit -m "Generated site at $COMMIT"
git push origin public
