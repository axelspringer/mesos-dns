#!/bin/bash

push() {
  VERSION=${VERSION:-0.6.0}
  TAG=${VERSION}

# base
  echo
  echo Pushing pixelmilk/mesos-dns:${TAG}
  docker push pixelmilk/mesos-dns:${TAG} || exit $?
}

# login docker before push
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

#    Mesos version
push "1.3.1"
