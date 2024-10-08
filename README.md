### Motivation : Highly configurable cs16 docker image with persistent volume. 

# Docker image for Counter Strike 1.6 Server

## Start the server with run.sh and persistent volume /opt/cs16

```bash
curl https://raw.githubusercontent.com/gaganyaan2/cs16/master/run.sh | bash
```

## Start the server with persistent volume /opt/cs16 (one time only)
```bash
docker run -d -p 27015:27015/udp --name cs16 "$username"/cs16:latest
docker cp -a cs16:/opt/cs16 /opt
docker rm -f cs16
docker run -d -p 27015:27015/udp -v /opt/cs16:/opt/cs16:Z --name cs16 "$username"/cs16:latest
```

## Stop/start/remove the cs16 server

```bash
# stop
docker stop cs16

## Start existing (stopped) server
docker start cs16

## Remove the server
docker rm -f cs16
```

## Run cs16 on kubernetes with nfs persistent volume

```bash
#1.Create NFS server
#2.Download and extract cs16.tar.gz on nfs mount (eg. /opt/nfs1/cs16)
#3.Add NFS server in kubernetes/cs16-deployment.yml

kubectl apply -f kubernetes/cs16-deployment.yml
```

# Attributions

-based on [counter-strike-docker](https://github.com/JimTouz/counter-strike-docker), developed by [JimTouz](https://github.com/JimTouz/counter-strike-docker).

-based on https://github.com/artem-panchenko/counter-strike-docker

## Changes from original project

* Added new maps.
* Added new plugins.
