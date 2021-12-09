FROM ubuntu 

RUN apt update

ENV APP /celestia-light
WORKDIR $APP

# Copy in the binary
COPY celestia ${APP}/celestia

EXPOSE 2121

RUN [ "/bin/bash", "-c", "exec ./celestia \
    light --repo.path ${APP} init" ]

ENTRYPOINT [ "/bin/bash", "-c", "sleep 45 && \ 
            exec ./celestia light \
            \"${@}\"", "--" ]
CMD ["--help"]
