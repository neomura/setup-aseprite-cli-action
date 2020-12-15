set -e
#sudo apt-get update
#sudo apt-get install libx11-dev libxcursor-dev xorg-dev ninja-build -y
sudo apt-get install ninja-build xorg-dev
cmake -E make_directory build
cmake -E chdir build cmake -G "Ninja" -DENABLE_UI=OFF ../submodules/aseprite/aseprite
cd build
ninja
