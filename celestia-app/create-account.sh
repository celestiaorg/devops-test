#!/bin/bash

node_name=$1
chain_id=devnet
moniker_name=josh
COIN="1000000000000celes"
directory=$node_name/app

celestia-appd --home=$directory init $moniker_name --chain-id $chain_id

celestia-appd --home=$directory keys add $node_name --keyring-backend=test
node_addr=$(celestia-appd --home=$directory keys show $node_name -a --keyring-backend test)

celestia-appd --home=$directory add-genesis-account $node_addr $COIN --keyring-backend test 

celestia-appd --home=$directory gentx $node_name 700000000000celes --keyring-backend=test --chain-id $chain_id

celestia-appd --home=$directory collect-gentxs

celestia-appd --home=$directory tendermint show-node-id

# Add config
cp config.sh $node_name/
cp Dockerfile $node_name/
sed -i '.bak' "s/bootX-Y/$node_name/g" $node_name/Dockerfile
rm $node_name/Dockerfile.bak
sed -i '.bak' "s/stake/celes/g" $directory/config/genesis.json
rm $directory/config/genesis.json.bak
