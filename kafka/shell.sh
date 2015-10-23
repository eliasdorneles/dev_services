#!/bin/bash

set -e

abort() {
    echo "$*"; exit 1;
}

usage() {
    abort "Usage: $(basename $0) [KAFKA_HOST] [ZK_HOST:PORT]"
}

require() {
    type $1 >/dev/null 2>/dev/null
}

while [ "${1#-}" != "$1" ]; do
    case "$1" in
        -h) usage;;
        *) usage;;
    esac
    shift
done

require docker

KAFKA_HOST=$KAFKA_HOST

[ -z "$KAFKA_HOST" ] && source env.sh
[ -z "$KAFKA_HOST" ] && abort "Couldn't find KAFKA_HOST"

HOST=${1:-$KAFKA_HOST}

ZK=${2:-$KAFKA_HOST:2181}

kafka_containers=$(docker-compose ps kafka | sed -r '1,2d' | egrep -o 'kafka_kafka_[0-9]+')
brokers=$(for c in $kafka_containers; do docker port $c 9092 | sed -e "s/0.0.0.0:/$KAFKA_HOST:/g"; done | paste -s -d,)

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
    -e HOST=$KAFKA_HOST \
    -e ZK=$ZK \
    -e BROKERS=$brokers \
    -i -t \
    wurstmeister/kafka /bin/bash \
    -c 'exec /bin/bash --rcfile <(echo export PATH=\$KAFKA_HOME/bin:\$PATH)'
