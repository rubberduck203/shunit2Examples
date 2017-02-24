FROM ubuntu

RUN apt-get update && \
	apt-get install shunit2

RUN mkdir /workspace && mkdir /src

WORKDIR /src
