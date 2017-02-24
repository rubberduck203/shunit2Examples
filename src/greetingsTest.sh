#!/bin/bash

function testCanCallExternalFunction() {
  . greetings.sh
  
  assertEquals "Hello World" "$(greet)"
}

# load shunit2
. shunit2
