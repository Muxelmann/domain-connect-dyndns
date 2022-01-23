#!/bin/sh
docker run --rm -it \
    -v ${PWD}/data:/data \
    muxelmann:domain-connect-dyndns \
    domain-connect-dyndns \
    --config /data/settings.txt \
    update \
    --all
