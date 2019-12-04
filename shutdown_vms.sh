#!/bin/sh

# remove VMs
for i in 1 2 3; do
	docker-machine rm node-$i
done
