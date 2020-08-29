FROM debian:jessie
WORKDIR /opt/cs16
RUN apt update && \
    apt install -y lib32gcc1 curl
COPY cs16.tar.gz /opt
RUN cd /opt && tar -xzf /opt/cs16.tar.gz
#/opt/cs16 should be mounted to external /opt/cs16
EXPOSE 27015
CMD ./hlds_run -game cstrike -pingboost 2 +ip 0.0.0.0 -port 27015 +maxplayers 32 +map aim_headshot +sv_lan 0
