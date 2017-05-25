FROM golang:1.8-alpine

ENV GOPATH /go
ENV USER root

RUN apk update && apk add git make

RUN go get github.com/kardianos/govendor \
 && govendor get github.com/spf13/hugo

COPY . $GOPATH/src/github.com/spf13/hugo

RUN cd $GOPATH/src/github.com/spf13/hugo \
 	&& make install test

ADD .s2i/bin /usr/local/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

EXPOSE 8080 1313
CMD ["usage"]
