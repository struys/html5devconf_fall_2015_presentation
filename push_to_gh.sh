#!/bin/bash

set -ex

[ "$TRAVIS_BRANCH" == "master" -a "$TRAVIS_PULL_REQUEST" == "false" ] || exit

git clone "https://${GH_TOKEN}@${GH_REF}" out >& /dev/null
cd out
git checkout gh-pages
git config user.name "Travis-CI"
git config user.email "ken@struys.ca"
# Repo
cp ../.travis.yml .
# Website
cp -R ../build ../bower_components ../index.html ../assets .

git add . >& /dev/null
git commit -m "Deployed ${TRAVIS_BUILD_NUMBER} to Github Pages" >& /dev/null
git push origin HEAD
