
export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0
export GOPATH=/mnt/c/Users/Dave/Go


go build -ldflags -a -o release/linux/amd64/drone-docker github.com/CroudSupport/drone-docker/cmd/drone-docker
docker build -f docker/Dockerfile --tag croudtech/drone-docker:0.1.10 .
docker push croudtech/drone-docker:0.1.10
