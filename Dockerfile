FROM golang:1.5
MAINTAINER Octoblu, Inc. <docker@octoblu.com>

ADD https://raw.githubusercontent.com/pote/gpm/v1.4.0/bin/gpm /go/bin/
RUN chmod +x /go/bin/gpm

RUN go get github.com/tools/godep

WORKDIR /go/src/github.com/octoblu/vulcand-bundle
COPY Godeps /go/src/github.com/octoblu/vulcand-bundle/
RUN gpm get

WORKDIR /go/src/github.com/vulcand/vulcand
RUN git remote add octoblu https://github.com/octoblu/vulcand.git && \
  git fetch octoblu && \
  git checkout 6c5d6abb4ae3ec0256875f5bf0d2cdd4efebc7a1

RUN go-wrapper download
RUN go-wrapper install

WORKDIR /go/src/github.com/octoblu/vulcand-bundle

COPY . /go/src/github.com/octoblu/vulcand-bundle

RUN env CGO_ENABLED=0 go build -o vulcand -a -ldflags '-s' .

CMD ["./vulcand"]
