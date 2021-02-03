set -e

if [ "$(uname)" == "Darwin" ]; then
  echo "$PWD/build/bin" >> $GITHUB_PATH
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo echo "$PWD/build/bin" >> $GITHUB_PATH
else
  echo "$PWD/build/bin" >> $GITHUB_PATH
fi
