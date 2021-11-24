PACKAGES=$(shell go list ./... | grep -v '/simulation')

mod:
	@go mod tidy

test:
	@go test -mod=readonly $(PACKAGES)s

build: mod
	@go get -u github.com/gobuffalo/packr/v2/packr2
	@mkdir -p build/
	@go build -o build/ .
	@go mod tidy