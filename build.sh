set -e

echo GITHUB_ACTION_REPOSITORY
echo GITHUB_ACTION_REF
#git clone https://github.com/neomura/setup-aseprite-cli-action --recurse-submodules --depth 1 clone

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
