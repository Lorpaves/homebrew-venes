#!/bin/sh
# Points the cask at a tagged release of the Venes CLI, and commits that:
#
#   scripts/bump.sh 0.3.41
set -eu
version="${1:?usage: scripts/bump.sh VERSION}"
cd "$(dirname "$0")/.."
# Downloaded first, so a failed download stops here rather than giving the checksum of nothing.
tarball=$(mktemp)
trap 'rm -f "$tarball"' EXIT
curl -fsSL --retry 3 -o "$tarball" "https://github.com/Lorpaves/venes-cli/archive/refs/tags/v$version.tar.gz"
sha=$(shasum -a 256 "$tarball" | cut -d ' ' -f 1)
sed -i '' -e "s/^  version \".*\"/  version \"$version\"/" -e "s/^  sha256 \".*\"/  sha256 \"$sha\"/" Casks/venes.rb
git commit -q -am "venes $version"
echo "venes $version ($sha)"
