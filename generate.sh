#!/usr/bin/bash

mkdir -p logs

cat specs/cyperf-openapi.json | python -c 'import sys, yaml, json; print(yaml.dump(json.loads(sys.stdin.read())))' | tee cyperf/cyperf-openapi.yaml
docker run --rm -v ${PWD}:/local --user=$(id -u):$(id -g) openapitools/openapi-generator-cli generate -i /local/cyperf/cyperf-openapi.yaml -g python -o /local/cyperf 2>&1 | tee logs/generate.log
mv cyperf/openapi_client cyperf/rest
