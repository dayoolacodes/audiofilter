#!/bin/bash
# Build audiofilter.zip for Chrome Web Store upload

set -e

DIST="audiofilter"
FILES="manifest.json background.js content.js popup.html popup.js popup.css offscreen.html offscreen.js blockedWords.json"

# Sync extension files into dist folder
for f in $FILES; do
  cp "$f" "$DIST/"
done
cp icons/*.png "$DIST/icons/"

# Create zip
rm -f audiofilter.zip
cd "$DIST"
zip -r ../audiofilter.zip . -x '.*'
cd ..

echo "Built audiofilter.zip ($(du -h audiofilter.zip | cut -f1))"
