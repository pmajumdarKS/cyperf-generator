#!/bin/bash

docker run --rm -it -v `pwd`:/cyperf -e LOCAL_UID=$UID docker-local-isg.artifactory.it.keysight.com/cyperf/cyperf-test:latest bash
