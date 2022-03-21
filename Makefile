BINARY_NAME=logsystem

build:
	GOARCH=amd64 GOS=darwin go build -o ${BINARY_NAME}-darwin cmd/server/main.go
	GOARCH=amd64 GOS=linux go build -o ${BINARY_NAME}-linux cmd/server/main.go
	GOARCH=amd64 GOS=windows go build -o ${BINARY_NAME}-windows cmd/server/main.go

run:
	./${BINARY_NAME}

build_and_run: build run

clean:
	go clean
	rm ${BINARY_NAME}-darwin
	rm ${BINARY_NAME}-linux
	rm ${BINARY_NAME}-windows

dep:
	go mod download
vet:
	go vet

lint:
	golang-lint run --enable-all


compile:
	protoc api/v1/*.proto --go_out=. --go_opt=paths=source_relative --proto_path=.
test:
	go test -race ./..

test_coverage:
	go test ./... -coverprofile=coverage.out