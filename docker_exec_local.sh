#!/usr/bin/env bash

docker rm -f docker-ubuntu1804-base
docker run --name docker-ubuntu1804-base -it docker-ubuntu1804-base /bin/zsh
