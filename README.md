[![build status](https://gitlab.timmertech.nl/docker/alpine-redis/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/alpine-redis/commits/master)

# docker/alpine-redis

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Configuration](#configuration)

# Introduction

Docker image for running Redis, image is based upon Alpine Linux.

Redis is an open source, BSD licensed, advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.

# Getting Started

```bash
docker pull registry.timmertech.nl/docker/alpine-redis
```

# Configuration

Default Locations:

| Type | Location |
|------|----------|
| Data | /var/lib/redis |
| Log(s) | /var/log/redis |
| Unix Socket | /var/run/redis/redis.sock |

<br>
<br>

| Option | Description |
|--------|-------------|
| REDIS_PASSWORD | Password authentication (default: NONE) |
| REDIS_MAXCLIENTS | Set maximum number of clients (default: 1024) |

