FROM golang:1.17-alpine

ENV APP /capp
ENV CONFIG celestia-app-config

RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq bash wget

WORKDIR $APP

# Copy in the pre-generated config
COPY celestia-appd ${APP}/celestia-appd
COPY boot1-8/app ${APP}/${CONFIG}
COPY boot1-8/config.sh ${APP}/config.sh

EXPOSE 26656 26657 1317 9090

RUN chmod +x /capp/config.sh && chmod +x /capp/celestia-appd
RUN /capp/config.sh
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
CMD ./celestia-appd start --home $APP/$CONFIG
