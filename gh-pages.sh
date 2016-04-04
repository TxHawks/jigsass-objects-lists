#!/bin/sh
# Generate documentation and deploy it to GitHub pages
# http://TxHawks.github.io/jigsass-objects-lists/
gulp sass:sg
git add ./docs/styleguide/.
git commit -m "Compile documentation"
git subtree push --prefix docs/styleguide origin gh-pages
