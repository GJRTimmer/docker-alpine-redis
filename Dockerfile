FROM registry.timmertech.nl/docker/alpine-base:latest
MAINTAINER G.J.R. Timmer <gjr.timmer@gmail.com>

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
	apk add --update --no-cache redis@edge

COPY rootfs/ /

EXPOSE 6379/tcp
EXPOSE 26379/tcp

VOLUME ["/var/lib/redis", "/var/log/redis"]
