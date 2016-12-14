FROM registry.timmertech.nl/docker/alpine-base:latest
MAINTAINER G.J.R. Timmer <gjr.timmer@gmail.com>

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
	apk add --update --no-cache redis@edge && \
	sed 's/^daemonize yes/daemonize no/' -i /etc/redis.conf && \
	sed 's/^bind 127.0.0.1/bind 0.0.0.0/' -i /etc/redis.conf && \
	sed 's/^# unixsocket \/tmp/unixsocket \/var\/run\/redis/' -i /etc/redis.conf && \
	sed 's/^# unixsocketperm 700/unixsocketperm 777/' -i /etc/redis.conf && \
	sed 's/^# maxclients 10000/maxclients 1024/' -i /etc/redis.conf

COPY rootfs/ /

EXPOSE 6379/tcp

VOLUME ["/var/lib/redis", "/var/log/redis"]