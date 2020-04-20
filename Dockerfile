FROM debian:jessie
RUN apt update && \
    apt install -y lib32gcc1 curl && \
    mkdir /opt/cs16
#/opt/cs16 should be mounted to external /opt/cs16
EXPOSE 27015
CMD cd /opt/cs16 && ./hlds_run -game cstrike -pingboost 2 +ip 0.0.0.0 -port 27015 +maxplayers 32 +map aim_headshot +sv_lan 0
