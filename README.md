# shUnit2 Examples

[![Build Status](https://travis-ci.org/ckuhn203/shunit2Examples.svg?branch=master)](https://travis-ci.org/ckuhn203/shunit2Examples)

Purpose:

 - Me spiking out how to test drive bash scripts
 - Use a docker container to run the tests in so we don't inadvertantly `rm -rf /` or anything equally stupid while I'm learning

Notes:
*Some of these are likely not directly shunit2 things, but just bash things I don't know yet.*

 - Import functions from another file with `. filename` source import
 - To match strings with spaces, you must wrap the function call in quotes.
   * `assertEquals "Hello World" "$(greet)"`
 - If you don't pass a message as the first arg to an assert, it's hard to tell what failed.

### Run Tests

```bash
cd src
docker run -it --rm -v $(pwd):/src shunit2
tests/greetingsTest.sh
```

## Building docker image

```bash
# From inside project root
docker build -t shunit2 .
```

## Running docker container

Run from the project root and mount the ./src directory so it's available live to the container.

```bash
docker run -it --rm -v $(pwd):/src shunit2
```

*Tests that write to the file system use the container:/workspace directory as a place to write temporary files to.*

## shUnit2

Docs are installed in /usr/share/doc/shunit2/

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

