#!/bin/bash

docker run --network devnet_localnet \
    -v ${PWD}/nodekey0:/celestia-full/keys/OAZHALLLMV4Q:ro \
    -v ${PWD}/config-full0.toml:/celestia-full/config.toml:ro \
    jbowen93/celestia-node:devnet full -r /celestia-full start \
    --core.remote tcp://192.167.10.2:26657 \
    --headers.trusted-hash A9272DAD1BEBEF104EBDBF071E39789E21C0650AF5B76A7062213B772B6B925E