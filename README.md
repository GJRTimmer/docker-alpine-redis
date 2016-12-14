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

<br>
# Sentinel Configuration

| Option | Default | Description |
|--------|---------|-------------|
| SENTINEL_IS_ACTIVE | 0 | If set to ```1``` or ```true``` will start sentinel with provided configuration |
| SENTINEL_PORT | 26379 | Port on which sentinel is running |
| SENTINEL_ANNOUNCE_IP | - | # When announce-ip is provided, the Sentinel will claim the specified IP address<br> in HELLO messages used to gossip its presence, instead of auto-detecting the<br> local address as it usually does.<br><br> Similarly when announce-port is provided and is valid and non-zero, Sentinel<br> will announce the specified TCP port.<br><br> The two options don't need to be used together, if only announce-ip is<br> provided, the Sentinel will announce the specified IP and the server port<br> as specified by the "port" option. If only announce-port is provided, the<br> Sentinel will announce the auto-detected local IP and the specified port. |
| SENTINEL_ANNOUNCE_PORT | - | See ```SENTINEL_ANNOUNCE_IP``` |
| SENTINEL_MASTER_SET | - | Name of the master set to monitor |
| SENTINEL_MASTER_IP | - | IP of redis master |
| SENTINEL_MASTER_PORT | - | Port of redis master to monitor |
| SENTINEL_MASTER_PASSWORD | - | Redis master password |
| SENTINEL_QUORUM | - | Quorum voting value |
| SENTINEL_DOWN_AFTER_MS | 30000 | Number of milliseconds the master (or any attached slave or sentinel) should<br> be unreachable (as in, not acceptable reply to PING, continuously, for the<br> specified period) in order to consider it in S_DOWN state (Subjectively<br> Down).<br><br> Default is 30 seconds. |
| SENTINEL_FAILOVER_TIMEOUT | 180000 | sentinel failover-timeout <master-name> <milliseconds><br><br> Specifies the failover timeout in milliseconds. It is used in many ways:<br><br> - The time needed to re-start a failover after a previous failover was<br>   already tried against the same master by a given Sentinel, is two<br>   times the failover timeout.<br><br> - The time needed for a slave replicating to a wrong master according<br>   to a Sentinel current configuration, to be forced to replicate<br>   with the right master, is exactly the failover timeout (counting since<br>   the moment a Sentinel detected the misconfiguration).<br><br> - The time needed to cancel a failover that is already in progress but<br>   did not produced any configuration change (SLAVEOF NO ONE yet not<br>   acknowledged by the promoted slave).<br><br> - The maximum time a failover in progress waits for all the slaves to be<br>   reconfigured as slaves of the new master. However even after this time<br>   the slaves will be reconfigured by the Sentinels anyway, but not with<br>   the exact parallel-syncs progression as specified.<br><br> Default is 3 minutes. |




