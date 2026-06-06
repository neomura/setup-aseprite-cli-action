set -e

if [ -f "$PWD/clone/submodules/aseprite/aseprite/build/bin/aseprite" ]; then
  echo "Skipping build as cache hit."
  exit 0
fi

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo apt-get update
  sudo apt-get install libxcb1-dev libxcursor-dev libxi-dev libxrandr-dev libglx-dev libgl-dev
fi

cd clone
git checkout temp

git submodule update --init --recursive --depth 1 submodules/aseprite/aseprite
cd submodules/aseprite/aseprite
bash ./build.sh --auto --norun
