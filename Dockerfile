FROM golang:1.6
MAINTAINER Octoblu, Inc. <docker@octoblu.com>

WORKDIR /go/src/github.com/octoblu/vulcand-bundle
COPY . /go/src/github.com/octoblu/vulcand-bundle

RUN env CGO_ENABLED=0 go build -o vulcand -a -ldflags '-s' .

CMD ["./vulcand"]
