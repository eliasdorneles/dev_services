
export KAFKA_HOST=$(ifconfig docker0 | egrep -o 'inet addr:\S+' | sed 's/inet addr://')
