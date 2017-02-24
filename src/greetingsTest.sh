#!/bin/bash

function testCanCallExternalFunction() {
  . greetings.sh
  
  assertEquals "Hello World" "$(greet)"
}

setUp() {
  if [ -e /workspace/greeting ]; then
    rm -r /workspace/greeting
  fi
}

testWriteGreetingToFile() {
  . greetings.sh

 writeGreeting /workspace/greeting
 assertTrue "[ -e /workspace/greeting ]"
}

# load shunit2
. shunit2
