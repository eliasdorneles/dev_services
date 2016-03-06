#!/bin/bash

echo """
Point your browser to http://localhost:15672 (credentials guest:guest)
Connect to RabbitMQ using server localhost and port 5672
"""

docker run --rm \
    --hostname my-rabbit \
    --name some-rabbit \
    -p 15672:15672 \
    -p 5672:5672 \
    rabbitmq:3-management

