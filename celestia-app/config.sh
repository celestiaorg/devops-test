#!/bin/bash

# Set proper defaults and change ports
sed -i 's#"tcp://127.0.0.1:26657"#"tcp://0.0.0.0:26657"#g' $APP/$CONFIG/config/config.toml
sed -i 's/timeout_commit = "5s"/timeout_commit = "1s"/g' $APP/$CONFIG/config/config.toml
sed -i 's/timeout_propose = "3s"/timeout_propose = "1s"/g' $APP/$CONFIG/config/config.toml
sed -i 's/index_all_keys = false/index_all_keys = true/g' $APP/$CONFIG/config/config.toml
# Open up rest api
sed -i '104 s/enable = false/enable = true/' $APP/$CONFIG/config/app.toml