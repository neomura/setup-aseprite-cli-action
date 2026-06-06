set -e

ls clone
ls clone/submodules
ls clone/submodules/aseprite
ls clone/submodules/aseprite/aseprite
ls clone/submodules/aseprite/aseprite/build
ls clone/submodules/aseprite/aseprite/build/bin

echo "$PWD/clone/submodules/aseprite/aseprite/build/bin" >> $GITHUB_PATH
