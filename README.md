[![build status](https://gitlab.timmertech.nl/docker/alpine-redis/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/alpine-redis/commits/master)

# docker/alpine-redis:3.2.5

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Examples](#examples)
  - [Locations](#locations)
  - [General Configuration](#general-configuration)
  - [Redis Configuration](#redis-configuration)
  - [Slave Configuration](#slave-configuration)
  - [Sentinel Configuration](#sentinel-configuration)
  
  <br>
# Introduction

Docker image for running Redis, image is based upon Alpine Linux.

Redis is an open source, BSD licensed, advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.

<br>
# Getting Started

```bash
docker pull registry.timmertech.nl/docker/alpine-redis
```

<br>
# Examples
 - [standalone redis](examples/docker-redis.yml)
 - [standalone master](examples/docker-master.yml)
 - [standalone slave](examples/docker-slave.yml)
 - [standalone sentinel](examples/docker-sentinel.yml)
 - [master with sentinel](examples/docker-master-sentinel.yml)
 - [slave with sentinel](examples/docker-slave-sentinel.yml)
 - [basic failover setup, 3x redis, 3x sentinel(s)](examples/docker-failover.yml)

<br>
# Locations

Default(s):

| Type | Default |
|------|----------|
| Redis Port | 6379 |
| Sentinel Port | 26379 |
| Data | /var/lib/redis |
| Log(s) | /var/log/redis |
| Unix Socket | /var/run/redis/redis.sock |

<br>
# General Configuration

| Option | Default | Description |
|--------|---------|-------------|
| ```REDIS``` | ```1 / true``` | Activate Redis Server |
| ``` SENTINEL``` | ```0 / false``` | Activate Redis Sentinel |
| ```USERMAP_UID``` | redis | Map ownership to UID |
| ```USERMAP_GID``` | redis | Map ownership to GID |

<br>
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

<br>
# Slave Configuration

| Option | Default | Required | Description |
|--------|---------|----------|-------------|
| ```SLAVE``` | 0 | - | Mark redis server as slave |
| ```SLAVE_MHOST``` | - | Yes | IP of master server |
| ```SLAVE_MPORT``` | 6379 | No | Port of the master redis server |
| ```SLAVE_MPASS``` | - | No | Password of the master redis server |
| ```SLAVE_IP``` | - | No | Publish IP of slave, used for docker NAT, ```IP``` is IP to reach container, uses redis ```slave-announce-ip``` |
| ```SLAVE_PORT``` | - | No | Publish port of slave, used for docker, ````PORT``` is port to reach container, uses redis ```slave-announce-port``` |

<br>
# Sentinel Configuration

| Option | Default | Required | Description |
|--------|---------|----------|-------------|
| ```SENTINEL``` | 0 | - | Activate redis-server sentinel |
| ```SENTINEL_IP``` | - | No | Publish IP of sentinel, used for docker NAT, ```IP``` is IP to reach container, uses ```sentinel announce-ip``` | 
| ```SENTINEL_PORT``` | - | No | Publish IP of sentinel, used for docker NAT, ```IP``` is IP to reach container, uses ```sentinel announce-ip``` |
| ```SENTINEL_MSET``` | - | Yes | Name of master set |
| ```SENTINEL_MHOST``` | - | Yes | IP of master redis |
| ```SENTINEL_MPORT``` | 6379 | No | Port of master redis server |
| ```SENTINEL_MPASS``` | - | No | Password of master redis server |
| ```SENTINEL_QUORUM``` | - | Yes | Quorum voting value |
