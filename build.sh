set -e

if [ -f "$PWD/build/bin/aseprite" ]; then
  echo "Skipping build as cache hit."
  exit 0
fi

cd clone
git checkout temp

git submodule update --init --recursive --depth 1 submodules/aseprite/aseprite
cd submodules/aseprite/aseprite
bash ./build.sh --auto --norun
