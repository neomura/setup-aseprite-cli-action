set -e

# Unfortunately, the GitHub Actions Marketplace strips out all Git details
# (including submodules) on publish, so we have to re-clone our own repository
# to get the Aseprite submodule we plan to build.

mkdir clone
cd clone

git init
git remote add origin https://github.com/$NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REPOSITORY
git fetch origin $NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REF:temp

git rev-parse temp > ../sha
