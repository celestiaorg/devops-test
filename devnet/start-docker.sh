#!/bin/bash

# Start core nodes
docker-compose -f docker/core-docker-compose.yml up -d 

echo "Waiting 20s for core nodes to produce a block"
sleep 20s

# Start bridge nodes
docker-compose -f docker/bridge-docker-compose.yml up -d

echo "Waiting 30s for bridge nodes to sync a block"
sleep 30s

# Start light nodes
docker-compose -f docker/light-docker-compose.yml up -d