#!submodules/bats-core/bats-core/bin/bats

load "./submodules/ztombol/bats-support/load"
load "./submodules/ztombol/bats-assert/load"

@test "makes the aseprite executable accessible to scripts" {
  run rm -r ./test/actual

  run aseprite --batch --list-tags --trim ./test/example.ase --data ./test/actual/example.json --save-as ./test/actual/example.png
  assert_success

  run ls ./test/actual
  assert_success
  assert_output "example.json
example1.png
example2.png
example3.png
example4.png
example5.png
example6.png
example7.png
example8.png
example9.png"

  if [ "$(uname)" == "Darwin" ]; then
    run brew install imagemagick jq
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    run sudo apt-get install imagemagick jq
  else
    run choco install imagemagick jq
  fi

  assert_success

  run identify -format "%wx%h" ./test/actual/example1.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example2.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example3.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example4.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example5.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example6.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example7.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example8.png
  assert_success
  assert_output "48x32"

  run identify -format "%wx%h" ./test/actual/example9.png
  assert_success
  assert_output "48x32"

  run convert ./test/actual/example1.png ./test/actual/example1.rgba
  assert_success

  run convert ./test/actual/example2.png ./test/actual/example2.rgba
  assert_success

  run convert ./test/actual/example3.png ./test/actual/example3.rgba
  assert_success

  run convert ./test/actual/example4.png ./test/actual/example4.rgba
  assert_success

  run convert ./test/actual/example5.png ./test/actual/example5.rgba
  assert_success

  run convert ./test/actual/example6.png ./test/actual/example6.rgba
  assert_success

  run convert ./test/actual/example7.png ./test/actual/example7.rgba
  assert_success

  run convert ./test/actual/example8.png ./test/actual/example8.rgba
  assert_success

  run convert ./test/actual/example9.png ./test/actual/example9.rgba
  assert_success

  run cmp ./test/expected/example1.rgba ./test/actual/example1.rgba
  assert_success

  run cmp ./test/expected/example2.rgba ./test/actual/example2.rgba
  assert_success

  run cmp ./test/expected/example3.rgba ./test/actual/example3.rgba
  assert_success

  run cmp ./test/expected/example4.rgba ./test/actual/example4.rgba
  assert_success

  run cmp ./test/expected/example5.rgba ./test/actual/example5.rgba
  assert_success

  run cmp ./test/expected/example6.rgba ./test/actual/example6.rgba
  assert_success

  run cmp ./test/expected/example7.rgba ./test/actual/example7.rgba
  assert_success

  run cmp ./test/expected/example8.rgba ./test/actual/example8.rgba
  assert_success

  run cmp ./test/expected/example9.rgba ./test/actual/example9.rgba
  assert_success

  run cmp <(jq -cS . ./test/expected/example.json) <(jq -cS . ./test/actual/example.json)
  assert_success
}
