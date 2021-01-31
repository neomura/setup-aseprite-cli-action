set -e

ls
ls clone
ls clone/build
cd clone/build/bin
echo "$PWD/clone/build/bin" >> $GITHUB_PATH
