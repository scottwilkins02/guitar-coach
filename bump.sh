#!/bin/sh
# Stamp a new build id into index.html and version.json before each deploy,
# so installed home-screen copies notice the update and reload.
set -e
cd "$(dirname "$0")"
B=$(date -u +%Y%m%d%H%M%S)
sed -i "s/const BUILD='[^']*'/const BUILD='$B'/" index.html
printf '{"build":"%s"}\n' "$B" > version.json
echo "build $B"
