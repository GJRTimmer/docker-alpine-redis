[![build status](https://gitlab.timmertech.nl/docker/alpine-redis/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/alpine-redis/commits/master)

# docker/alpine-redis

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Locations](#locations)
  - [General Configuration Options ](#general-configuration-options)

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
# Locations

Default Locations:

| Type | Location |
|------|----------|
| Data | /var/lib/redis |
| Log(s) | /var/log/redis |
| Unix Socket | /var/run/redis/redis.sock |

<br>
# General Configuration Options 

| Option | Default | Description |
|--------|---------|-------------|
| ```REDIS_PORT``` | 6379 | Redis port |
| ```REDIS_TIMEOUT``` | 0 | Close the connection after a client is idle for N seconds (0 to disable) |
| ```REDIS_KEEPALIVE``` | 0 | # If non-zero, use SO_KEEPALIVE to send TCP ACKs to clients in absence <br> of communication. This is useful for two reasons: <br><br> 1) Detect dead peers.<br> 2) Take the connection alive from the point of view of network<br>    equipment in the middle.<br><br> On Linux, the specified value (in seconds) is the period used to send ACKs.<br> Note that to close the connection the double of the time is needed.<br> On other kernels the period depends on the kernel configuration.<br><br> A reasonable value for this option is 60 seconds. |
| ```REDIS_DATA``` | /var/lib/redis | Data directory of redis |
| ```REDIS_DATABASES``` | 16 | Number of redis databases | 
| ```REDIS_PASSWORD``` | - | Password authentication |
| ```REDIS_MAXCLIENTS``` | 1024 | Set maximum number of clients |
| ```USERMAP_UID``` | redis | Map ownership to UID |
| ```USERMAP_GID``` | redis | Map ownership to GID |

<br>
# Master Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| ```REDIS_MIN_SLAVES_TO_WRITE``` | 0 | It is possible for a master to stop accepting writes if there are less than<br> N slaves connected, having a lag less or equal than M seconds.<br><br> The N slaves need to be in "online" state.<br><br> The lag in seconds, that must be <= the specified value, is calculated from<br> the last ping received from the slave, that is usually sent every second.<br><br> This option does not GUARANTEE that N replicas will accept the write, but<br> will limit the window of exposure for lost writes in case not enough slaves<br> are available, to the specified number of seconds.<br><br> For example to require at least 3 slaves with a lag <= 10 seconds use:<br><br> min-slaves-to-write 3<br> min-slaves-max-lag 10<br><br> Setting one or the other to 0 disables the feature.<br><br> By default min-slaves-to-write is set to 0 (feature disabled) and<br> min-slaves-max-lag is set to 10. |
| ```REDIS_MIN_SLAVES_MAX_LAG``` | 10 | See REDIS_MIN_SLAVES_TO_WRITE, only set when REDIS_MIN_SLAVES_TO_WRITE is set | 

<br>
# Slave Configuration Options
| Option | Default | Description |
|--------|---------|-------------|
| ```REDIS_IS_SLAVE``` | 0 | If set to ```1``` or ```true``` redis server will become a slave.<br><br>Required parameters for slave configuration:<br> - ```REDIS_MASTER_HOST```<br> - ```REDIS_MASTER_PORT```<br> |
| ```REDIS_MASTER_HOST``` | - | IP of redis master |
| ```REDIS_MASTER_PORT``` | 6379 | Port number of redis master |
| ```REDIS_MASTER_PASSWORD``` | - | Password of redis master |

