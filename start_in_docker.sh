#!/bin/bash

set -ex
docker network create --subnet=172.18.0.0/16 db-network || true

PD_IP=172.18.0.11
TIKV_IP1=172.18.0.12
TIKV_IP2=172.18.0.13
TIKV_IP3=172.18.0.14

docker run --rm -d --name pd \
       -v /etc/localtime:/etc/localtime:ro \
       -v ${HOME}/db:/data \
       --network db-network \
       --ip ${PD_IP} \
       pingcap/pd:latest \
       --name="pd" \
       --data-dir="/data/pd" \
       --client-urls="http://0.0.0.0:2379" \
       --advertise-client-urls="http://${PD_IP}:2379" \
       --peer-urls="http://0.0.0.0:2380" \
       --advertise-peer-urls="http://${PD_IP}:2380" \
       --initial-cluster="pd=http://${PD_IP}:2380" \
       --log-file=/data/pd.log

function start_tikv()
{
    local name=$1
    local ip=$2

    docker run --rm -d --name ${name} \
           -v /etc/localtime:/etc/localtime:ro \
           -v ${HOME}/db:/data \
           --network db-network \
           --ip ${ip} \
           tikv:spock \
           --addr="0.0.0.0:20160" \
           --advertise-addr="${ip}:20160" \
           --data-dir="/data/${name}" \
           --pd="${PD_IP}:2379" \
           --log-file="/data/${name}.log"
}

start_tikv tikv1 ${TIKV_IP1}
start_tikv tikv2 ${TIKV_IP2}
start_tikv tikv3 ${TIKV_IP3}
