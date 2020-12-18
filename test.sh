set -e

rm -rf ./test/actual

aseprite --batch --list-tags --trim ./test/example.ase --data ./test/actual/example.json --save-as ./test/actual/example.png

cmp <(ls ./test/actual) <(echo "example.json
example1.png
example2.png
example3.png
example4.png
example5.png
example6.png
example7.png
example8.png
example9.png")

if [ "$(uname)" == "Darwin" ]; then
  MAGICK=magick
  brew install imagemagick
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  MAGICK=magick
  git clone https://github.com/SoftCreatR/imei
  cd imei
  sudo ./imei.sh
  cd ..
else
  choco install imagemagick
  MAGICK=$(find "C:/Program Files" -name imagick.exe -print -quit)
fi

cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example1.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example2.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example3.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example4.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example5.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example6.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example7.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example8.png) <(echo "48x32")
cmp <($MAGICK identify -format "%wx%h\n" ./test/actual/example9.png) <(echo "48x32")

$MAGICK convert ./test/actual/example1.png ./test/actual/example1.rgba
$MAGICK convert ./test/actual/example2.png ./test/actual/example2.rgba
$MAGICK convert ./test/actual/example3.png ./test/actual/example3.rgba
$MAGICK convert ./test/actual/example4.png ./test/actual/example4.rgba
$MAGICK convert ./test/actual/example5.png ./test/actual/example5.rgba
$MAGICK convert ./test/actual/example6.png ./test/actual/example6.rgba
$MAGICK convert ./test/actual/example7.png ./test/actual/example7.rgba
$MAGICK convert ./test/actual/example8.png ./test/actual/example8.rgba
$MAGICK convert ./test/actual/example9.png ./test/actual/example9.rgba

cmp ./test/expected/example1.rgba ./test/actual/example1.rgba
cmp ./test/expected/example2.rgba ./test/actual/example2.rgba
cmp ./test/expected/example3.rgba ./test/actual/example3.rgba
cmp ./test/expected/example4.rgba ./test/actual/example4.rgba
cmp ./test/expected/example5.rgba ./test/actual/example5.rgba
cmp ./test/expected/example6.rgba ./test/actual/example6.rgba
cmp ./test/expected/example7.rgba ./test/actual/example7.rgba
cmp ./test/expected/example8.rgba ./test/actual/example8.rgba
cmp ./test/expected/example9.rgba ./test/actual/example9.rgba

cmp <(jq -cS . ./test/expected/example.json) <(jq -cS . ./test/actual/example.json)
