#!/usr/bin/bash

mkdir -p logs
mkdir -p apis

cat specs/data-model/cyperf-openapi.json | python -c 'import sys, yaml, json; print(yaml.dump(json.loads(sys.stdin.read())))' | tee apis/cyperf-openapi.yaml
docker run --rm -v ${PWD}:/local --user=$(id -u):$(id -g) openapitools/openapi-generator-cli generate -i /local/apis/cyperf-openapi.yaml -g python -o /local/apis 2>&1 | tee logs/generate.log
