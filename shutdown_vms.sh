#!/bin/sh

# remove VMs
for i in 1 2 3; do
	echo y | docker-machine rm node-$i
done
