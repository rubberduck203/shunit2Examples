#!/bin/bash

function testCanCallExternalFunction() {
  . greetings.sh
  
  assertEquals "Hello World" "$(greet)"
}

testWriteGreetingToFile() {
  . greetings.sh

  writeGreeting $tmpFile
  assertTrue "File $tmpFile should exist" "[ -e $tmpFile ]"
}

oneTimeSetUp() {
  SHUNIT_TMPDIR="work"
  mkdir "$SHUNIT_TMPDIR"
  tmpFile="${SHUNIT_TMPDIR}/greeting"
}

oneTimeTearDown() {
  rm -r "$SHUNIT_TMPDIR"
}

setUp() {
  if [ -e $tmpFile  ]; then
    rm -r $tmpFile
  fi
}

# load shunit2
. shunit2
