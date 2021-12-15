FROM ubuntu

RUN apt update

ENV APP /celestia-app
WORKDIR $APP

# Copy in the binary
COPY celestia-appd ${APP}/celestia-appd

EXPOSE 26656 26657 1317 9090

COPY priv_validator_state.json ${APP}/data/priv_validator_state.json

# This allows us to always set the --home directory using an env 
# var while still capturing all argumenmts passed at runtime
ENTRYPOINT [ "/bin/bash", "-c", "exec ./celestia-appd \
            --home ${APP} \
            \"${@}\"", "--" ]
# Default command to run if no arguments are passed
CMD ["--help"] 

