docker run -it --rm --name tikv2 \
       -p 20161:20160 \
       -v /etc/localtime:/etc/localtime:ro \
       -v /home/spockwang/db/tikv:/data \
       --network db-network \
       --ip 172.18.0.15 \
       tikv:spock \
       --addr="0.0.0.0:20160" \
       --advertise-addr="172.18.0.15:20160" \
       --data-dir="/data/tikv2" \
       --pd="172.18.0.11:2379"
       
