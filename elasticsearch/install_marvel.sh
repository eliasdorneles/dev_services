
docker-compose run elasticsearch \
    /elasticsearch/bin/plugin \
    -Des.config=/data/elasticsearch.yml \
    -i elasticsearch/marvel/latest
