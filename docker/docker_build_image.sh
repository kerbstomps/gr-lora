#!/bin/sh
LATEST_VERSION=`git ls-remote https://github.com/kerbstomps/gr-lora.git | grep HEAD | cut -f 1`
docker build -t kerbstomps/gr-lora --build-arg CACHEBUST=$LATEST_VERSION .