#!/bin/bash

build() {
  VERSION=${VERSION:-0.6.0}
  TAG=${VERSION}

# build
  echo Building pixelmilk/mesos-dns:${TAG}
    docker build \
      --squash \
      --compress \
      --build-arg VERSION=${VERSION} \
      -t pixelmilk/mesos-dns:${TAG} \
      . || exit $?
}

#     Mesos version
build "0.6.0"