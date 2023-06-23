#!/bin/bash

docker system prune
docker container rm -f $(docker container ls -aq)
docker image prune -a