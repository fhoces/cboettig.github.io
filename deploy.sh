#!/bin/bash
set -e
git config --global user.name cboettig
git config --global user.email cboettig@server.com
cd .. && git clone https://cboettig:${GH_TOKEN}@github.com/cboettig/cboettig.github.io deploy 
cp -a source/_site/ deploy/ 
cd deploy && git add -A . && git commit -m 'Site updated' && git push
