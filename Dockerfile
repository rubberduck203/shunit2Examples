FROM ubuntu

RUN apt-get update && \
	apt-get install shunit2

RUN mkdir /src

WORKDIR /src
