[![build status](https://gitlab.timmertech.nl/docker/alpine-redis/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/alpine-redis/commits/master)

# docker/alpine-redis

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Locations](#locations)
  - [Configuration Options](#configuration-options)

# Introduction

Docker image for running Redis, image is based upon Alpine Linux.

Redis is an open source, BSD licensed, advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.

# Getting Started

```bash
docker pull registry.timmertech.nl/docker/alpine-redis
```

# Locations

Default Locations:

| Type | Location |
|------|----------|
| Data | /var/lib/redis |
| Log(s) | /var/log/redis |
| Unix Socket | /var/run/redis/redis.sock |

# Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| REDIS_PORT | 6379 | Redis port |
| REDIS_TIMEOUT | 0 | Close the connection after a client is idle for N seconds (0 to disable) |
| REDIS_KEEPALIVE | 0 | # If non-zero, use SO_KEEPALIVE to send TCP ACKs to clients in absence <br> of communication. This is useful for two reasons: <br><br> 1) Detect dead peers.<br> 2) Take the connection alive from the point of view of network<br>    equipment in the middle.<br><br> On Linux, the specified value (in seconds) is the period used to send ACKs.<br> Note that to close the connection the double of the time is needed.<br> On other kernels the period depends on the kernel configuration.<br><br> A reasonable value for this option is 60 seconds. |
| REDIS_DATA | /var/lib/redis | Data directory of redis |
| REDIS_PASSWORD | - | Password authentication |
| REDIS_MAXCLIENTS | - | Set maximum number of clients |
| USERMAP_UID | - | Map ownership to UID |
| USERMAP_GID | - | Map ownership to GID |
