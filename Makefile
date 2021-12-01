PACKAGES=$(shell go list ./... | grep -v '/simulation')

mod:
	@go mod tidy

test:
	@go test -mod=readonly $(PACKAGES)s

build: mod
	@mkdir -p build/
	@go build -o build/ .
	@go mod tidy

docker-build: mod
	@docker build -t hello:latest .

start: 
	./build/devops-test

