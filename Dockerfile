FROM registry.timmertech.nl/docker/alpine-base:latest
MAINTAINER G.J.R. Timmer <gjr.timmer@gmail.com>

RUN echo 'http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
	apk add --update --no-cache redis && \
	sed 's/^bind 127.0.0.1/bind 0.0.0.0/' -i /etc/redis/redis.conf

COPY rootfs/ /

VOLUME ["/var/lib/redis", "/var/log/redis"]

EXPOSE 6379/tcp