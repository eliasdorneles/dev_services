#!/bin/bash

# mongodb Dockerfile from: https://github.com/dockerfile/mongodb

# see logs with:
#    docker logs mongodb

docker run -d -p 27017:27017 -p 28017:28017 --name mongodb dockerfile/mongodb mongod --rest --httpinterface

echo "Open your browser in http://localhost:28017 (Linux only)"
