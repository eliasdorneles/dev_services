#!/bin/bash

abort() {
    echo "$*"; exit 1;
}

usage() {
    abort "Open a shell inside container using docker exec
    Usage: $(basename $0)"
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

container_id=$(docker ps | grep rabbitmq | awk '{print $1}')

[ -z "$container_id" ] && abort "No RabbitMQ container running"

docker exec -ti $container_id /bin/bash
