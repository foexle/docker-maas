#!/usr/bin/env bash

set -e
set -x

docker build -t nottrobin/maas .
docker run -v /dev/log:/dev/log nottrobin/maas make syncdb
docker run -v /dev/log:/dev/log nottrobin/maas make sampledata
docker run -v /dev/log:/dev/log -p 5240:5240 nottrobin/maas make run
