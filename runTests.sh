#!/bin/bash

echo -e "Starting shunit2 container..."
container=$(docker run -itd shunit2)

echo -e "Copying contents of src to $container:/src\n"
docker cp src/. $container:/src

echo -e "Running tests...\n"
docker exec $container tests/greetingsTest.sh

echo -e "\n"
echo -e "Stopping and removing container..."
echo -e "Removed $(docker rm -f $container)\n" 

