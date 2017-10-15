
export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0


go build -v -ldflags -a -o release/linux/amd64/drone-docker
docker build -f docker/Dockerfile --tag croudtech/drone-docker:0.1.4 .
docker push croudtech/drone-docker:0.1.4
