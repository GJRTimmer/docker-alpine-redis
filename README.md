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
| REDIS_PASSWORD | - | Password authentication |
| REDIS_MAXCLIENTS | - | Set maximum number of clients |
| USERMAP_UID | - | Map ownership to UID |
| USERMAP_GID | - | Map ownership to GID |
