#!/bin/bash

apt update 
apt install docker.io -y
apt install docker-compose -y
cd devops-test/devnet
docker-compose up
