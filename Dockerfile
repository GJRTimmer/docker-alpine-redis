FROM registry.timmertech.nl/docker/alpine-base:latest
MAINTAINER G.J.R. Timmer <gjr.timmer@gmail.com>

RUN echo 'http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
	apk add --update --no-cache redis && \
	sed 's/^# unixsocket \/tmp/unixsocket \/var\/run\/redis/' -i /etc/redis.conf && \
	sed 's/^# unixsocketperm 700/unixsocketperm 777/' -i /etc/redis.conf

COPY rootfs/ /

VOLUME ["/var/lib/redis", "/var/log/redis"]

EXPOSE 6379/tcp