#!/bin/bash

function testCanCallExternalFunction() {
  . greetings.sh
  
  assertEquals "Hello World" "$(greet)"
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

testWriteGreetingToFile() {
  . greetings.sh

  echo $tmpFile 
  writeGreeting $tmpFile
  assertTrue "File $tmpFile should exist" "[ -e $tmpFile ]"
}

# load shunit2
. shunit2
