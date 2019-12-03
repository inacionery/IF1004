#!/bin/sh

for i in 1 2 3; do
	docker-machine create -d virtualbox node-$i
done

eval $(docker-machine env node-1)

docker swarm init --advertise-addr $(docker-machine ip node-1)
docker build -t if1004_grafana grafana
docker build -t if1004_prometheus prometheus
docker build -t if1004_node-exporter node-exporter

TOKEN=$(docker swarm join-token -q worker)

for i in 2 3; do
	eval $(docker-machine env node-$i)
	docker swarm join --token $TOKEN $(docker-machine ip node-1):2377
	docker build -t if1004_grafana grafana
	docker build -t if1004_prometheus prometheus
	docker build -t if1004_node-exporter node-exporter
done

echo "Swarm cluster criado com sucesso!";

eval $(docker-machine env minion01)

docker stack deploy -c docker-compose.yml if1004