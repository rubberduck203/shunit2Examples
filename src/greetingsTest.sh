#!/bin/bash

function testCanCallExternalFunction() {
  . greetings.sh
  
  assertEquals "Hello" `greet`
}

# load shunit2
. shunit2
