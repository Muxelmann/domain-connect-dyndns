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