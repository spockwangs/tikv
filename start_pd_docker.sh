docker run -it --rm --name pd \
       -p 2379:2379 \
       -p 2380:2380 \
       -v /etc/localtime:/etc/localtime:ro \
       -v /home/spockwang/db/pd:/data \
       --network db-network \
       --ip 172.18.0.11 \
       pingcap/pd:latest \
       --name="pd" \
       --data-dir="/data" \
       --client-urls="http://0.0.0.0:2379" \
       --advertise-client-urls="http://172.18.0.11:2379" \
       --peer-urls="http://0.0.0.0:2380" \
       --advertise-peer-urls="http://172.18.0.11:2380" \
       --initial-cluster="pd=http://172.18.0.11:2380"
