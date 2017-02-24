#!/bin/bash

function testCanCallExternalFunction() {
  . greetings.sh
  
  assertEquals "Hello World" "$(greet)"
}

tmpFile="/workspace/greeting"

setUp() {
  if [ -e $tmpFile  ]; then
    rm -r $tmpFile
  fi
}

testWriteGreetingToFile() {
  . greetings.sh

 #writeGreeting $tmpFile
 assertTrue "File $tmpFile should exist" "[ -e $tmpFile ]"
}

# load shunit2
. shunit2
