#!/bin/bash

new_node_name=$1
dest_node_name=$2
chain_id=devnet
moniker_name=josh
COIN="1000000000000celes"
new_dir=$new_node_name/app
dest_dir=$dest_node_name/app

# If the directory isn't here then create it
if [ ! -d "$new_dir" ]; then
  mkdir -p $new_dir
fi

# TODO(Josh): Copy the Dockerfile and config.sh then update the strings with sed

# Create the new node
celestia-appd --home=$new_dir init $moniker_name --chain-id $chain_id

celestia-appd --home=$new_dir keys add $new_node_name --keyring-backend=test
node_addr=$(celestia-appd --home=$new_dir keys show $new_node_name -a --keyring-backend test)

celestia-appd --home=$new_dir add-genesis-account $node_addr $COIN --keyring-backend test 

celestia-appd --home=$new_dir gentx $new_node_name 700000000000celes --keyring-backend=test --chain-id $chain_id

# Syncing

# Copy the new node's config to the original node
cp $new_dir/config/gentx/gentx-*.json $dest_dir/config/gentx/
# Add the new genesis account 
celestia-appd --home=$dest_dir add-genesis-account $node_addr $COIN
# Collect gentxs on original node
celestia-appd --home=$dest_dir collect-gentxs

# Copy the information from the original node's genesis to the new node
cp -r $dest_dir/config/gentx/ $new_dir/config/gentx

# Copy the original node's updated genesis.json
cp $dest_dir/config/genesis.json $new_dir/config/genesis.json

# Add config
cp config.sh $new_node_name/
cp Dockerfile $new_node_name/
sed -i '.bak' "s/bootX-Y/$new_node_name/g" $new_node_name/Dockerfile
rm $new_node_name/Dockerfile.bak