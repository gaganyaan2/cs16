### Motivation : Highly configurable cs16 docker image with persistent volume. 
and yes it doesn't follow the actual docker concept of having everything inside the container.

# Docker image for Counter Strike 1.6 Server

## Start the server with run.sh and persistent volume /opt/cs16

```bash
bash run.sh
```

## Start the server with persistent volume /opt/cs16
```bash
wget https://github.com/koolwithk/cs16/raw/master/cs16.tar.gz && tar -xzf cs16.tar.gz && mv cs16 /opt/cs16 && rm -rf cs16.tar.gz

docker run -d -p 27015:27015/udp -v /opt/cs16:/opt/cs16:Z --name cs16 koolwithk/cs16:latest
```

## Stop the server

```bash
docker stop cs16
```

## Start existing (stopped) server

```bash
docker start cs16
```

## Remove the server

```bash
docker rm cs16
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
