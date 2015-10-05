# Kafka playground

To start a cluster with two nodes:

    ./start-cluster.sh


Then, to start a shell with the tools to play with the cluster:

    ./shell.sh

This will fire up a Docker container like the cluster nodes,
only running the shell instead of a Kafka node, you can do:

    cd $KAFKA_HOME
    ./bin/kafka-topics.sh --zookeeper $ZK --list  # list topics
