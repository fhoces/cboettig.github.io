#!/bin/bash

REPO="cboettig.github.io"
SOURCE="source"
DEPLOY="master"

## Only build the site if the commit hook was a push to the source branch.
if [ "$DRONE_BRANCH" ]
  then 
    if [ "$DRONE_BRANCH" = "$SOURCE" ]
      then
				## Deploy site: clone the gh-pages branch, rsync files, commit, and push
        cd .. && git clone -b ${DEPLOY} https://cboettig:${GH_TOKEN}@github.com/cboettig/$REPO deploy 
        rsync -av $REPO/_site/ deploy/
        cd deploy && git add -A . && git commit -m 'Site updated from drone' && git push
    fi
fi