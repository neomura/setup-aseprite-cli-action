set -e

if [ ! -f "$PWD/build/bin/aseprite"]; then
  echo "Skipping build as cache hit."
fi

cd clone
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

if [ "$(uname)" == "Darwin" ]; then
  ninja
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  ninja
else
  ninja -j 1
fi
