FROM golang:latest

WORKDIR "/go/devops-test"
COPY Makefile main.go go.mod go.sum ./
RUN make build
CMD /go/devops-test/build/devops-test