#!/bin/sh

# load three VMs via docker-machine
for i in 1 2 3; do
	docker-machine create -d virtualbox node-$i
done

# poit to managed host node-1
eval $(docker-machine env node-1)

# initialize docker swarm cluster on node-1
docker swarm init --advertise-addr $(docker-machine ip node-1)

# build custom images on node-1 (manager)
docker build -t if1004_grafana grafana
docker build -t if1004_prometheus prometheus
docker build -t if1004_node-exporter node-exporter

# store token on variable
TOKEN=$(docker swarm join-token -q worker)

# loops through node 2 and 3 to join them to the cluster as workers
# build custom images on those nodes
for i in 2 3; do
	eval $(docker-machine env node-$i)
	docker swarm join --token $TOKEN $(docker-machine ip node-1):2377
	docker build -t if1004_grafana grafana
	docker build -t if1004_prometheus prometheus
	docker build -t if1004_node-exporter node-exporter
done

echo "Swarm cluster criado com sucesso!";

echo "IP do manager:";

# display manager's IP
docker-machine ip node-1

# point to node-1 (manager)
eval $(docker-machine env node-1)

# run stack to configure custom images and cadvisor
docker stack deploy -c docker-compose.yml if1004

# deploy example application
docker stack deploy -c app-demo/docker-compose.yml app
