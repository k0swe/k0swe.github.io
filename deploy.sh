#!/usr/bin/env bash
COMMIT=`git rev-parse --short HEAD`
bundle install
bundle exec jekyll build
cd _site
touch .nojekyll
git add -A
git commit -m "Generated site at $COMMIT"
git push origin public
