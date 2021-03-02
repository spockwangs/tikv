IP=172.18.0.16
docker run -it --rm --name tikv3 \
       -v /etc/localtime:/etc/localtime:ro \
       -v ${HOME}/db/tikv:/data \
       --network db-network \
       --ip ${IP} \
       tikv:spock \
       --addr="0.0.0.0:20160" \
       --advertise-addr="${IP}:20160" \
       --data-dir="/data/tikv3" \
       --pd="${IP}:2379"
