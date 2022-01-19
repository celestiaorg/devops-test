#!/bin/bash

# Start core nodes
docker-compose -f docker/core-docker-compose.yml up -d 

echo "Waiting 40s for core nodes to produce a block"
sleep 40s

# Start bridge nodes
docker-compose -f docker/bridge-docker-compose.yml up -d

echo "Waiting 30s for bridge nodes to sync a block"
sleep 30s

# Start light nodes
docker-compose -f docker/light-docker-compose.yml up -d

echo "Waiting 10s for light nodes to perform DA sampling"
sleep 10s

# Start the DALC node
docker-compose -f docker/dalc-docker-compose.yml up -d

# Fund the DALC node
./fund-dalc.sh