FROM golang
MAINTAINER Octoblu, Inc. <docker@octoblu.com>

ADD https://raw.githubusercontent.com/pote/gpm/v1.3.2/bin/gpm /go/bin/
RUN chmod +x /go/bin/gpm

COPY Godeps /go/src/github.com/octoblu/vulcand-bundle/
WORKDIR /go/src/github.com/octoblu/vulcand-bundle
RUN gpm install

COPY . /go/src/github.com/octoblu/vulcand-bundle

RUN env CGO_ENABLED=0 go build -o vulcand -a -ldflags '-s' .

CMD ["./vulcand"]
