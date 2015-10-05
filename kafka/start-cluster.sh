#!/bin/bash

set -e

source env.sh

docker-compose up -d

docker-compose scale kafka=2
