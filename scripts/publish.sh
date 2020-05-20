#! /usr/bin/env nix-shell
#! nix-shell ../shell.nix -i bash

set -eu

GITHUB_PAGES_BRANCH=gh-pages
nix build --file release.nix
ghp-import -m "Automatic update" -b $GITHUB_PAGES_BRANCH $(readlink ./result)
git push -f git@github.com:wagdav/wagdav.github.com $GITHUB_PAGES_BRANCH:master