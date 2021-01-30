set -e

# Unfortunately, the GitHub Actions Marketplace strips out all Git details
# (including submodules) on publish, so we have to re-clone our own repository
# to get the Aseprite submodule we plan to build.

mkdir clone
cd clone

git init
git remote add origin https://github.com/$NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REPOSITORY
git fetch origin $NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REF:temp
git checkout temp

git submodule update --init --recursive --depth 1 submodules/aseprite/aseprite
cd ..

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
