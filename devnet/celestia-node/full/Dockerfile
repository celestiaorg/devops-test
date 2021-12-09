FROM ubuntu 

RUN apt update

ENV APP /celestia-full
WORKDIR $APP

# Copy in the binary
COPY celestia ${APP}/celestia

EXPOSE 2121

RUN [ "/bin/bash", "-c", "exec ./celestia \
    full --repo.path ${APP} init" ]

ENTRYPOINT [ "/bin/bash", "-c", "sleep 2 && \ 
            exec ./celestia full \
            \"${@}\"", "--" ]
CMD ["--help"]
