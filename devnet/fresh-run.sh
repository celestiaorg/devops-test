#!/bin/bash

apt update 
apt install docker.io -y
apt install docker-compose -y
docker-compose up
