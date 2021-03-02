IP=172.18.0.15
docker run -it --rm --name tikv2 \
       -v /etc/localtime:/etc/localtime:ro \
       -v ${HOME}/db/tikv:/data \
       --network db-network \
       --ip ${IP} \
       tikv:spock \
       --addr="0.0.0.0:20160" \
       --advertise-addr="${IP}:20160" \
       --data-dir="/data/tikv2" \
       --pd="${IP}:2379"
