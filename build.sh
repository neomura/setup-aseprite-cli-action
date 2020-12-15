set -e

git clone https://github.com/$NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REPOSITORY --branch $NEOMURA_SETUP_ASEPRITE_CLI_ACTION_REPOSITORY --recurse-submodules --depth 1 clone

if [ "$(uname)" == "Darwin" ]; then
  brew install ninja
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo apt-get update
  sudo apt-get install ninja-build xorg-dev
else
  choco install ninja
fi

cmake -E make_directory build
cmake -E chdir build cmake -G Ninja -DENABLE_UI=OFF ../submodules/aseprite/aseprite
cd build
ninja
