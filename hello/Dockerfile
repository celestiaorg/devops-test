FROM golang:alpine
WORKDIR "/go/devops-test"
COPY Makefile main.go go.mod go.sum ./
RUN apk add --update make &&\
    make build
CMD make start