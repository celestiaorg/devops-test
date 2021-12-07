# TODO: We probably don't need golang anymore
FROM alpine

# Because Alpine
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk update && \
    apk --no-cache add bash

ENV APP /celestia-app
WORKDIR $APP

# Copy in the binary
COPY celestia-appd ${APP}/celestia-appd

# Copy in the pre-generated configs
# TODO: These should probably all be passed as Volumes
COPY gentx ${APP}/config/gentx
COPY golden-genesis.json ${APP}/config/genesis.json
COPY config.toml ${APP}/config/config.toml
COPY app.toml ${APP}/config/app.toml
COPY client.toml ${APP}/config/client.toml
COPY priv_validator_state.json ${APP}/data/priv_validator_state.json

EXPOSE 26656 26657 1317 9090

# This allows us to always set the --home directory using an env 
# var while still capturing all argumenmts passed at runtime
ENTRYPOINT [ "/bin/bash", "-c", "exec ./celestia-appd --home ${APP} \"${@}\"", "--" ]
# Default command to run if no arguments are passed
CMD ["--help"] 

