FROM golang:1.17-alpine

ENV APP /capp
ENV CONFIG celestia-app-config

RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq bash wget 

WORKDIR $APP

RUN wget https://fra1.digitaloceanspaces.com/celestia-node-binaries/celestia-appd 

# Copy in the pre-generated config
COPY boot1-8/app ${APP}/${CONFIG}
COPY boot1-8/config.sh ${APP}/config.sh

EXPOSE 26656 26657 1317 9090
 
RUN chmod +x /capp/config.sh && chmod +x /capp/celestia-appd
RUN /capp/config.sh
CMD ./celestia-appd start --home $APP/$CONFIG
