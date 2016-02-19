FROM golang
MAINTAINER Octoblu, Inc. <docker@octoblu.com>

COPY . /go/src/github.com/octoblu/vulcand-bundle
WORKDIR /go/src/github.com/octoblu/vulcand-bundle

RUN go get
RUN env CGO_ENABLED=0 go build -a -ldflags '-s' -o vulcand .

CMD ["./vulcand"]
