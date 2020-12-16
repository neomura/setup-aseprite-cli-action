set -e

# Unfortunately, the GitHub Actions Marketplace strips out all Git details
# (including submodules) on publish, so we have to re-clone our own repository
# to get the Aseprite submodule we plan to build.

NEOMURA_SETUP_ASEPRITE_CLI_ACTION_BRANCH=${NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REF#refs/heads/}
NEOMURA_SETUP_ASEPRITE_CLI_ACTION_BRANCH=${NEOMURA_SETUP_ASEPRITE_CLI_ACTION_BRANCH#refs/tags/}

git clone https://github.com/$NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REPOSITORY --branch $NEOMURA_SETUP_ASEPRITE_CLI_ACTION_BRANCH --recurse-submodules --depth 1 clone

if [ "$(uname)" == "Darwin" ]; then
  brew install ninja
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo apt-get update
  sudo apt-get install ninja-build xorg-dev
else
  choco install ninja
fi

cmake -E make_directory build
cmake -E chdir build cmake -G Ninja -DENABLE_UI=OFF ../clone/submodules/aseprite/aseprite
cd build
ninja

echo "$PWD/bin" >> $GITHUB_PATH
