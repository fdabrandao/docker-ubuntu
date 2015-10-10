#!/bin/sh
BASEDIR=`dirname $0`
cd $BASEDIR

docker build -t fdabrandao/docker-ubuntu . || exit 1
docker stop $(docker ps -a | grep fdabrandao/docker-ubuntu | cut -d" " -f1) 2>/dev/null
docker rm $(docker ps -a | grep fdabrandao/docker-ubuntu | cut -d" " -f1) 2>/dev/null
docker run -it --rm fdabrandao/docker-ubuntu || exit 1
