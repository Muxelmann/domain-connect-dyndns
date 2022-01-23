# domain-connect-dyndns

[![Software License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/Muxelmann/domain-connect-dyndns/blob/main/LICENSE)
[![Build, Test, & Lint](https://github.com/muxelmann/domain-connect-dyndns/actions/workflows/docker-image.yml/badge.svg)](https://github.com/Muxelmann/domain-connect-dyndns/blob/main/.github/workflows/docker-image.yml)

Also available on [Docker Hub](https://hub.docker.com/repository/docker/muxelmann/domain-connect-dyndns).

## tl;dr

Set up a dynamic DNS connection for an website using:

```bash
docker run --rm -it \
    -v ${PWD}/data:/data \
    muxelmann:domain-connect-dyndns \
    domain-connect-dyndns \
    --config /data/settings.txt \
    setup \
    --domain $1
```

And update all set up entries using:

```bash
docker run --rm -it \
    -v ${PWD}/data:/data \
    muxelmann:domain-connect-dyndns \
    domain-connect-dyndns \
    --config /data/settings.txt \
    update \
    --all
```

## Background

The standard (domain-connect-dyndns)[https://github.com/Domain-Connect/DomainConnectDDNS-Python] cannot be installed in Alpine using `pip install domain-connect-dyndns`. Here, I install some libraries I found necessary to install domain-connect-dyndns:

```Dockerfile
FROM python:3.10.2-alpine

RUN apk add --no-cache \
        gcc \
        rust \
        cargo \
        musl-dev \
        python3-dev \
        libffi-dev \
        openssl-dev \
    && \
    pip install domain-connect-dyndns

VOLUME /data

CMD [ "domain-connect-dyndns", "-h" ]
```