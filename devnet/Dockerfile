FROM golang:1.17-alpine

ENV APP /celestia-app

# Because Alpine
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq bash wget 

WORKDIR $APP

# Copy in the binary
COPY celestia-appd ${APP}/celestia-appd

# Copy in the pre-generated config
COPY gentx ${APP}/config/gentx
COPY golden-genesis.json ${APP}/config/genesis.json
COPY config.toml ${APP}/config/config.toml
COPY app.toml ${APP}/config/app.toml
COPY client.toml ${APP}/config/app.toml
COPY priv_validator_state.json ${APP}/data/priv_validator_state.json

EXPOSE 26656 26657 1317 9090

RUN chmod +x /capp/celestia-appd
CMD ./celestia-appd start --home $APP \
   --p2p.persistent_peers $persistent_peers \
   --moniker $moniker