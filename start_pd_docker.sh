IP=172.18.0.11
docker run -it --rm --name pd \
       -v /etc/localtime:/etc/localtime:ro \
       -v ${HOME}/db/pd:/data \
       --network db-network \
       --ip ${IP} \
       pingcap/pd:latest \
       --name="pd" \
       --data-dir="/data" \
       --client-urls="http://0.0.0.0:2379" \
       --advertise-client-urls="http://${IP}:2379" \
       --peer-urls="http://0.0.0.0:2380" \
       --advertise-peer-urls="http://${IP}:2380" \
       --initial-cluster="pd=http://${IP}:2380"
