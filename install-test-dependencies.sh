set -e

if [ "$(uname)" == "Darwin" ]; then
  brew install imagemagick
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  git clone https://github.com/SoftCreatR/imei
  cd imei
  sudo ./imei.sh
  cd ..
else
  choco install imagemagick
fi
