#!/usr/bin/env bash

docker rm -f docker-ubuntu1804-base
docker run --name docker-ubuntu1804-base -d --rm docker-ubuntu1804-base
