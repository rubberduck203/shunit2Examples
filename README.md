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
