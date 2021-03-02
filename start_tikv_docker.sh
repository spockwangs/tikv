IP=172.18.0.14
docker run -it --rm --name tikv1 \
       -v /etc/localtime:/etc/localtime:ro \
       -v ${HOME}/db/tikv:/data \
       --network db-network \
       --ip ${IP} \
       tikv:spock \
       --addr="0.0.0.0:20160" \
       --advertise-addr="${IP}:20160" \
       --data-dir="/data/tikv1" \
       --pd="${IP}:2379"
