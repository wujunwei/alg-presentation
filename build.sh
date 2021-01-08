#!/usr/bin/env bash

set -e
HUGO_ENV="production" hugo --gc
docker build -f ./Dockerfile -t iamhereforyouforever/algorithm-presentation:latest .
docker push iamhereforyouforever/algorithm-presentation:latest