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

cmp <(magick identify -format "%wx%h\n" ./test/actual/example1.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example2.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example3.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example4.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example5.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example6.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example7.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example8.png) <(echo "48x32")
cmp <(magick identify -format "%wx%h\n" ./test/actual/example9.png) <(echo "48x32")

magick convert ./test/actual/example1.png ./test/actual/example1.rgba
magick convert ./test/actual/example2.png ./test/actual/example2.rgba
magick convert ./test/actual/example3.png ./test/actual/example3.rgba
magick convert ./test/actual/example4.png ./test/actual/example4.rgba
magick convert ./test/actual/example5.png ./test/actual/example5.rgba
magick convert ./test/actual/example6.png ./test/actual/example6.rgba
magick convert ./test/actual/example7.png ./test/actual/example7.rgba
magick convert ./test/actual/example8.png ./test/actual/example8.rgba
magick convert ./test/actual/example9.png ./test/actual/example9.rgba

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
