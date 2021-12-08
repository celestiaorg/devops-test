FROM alpine

# Because Alpine
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk update && \
    apk --no-cache add bash

ENV APP /celestia-full
WORKDIR $APP

# Copy in the binary
COPY celestia ${APP}/celestia

EXPOSE 2121

RUN [ "/bin/bash", "-c", "exec ./celestia \
    full --repo.path ${APP} init" ]

# This allows us to always set the --home directory using an env 
# var while still capturing all argumenmts passed at runtime
ENTRYPOINT [ "/bin/bash", "-c", "sleep 2 && \ 
            exec ./celestia \
            \"${@}\"", "--" ]
CMD ["--help"]
