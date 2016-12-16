[![build status](https://gitlab.timmertech.nl/docker/alpine-redis/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/alpine-redis/commits/master)
[![](https://images.microbadger.com/badges/image/datacore/alpine-redis.svg)](https://microbadger.com/images/datacore/alpine-redis)
[![](https://images.microbadger.com/badges/version/datacore/alpine-redis.svg)](https://microbadger.com/images/datacore/alpine-redis)
[![](https://images.microbadger.com/badges/commit/datacore/alpine-redis.svg)](https://microbadger.com/images/datacore/alpine-redis)
[![](https://images.microbadger.com/badges/license/datacore/alpine-redis.svg)](https://microbadger.com/images/datacore/alpine-redis)

# docker/alpine-redis:3.2.5

Docker image for redis server with optional sentinel.

- [Introduction](#introduction)
- [Docker Registries](#docker-registries)
- [Source Repositories](#source-repositories)
- [Installation](#installation)
  - [DockerHub](#install-from-dockerhub)
  - [TimmerTech](#install-from-timmertech)
- [Examples](#examples)
- [Locations](#locations)
- [General Configuration](#general-configuration)
- [Redis Configuration](#redis-configuration)
- [Slave Configuration](#slave-configuration)
- [Sentinel Configuration](#sentinel-configuration)
  

# Introduction

Docker image for running Redis, image is based upon Alpine Linux.

Redis is an open source, BSD licensed, advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.


# Docker Registries

 - ```datacore/alpine-redis:latest``` (DockerHub)
 - ```registry.timmertech.nl/docker/alpine-redis:latest``` (registry.timmertech.nl)

 
# Source Repositories

- [https://github.com/GJRTimmer/docker-alpine-redis](github.com)
- [https://gitlab.timmertech.nl/docker/alpine-redis.git](gitlab.timmertech.nl)

 
# Installation

## Install from DockerHub
Download:
```bash
docker pull datacore/alpine-redis:latest
```

Build:
```bash
docker build -t datacore/docker-alpine-redis https://github.com/GJRTimmer/docker-alpine-redis
```


## Install from timmertech

Download:
```bash
docker pull registry.timmertech.nl/docker/alpine-redis:latest
```

Build:
```bash
docker build -t datacore/docker-alpine-redis https://gitlab.timmertech.nl/docker/alpine-redis
```


# Examples
 - [standalone redis](examples/docker-redis.yml)
 - [standalone master](examples/docker-master.yml)
 - [standalone slave](examples/docker-slave.yml)
 - [standalone sentinel](examples/docker-sentinel.yml)
 - [master with sentinel](examples/docker-master-sentinel.yml)
 - [slave with sentinel](examples/docker-slave-sentinel.yml)
 - [basic failover setup, 3x redis, 3x sentinel(s)](examples/docker-failover.yml)


# Locations

Default(s):

| Type | Default |
|------|----------|
| Redis Port | 6379 |
| Sentinel Port | 26379 |
| Data | /var/lib/redis |
| Log(s) | /var/log/redis |
| Unix Socket | /var/run/redis/redis.sock |


# General Configuration

| Option | Default | Description |
|--------|---------|-------------|
| ```REDIS``` | ```1 / true``` | Activate Redis Server |
| ```SENTINEL``` | ```0 / false``` | Activate Redis Sentinel |
| ```USERMAP_UID``` | redis | Map ownership to UID |
| ```USERMAP_GID``` | redis | Map ownership to GID |


# Redis Configuration
| Option | Default | Description |
|--------|---------|-------------|
| ```REDIS``` | ```1 / true``` | Activate Redis Server |
| ```REDIS_TIMEOUT``` | 0 | Close the connection after a client is idle for N seconds (0 to disable) |
| ```REDIS_KEEPALIVE``` | 300 | TCP keepalive.<br><br>If non-zero, use SO_KEEPALIVE to send TCP ACKs to clients in absence<br>of communication. This is useful for two reasons:<br><br>1) Detect dead peers.<br>2) Take the connection alive from the point of view of network<br>   equipment in the middle.<br><br>On Linux, the specified value (in seconds) is the period used to send ACKs.<br>Note that to close the connection the double of the time is needed.<br>On other kernels the period depends on the kernel configuration.<br><br>A reasonable value for this option is 300 seconds, which is the new<br>Redis default starting with Redis 3.2.1. | 
| ```REDIS_DATABASES``` | 16 | Number of redis databases | 
| ```REDIS_DATA``` | /var/lib/redis | Data directory of redis |
| ```REDIS_PASSWORD``` | - | Redis password |
| ```REDIS_MAXCLIENTS``` | 10000 | Max connected clients | 
| ```REDIS_MIN_SLAVES_TO_WRITE``` | 1 | It is possible for a master to stop accepting writes if there are less than<br>N slaves connected, having a lag less or equal than M seconds. |
| ```REDIS_MIN_SLAVES_MAX_LAG``` | 10 | It is possible for a master to stop accepting writes if there are less than<br>N slaves connected, having a lag less or equal than M seconds. |


# Slave Configuration

| Option | Default | Required | Description |
|--------|---------|----------|-------------|
| ```SLAVE``` | 0 | - | Mark redis server as slave |
| ```SLAVE_MHOST``` | - | Yes | IP of master server |
| ```SLAVE_MPORT``` | 6379 | No | Port of the master redis server |
| ```SLAVE_MPASS``` | - | No | Password of the master redis server |
| ```SLAVE_IP``` | - | No | Publish IP of slave, used for docker NAT, ```IP``` is the docker host IP to reach container, uses redis ```slave-announce-ip``` |
| ```SLAVE_PORT``` | - | No | Publish port of slave, used for docker, ```PORT``` is the docker host port to reach container, uses redis ```slave-announce-port``` |


# Sentinel Configuration

| Option | Default | Required | Description |
|--------|---------|----------|-------------|
| ```SENTINEL``` | 0 | - | Activate redis-server sentinel |
| ```SENTINEL_IP``` | - | No | Publish IP of sentinel, used for docker NAT, ```IP``` is the docker host IP to reach container, uses ```sentinel announce-ip``` | 
| ```SENTINEL_PORT``` | - | No | Publish IP of sentinel, used for docker NAT, ```PORT``` is the docker host PORT to reach container, uses ```sentinel announce-ip``` |
| ```SENTINEL_MSET``` | - | Yes | Name of master set |
| ```SENTINEL_MHOST``` | - | Yes | IP of master redis |
| ```SENTINEL_MPORT``` | 6379 | No | Port of master redis server |
| ```SENTINEL_MPASS``` | - | No | Password of master redis server |
| ```SENTINEL_QUORUM``` | - | Yes | Quorum voting value |
| ```SENTINEL_DOWN_AFTER_MS``` | 30000 | No | Number of milliseconds the master (or any attached slave or sentinel) should<br> be unreachable (as in, not acceptable reply to PING, continuously, for the<br> specified period) in order to consider it in S_DOWN state (Subjectively<br> Down).<br><br> Default is 30 seconds. |
| ```SENTINEL_PARALLEL_SYNCS``` | 1 | No | How many slaves we can reconfigure to point to the new slave simultaneously<br> during the failover. Use a low number if you use the slaves to serve query<br> to avoid that all the slaves will be unreachable at about the same<br> time while performing the synchronization with the master. |
| ```SENTINEL_FAILOVER_TIMEOUT``` | 180000 | No | Specifies the failover timeout in milliseconds. It is used in many ways:<br><br> - The time needed to re-start a failover after a previous failover was<br>   already tried against the same master by a given Sentinel, is two<br>   times the failover timeout.<br><br> - The time needed for a slave replicating to a wrong master according<br>   to a Sentinel current configuration, to be forced to replicate<br>   with the right master, is exactly the failover timeout (counting since<br>   the moment a Sentinel detected the misconfiguration).<br><br> - The time needed to cancel a failover that is already in progress but<br>   did not produced any configuration change (SLAVEOF NO ONE yet not<br>   acknowledged by the promoted slave).<br><br> - The maximum time a failover in progress waits for all the slaves to be<br>   reconfigured as slaves of the new master. However even after this time<br>   the slaves will be reconfigured by the Sentinels anyway, but not with<br>   the exact parallel-syncs progression as specified.<br><br> Default is 3 minutes. |

