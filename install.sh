set -e

echo 1
ls clone
echo 2
ls clone/submodules
echo 3
ls clone/submodules/aseprite
echo 4
ls clone/submodules/aseprite/aseprite
echo 5
ls clone/submodules/aseprite/aseprite/build
echo 6
ls clone/submodules/aseprite/aseprite/build/bin

echo "$PWD/clone/submodules/aseprite/aseprite/build/bin" >> $GITHUB_PATH
