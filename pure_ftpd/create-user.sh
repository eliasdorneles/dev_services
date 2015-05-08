#!/bin/bash

abort() {
    echo "$*"; exit 1;
}

usage() {
    abort "Usage: $(basename $0) USERNAME"
}

[ -z "$1" ] && usage

docker exec -it pureftpd_ftpd_1 pure-pw useradd "$1" -u ftpuser -d /data
docker exec -it pureftpd_ftpd_1 pure-pw mkdb
