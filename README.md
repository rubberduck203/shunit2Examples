# shUnit2 Examples

[![Build Status](https://travis-ci.org/ckuhn203/shunit2Examples.svg?branch=master)](https://travis-ci.org/ckuhn203/shunit2Examples)

## Purpose

Figure out how to test drive bash scripts and have reliable test results (i.e. no flaky integration tests!).

## Notes

*Some of these are likely not directly shunit2 things, but just bash things I don't know yet.*

 - Use a docker container to run the tests in so we don't inadvertantly `rm -rf /` or anything equally stupid while I'm learning
 - Import functions from another file with `. filename` source import
 - To match strings with spaces, you must wrap the function call in quotes.
   * `assertEquals "Hello World" "$(greet)"`
 - If you don't pass a message as the first arg to an assert, it's hard to tell what failed.
 - Docker copy the source into the container to completely isolate your file system from the container.
   * The runTests.sh script shows how to copy the source, execute the tests, and clean up the container.
   * I don't bother with this in the travis ci build, because it's already running in a container there, 
       but for consistency, we could.
 - Use the $SHUNIT_TMPDIR variable to set a working directory to write files for integration testing to.
   * Being realistic, many bash tests are going to be integration tests that are checking for existance of files and other side effects.
   * The tests in this project use a `work` directory inside the current working directory.

## Building docker image

```bash
# From inside project root
docker build -t shunit2 .
```

## Run Tests

```bash
./test.sh
```

## shUnit2 in 10 seconds

Docs are installed in /usr/share/doc/shunit2/
*Unfortunately, the HomeBrew Formulae doesn't seem to include the docs. The apt-get package does though.*

Bare bones test looks like this.

```bash
#! /bin/sh
# file: examples/equality_test.sh

testEquality()
{
  assertEquals 1 1
}

# load shunit2
. shunit2
```

Which can be run by executing the `equality_test.sh` file.

```bash
chmod +x equality_test.sh
./equality_test.sh
```

