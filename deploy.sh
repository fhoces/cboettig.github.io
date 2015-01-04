#!/bin/bash
set -e
git config user.name cboettig
git config user.email cboettig@server.com

if [ ! -d _posts  ]; then
	git checkout gh-pages 
fi
rsync -a _site/ . 
rm -rf _site && git add -A . && git commit -m 'Site updated' && git push
