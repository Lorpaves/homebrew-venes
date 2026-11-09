#!/bin/sh
# Points the cask at a tagged release of the Venes CLI, and commits that:
#
#   scripts/bump.sh 0.3.41
set -eu
version="${1:?usage: scripts/bump.sh VERSION}"
cd "$(dirname "$0")/.."
sha=$(curl -fsSL "https://github.com/Lorpaves/venes-cli/archive/refs/tags/v$version.tar.gz" | shasum -a 256 | cut -d ' ' -f 1)
sed -i '' -e "s/^  version \".*\"/  version \"$version\"/" -e "s/^  sha256 \".*\"/  sha256 \"$sha\"/" Casks/venes.rb
git commit -q -am "venes $version"
echo "venes $version ($sha)"
