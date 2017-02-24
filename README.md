# shUnit2 Examples

 - Me spiking out how to test drive bash scripts
 - Use a docker container to run the tests in so we don't inadvertantly `rm -rf /` or anything equally stupid while I'm learning


## Building docker image

```bash
# From inside project root
docker build -t shunit2 .
```

## Running docker container

```bash
docker run -it --rm shunit2
```


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

