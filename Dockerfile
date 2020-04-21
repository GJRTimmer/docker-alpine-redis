FROM registry.timmertech.nl/docker/alpine-base:3.11

ARG BUILD_DATE
ARG VCS_REF
ARG REDIS=5.0.7

ENV REDIS_VERSION=${REDIS}

LABEL \
    maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name=alpine-redis \
    org.label-schema.vendor=timmertech.nl \
    org.label-schema.url="https://gitlab.timmertech.nl/docker/redis" \
    org.label-schema.vcs-url="https://gitlab.timmertech.nl/docker/redis.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    nl.timmertech.license=MIT \
    org.alpinelinux.version=3.11 \
    io.redis.version=${REDIS_VERSION}

RUN echo 'http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    apk add --update --no-cache redis=${REDIS_VERSION}-r0

COPY rootfs/ /

EXPOSE 6379/tcp
EXPOSE 26379/tcp

VOLUME ["/var/lib/redis", "/var/log/redis"]
