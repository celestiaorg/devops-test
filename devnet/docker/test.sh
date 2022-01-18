#!/bin/bash

# Send tokens from the validator to the DALC address
./celestia-appd tx bank send $MY_VAL_ADDRESS $DALC_ADDRESS 1000000celes --chain-id ephemeral --keyring-backend test --keyring-dir $PWD